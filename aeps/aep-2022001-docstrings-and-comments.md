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

Multiline comments should use triple `#` at the beginning of the comment block
and triple `#` at the end of the comment block. The user can use one `#` for
every line inside the comment block in order to have a visual block of
the comment. For example:

```python
###
This multiline comment shows an example of how to use it inside the code.

You can add any comment inside this block.
###
x = 1

###
# In order to have a better look for the comment block, you can add a `#`
# for every line, aligned to the `###` used for starting and ending the
# comment block.
#
# The internal `#` is optional, but it helps to organize the comment
# visually.
###
x = 2

```

```cpp
/*
This multiline comment shows an example of how to use it inside the code.

You can add any comment inside this block.
 */
x = 1
```

It cannot be used in the middle of a line of code, For example:

```
# Wrong

function sum(a: int ### the first arg ###, b: int ### second arg ###) -> int:
  return a + b
```

**Alternative:**

One alternative would be to use triple backsticks (``` ` ```), but as it
will be used for docstrings, it would increase the complexity of the
lexer/parser, because the compiler, usually, just ignore all the comments
before tokenize the source code. Using triple bacsticks, the compiler will
need to check if it is a comment or docstring according to its position.

Another alternative would be to use triple backsticks plus an extra modifier,
for example `comment`. For example:

````
```comment
This is a multi line comment using triple backsticks
This doesn't look bad, but it is more verbose.
```
````

### Docstrings

The docstrings will be defined

## Examples

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
  # raise an error when a is less than 0
  if a < 0:
    raise ValueError("`a` is less than 0.")

  ###
  The sum function is useful when another function expect a function as
  parameter and you need to add two integers.
  ###
  return a + b

````

## Conclusion

The

## Copyright

This document has been placed in the public domain.

## References

<!--
In the references section ...
-->

* Title: url

## Changelog

- 2021-03-24: Creation of the document


[wiki-comments]: https://en.wikipedia.org/wiki/Comment_(computer_programming)
[wiki-docstrings]: https://en.wikipedia.org/wiki/Docstring
