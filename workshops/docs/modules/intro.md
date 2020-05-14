

<style>
.output_label {
    text-align: right;
    margin: -1em;
    padding: 0;
    font-size: 0.5em;
    color: grey
}
</style>


# Python: the basics





Python is a general purpose programming language that supports rapid development
of scripts and applications.

Python's main advantages:

* Open Source software, supported by Python Software Foundation
* Available on all major platforms (ie. Windows, Linux and MacOS) 
* It is a general-purpose programming language, designed for readability
* Supports multiple programming paradigms ('functional', 'object oriented')
* Very large community with a rich ecosystem of third-party packages





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





* "Scripting" Mode: Executing a series of "commands" saved in text file,
  usually with a `.py` extension after the name of your file:

```bash
user:host:~$ python my_script.py
Hello World
```





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






```python
print("Hello Jupyter !")
```

<pre class="output">
<div class="output_label">output</div>
<code class="text">
Hello Jupyter !

</code>
</pre>





In Jupyter/Collaboratory, just typing the name of a variable in the cell prints its representation:






```python
message = "Hello again !"
message
```




<pre class="output">
<div style="text-align: right; margin: -1em; padding: 0;"><span style="font-size: 0.5em; color: grey">output</span></div>
<code class="text">
'Hello again !'
</code>
</pre>








```python
# A 'hash' symbol denotes a comment
# This is a comment. Anything after the 'hash' symbol on the line is ignored by the Python interpreter

print("No comment")  # comment
```

<pre class="output">
<div class="output_label">output</div>
<code class="text">
No comment

</code>
</pre>





## Variables and data types
### Integers, floats, strings






```python
a = 5
```






```python
a
```




<pre class="output">
<div style="text-align: right; margin: -1em; padding: 0;"><span style="font-size: 0.5em; color: grey">output</span></div>
<code class="text">
5
</code>
</pre>








```python
type(a)
```




<pre class="output">
<div style="text-align: right; margin: -1em; padding: 0;"><span style="font-size: 0.5em; color: grey">output</span></div>
<code class="text">
int
</code>
</pre>







Adding a decimal point creates a `float`






```python
b = 5.0
```






```python
b
```




<pre class="output">
<div style="text-align: right; margin: -1em; padding: 0;"><span style="font-size: 0.5em; color: grey">output</span></div>
<code class="text">
5.0
</code>
</pre>








```python
type(b)
```




<pre class="output">
<div style="text-align: right; margin: -1em; padding: 0;"><span style="font-size: 0.5em; color: grey">output</span></div>
<code class="text">
float
</code>
</pre>







`int` and `float` are collectively called 'numeric' types

(There are also other numeric types like `hex` for hexidemical and `complex` for complex numbers)





## Challenge - Types

What is the **type** of the variable `letters` defined below ?

`letters = "ABACBS"`

* A) `int`
* B) `str`
* C) `float`
* D) `text`

Write some code the outputs the type - paste your answer into the Etherpad.




<!-- 
## Solution

Option B - `str`.
 -->



<!-- 

```python
letters = "ABACBS"
type(letters)
```




<pre class="output">
<div style="text-align: right; margin: -1em; padding: 0;"><span style="font-size: 0.5em; color: grey">output</span></div>
<code class="text">
str
</code>
</pre>


 -->




### Strings






```python
some_words = "Python3 strings are Unicode (UTF-8) ❤❤❤ 😸 蛇"
```






```python
some_words
```




<pre class="output">
<div style="text-align: right; margin: -1em; padding: 0;"><span style="font-size: 0.5em; color: grey">output</span></div>
<code class="text">
'Python3 strings are Unicode (UTF-8) ❤❤❤ 😸 蛇'
</code>
</pre>








```python
type(some_words)
```




<pre class="output">
<div style="text-align: right; margin: -1em; padding: 0;"><span style="font-size: 0.5em; color: grey">output</span></div>
<code class="text">
str
</code>
</pre>







