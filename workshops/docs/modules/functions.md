

<style>
.output_label {
    text-align: right;
    margin: -1em;
    padding: 0;
    font-size: 0.5em;
    color: grey
}
</style>


# Reusable and modular code with functions




<!-- 
## Instructor notes

*Estimated teaching time:* 30 min

*Estimated challenge time:* 0 min

*Key questions:*


    
*Learning objectives:*

  - "Build reusable code in Python."
  - "Write functions using conditional statements (if, then, else)"

*Key points:*

TODO

---
 -->




## Functions

Functions wrap up reusable pieces of code - they help you apply the _Do Not Repeat Yourself_ (DRY) principle.




<!-- 

```python
def square(x):
    # The body of the function is indicated by indenting by 4 spaces.
    return x**2

square(4)
```




<pre class="output">
<div style="text-align: right; margin: -1em; padding: 0;"><span style="font-size: 0.5em; color: grey">output</span></div>
<code class="text">
16
</code>
</pre>


 -->



<!-- 

```python
def hyphenate(a, b):
    # return statements immediately return a value (or None if no value is given)
    return a + '-' + b
    # Any code in the function after the return statement does not get executed.
    print("We will never get here")

hyphenate('python', 'esque')
```




<pre class="output">
<div style="text-align: right; margin: -1em; padding: 0;"><span style="font-size: 0.5em; color: grey">output</span></div>
<code class="text">
'python-esque'
</code>
</pre>


 -->




Suppose that separating large data files into individual yearly files is a task that we frequently have to perform. We could write a `for` loop like the one above every time we needed to do it but that would be time consuming and error prone. A more elegant solution would be to create a reusable tool that performs this task with minimum input from the user. To do this, we are going to turn the code we’ve already written into a function.

Functions are reusable, self-contained pieces of code that are called with a single command. They can be designed to accept arguments as input and return values, but they don’t need to do either. Variables declared inside functions only exist while the function is running and if a variable within the function (a local variable) has the same name as a variable somewhere else in the code, the local variable hides but doesn’t overwrite the other.

Every method used in Python (for example, `print`) is a function, and the libraries we import (say, `pandas`) are a collection of functions. We will only use functions that are housed within the same code that uses them, but it’s also easy to write functions that can be used by different programs.





Functions are declared following this general structure:






```python
def this_is_the_function_name(input_argument1, input_argument2):

    # The body of the function is indented
    # This function prints the two arguments to screen
    print('The function arguments are:', input_argument1, input_argument2, '(this is done inside the function!)')

    # And returns their product
    return input_argument1 * input_argument2
```





The function declaration starts with the word `def`, followed by the function name and any arguments in parenthesis, and ends in a colon. The body of the function is indented just like loops are. If the function returns something when it is called, it includes a return statement at the end.

This is how we call the function:






```python
product_of_inputs = this_is_the_function_name(2, 5)
```

<pre class="output">
<div class="output_label">output</div>
<code class="text">
The function arguments are: 2 5 (this is done inside the function!)

</code>
</pre>






```python
print('Their product is:', product_of_inputs, '(this is done outside the function!)')
```

<pre class="output">
<div class="output_label">output</div>
<code class="text">
Their product is: 10 (this is done outside the function!)

</code>
</pre>





## Challenge - Functions

1. Change the values of the arguments in the function and check its output.

2. Try calling the function by giving it the wrong number of arguments (not 2) or not assigning the function call to a variable (no `product_of_inputs =`).

3. Declare a variable inside the function and test to see where it exists (Hint: can you print it from outside the function?).

4. Explore what happens when a variable both inside and outside the function have the same name. What happens to the global variable when you change the value of the local variable?




<!-- 
## Solutions - Functions
 -->



<!-- 

```python
# Challenge part 1
product_of_inputs = this_is_the_function_name(2, 6)
print(product_of_inputs)
```

<pre class="output">
<div class="output_label">output</div>
<code class="text">
The function arguments are: 2 6 (this is done inside the function!)
12

</code>
</pre>
 -->



