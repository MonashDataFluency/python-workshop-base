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

+++ {"tags": ["solution"]}

# Indexing and Slicing

*Estimated teaching time:* 30 min

*Estimated challenge time:* 30 min

*Key questions:*

  - "How can I access specific data within my data set?"
  - "How  can Python and Pandas help me to analyse my data?"
    
*Learning objectives:*

  - Describe what 0-based indexing is.
  - Manipulate and extract data using column headings and index locations.
  - Employ slicing to select sets of data from a DataFrame.
  - Employ label and integer-based indexing to select ranges of data in a dataframe.
  - Reassign values within subsets of a DataFrame.
  - Create a copy of a DataFrame.
  - "Query /select a subset of data using a set of criteria using the following operators: =, !=, >, <, >=, <=."
  - Locate subsets of data using masks.
  - Describe BOOLEAN objects in Python and manipulate data using BOOLEANs.

---

In this lesson, we will explore **ways to access different parts of the data** in a Pandas DataFrame using:

  - Indexing,
  - Slicing, and
  - Subsetting

+++

# Indexing, Slicing and Subsetting


In this lesson, we will explore **ways to access different parts of the data** in a Pandas DataFrame using:

  - Indexing,
  - Slicing, and
  - Subsetting

+++

## Ensure the Pandas package is installed

```{code-cell} ipython3
!pip install pandas matplotlib
```

## Loading our data

We will continue to use the surveys dataset that we worked with in the last lesson. Let's reopen and read in the data again:


```{code-cell} ipython3
# Make sure pandas is loaded
import pandas as pd

# Read in the survey CSV
surveys_df = pd.read_csv("surveys.csv")
```

## Indexing and Slicing in Python

We often want to work with subsets of a **DataFrame** object. There are
different ways to accomplish this including: using labels (column headings),
numeric ranges, or specific x,y index locations.



+++

## Selecting data using Labels (Column Headings)

We use square brackets `[]` to select a subset of an Python object. For example,
we can select all data from a column named `species_id` from the `surveys_df`
DataFrame by name. There are two ways to do this:


```{code-cell} ipython3
# Method 1: select a 'subset' of the data using the column name
surveys_df['species_id'].head()
```

```{code-cell} ipython3
# Method 2: use the column name as an 'attribute'; gives the same output
surveys_df.species_id.head()
```


We can also create a new object that contains only the data within the
`species_id` column as follows:


```{code-cell} ipython3
# Creates an object, surveys_species, that only contains the `species_id` column
surveys_species = surveys_df['species_id']
```


We can pass a list of column names too, as an index to select columns in that
order. This is useful when we need to reorganize our data.

**NOTE:** If a column name is not contained in the DataFrame, an exception
(error) will be raised.


```{code-cell} ipython3
# Select the species and plot columns from the DataFrame
surveys_df[['species_id', 'site_id']].head()
```


What happens if you ask for a column that doesn't exist?

```python
surveys_df['speciess']
```

Outputs:

+++

