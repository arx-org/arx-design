# FIP 2021-002-03: Classes

**Authors** Ivan Ogasawara <ivan.ogasawara at gmail.com>

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

...

## Motivation

...

## Proposal

**Key points:**

* General Definition
* Visibility
* Attributes and Type Annotation
* Methods and Type Annotation
  * Regular Methods
  * Static Methods
  * Methods Decoration
  * Core methods
* Inheritance
* Template class
* Interface
* Instantiation
* Docstrings

**Conventions**

In this proposal, some examples use placeholders by adding a name inside `<>`
(e.g. `class <ClassName>`), it means that `<className>` should be replaced by
a name that will identify that class, for example, `class MyClass`.
Placeholders can be written using `CamelCase` or `snake_case` or, simply,
using words separated by dash (e.g. `block-of-code`) but it is not
stricted to values in this style.

Optional parameters are represented by `[]`, for example:
`[public] class <ClassName>`. It means that you can ommit `public` keyword
before the class statement. If there are more options for this section,
it can be expressed using `|`, for example: `[ public | protected | private]`.
If there is a default value when this section is ommited, it can be expressed
using `*`, for example: `[ public* | protected | private]`.

Also, it is possible to combine placeholders with optional values,
for example:
`[<visibility: public* | protected | private >] class <ClassName>:`
and it will match the follow statement:
`public class MyPublicClass:` as well as
`class MyPublicClass:`.

When a section can have more items using the same pattern, it can use the
`...` notation. For example:
`function <function_name>([<parameter_name_1>: <parameter_type_1>, ...])`
can match the following statement: `function my_func(a: int)`
as well as `function my_func(a: int, b: float)`.