<!-- 
Challenge part 2:

```python
this_is_the_function_name(2, 6, "nope")
```
 -->



<!-- 
```python
---------------------------------------------------------------------------
TypeError                                 Traceback (most recent call last)
<ipython-input-12-fe9d9cd35fe2> in <module>()
      1 # 2
----> 2 this_is_the_function_name(2, 6, "nope")

TypeError: this_is_the_function_name() takes 2 positional arguments but 3 were given
```
 -->



<!-- 
Challenge part 3:

```python
def this_is_the_function_name(input_argument1, input_argument2):
    
    inside_fun = "existential crisis"
    
    # The body of the function is indented
    # This function prints the two arguments to screen
    print('The function arguments are:', input_argument1, input_argument2, '(this is done inside the function!)')

    # And returns their product
    return input_argument1 * input_argument2

this_is_the_function_name(2, 5)
print(inside_fun)
```
 -->




```python
The function arguments are: 2 5 (this is done inside the function!)
---------------------------------------------------------------------------
NameError                                 Traceback (most recent call last)
<ipython-input-13-e7a0563b00a6> in <module>()
     12 
     13 this_is_the_function_name(2, 5)
---> 14 print(inside_fun)

NameError: name 'inside_fun' is not defined
```




<!-- 

```python
# Challenge part 4
outside = "unchanged"
def this_is_the_function_name(input_argument1, input_argument2):
    
    outside = "I'm being manipulated"
    
    # The body of the function is indented
    # This function prints the two arguments to screen
    print('The function arguments are:', input_argument1, input_argument2, '(this is done inside the function!)')

    # And returns their product
    return input_argument1 * input_argument2

this_is_the_function_name(2, 5)
print(outside)
```

<pre class="output">
<div class="output_label">output</div>
<code class="text">
The function arguments are: 2 5 (this is done inside the function!)
unchanged

</code>
</pre>
 -->




Say we had some code for taking our `survey.csv` data and splitting it out into one file for each year:

```python
# First let's make sure we've read the survey data into a pandas DataFrame.
# (if you are jumping in to just this lesson and don't yet have the surveys.csv file yet, 
#  see the "Data analysis in Python with Pandas" `working_with_data` module)
import pandas as pd
all_data = pd.read_csv("surveys.csv")

this_year = 2002
# Select data for the year
surveys_year = all_data[all_data.year == this_year]

# Write the new DataFrame to a csv file
filename = 'surveys' + str(this_year) + '.csv'
surveys_year.to_csv(filename)
```

There are many different “chunks” of this code that we can turn into functions, and we can even create functions that call other functions inside them. Let’s first write a function that separates data for just one year and saves that data to a file:






```python
def one_year_csv_writer(this_year, all_data):
    """
    Writes a csv file for data from a given year.

    this_year --- year for which data is extracted
    all_data --- DataFrame with multi-year data
    """

    # Select data for the year
    surveys_year = all_data[all_data.year == this_year]

    # Write the new DataFrame to a csv file
    filename = 'function_surveys' + str(this_year) + '.csv'
    surveys_year.to_csv(filename)
```





The text between the two sets of triple double quotes is called a _docstring_ and contains the documentation for the function. It does nothing when the function is running and is therefore not necessary, but it is good practice to include docstrings as a reminder of what the code does. Docstrings in functions also become part of their ‘official’ documentation:






```python
?one_year_csv_writer
```





**Signature:** `one_year_csv_writer(this_year, all_data)`

***Docstring:***
```
Writes a csv file for data from a given year.

this_year --- year for which data is extracted
all_data --- DataFrame with multi-year data
```

***File:***      `~/devel/python-workshop-base/workshops/docs/modules/notebooks/<ipython-input-16-978149c5937c>`

***Type:***      `function`






```python
# First let's make sure we've read the survey data into a pandas DataFrame.
# (if you are jumping in to just this lesson and don't yet have the surveys.csv file yet, 
#  see the "Data analysis in Python with Pandas" `working_with_data` module)
import pandas as pd
surveys_df = pd.read_csv("surveys.csv")

one_year_csv_writer(2002, surveys_df)
```





