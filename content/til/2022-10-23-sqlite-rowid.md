+++
title = "SQLite rowid"
authors = ["Tau"]
+++

Tables in SQLite automatically get an auto-incrementing unique key called [`rowid`] [^1]. \
Sorting or searching by the `rowid` is really fast because the data is stored in a B-Tree structure.

[^1]: Unless explicitly turned off using `WITHOUT ROWID`.

[`rowid`]: https://www.sqlite.org/lang_createtable.html#rowid
