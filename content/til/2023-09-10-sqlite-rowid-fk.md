+++
title = "SQLite rowid as Foreign Key"
authors = ["Tau"]
+++

I was really excited [when I first learned](@/til/2022-10-23-sqlite-rowid.md) about SQLite's `rowid` feature.

There is however a downside to the automatic `rowid` column: It can't be used as part of foreign keys.
Quoting from the [SQLite docs][rowid_tables] (emphasis is mine):
> […]. The parent key must be a named column or columns in the parent table, **not the rowid.**

Fixing this downside is easy: Just add an `INTEGER PRIMARY KEY` column—it will get aliased to the `rowid` column
(See [«ROWIDs and the INTEGER PRIMARY KEY»][rowids_and_the_integer_primary_key]):

```sql
CREATE TABLE example
    ( id INTEGER PRIMARY KEY
    , ...
    );
```

[rowid_tables]: https://www.sqlite.org/rowidtable.html
[rowids_and_the_integer_primary_key]: https://www.sqlite.org/lang_createtable.html#rowids_and_the_integer_primary_key