What we really want to do, though, is create files for multiple years without having to request them one by one. Let’s write another function that uses a `for` loop over a sequence of years and repeatedly calls the function we just wrote, `one_year_csv_writer`:






```python
def yearly_data_csv_writer(start_year, end_year, all_data):
    """
    Writes separate CSV files for each year of data.

    start_year --- the first year of data we want
    end_year --- the last year of data we want
    all_data --- DataFrame with multi-year data
    """

    # "end_year" is the last year of data we want to pull, so we loop to end_year+1
    for year in range(start_year, end_year+1):
        one_year_csv_writer(year, all_data)
```





Because people will naturally expect that the end year for the files is the last year with data, the `for` loop inside the function ends at `end_year + 1`. By writing the entire loop into a function, we’ve made a reusable tool for whenever we need to break a large data file into yearly files. Because we can specify the first and last year for which we want files, we can even use this function to create files for a subset of the years available. This is how we call this function:






```python
# Create CSV files, one for each year in the given range
yearly_data_csv_writer(1977, 2002, surveys_df)
```





## Challenge - More Functions

1. Add two arguments to the functions we wrote that take the path of the directory where the files will be written and the root of the file name. Create a new set of files with a different name in a different directory.

2. How could you use the function `yearly_data_csv_writer` to create a CSV file for only one year? (Hint: think about the syntax for range)

3. Make the functions return a list of the files they have written. There are many ways you can do this (and you should try them all!): either of the functions can print to screen, either can use a return statement to give back numbers or strings to their function call, or you can use some combination of the two. You could also try using the os library to list the contents of directories.

4. Explore what happens when variables are declared inside each of the functions versus in the main (non-indented) body of your code. What is the scope of the variables (where are they visible)? What happens when they have the same name but are given different values?




<!-- 
## Solutions - More Functions
 -->



<!-- 

```python
# Solution - part 1
import os

def one_year_csv_writer_to_path(this_year, all_data, output_path, filename_prefix):
    """
    Writes a csv file for data from a given year.

    this_year --- year for which data is extracted
    all_data --- DataFrame with multi-year data
    output_path --- The output path for the generated file
    filename_prefix --- Output filename will be of the form "{filename_prefix}{this_year}.csv"
    """

    # Select data for the year
    surveys_year = all_data[all_data.year == this_year]

    # Create directories if required
    if not os.path.exists(output_path):
        os.makedirs(output_path)
    
    # Write the new DataFrame to a csv file
    filename = output_path + '/' + filename_prefix + str(this_year) + '.csv'
    surveys_year.to_csv(filename)

def yearly_data_csv_writer_to_path(start_year, end_year, all_data, output_path, filename_prefix):
    """
    Writes separate CSV files for each year of data.

    start_year --- the first year of data we want
    end_year --- the last year of data we want
    all_data --- DataFrame with multi-year data
    output_path --- The output path for the generated file
    filename_prefix --- Output filename will be of the form "{filename_prefix}{year}.csv"
    """

    # "end_year" is the last year of data we want to pull, so we loop to end_year+1
    for year in range(start_year, end_year+1):
        one_year_csv_writer_to_path(year, all_data, output_path, filename_prefix)
```
 -->



<!-- 

```python
# Solution - part 2
yearly_data_csv_writer(2002, 2002, surveys_df)
```
 -->



<!-- 

```python
# Solution - part 3

def one_year_csv_writer_return_fn(this_year, all_data):
    # Select data for the year
    surveys_year = all_data[all_data.year == this_year]

    # Write the new DataFrame to a csv file
    filename = 'function_surveys' + str(this_year) + '.csv'
    surveys_year.to_csv(filename)
    
    # We could just print the filename. We can see the result, but won't capture the value
    # print(filename)
    
    # It's often more useful to return it, so we can do something with it
    return filename

def yearly_data_csv_writer_list(start_year, end_year, all_data):
    
    generated_files = []
    for year in range(start_year, end_year+1):
        fn = one_year_csv_writer_return_fn(year, all_data)
        generated_files.append(fn)
        
    return generated_files

print(yearly_data_csv_writer_list(2000, 2002, surveys_df))
```

