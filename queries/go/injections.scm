; extends

(
(comment) @_sql_comment (#eq?  @_sql_comment "/*sql*/")
(expression_list
 (raw_string_literal) @sql (#offset! @sql 0 1 0 -1))
)

(
(comment) @_sql_comment (#eq?  @_sql_comment "/*sql*/")
((raw_string_literal) @sql (#offset! @sql 0 1 0 -1))
)
