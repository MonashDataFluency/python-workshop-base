---
jupytext:
  formats: ipynb,md:myst
  text_representation:
    extension: .md
    format_name: myst
    format_version: 0.13
    jupytext_version: 1.11.5
kernelspec:
  display_name: Python 3
  language: python
  name: python3
---

+++ {"slideshow": {"slide_type": "slide"}}

# Introduction - The Basics of Python

+++

Python is a general purpose programming language that supports rapid development
of scripts and applications.

Python's main advantages:

* Open Source software, supported by Python Software Foundation
* Available on all major platforms (ie. Windows, Linux and MacOS) 
* It is a general-purpose programming language, designed for readability
* Supports multiple programming paradigms ('functional', 'object oriented')
* Very large community with a rich ecosystem of third-party packages

+++

## Interpreter

Python is an interpreted language[*](https://softwareengineering.stackexchange.com/a/24560) which can be used in two ways:

* "Interactive" Mode: It functions like an "advanced calculator", executing
  one command at a time:
  
```bash
user:host:~$ python
Python 3.5.1 (default, Oct 23 2015, 18:05:06)
[GCC 4.8.3] on linux2
Type "help", "copyright", "credits" or "license" for more information.
>>> 2 + 2
4
>>> print("Hello World")
Hello World
```

+++

* "Scripting" Mode: Executing a series of "commands" saved in text file,
  usually with a `.py` extension after the name of your file:

```bash
user:host:~$ python my_script.py
Hello World
```

+++

## Using interactive Python in Jupyter-style notebooks

A convenient and powerful way to use interactive-mode Python is via a Jupyter Notebook, or similar browser-based interface.

This particularly lends itself to data analysis since the notebook records a history of commands and shows output and graphs immediately in the browser.

There are several ways you can run a Jupyter(-style) notebook - locally installed on your computer or hosted as a service on the web. Today we will use a Jupyter notebook service provided by Google: https://colab.research.google.com (Colaboratory).

### Jupyter-style notebooks: a quick tour

Go to https://colab.research.google.com and login with your Google account.

Select ***NEW NOTEBOOK → NEW PYTHON 3 NOTEBOOK*** - a new notebook will be created.

---

Type some Python code in the top cell, eg:

```python
print("Hello Jupyter !")
```

***Shift-Enter*** to run the contents of the cell

---

You can add new cells.

***Insert → Insert Code Cell***

---

NOTE: When the text on the left hand of the cell is: `In [*]` (with an asterisk rather than a number), the cell is still running. It's usually best to wait until one cell has finished running before running the next.

Let's begin writing some code in our notebook.

```{code-cell} ipython3
---
slideshow:
  slide_type: '-'
---
print("Hello Jupyter !")
```

+++ {"slideshow": {"slide_type": "slide"}}

In Jupyter/Collaboratory, just typing the name of a variable in the cell prints its representation:

```{code-cell} ipython3
---
slideshow:
  slide_type: '-'
---
message = "Hello again !"
message
```

```{code-cell} ipython3
---
slideshow:
  slide_type: slide
---
# A 'hash' symbol denotes a comment
# This is a comment. Anything after the 'hash' symbol on the line is ignored by the Python interpreter

print("No comment")  # comment
```

+++ {"slideshow": {"slide_type": "slide"}}

## Variables and data types
### Integers, floats, strings

```{code-cell} ipython3
---
slideshow:
  slide_type: '-'
---
a = 5
```

```{code-cell} ipython3
a
```

```{code-cell} ipython3
type(a)
```

Adding a decimal point creates a `float`

```{code-cell} ipython3
b = 5.0
```

```{code-cell} ipython3
b
```

```{code-cell} ipython3
type(b)
```

+++ {"slideshow": {"slide_type": "slide"}}

`int` and `float` are collectively called 'numeric' types

(There are also other numeric types like `hex` for hexidemical and `complex` for complex numbers)

+++ {"tags": ["challenge"]}

## Challenge - Types

What is the **type** of the variable `letters` defined below ?

`letters = "ABACBS"`

* A) `int`
* B) `str`
* C) `float`
* D) `text`