<pre class="output">
<div class="output_label">output</div>
<code class="text">
['function_surveys2000.csv', 'function_surveys2001.csv', 'function_surveys2002.csv']

</code>
</pre>
 -->



<!-- 

```python
# Solution - part 4
# Variables declared inside the function are only visible and modified in the scope of the function

y = "unchanged"

def bla(x):
    y = "uiop"
    print(x + ": printed from function")

bla("abc")
y
```

<pre class="output">
<div class="output_label">output</div>
<code class="text">
abc: printed from function

</code>
</pre>




<pre class="output">
<div style="text-align: right; margin: -1em; padding: 0;"><span style="font-size: 0.5em; color: grey">output</span></div>
<code class="text">
'unchanged'
</code>
</pre>


 -->



<!-- 

```python
# Solution - part 4
# the `global` keyword inside a function lets us modify a variable declared outside the scope of the function

y = "also_unchanged"

def bla(x):
    global y
    
    y = "uiop"
    print(x)

bla('abc')
y
```

<pre class="output">
<div class="output_label">output</div>
<code class="text">
abc

</code>
</pre>




<pre class="output">
<div style="text-align: right; margin: -1em; padding: 0;"><span style="font-size: 0.5em; color: grey">output</span></div>
<code class="text">
'uiop'
</code>
</pre>


 -->



<!-- 

```python
# Solution - part 4 - possibly a digression, but this challenge naturally leads us here ...
#
# There is some (possibly surprising) behaviour when you pass variables into a function as an argument. 
# The value of "immutable" types (eg strings, ints, floats, tuples) are effectively 'copied' into the function 
# - they won't change if you modify the from inside the scope of the function, since you are actually working 
# with a new copy.
# HOWEVER: "Mutable" types, like lists, dictionaries ARE modified when passed into a function.
# They are passed as a 'reference' to original object, not a new copy of it.

import random

n = [1, 2, 3, 4]

def bla(x):
    x.append(random.randrange(1, 100))
    print(x)
    print()

bla(n)
print(n)

bla(n)
print(n)

bla(n)
print(n)

# We can pass in a COPY of the list, then the original isn't modified
bla(list(n))
print(n)
```

<pre class="output">
<div class="output_label">output</div>
<code class="text">
[1, 2, 3, 4, 52]

[1, 2, 3, 4, 52]
[1, 2, 3, 4, 52, 65]

[1, 2, 3, 4, 52, 65]
[1, 2, 3, 4, 52, 65, 14]

[1, 2, 3, 4, 52, 65, 14]
[1, 2, 3, 4, 52, 65, 14, 89]

[1, 2, 3, 4, 52, 65, 14]

</code>
</pre>
 -->




The functions we wrote demand that we give them a value for every argument. Ideally, we would like these functions to be as flexible and independent as possible. Let’s modify the function `yearly_data_csv_writer` so that the `start_year` and `end_year` default to the full range of the data if they are not supplied by the user. 

Arguments can be given default values with an equal sign in the function declaration - we call these **'keyword'** arguments. Any argument in the function without a default value (here, `all_data`) is a required argument - we call these **'positional'** arguments. Positional arguements MUST come before any keyword arguments. Keyword arguments are optional - if you don't include them when calling the function, the default value is used.






```python
def yearly_data_arg_test(all_data, start_year = 1977, end_year = 2002):
    """
    Modified from yearly_data_csv_writer to test default argument values!

    start_year --- the first year of data we want --- default: 1977
    end_year --- the last year of data we want --- default: 2002
    all_data --- DataFrame with multi-year data
    """

    return start_year, end_year


start,end = yearly_data_arg_test (surveys_df, 1988, 1993)
print('Both optional arguments:\t', start, end)

start,end = yearly_data_arg_test (surveys_df)
print('Default values:\t\t\t', start, end)
```

