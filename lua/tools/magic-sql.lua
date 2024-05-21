local run_formatter = function(text)
    local text_without_ticks = string.gsub(text, "`", "")
    -- local trimmed = string.gsub(text_without_ticks, "^%s*(.-)%s*$", "%1")

    local split = vim.split(text_without_ticks, "\n")
    local result = table.concat(vim.list_slice(split, 2, #split - 1), "\n")

    -- Finds sql-format-via-python somewhere in your nvim config path
    -- local bin = vim.api.nvim_get_runtime_file("bin/format-sql.py", false)[1]
    --
    -- local j = require("plenary.job"):new({
    -- 	command = "python3",
    -- 	args = { bin },
    -- 	writer = { result },
    -- })

    local j = require("plenary.job"):new({
        command = "pg_format",
        args = {
            -- "--wrap-limit", "100",
            "--no-space-function",
            "--keyword-case", "1"
        },
        writer = { result },
    })

    return j:sync()
end

local embedded_sql = vim.treesitter.query.parse(
    "go",
    [[
(
(comment) @_sql_comment (#eq?  @_sql_comment "/*sql*/")
(expression_list
 (raw_string_literal) @sql (#offset! @sql 0 1 0 -1))
)

(
(comment) @_sql_comment (#eq?  @_sql_comment "/*sql*/")
((raw_string_literal) @sql (#offset! @sql 0 1 0 -1))
)
]]
)

local get_root = function(bufnr)
    local parser = vim.treesitter.get_parser(bufnr, "go", {})
    local tree = parser:parse()[1]

    return tree:root()
end

local format_dat_sql = function(bufnr)
    bufnr = bufnr or vim.api.nvim_get_current_buf()

    if vim.bo[bufnr].filetype ~= "go" then
        vim.notify("can only format go files")
        return
    end

    local root = get_root(bufnr)

    local changes = {}
    for id, node in embedded_sql:iter_captures(root, bufnr, 0, -1) do
        local name = embedded_sql.captures[id]

        if name == "sql" then
            local range = { node:range() }

            local start = range[1] + 1
            local final = range[3]

            if start < final then
                local first_line = vim.api.nvim_buf_get_lines(bufnr, range[1], range[1] + 1, true)[1]
                -- local none_blank = first_line:match("^%s*"):len()
                local none_blank = first_line:match("^\t*"):len()

                local indentation = string.rep("\t", none_blank + 1)

                local text = vim.treesitter.get_node_text(node, bufnr)
                local formatted = run_formatter(text)

                for idx, line in ipairs(formatted) do
                    formatted[idx] = indentation .. line
                    -- formatted[idx] = line
                end

                table.insert(changes, 1, {
                    start = start,
                    final = final,
                    formatted = formatted,
                })
            end
        end
    end

    for _, change in ipairs(changes) do
        vim.api.nvim_buf_set_lines(bufnr, change.start, change.final, false, change.formatted)
    end
end

vim.api.nvim_create_user_command("FormatDatSql", function()
    format_dat_sql()
end, {})
