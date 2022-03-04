# AEP 2022001: Docstring and comments

<!--
Authors: Full Name 1 <full.name1 at organization.com>, Full Name2 <full.name2 at organization.com>
-->
**Authors** : Ivan Ogasawara <ivan.ogasawara at gmail.com>

<!--
Status [Draft | Accepted | Final | Deferred | Rejected | Withdrawn | Superseded | Active]
-->
**Status** Draft

<!--
Type: [Standards Track | Informational | Process]
-->
**Type** Informational

**Created** 2021-02-23

<!--
resolution: url to discussion (required for Accepted | Rejected | Withdrawn)
-->
**Resolution**


## Abstract

<!--
The Abstraction section ...
-->

...

## Motivation

Every programming language has its own way to specify a comment
(see [wikipedia](https://en.wikipedia.org/wiki/Comment_(computer_programming)#Examples)).
Two main kind of comments are: **Inline** and **Multiline**.

Additionally, the languages can also define **docstrings**, that are
comments used to create documentation.

### Comments

Some examples of **inline** comments:

```python
# a comment in the beginning of a line

x = 1  # a comment at the end of a line

```

Some examples of **multiline** comment:

```javascript

/* comment block in one line */

/*
 * Multiline comment
 */

```

In order to define the comments approach for **Arx**, let's check
first how some other languages have implemented that.

Inline comments:

* `--`: used by Ada, AppleScript, Haskel, SQL, Eiffel, VHDL, Lua
* `⍝`: Used by APL
* `REM`: BASIC
* `'`: Quick Basic, Q Basic, Visual Basic, Visual Basic .NET, VB Script,
  FreeBASIC and Gambas
* `! `: Cisco IOS and IOS-XE configuration, Fortran 90
* `C`: Foltran IV (used in the column 1)
* `%`: LaTex, MATLAB
* `//`: C, Java, JavaScript, PHP, Swift, C++, Go, Rust
* `#`: Nim, Perl, R, PHP, Python, Ruby, YAML
* ``` ` ``` and ``` ` ```: Markdown
*
Multine comments:
* `(*` and `*)`: AppleScript, OCaml, Pascal
* `/*` and `*/`: C, Java, JavaScript, PHP, Swift, C++, Go
* `<!---` and `--->`: ColdFusion
* `<!--` and `-->`: XML; HTML
* `{-` and `-}`: Haskel
* `--[[` and `]]`: Lua
* `%{` and `}%`: MATLAB
* `#[` and `]#`: Nim
* `=begin <anyname>` and `=end <anyname>`: Perl
* `=begin` and `=end`: Ruby
* `=<anyname>` and `=cut`: Perl
* ```#`{{``` and `}}`: Raku
* `<#` and `#>`: PowerShell
* `"""` and `"""`: Python
* `'''` and `'''`: Python
*  ```` ``` ```` and ```` ``` ````: Markdown

### Docstrings

Inline **docstrings**:

* `///`: Rust
* `@doc "<some text>"`: Elixir
* `##`: Nim (for documentation)

Multiline **docstrings**:
* `/**` and `*/`: C, Java, JavaScript, PHP, C++
* `"""` and `"""`: Python
* `'''` and `'''`: Python
* `@moduledoc """` and `"""`: Elixir
* `##[` and `]##`: Nim
* `(documentation #` and `'<some name> 'function) => "<some output>"`: LISP


## Proposal

**Arx** aims to keep the syntaxes as similar as possible to the languages
more used nowadays, such as **Python** and **C++**.

**Key points:**

* key point 1
  * key point 1.1
* key point 2
* ...

**Conventions**

...

### Key point 1

...

#### Key point 1.1

...

### Key point 2

...

### Examples

Example of docstrings:

````

function sum(a: int, b: int) -> int:
  ```
  title: Sum `a` and `b`

  summary: |
    `sum` function aims to sum the arguments `a` and `b`.
    It is the same as `a` + `b`.

  parameters:
    a: The first number.
    b: The second number.

  returns: Return the sum of the numbers.

  deprecated:
    1.8.0:
      - this function would be replaced by the binary operator `+`.

  raises:
    ValueError: If `a` is less than 0.

  notes:
    - this is a very simple function
    - don't use it for production

  see-also:
    sum_list: sum a list of integers.

  references:
    - https://en.wiktionary.org/wiki/sum

  examples: |
    >>> sum(1, 2) == 3
    true

  ```
  if a < 0:
    raise ValueError("`a` is less than 0.")

  return a + b

````

...

## Alternatives

<!--
The Alternatives section ...
-->
...

### Alternative 1

...

## Copyright

This document has been placed in the public domain.

## References

<!--
In the references section ...
-->

* Title: url

## Changelog

- 2021-03-24: Creation of the document