```python
---------------------------------------------------------------------------
KeyError                                  Traceback (most recent call last)
/Applications/anaconda/lib/python3.6/site-packages/pandas/core/indexes/base.py in get_loc(self, key, method, tolerance)
   2392             try:
-> 2393                 return self._engine.get_loc(key)
   2394             except KeyError:

pandas/_libs/index.pyx in pandas._libs.index.IndexEngine.get_loc (pandas/_libs/index.c:5239)()

pandas/_libs/index.pyx in pandas._libs.index.IndexEngine.get_loc (pandas/_libs/index.c:5085)()

pandas/_libs/hashtable_class_helper.pxi in pandas._libs.hashtable.PyObjectHashTable.get_item (pandas/_libs/hashtable.c:20405)()

pandas/_libs/hashtable_class_helper.pxi in pandas._libs.hashtable.PyObjectHashTable.get_item (pandas/_libs/hashtable.c:20359)()

KeyError: 'speciess'

During handling of the above exception, another exception occurred:

KeyError                                  Traceback (most recent call last)
<ipython-input-7-7d65fa0158b8> in <module>()
      1 
      2 # What happens if you ask for a column that doesn't exist?
----> 3 surveys_df['speciess']
      4 

/Applications/anaconda/lib/python3.6/site-packages/pandas/core/frame.py in __getitem__(self, key)
   2060             return self._getitem_multilevel(key)
   2061         else:
-> 2062             return self._getitem_column(key)
   2063 
   2064     def _getitem_column(self, key):

/Applications/anaconda/lib/python3.6/site-packages/pandas/core/frame.py in _getitem_column(self, key)
   2067         # get column
   2068         if self.columns.is_unique:
-> 2069             return self._get_item_cache(key)
   2070 
   2071         # duplicate columns & possible reduce dimensionality

/Applications/anaconda/lib/python3.6/site-packages/pandas/core/generic.py in _get_item_cache(self, item)
   1532         res = cache.get(item)
   1533         if res is None:
-> 1534             values = self._data.get(item)
   1535             res = self._box_item_values(item, values)
   1536             cache[item] = res

/Applications/anaconda/lib/python3.6/site-packages/pandas/core/internals.py in get(self, item, fastpath)
   3588 
   3589             if not isnull(item):
-> 3590                 loc = self.items.get_loc(item)
   3591             else:
   3592                 indexer = np.arange(len(self.items))[isnull(self.items)]

/Applications/anaconda/lib/python3.6/site-packages/pandas/core/indexes/base.py in get_loc(self, key, method, tolerance)
   2393                 return self._engine.get_loc(key)
   2394             except KeyError:
-> 2395                 return self._engine.get_loc(self._maybe_cast_indexer(key))
   2396 
   2397         indexer = self.get_indexer([key], method=method, tolerance=tolerance)

pandas/_libs/index.pyx in pandas._libs.index.IndexEngine.get_loc (pandas/_libs/index.c:5239)()

pandas/_libs/index.pyx in pandas._libs.index.IndexEngine.get_loc (pandas/_libs/index.c:5085)()

pandas/_libs/hashtable_class_helper.pxi in pandas._libs.hashtable.PyObjectHashTable.get_item (pandas/_libs/hashtable.c:20405)()

pandas/_libs/hashtable_class_helper.pxi in pandas._libs.hashtable.PyObjectHashTable.get_item (pandas/_libs/hashtable.c:20359)()

KeyError: 'speciess'
```

+++

Python tells us what type of error it is in the traceback, at the bottom it says `KeyError: 'speciess'` which means that `speciess` is not a column name (or Key in the related python data type dictionary).

```{code-cell} ipython3
# What happens when you flip the order?
surveys_df[['site_id', 'species_id']].head()
```

## Extracting Range based Subsets: Slicing

**REMINDER**: Python Uses 0-based Indexing

Let's remind ourselves that Python uses 0-based
indexing. This means that the first element in an object is located at position
0. This is different from other tools like R and Matlab that index elements
within objects starting at 1.


```{code-cell} ipython3
# Create a list of numbers:
a = [1, 2, 3, 4, 5]
```

![indexing diagram](images/slicing-indexing.svg)
![slicing diagram](images/slicing-slicing.svg)

+++ {"tags": ["challenge"]}

## Challenge - Extracting data

1. What value does the code **a[0]** return?

2. How about this: **a[5]**

3. In the example above, calling `a[5]` returns an error. Why is that?

4. What about **a[len(a)]** ?



+++

## Solutions - Extracting data

```{code-cell} ipython3
:tags: [solution]

a[0]
```

```{code-cell} ipython3
:tags: [solution]

# Solution #2
# a[5]
```

+++ {"tags": ["solution"]}

#### Solution #2

In above example, the error says `list index out of range`. This means we don't have index 5 in our list. The maximum index for `a` is `4`, as indexing starts at `0`.

```{code-cell} ipython3
:tags: [solution]

# Solution #3
# a[len(a)]
```

+++ {"tags": ["solution"]}

#### Solution - # 4 - Extracting data 
This also gives an error, because len(a) is `5` which is not the maximum index

+++

## Slicing Subsets of Rows in Python

Slicing using the `[]` operator selects a set of rows and/or columns from a
DataFrame. To slice out a set of rows, you use the following syntax:
`data[start:stop]`. When slicing in pandas the start bound is included in the
output. The stop bound is one step BEYOND the row you want to select. So if you
want to select rows 0, 1 and 2 your code would look like this with our `surveys data`:


```{code-cell} ipython3
# Select rows 0, 1, 2 (row 3 is not selected)
surveys_df[0:3]
```


The stop bound in Python is different from what you might be used to in
languages like Matlab and R.

Now lets select the `first 5 rows (rows 0, 1, 2, 3, 4)`.

```{code-cell} ipython3
surveys_df[:5]
```

```{code-cell} ipython3
# Select the last element in the list
# (the slice starts at the last element, and ends at the end of the list)
surveys_df[-1:]
```


We can also reassign values within subsets of our DataFrame.


Let's create a brand new clean dataframe from
the original data CSV file.


```{code-cell} ipython3
surveys_df = pd.read_csv("surveys.csv")
```

## Slicing Subsets of Rows and Columns in Python

We can select specific ranges of our data in both the row and column directions
using either label or integer-based indexing.

- `loc` is primarily *label* based indexing. *Integers* may be used but
  they are interpreted as a *label*.
- `iloc` is primarily *integer* based indexing

To select a subset of rows **and** columns from our DataFrame, we can use the
`iloc` method. For example, we can select month, day and year (columns 2, 3
and 4 if we start counting at 1), like this:

`iloc[row slicing, column slicing]`


```{code-cell} ipython3
surveys_df.iloc[0:3, 1:4]
```

Notice that we asked for a slice from 0:3. This yielded 3 rows of data. When you
ask for 0:3, you are actually telling Python to start at index 0 and select rows
0, 1, 2 **up to but not including 3**.

Let's explore some other ways to index and select subsets of data:


```{code-cell} ipython3
# Select all columns for rows of index values 0 and 10
surveys_df.loc[[0, 10], :]
```

```{code-cell} ipython3
# What does this do?
surveys_df.loc[0, ['species_id', 'site_id', 'weight']]
```

```{code-cell} ipython3
# What happens when you uncomment and run the code below?
# surveys_df.loc[[0, 10, 35549], :]
```


**NOTE**: Labels must be found in the DataFrame or you will get a `KeyError`.

Indexing by labels `loc` differs from indexing by integers `iloc`.
With `loc`, the both start bound and the stop bound are **inclusive**. When using
`loc`, integers *can* be used, but the integers refer to the
index label and not the position. For example, using `loc` and select 1:4
will get a different result than using `iloc` to select rows 1:4.

We can also select a specific data value using a row and
column location within the DataFrame and `iloc` indexing:

```python
# Syntax for iloc indexing to finding a specific data element
dat.iloc[row, column]
```

In following iloc example:

```{code-cell} ipython3
surveys_df.iloc[2, 6]
```

Remember that Python indexing begins at 0. So, the index location [2, 6]
selects the element that is 3 rows down and 7 columns over in the DataFrame.

+++ {"tags": ["challenge"]}

## Challenge - Range

1. What happens when you execute:

       - `surveys_df[0:1]`
       - `surveys_df[:4]`
       - `surveys_df[:-1]`

2. What happens when you call:

       - `surveys_df.iloc[0:4, 1:4]`

+++ {"tags": ["solution"]}

## Solution - Range

```{code-cell} ipython3
:tags: [solution]

# Solution - Range - #1 (a)
surveys_df[0:1]
```

```{code-cell} ipython3
:tags: [solution]

# Solution - Range - #1 (b)
surveys_df[:4]
```

```{code-cell} ipython3
:tags: [solution]

# Solution - Range - #1 (c)
surveys_df[:-1]
```

```{code-cell} ipython3
:tags: [solution]

# Solution - Range - #2
surveys_df.iloc[0:4, 1:4]
```

## Subsetting Data using Criteria

We can also select a subset of our data using criteria. For example, we can
select all rows that `have a year value of 2002`:


```{code-cell} ipython3
surveys_df[surveys_df.year == 2002].head()
```


Or we can select all rows that `do not contain the year 2002`:


```{code-cell} ipython3
surveys_df[surveys_df.year != 2002]
```


We can define sets of criteria too:


```{code-cell} ipython3
surveys_df[(surveys_df.year >= 1980) & (surveys_df.year <= 1985)]
```


### Python Syntax Cheat Sheet

Use can use the syntax below when querying data by criteria from a DataFrame.
Experiment with selecting various subsets of the "surveys" data.