<pre class="output">
<div class="output_label">output</div>
<code class="text">
Both optional arguments:	 1988 1993
Default values:			 1977 2002

</code>
</pre>





The `\t` in the print statements are tabs, used to make the text align and be easier to read.

But what if our dataset doesn’t start in 1977 and end in 2002? We can modify the function so that it looks for the start and end years in the dataset if those dates are not provided:






```python
def yearly_data_arg_test(all_data, start_year = None, end_year = None):
    """
    Modified from yearly_data_csv_writer to test default argument values!

    start_year --- the first year of data we want --- default: None - check all_data
    end_year --- the last year of data we want --- default: None - check all_data
    all_data --- DataFrame with multi-year data
    """

    if start_year is None:
        start_year = min(all_data.year)
    if end_year is None:
        end_year = max(all_data.year)

    return start_year, end_year


start,end = yearly_data_arg_test (surveys_df, 1988, 1993)
print('Both optional arguments:\t', start, end)

start,end = yearly_data_arg_test (surveys_df)
print('Default values:\t\t\t', start, end)
```

<pre class="output">
<div class="output_label">output</div>
<code class="text">
Both optional arguments:	 1988 1993
Default values:			 1977 2002

</code>
</pre>





The default values of the `start_year` and `end_year` arguments in the function `yearly_data_arg_test` are now `None`. This is a build-it constant in Python that indicates the absence of a value - essentially, that the variable exists in the namespace of the function (the directory of variable names) but that it doesn’t correspond to any existing object.





## Challenge - Variables

1. What type of object corresponds to a variable declared as `None` ? (Hint: create a variable set to None and use the function `type()`)

2. Compare the behavior of the function `yearly_data_arg_test` when the arguments have `None` as a default and when they do not have default values.

3. What happens if you only include a value for `start_year` in the function call? Can you write the function call with only a value for `end_year` ? (Hint: think about how the function must be assigning values to each of the arguments - this is related to the need to put the arguments without default values before those with default values in the function definition!)




<!-- 
## Solutions - Variables
 -->



<!-- 

```python
# Challenge 1
the_void = None
type(the_void)
```




<pre class="output">
<div style="text-align: right; margin: -1em; padding: 0;"><span style="font-size: 0.5em; color: grey">output</span></div>
<code class="text">
NoneType
</code>
</pre>


 -->



<!-- 

```python
# Challenge 2
print(yearly_data_arg_test(surveys_df))
print(yearly_data_arg_test(surveys_df, start_year=1999, end_year=2001))
```

<pre class="output">
<div class="output_label">output</div>
<code class="text">
(1977, 2002)
(1999, 2001)

</code>
</pre>
 -->



<!-- 

```python
# Challenge 3
print(yearly_data_arg_test(surveys_df, start_year=1999))

# Keyword args are taken in order if there is no keyword used
# Doing this is a bit dangerous (what if you later decide to add more keyword args to the function ?)
print(yearly_data_arg_test(surveys_df, 1999))
print(yearly_data_arg_test(surveys_df, 1999, end_year=2001))

# But keyword args must always come last - this throws an error
# print(yearly_data_arg_test(surveys_df, start_year=1999, 2001))

# We don't need to specify all keyword args, nor do they need to be in order
print(yearly_data_arg_test(surveys_df, end_year=1999))
print(yearly_data_arg_test(surveys_df, end_year=2001, start_year=1999))
```

<pre class="output">
<div class="output_label">output</div>
<code class="text">
(1999, 2002)
(1999, 2002)
(1999, 2001)
(1977, 1999)
(1999, 2001)

</code>
</pre>
 -->




## Conditionals - `if` statements





The body of the test function now has two conditionals (`if` statements) that check the values of `start_year` and `end_year`. `if` statements execute a segment of code when some condition is met. They commonly look something like this:






```python
a = 5

if a < 0:  # Meets first condition?

    # if a IS less than zero
    print('a is a negative number')

elif a > 0:  # Did not meet first condition. meets second condition?

    # if a ISN'T less than zero and IS more than zero
    print('a is a positive number')

else:  # Met neither condition

    # if a ISN'T less than zero and ISN'T more than zero
    print('a must be zero!')
```