""" General Definition

The proposal for class on **Fenix** presents the following structure:

```

[<visibility: public* | protected | private >] class <ClassName> [()|(<BaseClassName>, ...)]:
  [
    <docstring>
  ]

  [
  attributes:
    <attribute_name_1>: <visibility: [ public* | protected | private ]> [<mutability: mutable* | constant >] <attribute_type_1> [ = <default_value>]
    ...
  ]

  [
    methods:
      <method_name_1>([<mutability_parameter_1: mutable* | constant >] <parameter_name_1>: <parameter_type_1>, ... ]) [ -> <return_type> ]:
        <block_of_code>
        [return [<some_value>]]

      ...
  ]

```

Notes:
  - Visibility should be defined explicitly
  - Mutability should be defined explicitly
  - For private `[-]` and protected `[#]` attributes it is optional the usage
    of a `_` as prefix, e.g. `_attr1` or `_attr2`. Maybe it can
    help to improve the code readability.


### Visibility

...


### Attributes and Type Annotation

...

### Methods and Type Annotation

...

#### Regular Methods

...

#### Static Methods

...


#### Methods Decoration

...

#### Core methods


**Initialization and Construction**

  - `__new__`(other)	To get called in an object's instantiation.
  - `__init__`(other)	To get called by the `__new__ method.
  - `__del__`()	Destructor method.

**Comparison core methods**

  - `__cmp__`(other) It is the most basic of the comparison magic methods.
    It actually implements behavior for all of the comparison operators (<, ==, !=, etc.)
  - `__eq__`(other)	To get called on comparison using == operator.
  - `__ge__`(other)	To get called on comparison using >= operator.
  - `__gt__`(other)	To get called on comparison using > operator.
  - `__lt__`(other)	To get called on comparison using < operator.
  - `__le__`(other)	To get called on comparison using <= operator.
  - `__ne__`(other)	To get called on comparison using != operator.


**Numeric Unary operators and functions**

  - `__pos__`()	To get called for unary positive e.g. +someobject.
  - `__neg__`()	To get called for unary negative e.g. -someobject.
  - `__abs__`()	To get called by built-in abs() function.
  - `__invert__`()	To get called for inversion using the ~ operator.
  - `__round__`(self,n)	To get called by built-in round() function.
  - `__floor__`()	To get called by built-in math.floor() function.
  - `__ceil__`()	To -  other)	To get called on integer division with assignment e.g. a //=b.


  - `__idiv__`(other)	To get called on division with assignment e.g. a /=b.
  - `__itruediv__`(other)	To get called on true division with assignment
  - `__imod__`(other)	To get called on modulo with assignment e.g. a%=b.
  - `__ipow__`(other)	To get called on exponentswith assignment e.g. a **=b.
  - `__ilshift__`(other)	To get called on left bitwise shift with assignment e.g. a<<=b.
  - `__irshift__`(other)	To get called on right bitwise shift with assignment e.g. a >>=b.
  - `__iand__`(other)	To get called on bitwise AND with assignment e.g. a&=b.
  - `__ior__`(other)	To get called on bitwise OR with assignment e.g. a|=b.
  - `__ixor__`(other)	To get called on bitwise XOR with assignment e.g. a ^=b.



**String Core Methods**
  - `__str__`()	To get called by built-int str() method to return a string representation of a type.
  - `__repr__`()	To get called by built-int repr() method to return a machine readable representation of a type.

**Attribute Core Methods**
  - `__getattr__`(name)	Is called when the accessing attribute of a class that does not exist.
  - `__setattr__`(name, value)	Is called when assigning a value to the attribute of a class.


### Inheritance


### Docstrings


### Class Instance


### Example

```fenix

"""
notes:
- This example ilustrate how to create a class for Fenix Language.
"""

interface IBase:
  """
  title: Define the interface for Base classes.
  """
  attributes:
    _attr1: [-] Nullable[int]
    _attr2: [#] mutable float
    attr3: [+] constant string = "default"

  methods:
    add(number1: int32, number2: int32)[+] -> int32
    sub(number1: int32, number2: int32)[+] -> int32


class Base(IBase)[+]:
  """
  title: The Base class aims to organize a simple and util set of attributes
    and methods to be reused for derived classes.
  """

  attributes:
    ### Attribute used as a first information
    _attr1: [-] mutable [int|float]?
    ### Attribute used as a second information
    _attr2: [#] mutable float
    ### Attribute used as a third information
    attr3: [+] constant string = "default"

  methods:
    __init__(
      attr1: [int|float]?,
      attr2: mutable float,
      attr3: constant string = "default2"
    )[+]:
      """
      title: Initialize the Base instance.

      parameters:
        - attr1: The first parameter.
        - attr2: The second parameter.
        - attr3: The third parameter.

      notes:
        - if at the end of `__init__, self.attr1 is not defined, it
          will assume `null`
        - if at the end of `__init__, self.attr2 is not defined, an
          error is raised.
        - if at the end of `__init__, self.attr3 is not defined, it
          will assume `"default"` string.

      """
      self.attr1 = attr1
      self.attr2 = attr2
      self.attr3 = attr3

    add(
      (number1: constant int32, number2: constant int32) -> int32,
      (number1: constant int64, number2: constant int64) -> int64,
      (number1: constant float32, number2: constant float32) -> float32
    )[+]:
      """
      title: Add two integer and return the result.

      parameters:
        - number1: The first number for the addition operation.
        - number1: The second number for the addition operation.

      return: The result of the addition between number1 and number2.
      """
      return number1 + number2

    add(*args: Tuple<string>)[+] -> string:
      return ''.join(args, sep=', ')

    add(value1: constant <T>, value2: constant <U>)[+]:
      raise Exception(
        "The operation between {type(value1)} and {type(value2)} " +
        " is not supported".
      )


class DerivedOne(Base)[+]:
  attributes:
    attr4: [+] mutable datetime

  methods:
    __init__(
      attr1: mutable nullable int,
      attr2: mutable float,
      attr3: constant string = "default2",
      attr4: datetime = datetime.now()
    )[+]:
      """
      title: Initialize the Derived class.

      parameters:
        - attr1: The first parameter.
        - attr2: The second parameter.
        - attr3: The third parameter.
        - attr4: The forth attribute
      """
      ## or, in this case, just `self.__base__.__init__` ...
      self.__base__[Base].__init__(attr1, attr2, attr3)
      self.attr4 = attr4

    sub(number1: int32, number2: int32)[+] -> int32:
      """
      title: Subtract two integer and return the result.

      parameters:
        - number1: The first number for the subtraction operation.
        - number1: The second number for the subtraction operation.

      return: The result of the addition between number1 and number2.
      """
      return number1 + number2

    _update_attr4()[-]:
      self.attr4 = datetime.now()

    is_positive_number(number: int)[+, static] -> bool:
      return number >= 0


class MyGenericClass<const T, mutable U>:
  attributes:
    attr1: [+] <T>
    attr2: [+] <U>

  methods:
    __init__(attr1: <T>, attr2: <U>)[+]:
      self.attr1 = attr1
      self.attr2 = attr2


derived_obj = DerivedOne(attr1=null, attr2=2.5)
generic_obj = MyGenericClass<int32, float32>(2, 2.2)

```

## Copyright

This document has been placed in the public domain.


## References

* Magic Methods in Python: https://www.tutorialsteacher.com/python/magic-methods-in-python
* A Guide to Python's Magic Methods: https://rszalski.github.io/magicmethods/
* Class diagram: https://en.wikipedia.org/wiki/Class_diagram
* Multiple dispatch: https://en.wikipedia.org/wiki/Multiple_dispatch
* Template (C++): https://en.wikipedia.org/wiki/Template_(C%2B%2B)
* Generics in Java: https://en.wikipedia.org/wiki/Generics_in_Java
* Template metaprogramming: https://en.wikipedia.org/wiki/Template_metaprogramming
* Generic programming: https://en.wikipedia.org/wiki/Generic_programming
* Metaprogramming: https://en.wikipedia.org/wiki/Metaprogramming
* Polymorphism (computer science): https://en.wikipedia.org/wiki/Polymorphism_(computer_science)
* Nullable type: https://en.wikipedia.org/wiki/Nullable_type
* Option type: https://en.wikipedia.org/wiki/Option_type


## Changelog

- 2021-02-23: Creation of the document
