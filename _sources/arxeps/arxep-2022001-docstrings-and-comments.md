# ArxEP 2022001: Docstring and comments

<!--
Authors: Full Name 1 <full.name1 at organization.com>, Full Name2 <full.name2 at organization.com>
-->
**Authors** : Ivan Ogasawara <ivan.ogasawara at gmail.com>

<!--
Status [Draft | Accepted | Final | Deferred | Rejected | Withdrawn | Superseded | Active]
-->
**Status** Accepted

<!--
Type: [Standards Track | Informational | Process]
-->
**Type** Standards Track

**Created** 2022-03-01

<!--
resolution: url to discussion (required for Accepted | Rejected | Withdrawn)
-->
**Resolution**


## Abstract

<!--
The Abstraction section ...
-->

Currently, the comments used by **Arx** was inherited from **Kaleidoscope** language.
Now, it needs to be udpated according to the needs of Arx.

Other programming languages have adopted differents approaches for comments
and docstrings (comments used for documentation).

The current proposal presents some approaches used by other languages, and it
ends with a proposal for **Arx**.


## Motivation

Every programming language has its own approach for
[comments][wiki-comments] and [docstrings][wiki-docstrings].
Commonly, comments could be **Inline** or **Multiline**.

**docstrings** is similar to comments, but they used for documentation.

In this section, it is presented some approaches used for comments and
docstrings.

### Comments

As mentioned before, commonly, comments could be **inline** or **multiline**.

Inline comments, usually can be used in the beginning of a line
(all the line would be considered as a comment) or it can be used at the end
of a line.

Some examples of **inline** comments:

```python
# a comment in the beginning of a line

x = 1  # a comment at the end of a line

```

Multiline comments, also known as **comment block**, can be used to create a
block of comments. It is very useful when creating a comment with a long text.

Some examples of **multiline** comment:

```javascript

/* comment block in one line */

/*
 * Multiline comment
 */

```

Before defining the **comments** for **Arx**, it is helpful to check first
how some other languages have implemented that.

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

**Docstrings** are very similar to **comments**, but it is used for
generating documentation. Besides the characters used to start a docstring,
every language also has standards to define the information for the
documentation.

**Note:** It isn't the intention for this document to review the
standards to write the docstrings.

Some examples for **Inline docstrings**:

* `///`: Rust
* `@doc "<some text>"`: Elixir
* `##`: Nim (for documentation)

Some examples for **Multiline docstrings**:

* `/**` and `*/`: C, Java, JavaScript, PHP, C++
* `"""` and `"""`: Python
* `'''` and `'''`: Python
* `@moduledoc """` and `"""`: Elixir
* `##[` and `]##`: Nim
* `(documentation #` and `'<some name> 'function) => "<some output>"`: LISP


## Proposal

**Arx** aims to keep the syntaxes as similar as possible to the languages
more used nowadays, such as **Python** and **C++**. Additionally, it considers
**Yaml** format as a very useful way to write configuration and define a
data structure.

**Key points:**

* Comments
  * Inline comments
  * Multiline comments
* Docstrings

**Conventions**


### Comments

This section proposes the inline and multiline comment for **Arx**.

#### Inline comments

Inline comments should use `#`, and it should work in the same way that was
implement for `Python` (and other languages as well).

It can be added in the beginning of a line, or it can be used at the end of a
line. For example:

```python
# a comment in the beginning of a line

x = 1  # a comment at the end of a line

```

#### Multiline comments

Multiline comments should use triple backsticks (``` ` ```) at the beginning of the comment block
and triple backsticks at the end.

````yaml
```
This multiline comment shows an example of how to use it inside the code.

You can add any comment inside this block.
```
x = 1

````

It be used in the middle of a line of code, For example:

```
function sum(a: int ```the 1st arg``` b: int ```2nd arg```) -> int:
  return a + b
```

**Alternative:**

Alternatively, the user can add the `comment` modifier. For example:

````
```comment
This is a multi line comment using triple backsticks
This doesn't look bad, but it is more verbose.
```
````

So, the triple backsticks would work as a sugar syntax to
triple backsticks with `comment` modifier.

### Docstrings

Similar to the **multiline comments**, **docstring** should use triple backsticks (``` ` ```) at the beginning of the comment block
and triple backsticks at the end.

The docstrings will be used (and required) for **functions** (in the future, also for
**classes** and **methods**). The content should use **Yaml** format
and its structure should follow the
[**numpy docstring standards**][numpy-dcostring].

For example:

````yaml
function sum(a: int, b: int) -> int:
  ```
  title: Sum two integer numbers `a` and `b`

  parameters:
    a: The first parameter
    b: The second parameter

  returns: The sum of two integer numbers
  ```
  return a + b

````

The attributes/keys supported are:

1. title (required)
2. summary
3. deprecated
4. parameters
5. returns
6. raises
7. see Also
8. notes
9. references
10. examples


In the following example, it is presented a full example of docstrings for a function:

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
  # raise an error when a is less than 0
  if a < 0:
    raise ValueError("`a` is less than 0.")

  ```
  The sum function is useful when another function expect a function as
  parameter and you need to add two integers.
  ```
  return a + b

````

The docstrings should be required at compile-time, and the attribute `title` is required. The other attributes are optional.

## Future works

1. Additionally, the docstring for parameters description could be
defined inline inside the function signature.

````
function sum(a: int ```the 1st arg``` b: int ```2nd arg``` -> int:
  ```
  title: Sum two integer numbers.
  ```
  return a + b
````

2. The docstrings should be converted into a dictionary, and it should
be available inside the code. For example:

```
print(sum.__doc__)
```

These topics should be discussed for future implementation.


## Copyright

This document has been placed in the public domain.

## References

* [Comments][wiki-comments]
* [Docstrings][wiki-docstrings]
* [Numpy Docstrings Format][numpy-docstrings]
## Changelog

- 2021-03-24: Creation of the document

<!-- markdown references -->

[wiki-comments]: https://en.wikipedia.org/wiki/Comment_(computer_programming)
[wiki-docstrings]: https://en.wikipedia.org/wiki/Docstring
[numpy-docstrings]: https://numpydoc.readthedocs.io/en/latest/format.html