<pre class="output">
<div class="output_label">output</div>
<code class="text">
a is a positive number

</code>
</pre>





Change the value of a to see how this function works. The statement `elif` means “else if”, and all of the conditional statements must end in a colon.

The `if` statements in the function `yearly_data_arg_test` check whether there is an object associated with the variable names `start_year` and `end_year`. If those variables are `None`, the `if` statements return the boolean `True` and execute whatever is in their body. On the other hand, if the variable names are associated with some value (they got a number in the function call), the `if` statements return `False` and do not execute. The opposite conditional statements, which would return `True` if the variables were associated with objects (if they had received value in the function call), would be `if start_year` and `if end_year`.

As we’ve written it so far, the function `yearly_data_arg_test` associates values in the function call with arguments in the function definition just based in their order. If the function gets only two values in the function call, the first one will be associated with `all_data` and the second with `start_year`, regardless of what we intended them to be. We can get around this problem by calling the function using keyword arguments, where each of the arguments in the function definition is associated with a keyword and the function call passes values to the function using these keywords:






```python
start,end = yearly_data_arg_test (surveys_df)
print('Default values:\t\t\t', start, end)

start,end = yearly_data_arg_test (surveys_df, 1988, 1993)
print('No keywords:\t\t\t', start, end)

start,end = yearly_data_arg_test (surveys_df, start_year = 1988, end_year = 1993)
print('Both keywords, in order:\t', start, end)

start,end = yearly_data_arg_test (surveys_df, end_year = 1993, start_year = 1988)
print('Both keywords, flipped:\t\t', start, end)

start,end = yearly_data_arg_test (surveys_df, start_year = 1988)
print('One keyword, default end:\t', start, end)

start,end = yearly_data_arg_test (surveys_df, end_year = 1993)
print('One keyword, default start:\t', start, end)
```

<pre class="output">
<div class="output_label">output</div>
<code class="text">
Default values:			 1977 2002
No keywords:			 1988 1993
Both keywords, in order:	 1988 1993
Both keywords, flipped:		 1988 1993
One keyword, default end:	 1988 2002
One keyword, default start:	 1977 1993

</code>
</pre>





## Challenge - Modifying functions

1. Rewrite the `one_year_csv_writer` and `yearly_data_csv_writer` functions to have keyword arguments with default values.

2. Modify the functions so that they don’t create yearly files if there is no data for a given year and display an alert to the user (Hint: use conditional statements to do this. For an extra challenge, use `try` statements !).

3. The code below checks to see whether a directory exists and creates one if it doesn’t. Add some code to your function that writes out the CSV files, to check for a directory to write to.

```python
import os

if 'dir_name_here' in os.listdir('.'):
   print('Processed directory exists')
else:
   os.mkdir('dir_name_here')
   print('Processed directory created')
```

4. The code that you have written so far to loop through the years is good, however it is not necessarily reproducible with different datasets. For instance, what happens to the code if we have additional years of data in our CSV files? Using the tools that you learned in the previous activities, make a list of all years represented in the data. Then create a loop to process your data, that begins at the earliest year and ends at the latest year using that list.

_HINT:_ you can create a loop with a list as follows: `for years in year_list:`




<!-- 
## Solutions - Modifying functions
 -->



<!-- 