The variable `some_words` is of type `str`, short for "string". Strings hold
sequences of characters, which can be letters, numbers, punctuation
or more exotic forms of text (even emoji!).





## Operators

We can perform mathematical calculations in Python using the basic operators:

`+`  `-`  `*`  `/`  `%` `//` `**`






```python
2 + 2  # Addition
```




<pre class="output">
<div style="text-align: right; margin: -1em; padding: 0;"><span style="font-size: 0.5em; color: grey">output</span></div>
<code class="text">
4
</code>
</pre>







```python
6 * 7  # Multiplication
```

<pre class="output">
<div style="text-align: right; margin: -1em; padding: 0;"><span style="font-size: 0.5em; color: grey">output</span></div>
<code class="text">
42
</code>
</pre>







```python
5 / 2  # Division
```




<pre class="output">
<div style="text-align: right; margin: -1em; padding: 0;"><span style="font-size: 0.5em; color: grey">output</span></div>
<code class="text">
2.5
</code>
</pre>





```python
13 % 5  # Modulo
```




<pre class="output">
<div style="text-align: right; margin: -1em; padding: 0;"><span style="font-size: 0.5em; color: grey">output</span></div>
<code class="text">
3
</code>
</pre>




```python
13 // 5  # Floor division
```




<pre class="output">
<div style="text-align: right; margin: -1em; padding: 0;"><span style="font-size: 0.5em; color: grey">output</span></div>
<code class="text">
2
</code>
</pre>








```python
2 ** 16  # Power
```




<pre class="output">
<div style="text-align: right; margin: -1em; padding: 0;"><span style="font-size: 0.5em; color: grey">output</span></div>
<code class="text">
65536
</code>
</pre>














```python
# int + int = int
a = 5
a + 1
```




<pre class="output">
<div style="text-align: right; margin: -1em; padding: 0;"><span style="font-size: 0.5em; color: grey">output</span></div>
<code class="text">
6
</code>
</pre>








```python
# float + int = float
b = 5.0
b + 1
```




<pre class="output">
<div style="text-align: right; margin: -1em; padding: 0;"><span style="font-size: 0.5em; color: grey">output</span></div>
<code class="text">
6.0
</code>
</pre>








```python
a + b
```




<pre class="output">
<div style="text-align: right; margin: -1em; padding: 0;"><span style="font-size: 0.5em; color: grey">output</span></div>
<code class="text">
10.0
</code>
</pre>







```python
some_words = "I'm a string"
a = 6
a + some_words
```







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






```python
str(a) + " " + some_words
```




<pre class="output">
<div style="text-align: right; margin: -1em; padding: 0;"><span style="font-size: 0.5em; color: grey">output</span></div>
<code class="text">
'5 Python3 strings are Unicode (UTF-8) ❤❤❤ 😸 蛇'
</code>
</pre>








```python
# Shorthand: operators with assignment
a += 1
a

# Equivalent to:
# a = a + 1
```




<pre class="output">
<div style="text-align: right; margin: -1em; padding: 0;"><span style="font-size: 0.5em; color: grey">output</span></div>
<code class="text">
6
</code>
</pre>







### Boolean operations

We can also use comparison and logic operators:
`<, >, ==, !=, <=, >=` and statements of identity such as
`and, or, not`. The data type returned by this is
called a _boolean_.







```python
3 > 4
```




<pre class="output">
<div style="text-align: right; margin: -1em; padding: 0;"><span style="font-size: 0.5em; color: grey">output</span></div>
<code class="text">
False
</code>
</pre>








```python
True and True
```




<pre class="output">
<div style="text-align: right; margin: -1em; padding: 0;"><span style="font-size: 0.5em; color: grey">output</span></div>
<code class="text">
True
</code>
</pre>








```python
True or False
```




<pre class="output">
<div style="text-align: right; margin: -1em; padding: 0;"><span style="font-size: 0.5em; color: grey">output</span></div>
<code class="text">
True
</code>
</pre>







