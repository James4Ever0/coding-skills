# SQL Guide

> **Scope**: relational database schemas, queries, migrations, and data access layers.

---

## 1. Schema Design

- Use clear, singular table names (`user`, `order`).
- Name foreign-key columns after the referenced table (`user_id`).
- Use consistent casing and quoting conventions.
- Store timestamps in UTC; use `TIMESTAMPTZ` on PostgreSQL.

---

## 2. Query Style

- Format SQL with a consistent style; consider `sqlfluff` or `pg_format`.
- Use explicit column lists instead of `SELECT *` in production code.
- Alias complex expressions and subqueries for readability.
- Keep transactions short and isolated.

---

## 3. Safety

- Use parameterized queries; never concatenate user input into SQL.
- Validate identifiers when dynamic SQL is unavoidable.
- Grant least-privilege database roles to applications.

---

## 4. Migrations

- Use a migration tool (Flyway, Liquibase, Alembic, dbmate).
- Make migrations backward-compatible where possible.
- Never delete or rename a column in the same deploy that removes code using it.
- Keep migration files ordered and idempotent.

---

## 5. Indexes

- Add indexes to support query patterns, not speculatively.
- Document why each index exists.
- Review query plans (`EXPLAIN ANALYZE`) before adding indexes.

---

## 6. Testing

- Test migrations against a fresh database and against a copy of production schema.
- Write unit tests for complex queries and functions.
- Use transactions in tests and roll back afterward.

---

## 7. Documentation

- Keep a data dictionary (`docs/data-dictionary.md`) describing tables and columns.
- Summarize access patterns and constraints.
- Document any non-obvious business rules encoded in triggers or stored procedures.
