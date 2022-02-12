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

# Reusable and modular code with functions

+++ {"tags": ["solution"]}

## Instructor notes

*Estimated teaching time:* 30 min

*Estimated challenge time:* 0 min

*Key questions:*


    
*Learning objectives:*

  - "Build reusable code in Python."
  - "Write functions using conditional statements (if, then, else)"

---

+++

## Functions

Functions wrap up reusable pieces of code - they help you apply the _Do Not Repeat Yourself_ (DRY) principle.

```{code-cell} ipython3
:tags: [solution]

def square(x):
    # The body of the function is indicated by indenting by 4 spaces.
    return x**2

square(4)
```

```{code-cell} ipython3
:tags: [solution]

def hyphenate(a, b):
    # return statements immediately return a value (or None if no value is given)
    return a + '-' + b
    # Any code in the function after the return statement does not get executed.
    print("We will never get here")

hyphenate('python', 'esque')
```

Suppose that separating large data files into individual yearly files is a task that we frequently have to perform. We could write a `for` loop like the one above every time we needed to do it but that would be time consuming and error prone. A more elegant solution would be to create a reusable tool that performs this task with minimum input from the user. To do this, we are going to turn the code we’ve already written into a function.

Functions are reusable, self-contained pieces of code that are called with a single command. They can be designed to accept arguments as input and return values, but they don’t need to do either. Variables declared inside functions only exist while the function is running and if a variable within the function (a local variable) has the same name as a variable somewhere else in the code, the local variable hides but doesn’t overwrite the other.

Every method used in Python (for example, `print`) is a function, and the libraries we import (say, `pandas`) are a collection of functions. We will only use functions that are housed within the same code that uses them, but it’s also easy to write functions that can be used by different programs.

+++

Functions are declared following this general structure:

+++

```python
def this_is_the_function_name(input_argument1, input_argument2):

    # The body of the function is indented
    # This function prints the two arguments to screen
    print('The function arguments are:', input_argument1, input_argument2, '(this is done inside the function!)')

    # And returns their product
    return input_argument1 * input_argument2
```

The function declaration starts with the word `def`, followed by the function name and any arguments in parenthesis, and ends in a colon. The body of the function is indented just like loops are. If the function returns something when it is called, it includes a return statement at the end.


Let's rewrite this function with shorter (but still informative) names so we don't need to type as much:

```{code-cell} ipython3
def product(a, b):
    print('The function arguments are:', a, b, '(this is done inside the function!)')

    return a * b
```

This is how we call the function:

```{code-cell} ipython3
product_of_inputs = product(2, 5)
```

```{code-cell} ipython3
print('Their product is:', product_of_inputs, '(this is done outside the function!)')
```

+++ {"tags": ["challenge"]}

## Challenge - Functions

1. Change the values of the input arguments in the function and check its output.

2. Try calling the function by giving it the wrong number of arguments (not 2) or not assigning the function call to a variable (no `product_of_inputs =`).

### Bonus challenges

3. Declare a variable inside the function and test to see where it exists (Hint: can you print it from outside the function?).

4. Explore what happens when a variable both inside and outside the function have the same name. What happens to the global variable when you change the value of the local variable?

+++ {"tags": ["solution"]}

## Solutions - Functions

```{code-cell} ipython3
:tags: [solution]

# Challenge part 1
product_of_inputs = product(2, 6)
print(product_of_inputs)
```

+++ {"tags": ["solution"]}

Challenge part 2:

```python
product(2, 6, "nope")
```

+++ {"tags": ["solution"]}

```python
---------------------------------------------------------------------------
TypeError                                 Traceback (most recent call last)
<ipython-input-12-fe9d9cd35fe2> in <module>()
      1 # 2
----> 2 this_is_the_function_name(2, 6, "nope")

TypeError: this_is_the_function_name() takes 2 positional arguments but 3 were given
```

+++ {"tags": ["solution"]}

Challenge part 3:

```python
def product(a, b):
    
    inside_fun = "existential crisis"
    print('The function arguments are:', a, b, '(this is done inside the function!)')
    
    return a * b

product(2, 5)
print(inside_fun)
```