## Lists and sequence types





### Lists






```python
numbers = [2, 4, 6, 8, 10]
numbers
```




<pre class="output">
<div style="text-align: right; margin: -1em; padding: 0;"><span style="font-size: 0.5em; color: grey">output</span></div>
<code class="text">
[2, 4, 6, 8, 10]
</code>
</pre>








```python
# `len` get the length of a list
len(numbers)
```




<pre class="output">
<div style="text-align: right; margin: -1em; padding: 0;"><span style="font-size: 0.5em; color: grey">output</span></div>
<code class="text">
5
</code>
</pre>








```python
# Lists can contain multiple data types, including other lists
mixed_list = ["asdf", 2, 3.142, numbers, ['a','b','c']]
mixed_list
```




<pre class="output">
<div style="text-align: right; margin: -1em; padding: 0;"><span style="font-size: 0.5em; color: grey">output</span></div>
<code class="text">
['asdf', 2, 3.142, [2, 4, 6, 8, 10], ['a', 'b', 'c']]
</code>
</pre>







You can retrieve items from a list by their *index*. In Python, the first item has an index of 0 (zero).






```python
numbers[0]
```




<pre class="output">
<div style="text-align: right; margin: -1em; padding: 0;"><span style="font-size: 0.5em; color: grey">output</span></div>
<code class="text">
2
</code>
</pre>








```python
numbers[3]
```




<pre class="output">
<div style="text-align: right; margin: -1em; padding: 0;"><span style="font-size: 0.5em; color: grey">output</span></div>
<code class="text">
8
</code>
</pre>







You can also assign a new value to any position in the list.






```python
numbers[3] = numbers[3] * 100
numbers
```




<pre class="output">
<div style="text-align: right; margin: -1em; padding: 0;"><span style="font-size: 0.5em; color: grey">output</span></div>
<code class="text">
[2, 4, 6, 800, 10]
</code>
</pre>







You can append items to the end of the list.






```python
numbers.append(12)
numbers
```




<pre class="output">
<div style="text-align: right; margin: -1em; padding: 0;"><span style="font-size: 0.5em; color: grey">output</span></div>
<code class="text">
[2, 4, 6, 800, 10, 12]
</code>
</pre>







You can add multiple items to the end of a list with `extend`.






```python
numbers.extend([14, 16, 18])
numbers
```




<pre class="output">
<div style="text-align: right; margin: -1em; padding: 0;"><span style="font-size: 0.5em; color: grey">output</span></div>
<code class="text">
[2, 4, 6, 800, 10, 12, 14, 16, 18]
</code>
</pre>







### Loops

A for loop can be used to access the elements in a list or other Python data structure one at a time. We will learn about loops in other lesson.






```python
for num in numbers:
    print(num)
```

<pre class="output">
<div class="output_label">output</div>
<code class="text">
2
4
6
800
10
12
14
16
18

</code>
</pre>





**Indentation** is very important in Python. Note that the second line in the
example above is indented, indicating the code that is the body of the loop.





To find out what methods are available for an object, we can use the built-in `help` command:






```python
help(numbers)
```

<pre class="output">
<div class="output_label">output</div>
<code class="text">
Help on list object:

