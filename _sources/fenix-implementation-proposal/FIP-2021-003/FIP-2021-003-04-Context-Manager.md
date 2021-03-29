# FIP 2021-002-06: Context Manager

<!--
Authors Full Name 1 <full.name1 at organization.com>, Full Name2 <full.name2 at organization.com>
-->
**Authors** Ivan Ogasawara <ivan.ogasawara at gmail.com>

<!--
Status [Draft | Accepted | Final | Deferred | Rejected | Withdrawn | Superseded | Active]
-->
**Status** Draft

<!--
Type: [Standards Track | Informational | Process]
-->
**Type** Informational

**Created** 2021-03-24

<!--
resolution: url to discussion (required for Accepted | Rejected | Withdrawn)
-->
**Resolution**


## Abstract

This document proposes the Context Manager.

...

## Motivation

Context managers allow the resources allocation and releasing precisely for a specific scope.
It helps to avoid for example keep a connection to a socket after its usage.
...

## Proposal

This proposal considers two ways to implement the:

1. Using just scope
2. Using `with` statement

**Key points:**

* Context managememt with scope
* Context management with `with` statement

**Conventions**

`<...>` is used as a placeholder, it is not a real code.
It illustrate that it can contain a code there.


### Context managememt with scope

The context management can be done using the scope context. The **scope**
definition is proposed at FIP-2021-002-20-Scope.md.

The **scope** definition states that everything created inside a scope
will be delete at the end of the scope. So, for example, a class `Connection`
can close the connection when the object is delete:

```fenix

class Connection:
  <...>

  methods:
    __init__: public(connection_string: str)
    __enter__: public(<...>):
      return self.connection

    __exit__: public(<...>):
      self.connection.close()

    __del__: public(<...>):
      self.__exit__()

class TableResult:
  <...>

result: TableResult

{
  con = Connection("<some database connection string>")
  result = con.execute("Select table table1;");
}

print(result)
```

#### Context management with `with` statement

The context management can be done also using `with` statement.
This idea was borred from **Python**.

This is an example of the usage of the `with` statement:

```fenix

class Connection:
  <...>

  methods:
    __init__: public(connection_string: str):
      self.connection = somedriver.connection(connection_string: str)

    __enter__: public(<...>):
      return self

    __exit__: public(<...>):
      self.connection.close()

    __del__: public(<...>):
      self.__exit__()

    execute: public(sql: str) -> TableResult:
      return self.connection.execute(sql)

class TableResult:
  <...>

result: TableResult

with Connection("<some database connection string>") as con:
  result = con.execute("Select table table1;")

print(result)
```

## Copyright

This document has been placed in the public domain.

## References

* pythontips: https://book.pythontips.com/en/latest/context_managers.htm
* Python documentation: https://docs.python.org/3/reference/compound_stmts.html#with

## Changelog

- 2021-03-24: Creation of the document