+++ {"tags": ["solution"]}

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

```{code-cell} ipython3
:tags: [solution]

# Challenge part 4
outside = "unchanged"
def product(a, b):
    
    outside = "I'm being manipulated"
    print('The function arguments are:', a, b, '(this is done inside the function!)')

    return a * b

product(2, 5)
print(outside)
```

Say we had some code for taking our `survey.csv` data and splitting it out into one file for each year:

```python
# First let's make sure we've read the survey data into a pandas DataFrame.
import pandas as pd
all_data = pd.read_csv("surveys.csv")

this_year = 2002
# Select data for just that year
surveys_year = all_data[all_data.year == this_year]

# Write the new DataFrame to a csv file
filename = 'surveys' + str(this_year) + '.csv'
surveys_year.to_csv(filename)
```

There are many different "chunks" of this code that we can turn into functions, and we can even create functions that call other functions inside them. Let’s first write a function that separates data for just one year and saves that data to a file:

```{code-cell} ipython3
def year_to_csv(year, all_data):
    """
    Writes a csv file for data from a given year.

    year --- year for which data is extracted
    all_data --- DataFrame with multi-year data
    """

    # Select data for the year
    surveys_year = all_data[all_data.year == year]

    # Write the new DataFrame to a csv file
    filename = 'function_surveys' + str(year) + '.csv'
    surveys_year.to_csv(f"./data/{filename}")
```

The text between the two sets of triple double quotes is called a _docstring_ and contains the documentation for the function. It does nothing when the function is running and is therefore not necessary, but it is good practice to include docstrings as a reminder of what the code does. Docstrings in functions also become part of their ‘official’ documentation:

```{code-cell} ipython3
?year_to_csv
```

**Signature:** `year_to_csv(year, all_data)`

***Docstring:***
```
Writes a csv file for data from a given year.

year --- year for which data is extracted
all_data --- DataFrame with multi-year data
```

***File:***      `~/devel/python-workshop-base/workshops/docs/modules/notebooks/<ipython-input-16-978149c5937c>`

***Type:***      `function`

```{code-cell} ipython3
# Read the survey data into a pandas DataFrame.
# (if you are jumping in to just this lesson and don't yet have the surveys.csv file yet, 
#  see the "Data analysis in Python with Pandas" `working_with_data` module)
import pandas as pd
surveys_df = pd.read_csv("surveys.csv")

year_to_csv(2002, surveys_df)
```

+++ {"tags": ["protip", "aside"]}

### Aside - listing files and the `os` module

Google Collaboratory and Juypter Notebooks have a built-in file browser, however, you can list the files and directories in the current directory ("folder") with Python code like:

```python
import os

print(os.listdir())
```

You'll see a Python list, a bit like:

```
['surveys.csv','function_surveys2002.csv']
```

(you may have additional files listed here, generated in previous lessons)