class list(object)
 |  list() -> new empty list
 |  list(iterable) -> new list initialized from iterable's items
 |  
 |  Methods defined here:
 |  
 |  __add__(self, value, /)
 |      Return self+value.
 |  
 |  __contains__(self, key, /)
 |      Return key in self.
 |  
 |  __delitem__(self, key, /)
 |      Delete self[key].
 |  
 |  __eq__(self, value, /)
 |      Return self==value.
 |  
 |  __ge__(self, value, /)
 |      Return self>=value.
 |  
 |  __getattribute__(self, name, /)
 |      Return getattr(self, name).
 |  
 |  __getitem__(...)
 |      x.__getitem__(y) <==> x[y]
 |  
 |  __gt__(self, value, /)
 |      Return self>value.
 |  
 |  __iadd__(self, value, /)
 |      Implement self+=value.
 |  
 |  __imul__(self, value, /)
 |      Implement self*=value.
 |  
 |  __init__(self, /, *args, **kwargs)
 |      Initialize self.  See help(type(self)) for accurate signature.
 |  
 |  __iter__(self, /)
 |      Implement iter(self).
 |  
 |  __le__(self, value, /)
 |      Return self<=value.
 |  
 |  __len__(self, /)
 |      Return len(self).
 |  
 |  __lt__(self, value, /)
 |      Return self<value.
 |  
 |  __mul__(self, value, /)
 |      Return self*value.
 |  
 |  __ne__(self, value, /)
 |      Return self!=value.
 |  
 |  __new__(*args, **kwargs) from builtins.type
 |      Create and return a new object.  See help(type) for accurate signature.
 |  
 |  __repr__(self, /)
 |      Return repr(self).
 |  
 |  __reversed__(...)
 |      L.__reversed__() -- return a reverse iterator over the list
 |  
 |  __rmul__(self, value, /)
 |      Return value*self.
 |  
 |  __setitem__(self, key, value, /)
 |      Set self[key] to value.
 |  
 |  __sizeof__(...)
 |      L.__sizeof__() -- size of L in memory, in bytes
 |  
 |  append(...)
 |      L.append(object) -> None -- append object to end
 |  
 |  clear(...)
 |      L.clear() -> None -- remove all items from L
 |  
 |  copy(...)
 |      L.copy() -> list -- a shallow copy of L
 |  
 |  count(...)
 |      L.count(value) -> integer -- return number of occurrences of value
 |  
 |  extend(...)
 |      L.extend(iterable) -> None -- extend list by appending elements from the iterable
 |  
 |  index(...)
 |      L.index(value, [start, [stop]]) -> integer -- return first index of value.
 |      Raises ValueError if the value is not present.
 |  
 |  insert(...)
 |      L.insert(index, object) -- insert object before index
 |  
 |  pop(...)
 |      L.pop([index]) -> item -- remove and return item at index (default last).
 |      Raises IndexError if list is empty or index is out of range.
 |  
 |  remove(...)
 |      L.remove(value) -> None -- remove first occurrence of value.
 |      Raises ValueError if the value is not present.
 |  
 |  reverse(...)
 |      L.reverse() -- reverse *IN PLACE*
 |  
 |  sort(...)
 |      L.sort(key=None, reverse=False) -> None -- stable sort *IN PLACE*
 |  
 |  ----------------------------------------------------------------------
 |  Data and other attributes defined here:
 |  
 |  __hash__ = None


</code>
</pre>





### Tuples

A tuple is similar to a list in that it's an ordered sequence of elements.
However, tuples can not be changed once created (they are "immutable"). Tuples
are created by placing comma-separated values inside parentheses `()`.






```python
tuples_are_immutable = ("bar", 100, 200, "foo")
tuples_are_immutable
```




<pre class="output">
<div style="text-align: right; margin: -1em; padding: 0;"><span style="font-size: 0.5em; color: grey">output</span></div>
<code class="text">
('bar', 100, 200, 'foo')
</code>
</pre>








```python
tuples_are_immutable[1]
```




<pre class="output">
<div style="text-align: right; margin: -1em; padding: 0;"><span style="font-size: 0.5em; color: grey">output</span></div>
<code class="text">
100
</code>
</pre>







```python
tuples_are_immutable[1] = 666
```





Outputs:

```
---------------------------------------------------------------------------
TypeError                                 Traceback (most recent call last)
<ipython-input-39-c91965b0815a> in <module>()
----> 1 tuples_are_immutable[1] = 666

TypeError: 'tuple' object does not support item assignment
```





### Dictionaries

Dictionaries are a container that store key-value pairs. They are unordered. 