Write some code the outputs the type - paste your answer into the Etherpad.

+++ {"tags": ["solution"]}

## Solution

Option B - `str`.

```{code-cell} ipython3
:tags: [solution]

letters = "ABACBS"
type(letters)
```

+++ {"slideshow": {"slide_type": "slide"}}

### Strings

```{code-cell} ipython3
some_words = "Python3 strings are Unicode (UTF-8) ❤❤❤ 😸 蛇"
```

```{code-cell} ipython3
some_words
```

```{code-cell} ipython3
type(some_words)
```

The variable `some_words` is of type `str`, short for "string". Strings hold
sequences of characters, which can be letters, numbers, punctuation
or more exotic forms of text (even emoji!).

+++ {"slideshow": {"slide_type": "slide"}}

## Operators

We can perform mathematical calculations in Python using the basic operators:

`+`  `-`  `*`  `/`  `%`  `**`

```{code-cell} ipython3
2 + 2  # Addition
```

```{code-cell} ipython3
6 * 7  # Multiplication
```

```{code-cell} ipython3
2 ** 16  # Power
```

```{code-cell} ipython3
13 % 5  # Modulo
```

```{code-cell} ipython3
---
slideshow:
  slide_type: slide
---
# int + int = int
a = 5
a + 1
```

```{code-cell} ipython3
# float + int = float
b = 5.0
b + 1
```

```{code-cell} ipython3
a + b
```

+++ {"slideshow": {"slide_type": "slide"}}

```python
some_words = "I'm a string"
a = 6
a + some_words
```


+++

Outputs:

```
---------------------------------------------------------------------------
TypeError                                 Traceback (most recent call last)
<ipython-input-1-781eba7cf148> in <module>()
      1 some_words = "I'm a string"
      2 a = 6
----> 3 a + some_words

TypeError: unsupported operand type(s) for +: 'int' and 'str'
```

```{code-cell} ipython3
str(a) + " " + some_words
```

```{code-cell} ipython3
# Shorthand: operators with assignment
a += 1
a

# Equivalent to:
# a = a + 1
```

### Boolean operations

We can also use comparison and logic operators:
`<, >, ==, !=, <=, >=` and statements of identity such as
`and, or, not`. The data type returned by this is
called a _boolean_.

```{code-cell} ipython3
3 > 4
```

```{code-cell} ipython3
True and True
```

```{code-cell} ipython3
True or False
```

+++ {"slideshow": {"slide_type": "slide"}}

## Lists and sequence types

+++ {"slideshow": {"slide_type": "slide"}}

### Lists

```{code-cell} ipython3
numbers = [2, 4, 6, 8, 10]
numbers
```

```{code-cell} ipython3
# `len` get the length of a list
len(numbers)
```

```{code-cell} ipython3
# Lists can contain multiple data types, including other lists
mixed_list = ["asdf", 2, 3.142, numbers, ['a','b','c']]
mixed_list
```

You can retrieve items from a list by their *index*. In Python, the first item has an index of 0 (zero).

```{code-cell} ipython3
numbers[0]
```

```{code-cell} ipython3
numbers[3]
```

You can also assign a new value to any position in the list.

```{code-cell} ipython3
numbers[3] = numbers[3] * 100
numbers
```

You can append items to the end of the list.

```{code-cell} ipython3
numbers.append(12)
numbers
```

You can add multiple items to the end of a list with `extend`.

```{code-cell} ipython3
numbers.extend([14, 16, 18])
numbers
```

### Loops

A for loop can be used to access the elements in a list or other Python data structure one at a time. We will learn about loops in other lesson.

```{code-cell} ipython3
for num in numbers:
    print(num)
```

**Indentation** is very important in Python. Note that the second line in the
example above is indented, indicating the code that is the body of the loop.

+++

