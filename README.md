# Procedures-and-Functions

# A stored function is a named, reusable SQL routine that always returns a single scalar value.

# It can be used like built-in functions within SQL expressions (e.g., in SELECT, WHERE, or ORDER BY).

# Accepts only input parameters; no OUT or INOUT—all parameters are implicitly IN .

# Must have a declared return type, which is enforced by MySQL when the function executes.

# Must be declared as one or more of: DETERMINISTIC, NO SQL, or READS SQL DATA if binary logging is enabled, DETERMINISTIC consistent output for the same inputs,NO SQL contains no SQL statements; purely computational,READS SQL DATA performs read-only SQL operations, like SELECT, but doesn’t modify data .

# Cannot modify database state—no INSERT, UPDATE, DELETE, or transaction statements .

# Cannot return result sets (e.g., queries without INTO), call stored procedures, or commit/rollback.

# Invoked within SQL like: SELECT my_function(...);—behaves as part of standard queries.

# Deterministic functions can be optimized (e.g., calculated once per group), while nondeterministic ones are evaluated for each row.