Other programming languages might call this a 'hash', 'hashtable' or 'hashmap'.






```python
pairs = {'Apple': 1, 'Orange': 2, 'Pear': 4}
pairs
```




<pre class="output">
<div style="text-align: right; margin: -1em; padding: 0;"><span style="font-size: 0.5em; color: grey">output</span></div>
<code class="text">
{'Apple': 1, 'Orange': 2, 'Pear': 4}
</code>
</pre>








```python
pairs['Orange']
```




<pre class="output">
<div style="text-align: right; margin: -1em; padding: 0;"><span style="font-size: 0.5em; color: grey">output</span></div>
<code class="text">
2
</code>
</pre>








```python
pairs['Orange'] = 16
pairs
```




<pre class="output">
<div style="text-align: right; margin: -1em; padding: 0;"><span style="font-size: 0.5em; color: grey">output</span></div>
<code class="text">
{'Apple': 1, 'Orange': 16, 'Pear': 4}
</code>
</pre>







The `items` method returns a sequence of the key-value pairs as tuples.

`values` returns a sequence of just the values.

`keys` returns a sequence of just the keys.

---
In Python 3, the `.items()`, `.values()` and `.keys()` methods return a ['dictionary view' object](https://docs.python.org/3/library/stdtypes.html#dictionary-view-objects) that behaves like a list or tuple in for loops but doesn't support indexing. 'Dictionary views' stay in sync even when the dictionary changes.

You can turn them into a normal list or tuple with the `list()` or `tuple()` functions.






```python
pairs.items()
# list(pairs.items())
```




<pre class="output">
<div style="text-align: right; margin: -1em; padding: 0;"><span style="font-size: 0.5em; color: grey">output</span></div>
<code class="text">
dict_items([('Apple', 1), ('Orange', 16), ('Pear', 4)])
</code>
</pre>








```python
pairs.values()
# list(pairs.values())
```




<pre class="output">
<div style="text-align: right; margin: -1em; padding: 0;"><span style="font-size: 0.5em; color: grey">output</span></div>
<code class="text">
dict_values([1, 16, 4])
</code>
</pre>








```python
pairs.keys()
# list(pairs.keys())
```




<pre class="output">
<div style="text-align: right; margin: -1em; padding: 0;"><span style="font-size: 0.5em; color: grey">output</span></div>
<code class="text">
dict_keys(['Apple', 'Orange', 'Pear'])
</code>
</pre>








```python
len(pairs)
```




<pre class="output">
<div style="text-align: right; margin: -1em; padding: 0;"><span style="font-size: 0.5em; color: grey">output</span></div>
<code class="text">
3
</code>
</pre>








```python
dict_of_dicts = {'first': {1:2, 2: 4, 4: 8, 8: 16}, 'second': {'a': 2.2, 'b': 4.4}}
dict_of_dicts
```




<pre class="output">
<div style="text-align: right; margin: -1em; padding: 0;"><span style="font-size: 0.5em; color: grey">output</span></div>
<code class="text">
{'first': {1: 2, 2: 4, 4: 8, 8: 16}, 'second': {'a': 2.2, 'b': 4.4}}
</code>
</pre>







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




<!-- 
## Solution - Dictionaries

The correct answer is **C**.

**A** assigns the name `jam_ratings` to a new dictionary with only the key `apricot` - not only are the other jam ratings now missing, but strings used as dictionary keys are *case sensitive* - `apricot` is not the same key as `Apricot`.

**B** mixes up the value and the key. Assigning to a dictionary uses the form: `dictionary[key] = value`.

**C** is correct. Bonus - another way to do this would be `jam_ratings.update({'Apricot': 9})` or even `jam_ratings.update(Apricot=9)`.

**D** mixes up the value and the key (and doesn't actually include the new value to be assigned, `9`, anywhere). `2` is the original *value*, `Apricot` is the key. Assigning to a dictionary uses the form: `dictionary[key] = value`.
 -->