* Equals: `==`
* Not equals: `!=`
* Greater than, less than: `>` or `<`
* Greater than or equal to `>=`
* Less than or equal to `<=`



+++ {"tags": ["challenge"]}

## Challenge - Queries

1. Select a subset of rows in the `surveys_df` DataFrame that contain data from
   the year 1999 and that contain weight values less than or equal to 8. How
   many rows did you end up with? What did your neighbor get?

2. **(Extra)** Use the `isin` function to find all plots that contain `PB` and `PL` species
in the "surveys" DataFrame. How many records contain these values?

You can use the `isin` command in Python to query a DataFrame based upon a
   list of values as follows:

```python
surveys_df[surveys_df['species_id'].isin([listGoesHere])]
```

+++ {"tags": ["solution"]}

## Solution - Queries 

```{code-cell} ipython3
:tags: [solution]

## Solution - Queries #1
surveys_df[(surveys_df["year"] == 1999) & (surveys_df["weight"] <= 8)]
```

```{code-cell} ipython3
:tags: [solution]

# when only interested in how many, the sum of True values could be used as well: 
sum((surveys_df["year"] == 1999) & (surveys_df["weight"] <= 8))
```

```{code-cell} ipython3
:tags: [solution]

# Solution - Queries #2
surveys_df[surveys_df['species_id'].isin(['PB', 'PL'])]['site_id'].unique()
```

```{code-cell} ipython3
:tags: [solution]

# To get number of records
surveys_df[surveys_df['species_id'].isin(['PB', 'PL'])].shape
```

+++ {"tags": ["challenge"]}

## Extra Challenges


3. **(Extra)** Create a query that finds all rows with a
   weight value greater than (`>`) or equal to 0.

4. **(Extra)** The `~` symbol in Python can be used to return the OPPOSITE of the
   selection that you specify in Python. It is equivalent to **is not in**.
   Write a query that selects all rows with sex NOT equal to 'M' or 'F' in
   the "surveys" data.

```{code-cell} ipython3
:tags: [solution]

sum(surveys_df["weight"]>=0)
```

```{code-cell} ipython3
:tags: [solution]

surveys_df[~surveys_df["sex"].isin(['M', 'F'])]
```

# Using masks to identify a specific condition

A **mask** can be useful to locate where a particular subset of values exist or
don't exist - for example,  NaN, or "Not a Number" values. To understand masks,
we also need to understand `BOOLEAN` objects in Python.

Boolean values include `True` or `False`. For example,

```{code-cell} ipython3
# Set x to 5
x = 5
```

```{code-cell} ipython3
# What does the code below return?
x > 5
```

```{code-cell} ipython3
# How about this?
x == 5
```

+++ {"tags": ["challenge"]}

## _Extra Challenges - Putting it all together_

 1. Create a new DataFrame that only contains observations with sex values that
   are **not** female or male. Assign each sex value in the new DataFrame to a
   new value of 'x'. Determine the number of null values in the subset.
   
 2. Create a new DataFrame that contains only observations that are of sex male
   or female and where weight values are greater than 0. Create a stacked bar
   plot of average weight by plot with male vs female values stacked for each
   plot.
  3. Count the number of missing values per column. Hint: The method .count() gives you the number of non-NA observations per column. 


+++ {"tags": ["solution"]}

## Solution _Extra Challenges_

```{code-cell} ipython3
:tags: [solution]

# Solution extra challenge 1
new = surveys_df[~surveys_df['sex'].isin(['M', 'F'])].copy()
new['sex']='x'
print(len(new))
```

```{code-cell} ipython3
:tags: [solution]

# We can verify the number of NaN values with
sum(surveys_df['sex'].isnull())
```

```{code-cell} ipython3
# Solution extra challenge 2

# selection of the data with isin
stack_selection = surveys_df[(surveys_df['sex'].isin(['M', 'F'])) &
							surveys_df["weight"] > 0.][["sex", "weight", "site_id"]]

# calculate the mean weight for each site id and sex combination:
stack_selection = stack_selection.groupby(["site_id", "sex"]).mean().unstack()

# Plot inside jupyter notebook
%matplotlib inline

# and we can make a stacked bar plot from this:
stack_selection.plot(kind='bar', stacked=True)
```