The [os](https://docs.python.org/3/library/os.html) module contains, among other things, a bunch of useful functions for working with the filesystem and file paths.

Two other useful examples (hint - these might help in a upcoming challenge):

```python
# This returns True if the file or directory specified exists
os.path.exists('surveys.csv')
```

```python
# This creates empty (nested) directories based on a path (eg in a 'path' each directory is separated by slashes)
os.makedirs('data/csvs/')
```

If a directory already exists, `os.makedirs` fails and produces an error message (in Python terminology we might say it 'raises an exception' ).

We can avoid this by using `os.path.exists` and `os.makedirs` together like:
```python
if not os.path.exists('data/csvs/'):
    os.makedirs('data/csvs/')
```

+++

What we really want to do, though, is create files for multiple years without having to request them one by one. Let’s write another function that uses a `for` loop over a sequence of years and repeatedly calls the function we just wrote, `year_to_csv`:

```{code-cell} ipython3
def create_csvs_by_year(start_year, end_year, all_data):
    """
    Writes separate CSV files for each year of data.

    start_year --- the first year of data we want
    end_year --- the last year of data we want
    all_data --- DataFrame with multi-year data
    """

    # "end_year" is the last year of data we want to pull, so we loop to end_year+1
    for year in range(start_year, end_year+1):
        year_to_csv(year, all_data)
```

Because people will naturally expect that the end year for the files is the last year with data, the `for` loop inside the function ends at `end_year + 1`. By writing the entire loop into a function, we’ve made a reusable tool for whenever we need to break a large data file into yearly files. Because we can specify the first and last year for which we want files, we can even use this function to create files for a subset of the years available. This is how we call this function:

```{code-cell} ipython3
# Create CSV files, one for each year in the given range
create_csvs_by_year(1977, 2002, surveys_df)
```

+++ {"tags": ["challenge"]}

## Challenge - More Functions

1. How could you use the function `create_csvs_by_year` to create a CSV file for only one year ? (Hint: think about the syntax for range)

2. Modify `year_to_csv` so that it has two additional arguments, `output_path` (the path of the directory where the files will be written) and `filename_prefix` (a prefix to be added to the start of the file name). Name your new function `year_to_csv_at_path`. Eg, `def year_to_csv_at_path(year, all_data, output_path, filename_prefix):`. Call your new function to create a new file with a different name in a different directory. ... **Hint:** You could manually create the target directory before calling the function using the Collaboratory / Jupyter file browser, *or* for bonus points you could do it in Python inside the function using the `os` module.

3. Create a new version of the `create_csvs_by_year` function called `create_csvs_by_year_at_path` that also takes the additional arguments `output_path` and `filename_prefix`. Internally `create_csvs_by_year_at_path` should pass these values to `year_to_csv_at_path`. Call your new function to create a new set of files with a different name in a different directory.

4. Make these new functions return a list of the files they have written. There are many ways you can do this (and you should try them all!): you could make the function print the filenames to screen, or you could use a `return` statement to make the function produce a list of filenames, or you can use some combination of the two. You could also try using the `os` library to list the contents of directories.

+++ {"tags": ["solution"]}

## Solutions - More Functions

```{code-cell} ipython3
:tags: [solution]

# Solution - part 1
create_csvs_by_year(2002, 2002, surveys_df)
```

```{code-cell} ipython3
:tags: [solution]

# Solution - part 2 and 3
import os

def year_to_csv_at_path(year, all_data, output_path, filename_prefix):
    """
    Writes a csv file for data from a given year.

    year --- year for which data is extracted
    all_data --- DataFrame with multi-year data
    output_path --- The output path for the generated file
    filename_prefix --- Output filename will be of the form "{filename_prefix}{year}.csv"
    """

    # Select data for the year
    surveys_year = all_data[all_data.year == year]

    # Create directories if required
    if not os.path.exists(output_path):
        os.makedirs(output_path)
    
    # Write the new DataFrame to a csv file
    filename = output_path + '/' + filename_prefix + str(year) + '.csv'
    surveys_year.to_csv(filename)

def create_csvs_by_year_at_path(start_year, end_year, all_data, output_path, filename_prefix):
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
        year_to_csv_at_path(year, all_data, output_path, filename_prefix)
```

```{code-cell} ipython3
:tags: [solution]

# Solution - part 4

def year_to_csv_return_filenames(year, all_data):
    # Select data for the year
    surveys_year = all_data[all_data.year == year]

    # Write the new DataFrame to a csv fileoutput_path
    filename = 'function_surveys' + str(year) + '.csv'
    surveys_year.to_csv(filename)
    
    # We could just print the filename. We can see the result, but won't capture the value
    # print(filename)
    
    # It's often more useful to return data rather than print it, so we can do something with it
    return filename

def create_csvs_by_year_return_filenames(start_year, end_year, all_data):
    
    generated_files = []
    for year in range(start_year, end_year+1):
        fn = year_to_csv_return_filenames(year, all_data)
        generated_files.append(fn)
        
    return generated_files

print(create_csvs_by_year_return_filenames(2000, 2002, surveys_df))
```

The functions we wrote demand that we give them a value for every argument. Ideally, we would like these functions to be as flexible and independent as possible. Let’s modify the function `create_csvs_by_year` so that the `start_year` and `end_year` default to the full range of the data if they are not supplied by the user. 

Arguments can be given default values with an equal sign in the function declaration - we call these **'keyword'** arguments. Any argument in the function without a default value (here, `all_data`) is a required argument - we call these **'positional'** arguments. Positional arguements MUST come before any keyword arguments. Keyword arguments are optional - if you don't include them when calling the function, the default value is used.

```{code-cell} ipython3
def keyword_arg_test(all_data, start_year = 1977, end_year = 2002):
    """
    A simple function to demonstrate the use of keyword arguments with defaults !

    start_year --- the first year of data we want --- default: 1977
    end_year --- the last year of data we want --- default: 2002
    all_data --- DataFrame with multi-year data - not actually used
    """

    return start_year, end_year


start,end = keyword_arg_test(surveys_df, 1988, 1993)
print('Both optional arguments:\t', start, end)

start,end = keyword_arg_test(surveys_df)
print('Default values:\t\t\t', start, end)
```

The `\t` in the print statements are tabs, used to make the text align and be easier to read.

What if our dataset doesn’t start in 1977 and end in 2002? We can modify the function so that it looks for the ealiest and latest years in the dataset if those dates are not provided. Let's redefine `csvs_by_year`:

```{code-cell} ipython3
def csvs_by_year(all_data, start_year = None, end_year = None):
    """
    Writes separate CSV files for each year of data. The start year and end year can 
    be optionally provided, otherwise the earliest and latest year in the dataset are
    used as the range.

    start_year --- the first year of data we want --- default: None - check all_data
    end_year --- the last year of data we want --- default: None - check all_data
    all_data --- DataFrame with multi-year data
    """

    if start_year is None:
        start_year = min(all_data.year)
    if end_year is None:
        end_year = max(all_data.year)

    return start_year, end_year


start,end = csvs_by_year(surveys_df, 1988, 1993)
print('Both optional arguments:\t', start, end)

start,end = csvs_by_year(surveys_df)
print('Default values:\t\t\t', start, end)
```

The default values of the `start_year` and `end_year` arguments in this new version of the `csvs_by_year` function are now `None`. This is a built-in constant in Python that indicates the absence of a value - essentially, that the variable exists in the namespace of the function (the directory of variable names) but that it doesn’t correspond to any existing object.

+++ {"tags": ["challenge"]}

## Challenge - Experimenting with keyword arguments

1. What type of object corresponds to a variable declared as `None` ? (Hint: create a variable set to None and use the function `type()`)

2. Compare the behavior of the function `csvs_by_year` when the keyword arguments have `None` as a default vs. calling the function by supplying (non-default) values to the keyword arguments

3. What happens if you only include a value for `start_year` in the function call? Can you write the function call with only a value for `end_year` ? (Hint: think about how the function must be assigning values to each of the arguments - this is related to the need to put the arguments without default values before those with default values in the function definition!)

+++ {"tags": ["solution"]}

## Solutions - Experimenting with keyword arguments

```{code-cell} ipython3
:tags: [solution]

# Challenge 1
the_void = None
type(the_void)
```

```{code-cell} ipython3
:tags: [solution]

# Challenge 2
print(csvs_by_year(surveys_df))
print(csvs_by_year(surveys_df, start_year=1999, end_year=2001))
```

```{code-cell} ipython3
:tags: [solution]

# Challenge 3
print(csvs_by_year(surveys_df, start_year=1999))

# Keyword args are taken in order if there is no keyword used
# Doing this is a bit dangerous (what if you later decide to add more keyword args to the function ?)
print(csvs_by_year(surveys_df, 1999))
print(csvs_by_year(surveys_df, 1999, end_year=2001))

# But keyword args must always come last - this throws an error
# print(csvs_by_year(surveys_df, start_year=1999, 2001))

# We don't need to specify all keyword args, nor do they need to be in order
print(csvs_by_year(surveys_df, end_year=1999))
print(csvs_by_year(surveys_df, end_year=2001, start_year=1999))
```

## Conditionals - `if` statements

+++

The body of the test function now has two conditionals (`if` statements) that check the values of `start_year` and `end_year`. `if` statements execute a segment of code when some condition is met. They commonly look something like this:

```{code-cell} ipython3
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

Change the value of `a` to see how this function works. The statement `elif` means “else if”, and all of the conditional statements must end in a colon.

The `if` statements in the function `csvs_by_year` check whether there is an object associated with the variable names `start_year` and `end_year`. If those variables are `None`, the `if` statements return the boolean `True` and execute whatever is in their body. On the other hand, if the variable names are associated with some value (they got a number in the function call), the `if` statements return `False` and do not execute. The opposite conditional statements, which would return `True` if the variables were associated with objects (if they had received value in the function call), would be `if start_year` and `if end_year`.

As we’ve written it so far, the function `csvs_by_year` associates values in the function call with arguments in the function definition just based in their order. If the function gets only two values in the function call, the first one will be associated with `all_data` and the second with `start_year`, regardless of what we intended them to be. We can get around this problem by calling the function using keyword arguments, where each of the arguments in the function definition is associated with a keyword and the function call passes values to the function using these keywords:

```{code-cell} ipython3
start,end = csvs_by_year(surveys_df)
print('Default values:\t\t\t', start, end)

start,end = csvs_by_year(surveys_df, 1988, 1993)
print('No keywords:\t\t\t', start, end)

start,end = csvs_by_year(surveys_df, start_year = 1988, end_year = 1993)
print('Both keywords, in order:\t', start, end)

start,end = csvs_by_year(surveys_df, end_year = 1993, start_year = 1988)
print('Both keywords, flipped:\t\t', start, end)

start,end = csvs_by_year(surveys_df, start_year = 1988)
print('One keyword, default end:\t', start, end)

start,end = csvs_by_year(surveys_df, end_year = 1993)
print('One keyword, default start:\t', start, end)
```

+++ {"tags": ["challenge"]}

## Multiple choice challenge

What output would you expect from the `if` statement (try to figure out the answer without running the code):

```python
pod_bay_doors_open = False
dave_want_doors_open = False
hal_insanity_level = 2001

if not pod_bay_doors_open:
    print("Dave: Open the pod bay doors please HAL.")
    dave_wants_doors_open = True
elif pod_bay_doors_open and hal_insanity_level >= 95:
    print("HAL: I'm closing the pod bay doors, Dave.")
    
if dave_wants_doors_open and not pod_bay_doors_open and hal_insanity_level >= 95:
    print("HAL: I’m sorry, Dave. I’m afraid I can’t do that.")
elif dave_wants_doors_open and not pod_bay_doors_open:
    print("HAL: I'm opening the pod bay doors, welcome back Dave.")
else:
    print("... silence of space ...")
```

**a)** "HAL: I'm closing the pod bay doors, Dave.", "... silence of space ..."

**b)** "Dave: Open the pod bay doors please HAL.", "HAL: I’m sorry, Dave. I’m afraid I can’t do that."

**c)** "... silence of space ..."

**d)** "Dave: Open the pod bay doors please HAL.", HAL: "I'm opening the pod bay doors, welcome back Dave."

+++ {"tags": ["solution"]}

**Option (b)**

+++ {"tags": ["challenge"]}

## Bonus Challenge - Modifying functions

1. Rewrite the `year_to_csv` and `csvs_by_year` functions to have keyword arguments with default values.

2. Modify the functions so that they don’t create yearly files if there is no data for a given year and display an alert to the user (Hint: use conditional statements to do this. For an extra challenge, use `try` statements !).

3. The code below checks to see whether a directory exists and creates one if it doesn’t. Add some code to your function that writes out the CSV files, to check for a directory to write to.

```python
import os

if 'dir_name_here' in os.listdir():
   print('Processed directory exists')
else:
   os.mkdir('dir_name_here')
   print('Processed directory created')
```

`4.` The code that you have written so far to loop through the years is good, however it is not necessarily reproducible with different datasets. For instance, what happens to the code if we have additional years of data in our CSV files? Using the tools that you learned in the previous activities, make a list of all years represented in the data. Then create a loop to process your data, that begins at the earliest year and ends at the latest year using that list.

_HINT:_ you can create a loop with a list as follows: `for years in year_list:`

+++ {"tags": ["solution"]}

## Solutions - Modifying functions

```{code-cell} ipython3
:tags: [solution]

# Solution - part 1

def year_to_csv(year=None, all_data=None):
    """
    Writes a csv file for data from a given year.

    year --- year for which data is extracted
    all_data --- DataFrame with multi-year data
    """

    if all_data is None:
        all_data = pd.read_csv("surveys.csv")
    
    if year is None:
        year = min(all_data.year)
    
    # Select data for the year
    surveys_year = all_data[all_data.year == year]

    # Write the new DataFrame to a csv file
    filename = 'function_surveys' + str(year) + '.csv'
    surveys_year.to_csv(filename)
    
    
def csvs_by_year(start_year=None, end_year=None, all_data=None):
    """
    Writes separate CSV files for each year of data.

    start_year --- the first year of data we want
    end_year --- the last year of data we want
    all_data --- DataFrame with multi-year data
    """
    
    if all_data is None:
        all_data = pd.read_csv("surveys.csv")
    
    if start_year is None:
        start_year = min(all_data.year)
        
    if end_year is None:
        end_year = max(all_data.year)

    # "end_year" is the last year of data we want to pull, so we loop to end_year+1
    for year in range(start_year, end_year+1):
        year_to_csv(year, all_data)
```

```{code-cell} ipython3
:tags: [solution]

# Solution - part 2

def csvs_by_year(start_year=None, end_year=None, all_data=None):
    """
    Writes separate CSV files for each year of data.

    start_year --- the first year of data we want
    end_year --- the last year of data we want
    all_data --- DataFrame with multi-year data
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
            year_to_csv(year, all_data)
        else:
            print("Skipping: ", year, " - no data points for this year.")

surveys_df = pd.read_csv("surveys.csv")
csvs_by_year(1977, 2002, surveys_df)
```

```{code-cell} ipython3
:tags: [solution]

import os

# Solution - part 3
def year_to_csv(year=None, all_data=None, output_dir='output'):
    """
    Writes a csv file for data from a given year.

    year --- year for which data is extracted
    all_data --- DataFrame with multi-year data
    output_dir --- the output directory when CSV files will be written
    """

    if all_data is None:
        all_data = pd.read_csv("surveys.csv")
    
    if year is None:
        year = min(all_data.year)
    
    # Select data for the year
    surveys_year = all_data[all_data.year == year]


    if output_dir in os.listdir('.'):
        print('Processed directory exists: ', output_dir)
    else:
        os.mkdir(output_dir)
        print('Processed directory created: ', output_dir)
    
    # Write the new DataFrame to a csv file
    filename = output_dir + '/' + 'function_surveys' + str(year) + '.csv'
    # The more correct way to create paths is:
    # filename = os.path.join(output_dir, 'function_surveys' + str(year) + '.csv')
    surveys_year.to_csv(filename)
    
year_to_csv(2002, surveys_df)
```

```{code-cell} ipython3
:tags: [solution]

# Solution - part 4
def csvs_by_year(all_data):
    """
    Writes separate CSV files for each year of data.

    all_data --- DataFrame with multi-year data
    """

    # We could do this, but missing years will be included in the 'range'
    # start_year = min(all_data.year)
    # end_year = max(all_data.year)
    # year_list = range(start_year, end_year+1)
    
    # Instead, we create an empty list, then loop over all the rows, adding years
    # we haven't seen yet to the list.
    year_list = []
    for year in surveys_df.year:
        if year not in year_list:
            year_list.append(year)
    
    # An elegant alternative is to use a 'set' object.
    # A 'set' is a collection where every value is unique - no duplicates.
    # This ensures no repeated years and has the advantage of also skipping missing years.
    # year_list = set(surveys_df.year)
    
    # "end_year" is the last year of data we want to pull, so we loop to end_year+1
    for year in year_list:
        year_to_csv(year, all_data)
        
# The 'list' of years from each row contains duplicates (we just list the first 20 here)
print(list(surveys_df.year)[0:20])

print()

# Making it a 'set' removes duplicates
print(list(set(surveys_df.year)))
```
