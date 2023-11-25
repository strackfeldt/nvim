import sys
import sqlparse

contents = sys.stdin.read()
for identifier in range(10):
    contents = contents.replace(f"?{identifier}", f"__id_{identifier}")


result = sqlparse.format(
    contents,
    indent_columns=True,
    keyword_case="lower",
    identifier_case="lower",
    reindent=True,
    indent_after_first=False,
    wrap_after=80,
    comma_first=False,
)

for identifier in range(10):
    result = result.replace(f"__id_{identifier}", f"?{identifier}")

print(result.strip())