To find out what methods are available for an object, we can use the built-in `help` command:

```{code-cell} ipython3
help(numbers)
```

+++ {"slideshow": {"slide_type": "slide"}}

### Tuples

A tuple is similar to a list in that it's an ordered sequence of elements.
However, tuples can not be changed once created (they are "immutable"). Tuples
are created by placing comma-separated values inside parentheses `()`.

```{code-cell} ipython3
tuples_are_immutable = ("bar", 100, 200, "foo")
tuples_are_immutable
```

```{code-cell} ipython3
tuples_are_immutable[1]
```

```python
tuples_are_immutable[1] = 666
```

+++

Outputs:

```
---------------------------------------------------------------------------
TypeError                                 Traceback (most recent call last)
<ipython-input-39-c91965b0815a> in <module>()
----> 1 tuples_are_immutable[1] = 666

TypeError: 'tuple' object does not support item assignment
```

+++ {"slideshow": {"slide_type": "slide"}}

### Dictionaries

Dictionaries are a container that store key-value pairs. They are unordered. 

Other programming languages might call this a 'hash', 'hashtable' or 'hashmap'.

```{code-cell} ipython3
pairs = {'Apple': 1, 'Orange': 2, 'Pear': 4}
pairs
```

```{code-cell} ipython3
pairs['Orange']
```

```{code-cell} ipython3
pairs['Orange'] = 16
pairs
```

The `items` method returns a sequence of the key-value pairs as tuples.

`values` returns a sequence of just the values.

`keys` returns a sequence of just the keys.

---
In Python 3, the `.items()`, `.values()` and `.keys()` methods return a ['dictionary view' object](https://docs.python.org/3/library/stdtypes.html#dictionary-view-objects) that behaves like a list or tuple in for loops but doesn't support indexing. 'Dictionary views' stay in sync even when the dictionary changes.

You can turn them into a normal list or tuple with the `list()` or `tuple()` functions.

```{code-cell} ipython3
---
slideshow:
  slide_type: subslide
---
pairs.items()
# list(pairs.items())
```

```{code-cell} ipython3
---
slideshow:
  slide_type: subslide
---
pairs.values()
# list(pairs.values())
```

```{code-cell} ipython3
---
slideshow:
  slide_type: subslide
---
pairs.keys()
# list(pairs.keys())
```

```{code-cell} ipython3
---
slideshow:
  slide_type: subslide
---
len(pairs)
```

```{code-cell} ipython3
---
slideshow:
  slide_type: subslide
---
dict_of_dicts = {'first': {1:2, 2: 4, 4: 8, 8: 16}, 'second': {'a': 2.2, 'b': 4.4}}
dict_of_dicts
```

+++ {"tags": ["challenge"]}

## Challenge - Dictionaries

Given the dictionary:

```python
jam_ratings = {'Plum': 6, 'Apricot': 2, 'Strawberry': 8}
```

How would you change the value associated with the key `Apricot` to `9`.

A) `jam_ratings = {'apricot': 9}`

B) `jam_ratings[9] = 'Apricot'`

C) `jam_ratings['Apricot'] = 9`

D) `jam_ratings[2] = 'Apricot'`

+++ {"tags": ["solution"]}

## Solution - Dictionaries

The correct answer is **C**.

**A** assigns the name `jam_ratings` to a new dictionary with only the key `apricot` - not only are the other jam ratings now missing, but strings used as dictionary keys are *case sensitive* - `apricot` is not the same key as `Apricot`.

**B** mixes up the value and the key. Assigning to a dictionary uses the form: `dictionary[key] = value`.

**C** is correct. Bonus - another way to do this would be `jam_ratings.update({'Apricot': 9})` or even `jam_ratings.update(Apricot=9)`.

**D** mixes up the value and the key (and doesn't actually include the new value to be assigned, `9`, anywhere). `2` is the original *value*, `Apricot` is the key. Assigning to a dictionary uses the form: `dictionary[key] = value`.