```python
# Solution - part 1

def one_year_csv_writer(this_year=None, all_data=None):
    """
    Writes a csv file for data from a given year.

    all_data --- DataFrame with multi-year data
    this_year --- year for which data is extracted
    """

    if all_data is None:
        all_data = pd.read_csv("surveys.csv")
    
    if this_year is None:
        this_year = min(all_data.year)
    
    # Select data for the year
    surveys_year = all_data[all_data.year == this_year]

    # Write the new DataFrame to a csv file
    filename = 'function_surveys' + str(this_year) + '.csv'
    surveys_year.to_csv(filename)
    
    
def yearly_data_csv_writer(start_year=None, end_year=None, all_data=None):
    """
    Writes separate CSV files for each year of data.

    all_data --- DataFrame with multi-year data
    start_year --- the first year of data we want
    end_year --- the last year of data we want
    """
    
    if all_data is None:
        all_data = pd.read_csv("surveys.csv")
    
    if start_year is None:
        start_year = min(all_data.year)
        
    if end_year is None:
        end_year = max(all_data.year)

    # "end_year" is the last year of data we want to pull, so we loop to end_year+1
    for year in range(start_year, end_year+1):
        one_year_csv_writer(year, all_data)
```
 -->



<!-- 

```python
# Solution - part 2

def yearly_data_csv_writer(start_year=None, end_year=None, all_data=None):
    """
    Writes separate CSV files for each year of data.

    all_data --- DataFrame with multi-year data
    start_year --- the first year of data we want
    end_year --- the last year of data we want
    """
    
    if all_data is None:
        all_data = pd.read_csv("surveys.csv")
    
    if start_year is None:
        start_year = min(all_data.year)
        
    if end_year is None:
        end_year = max(all_data.year)

    # "end_year" is the last year of data we want to pull, so we loop to end_year+1
    for year in range(start_year, end_year+1):
        # print(len(all_data[all_data.year == year]))
        if len(all_data[all_data.year == year]) > 0:
            one_year_csv_writer(year, all_data)
        else:
            print("Skipping: ", year, " - no data points for this year.")

surveys_df = pd.read_csv("surveys.csv")
yearly_data_csv_writer(1977, 2002, surveys_df)
```
 -->



<!-- 

```python
import os

# Solution - part 3
def one_year_csv_writer(this_year=None, all_data=None, output_dir='output'):
    """
    Writes a csv file for data from a given year.

    all_data --- DataFrame with multi-year data
    this_year --- year for which data is extracted
    """

    if all_data is None:
        all_data = pd.read_csv("surveys.csv")
    
    if this_year is None:
        this_year = min(all_data.year)
    
    # Select data for the year
    surveys_year = all_data[all_data.year == this_year]


    if output_dir in os.listdir('.'):
        print('Processed directory exists: ', output_dir)
    else:
        os.mkdir(output_dir)
        print('Processed directory created: ', output_dir)
    
    # Write the new DataFrame to a csv file
    filename = output_dir + '/' + 'function_surveys' + str(this_year) + '.csv'
    # The more correct way to create paths is:
    # filename = os.path.join(output_dir, 'function_surveys' + str(this_year) + '.csv')
    surveys_year.to_csv(filename)
    
one_year_csv_writer(2002, surveys_df)
```

<pre class="output">
<div class="output_label">output</div>
<code class="text">
Processed directory exists:  output

</code>
</pre>
 -->



<!-- 

```python
# Solution - part 4
def yearly_data_csv_writer(all_data):
    """
    Writes separate CSV files for each year of data.

    start_year --- the first year of data we want
    end_year --- the last year of data we want
    all_data --- DataFrame with multi-year data
    """

    start_year = min(all_data.year)
    end_year = max(all_data.year)
    
    year_list = range(start_year, end_year+1)
    
    # Or, we could iterate over a 'set' object, which gives each unique year
    # year_list = set(surveys_df.year)
    
    # "end_year" is the last year of data we want to pull, so we loop to end_year+1
    for year in year_list:
        one_year_csv_writer(year, all_data)
        
list(set(surveys_df.year))
```




<pre class="output">
<div style="text-align: right; margin: -1em; padding: 0;"><span style="font-size: 0.5em; color: grey">output</span></div>
<code class="text">
[1977,
 1978,
 1979,
 1980,
 1981,
 1982,
 1983,
 1984,
 1985,
 1986,
 1987,
 1988,
 1989,
 1990,
 1991,
 1992,
 1993,
 1994,
 1995,
 1996,
 1997,
 1998,
 1999,
 2000,
 2001,
 2002]
</code>
</pre>


 -->

