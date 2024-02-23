; extends

(
(comment) @_sql_comment (#eq?  @_sql_comment "/*sql*/")
(expression_list
 (raw_string_literal) @injection.content (#offset! @injection.content 0 1 0 -1))
 (#set! injection.language "sql")
)

(
(comment) @_sql_comment (#eq?  @_sql_comment "/*sql*/")
((raw_string_literal) @injection.content (#offset! @injection.content 0 1 0 -1))
(#set! injection.language "sql")
)
