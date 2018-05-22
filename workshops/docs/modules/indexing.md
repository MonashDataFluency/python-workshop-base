

<style>
.output_label {
    text-align: right;
    margin: -1em;
    padding: 0;
    font-size: 0.5em;
    color: grey
}
</style>


# Indexing, Slicing and Subsetting

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





## Ensure the Pandas package is installed






```python
!pip install pandas
```

<pre class="output">
<div class="output_label">output</div>
<code class="text">
Requirement already satisfied: pandas in /Users/perry/.virtualenvs/python-workshop-base-ufuVBSbV/lib/python3.6/site-packages (0.23.0)
Requirement already satisfied: pytz>=2011k in /Users/perry/.virtualenvs/python-workshop-base-ufuVBSbV/lib/python3.6/site-packages (from pandas) (2018.4)
Requirement already satisfied: numpy>=1.9.0 in /Users/perry/.virtualenvs/python-workshop-base-ufuVBSbV/lib/python3.6/site-packages (from pandas) (1.14.3)
Requirement already satisfied: python-dateutil>=2.5.0 in /Users/perry/.virtualenvs/python-workshop-base-ufuVBSbV/lib/python3.6/site-packages (from pandas) (2.7.3)
Requirement already satisfied: six>=1.5 in /Users/perry/.virtualenvs/python-workshop-base-ufuVBSbV/lib/python3.6/site-packages (from python-dateutil>=2.5.0->pandas) (1.11.0)

</code>
</pre>





## Loading our data

We will continue to use the surveys dataset that we worked with in the last lesson. Let's reopen and read in the data again:








```python
# Make sure pandas is loaded
import pandas as pd

# Read in the survey CSV
surveys_df = pd.read_csv("data/surveys.csv")
```





## Indexing and Slicing in Python

We often want to work with subsets of a **DataFrame** object. There are
different ways to accomplish this including: using labels (column headings),
numeric ranges, or specific x,y index locations.








## Selecting data using Labels (Column Headings)

We use square brackets `[]` to select a subset of an Python object. For example,
we can select all data from a column named `species_id` from the `surveys_df`
DataFrame by name. There are two ways to do this:








```python
# Method 1: select a 'subset' of the data using the column name
surveys_df['species_id'].head()

# Method 2: use the column name as an 'attribute'; gives the same output
surveys_df.species_id.head()
```




<pre class="output">
<div style="text-align: right; margin: -1em; padding: 0;"><span style="font-size: 0.5em; color: grey">output</span></div>
<code class="text">
0    NL
1    NL
2    DM
3    DM
4    DM
Name: species_id, dtype: object
</code>
</pre>








We can also create a new object that contains only the data within the
`species_id` column as follows:








```python
# Creates an object, surveys_species, that only contains the `species_id` column
surveys_species = surveys_df['species_id']
```






We can pass a list of column names too, as an index to select columns in that
order. This is useful when we need to reorganize our data.

**NOTE:** If a column name is not contained in the DataFrame, an exception
(error) will be raised.








```python
# Select the species and plot columns from the DataFrame
surveys_df[['species_id', 'site_id']].head()
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>species_id</th>
      <th>site_id</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>NL</td>
      <td>2</td>
    </tr>
    <tr>
      <th>1</th>
      <td>NL</td>
      <td>3</td>
    </tr>
    <tr>
      <th>2</th>
      <td>DM</td>
      <td>2</td>
    </tr>
    <tr>
      <th>3</th>
      <td>DM</td>
      <td>7</td>
    </tr>
    <tr>
      <th>4</th>
      <td>DM</td>
      <td>3</td>
    </tr>
  </tbody>
</table>
</div>







```python
# What happens if you ask for a column that doesn't exist?
surveys_df['speciess']
```

Outputs:

```
---------------------------------------------------------------------------
KeyError                                  Traceback (most recent call last)
~/.virtualenvs/jupyter/lib/python3.6/site-packages/pandas/core/indexes/base.py in get_loc(self, key, method, tolerance)
   2521             try:
-> 2522                 return self._engine.get_loc(key)
   2523             except KeyError:

pandas/_libs/index.pyx in pandas._libs.index.IndexEngine.get_loc()

pandas/_libs/index.pyx in pandas._libs.index.IndexEngine.get_loc()

pandas/_libs/hashtable_class_helper.pxi in pandas._libs.hashtable.PyObjectHashTable.get_item()

pandas/_libs/hashtable_class_helper.pxi in pandas._libs.hashtable.PyObjectHashTable.get_item()

KeyError: 'speciess'

During handling of the above exception, another exception occurred:

KeyError                                  Traceback (most recent call last)
<ipython-input-15-211eec9ce8b9> in <module>()
      1 # What happens if you ask for a column that doesn't exist?
----> 2 surveys_df['speciess']

~/.virtualenvs/jupyter/lib/python3.6/site-packages/pandas/core/frame.py in __getitem__(self, key)
   2137             return self._getitem_multilevel(key)
   2138         else:
-> 2139             return self._getitem_column(key)
   2140 
   2141     def _getitem_column(self, key):

~/.virtualenvs/jupyter/lib/python3.6/site-packages/pandas/core/frame.py in _getitem_column(self, key)
   2144         # get column
   2145         if self.columns.is_unique:
-> 2146             return self._get_item_cache(key)
   2147 
   2148         # duplicate columns & possible reduce dimensionality

~/.virtualenvs/jupyter/lib/python3.6/site-packages/pandas/core/generic.py in _get_item_cache(self, item)
   1840         res = cache.get(item)
   1841         if res is None:
-> 1842             values = self._data.get(item)
   1843             res = self._box_item_values(item, values)
   1844             cache[item] = res

~/.virtualenvs/jupyter/lib/python3.6/site-packages/pandas/core/internals.py in get(self, item, fastpath)
   3836 
   3837             if not isna(item):
-> 3838                 loc = self.items.get_loc(item)
   3839             else:
   3840                 indexer = np.arange(len(self.items))[isna(self.items)]

~/.virtualenvs/jupyter/lib/python3.6/site-packages/pandas/core/indexes/base.py in get_loc(self, key, method, tolerance)
   2522                 return self._engine.get_loc(key)
   2523             except KeyError:
-> 2524                 return self._engine.get_loc(self._maybe_cast_indexer(key))
   2525 
   2526         indexer = self.get_indexer([key], method=method, tolerance=tolerance)

pandas/_libs/index.pyx in pandas._libs.index.IndexEngine.get_loc()

pandas/_libs/index.pyx in pandas._libs.index.IndexEngine.get_loc()

pandas/_libs/hashtable_class_helper.pxi in pandas._libs.hashtable.PyObjectHashTable.get_item()

pandas/_libs/hashtable_class_helper.pxi in pandas._libs.hashtable.PyObjectHashTable.get_item()

KeyError: 'speciess'
```






```python
# What happens when you flip the order?
surveys_df[['site_id', 'species_id']].head()
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>site_id</th>
      <th>species_id</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>2</td>
      <td>NL</td>
    </tr>
    <tr>
      <th>1</th>
      <td>3</td>
      <td>NL</td>
    </tr>
    <tr>
      <th>2</th>
      <td>2</td>
      <td>DM</td>
    </tr>
    <tr>
      <th>3</th>
      <td>7</td>
      <td>DM</td>
    </tr>
    <tr>
      <th>4</th>
      <td>3</td>
      <td>DM</td>
    </tr>
  </tbody>
</table>
</div>








Python tells us what type of error it is in the traceback, at the bottom it says `KeyError: 'speciess'` which means that `speciess` is not a column name (or Key in the related python data type dictionary).







## Extracting Range based Subsets: Slicing

**REMINDER**: Python Uses 0-based Indexing

Let's remind ourselves that Python uses 0-based
indexing. This means that the first element in an object is located at position
0. This is different from other tools like R and Matlab that index elements
within objects starting at 1.








```python
# Create a list of numbers:
a = [1, 2, 3, 4, 5]
```





![indexing diagram](images/slicing-indexing.svg)
![slicing diagram](images/slicing-slicing.svg)





## Challenge - Extracting data

1. What value does the code **a[0]** return?

2. How about this: **a[5]**

3. In the example above, calling `a[5]` returns an error. Why is that?

4. What about **a[len(a)]** ?








## Slicing Subsets of Rows in Python

Slicing using the `[]` operator selects a set of rows and/or columns from a
DataFrame. To slice out a set of rows, you use the following syntax:
`data[start:stop]`. When slicing in pandas the start bound is included in the
output. The stop bound is one step BEYOND the row you want to select. So if you
want to select rows 0, 1 and 2 your code would look like this:








```python
# Select rows 0, 1, 2 (row 3 is not selected)
surveys_df[0:3]
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>record_id</th>
      <th>month</th>
      <th>day</th>
      <th>year</th>
      <th>site_id</th>
      <th>species_id</th>
      <th>sex</th>
      <th>hindfoot_length</th>
      <th>weight</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>1</td>
      <td>7</td>
      <td>16</td>
      <td>1977</td>
      <td>2</td>
      <td>NL</td>
      <td>M</td>
      <td>32.0</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>1</th>
      <td>2</td>
      <td>7</td>
      <td>16</td>
      <td>1977</td>
      <td>3</td>
      <td>NL</td>
      <td>M</td>
      <td>33.0</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>2</th>
      <td>3</td>
      <td>7</td>
      <td>16</td>
      <td>1977</td>
      <td>2</td>
      <td>DM</td>
      <td>F</td>
      <td>37.0</td>
      <td>NaN</td>
    </tr>
  </tbody>
</table>
</div>








The stop bound in Python is different from what you might be used to in
languages like Matlab and R.








```python
# Select the first 5 rows (rows 0, 1, 2, 3, 4)
surveys_df[:5]

# Select the last element in the list
# (the slice starts at the last element, and ends at the end of the list)
surveys_df[-1:]
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>record_id</th>
      <th>month</th>
      <th>day</th>
      <th>year</th>
      <th>site_id</th>
      <th>species_id</th>
      <th>sex</th>
      <th>hindfoot_length</th>
      <th>weight</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>35548</th>
      <td>35549</td>
      <td>12</td>
      <td>31</td>
      <td>2002</td>
      <td>5</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
  </tbody>
</table>
</div>








We can also reassign values within subsets of our DataFrame.


Let's create a brand new clean dataframe from
the original data CSV file.








```python
surveys_df = pd.read_csv("data/surveys.csv")
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








```python
# iloc[row slicing, column slicing]
surveys_df.iloc[0:3, 1:4]
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>month</th>
      <th>day</th>
      <th>year</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>7</td>
      <td>16</td>
      <td>1977</td>
    </tr>
    <tr>
      <th>1</th>
      <td>7</td>
      <td>16</td>
      <td>1977</td>
    </tr>
    <tr>
      <th>2</th>
      <td>7</td>
      <td>16</td>
      <td>1977</td>
    </tr>
  </tbody>
</table>
</div>








which gives the **output**

```
   month  day  year
0      7   16  1977
1      7   16  1977
2      7   16  1977
```

Notice that we asked for a slice from 0:3. This yielded 3 rows of data. When you
ask for 0:3, you are actually telling Python to start at index 0 and select rows
0, 1, 2 **up to but not including 3**.

Let's explore some other ways to index and select subsets of data:








```python
# Select all columns for rows of index values 0 and 10
surveys_df.loc[[0, 10], :]

# What does this do?
surveys_df.loc[0, ['species_id', 'site_id', 'weight']]

# What happens when you type the code below?
surveys_df.loc[[0, 10, 35549], :]
```

<pre class="output">
<div class="output_label">output</div>
<code class="text">
/Users/perry/.virtualenvs/python-workshop-base-ufuVBSbV/lib/python3.6/site-packages/pandas/core/indexing.py:1472: FutureWarning: 
Passing list-likes to .loc or [] with any missing label will raise
KeyError in the future, you can use .reindex() as an alternative.

See the documentation here:
https://pandas.pydata.org/pandas-docs/stable/indexing.html#deprecate-loc-reindex-listlike
  return self._getitem_tuple(key)

</code>
</pre>




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>record_id</th>
      <th>month</th>
      <th>day</th>
      <th>year</th>
      <th>site_id</th>
      <th>species_id</th>
      <th>sex</th>
      <th>hindfoot_length</th>
      <th>weight</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>1.0</td>
      <td>7.0</td>
      <td>16.0</td>
      <td>1977.0</td>
      <td>2.0</td>
      <td>NL</td>
      <td>M</td>
      <td>32.0</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>10</th>
      <td>11.0</td>
      <td>7.0</td>
      <td>16.0</td>
      <td>1977.0</td>
      <td>5.0</td>
      <td>DS</td>
      <td>F</td>
      <td>53.0</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>35549</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
  </tbody>
</table>
</div>








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






In this `iloc` example,








```python
surveys_df.iloc[2, 6]
```




<pre class="output">
<div style="text-align: right; margin: -1em; padding: 0;"><span style="font-size: 0.5em; color: grey">output</span></div>
<code class="text">
'F'
</code>
</pre>







Remember that Python indexing begins at 0. So, the index location [2, 6]
selects the element that is 3 rows down and 7 columns over in the DataFrame.





## Challenge - Range

1. What happens when you execute:

   - `surveys_df[0:1]`
   - `surveys_df[:4]`
   - `surveys_df[:-1]`

2. What happens when you call:

   - `surveys_df.iloc[0:4, 1:4]`










## Subsetting Data using Criteria

We can also select a subset of our data using criteria. For example, we can
select all rows that have a year value of 2002:








```python
surveys_df[surveys_df.year == 2002].head()
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>record_id</th>
      <th>month</th>
      <th>day</th>
      <th>year</th>
      <th>site_id</th>
      <th>species_id</th>
      <th>sex</th>
      <th>hindfoot_length</th>
      <th>weight</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>33320</th>
      <td>33321</td>
      <td>1</td>
      <td>12</td>
      <td>2002</td>
      <td>1</td>
      <td>DM</td>
      <td>M</td>
      <td>38.0</td>
      <td>44.0</td>
    </tr>
    <tr>
      <th>33321</th>
      <td>33322</td>
      <td>1</td>
      <td>12</td>
      <td>2002</td>
      <td>1</td>
      <td>DO</td>
      <td>M</td>
      <td>37.0</td>
      <td>58.0</td>
    </tr>
    <tr>
      <th>33322</th>
      <td>33323</td>
      <td>1</td>
      <td>12</td>
      <td>2002</td>
      <td>1</td>
      <td>PB</td>
      <td>M</td>
      <td>28.0</td>
      <td>45.0</td>
    </tr>
    <tr>
      <th>33323</th>
      <td>33324</td>
      <td>1</td>
      <td>12</td>
      <td>2002</td>
      <td>1</td>
      <td>AB</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>33324</th>
      <td>33325</td>
      <td>1</td>
      <td>12</td>
      <td>2002</td>
      <td>1</td>
      <td>DO</td>
      <td>M</td>
      <td>35.0</td>
      <td>29.0</td>
    </tr>
  </tbody>
</table>
</div>








Which produces the following output:







```
record_id  month  day  year  plot_id species_id  sex  hindfoot_length  weight
33320      33321      1   12  2002        1         DM    M     38      44
33321      33322      1   12  2002        1         DO    M     37      58
33322      33323      1   12  2002        1         PB    M     28      45
33323      33324      1   12  2002        1         AB  NaN    NaN     NaN
33324      33325      1   12  2002        1         DO    M     35      29
...
35544      35545     12   31  2002       15         AH  NaN    NaN     NaN
35545      35546     12   31  2002       15         AH  NaN    NaN     NaN
35546      35547     12   31  2002       10         RM    F     15      14
35547      35548     12   31  2002        7         DO    M     36      51
35548      35549     12   31  2002        5        NaN  NaN    NaN     NaN

[2229 rows x 9 columns]
```






Or we can select all rows that do not contain the year 2002:








```python
surveys_df[surveys_df.year != 2002]
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>record_id</th>
      <th>month</th>
      <th>day</th>
      <th>year</th>
      <th>site_id</th>
      <th>species_id</th>
      <th>sex</th>
      <th>hindfoot_length</th>
      <th>weight</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>1</td>
      <td>7</td>
      <td>16</td>
      <td>1977</td>
      <td>2</td>
      <td>NL</td>
      <td>M</td>
      <td>32.0</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>1</th>
      <td>2</td>
      <td>7</td>
      <td>16</td>
      <td>1977</td>
      <td>3</td>
      <td>NL</td>
      <td>M</td>
      <td>33.0</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>2</th>
      <td>3</td>
      <td>7</td>
      <td>16</td>
      <td>1977</td>
      <td>2</td>
      <td>DM</td>
      <td>F</td>
      <td>37.0</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>3</th>
      <td>4</td>
      <td>7</td>
      <td>16</td>
      <td>1977</td>
      <td>7</td>
      <td>DM</td>
      <td>M</td>
      <td>36.0</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>4</th>
      <td>5</td>
      <td>7</td>
      <td>16</td>
      <td>1977</td>
      <td>3</td>
      <td>DM</td>
      <td>M</td>
      <td>35.0</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>5</th>
      <td>6</td>
      <td>7</td>
      <td>16</td>
      <td>1977</td>
      <td>1</td>
      <td>PF</td>
      <td>M</td>
      <td>14.0</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>6</th>
      <td>7</td>
      <td>7</td>
      <td>16</td>
      <td>1977</td>
      <td>2</td>
      <td>PE</td>
      <td>F</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>7</th>
      <td>8</td>
      <td>7</td>
      <td>16</td>
      <td>1977</td>
      <td>1</td>
      <td>DM</td>
      <td>M</td>
      <td>37.0</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>8</th>
      <td>9</td>
      <td>7</td>
      <td>16</td>
      <td>1977</td>
      <td>1</td>
      <td>DM</td>
      <td>F</td>
      <td>34.0</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>9</th>
      <td>10</td>
      <td>7</td>
      <td>16</td>
      <td>1977</td>
      <td>6</td>
      <td>PF</td>
      <td>F</td>
      <td>20.0</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>10</th>
      <td>11</td>
      <td>7</td>
      <td>16</td>
      <td>1977</td>
      <td>5</td>
      <td>DS</td>
      <td>F</td>
      <td>53.0</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>11</th>
      <td>12</td>
      <td>7</td>
      <td>16</td>
      <td>1977</td>
      <td>7</td>
      <td>DM</td>
      <td>M</td>
      <td>38.0</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>12</th>
      <td>13</td>
      <td>7</td>
      <td>16</td>
      <td>1977</td>
      <td>3</td>
      <td>DM</td>
      <td>M</td>
      <td>35.0</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>13</th>
      <td>14</td>
      <td>7</td>
      <td>16</td>
      <td>1977</td>
      <td>8</td>
      <td>DM</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>14</th>
      <td>15</td>
      <td>7</td>
      <td>16</td>
      <td>1977</td>
      <td>6</td>
      <td>DM</td>
      <td>F</td>
      <td>36.0</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>15</th>
      <td>16</td>
      <td>7</td>
      <td>16</td>
      <td>1977</td>
      <td>4</td>
      <td>DM</td>
      <td>F</td>
      <td>36.0</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>16</th>
      <td>17</td>
      <td>7</td>
      <td>16</td>
      <td>1977</td>
      <td>3</td>
      <td>DS</td>
      <td>F</td>
      <td>48.0</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>17</th>
      <td>18</td>
      <td>7</td>
      <td>16</td>
      <td>1977</td>
      <td>2</td>
      <td>PP</td>
      <td>M</td>
      <td>22.0</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>18</th>
      <td>19</td>
      <td>7</td>
      <td>16</td>
      <td>1977</td>
      <td>4</td>
      <td>PF</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>19</th>
      <td>20</td>
      <td>7</td>
      <td>17</td>
      <td>1977</td>
      <td>11</td>
      <td>DS</td>
      <td>F</td>
      <td>48.0</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>20</th>
      <td>21</td>
      <td>7</td>
      <td>17</td>
      <td>1977</td>
      <td>14</td>
      <td>DM</td>
      <td>F</td>
      <td>34.0</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>21</th>
      <td>22</td>
      <td>7</td>
      <td>17</td>
      <td>1977</td>
      <td>15</td>
      <td>NL</td>
      <td>F</td>
      <td>31.0</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>22</th>
      <td>23</td>
      <td>7</td>
      <td>17</td>
      <td>1977</td>
      <td>13</td>
      <td>DM</td>
      <td>M</td>
      <td>36.0</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>23</th>
      <td>24</td>
      <td>7</td>
      <td>17</td>
      <td>1977</td>
      <td>13</td>
      <td>SH</td>
      <td>M</td>
      <td>21.0</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>24</th>
      <td>25</td>
      <td>7</td>
      <td>17</td>
      <td>1977</td>
      <td>9</td>
      <td>DM</td>
      <td>M</td>
      <td>35.0</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>25</th>
      <td>26</td>
      <td>7</td>
      <td>17</td>
      <td>1977</td>
      <td>15</td>
      <td>DM</td>
      <td>M</td>
      <td>31.0</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>26</th>
      <td>27</td>
      <td>7</td>
      <td>17</td>
      <td>1977</td>
      <td>15</td>
      <td>DM</td>
      <td>M</td>
      <td>36.0</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>27</th>
      <td>28</td>
      <td>7</td>
      <td>17</td>
      <td>1977</td>
      <td>11</td>
      <td>DM</td>
      <td>M</td>
      <td>38.0</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>28</th>
      <td>29</td>
      <td>7</td>
      <td>17</td>
      <td>1977</td>
      <td>11</td>
      <td>PP</td>
      <td>M</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>29</th>
      <td>30</td>
      <td>7</td>
      <td>17</td>
      <td>1977</td>
      <td>10</td>
      <td>DS</td>
      <td>F</td>
      <td>52.0</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>...</th>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
    </tr>
    <tr>
      <th>33290</th>
      <td>33291</td>
      <td>12</td>
      <td>15</td>
      <td>2001</td>
      <td>23</td>
      <td>PE</td>
      <td>M</td>
      <td>20.0</td>
      <td>18.0</td>
    </tr>
    <tr>
      <th>33291</th>
      <td>33292</td>
      <td>12</td>
      <td>15</td>
      <td>2001</td>
      <td>23</td>
      <td>RM</td>
      <td>F</td>
      <td>16.0</td>
      <td>8.0</td>
    </tr>
    <tr>
      <th>33292</th>
      <td>33293</td>
      <td>12</td>
      <td>15</td>
      <td>2001</td>
      <td>20</td>
      <td>PE</td>
      <td>F</td>
      <td>20.0</td>
      <td>22.0</td>
    </tr>
    <tr>
      <th>33293</th>
      <td>33294</td>
      <td>12</td>
      <td>15</td>
      <td>2001</td>
      <td>20</td>
      <td>SH</td>
      <td>M</td>
      <td>25.0</td>
      <td>43.0</td>
    </tr>
    <tr>
      <th>33294</th>
      <td>33295</td>
      <td>12</td>
      <td>15</td>
      <td>2001</td>
      <td>20</td>
      <td>PB</td>
      <td>F</td>
      <td>27.0</td>
      <td>33.0</td>
    </tr>
    <tr>
      <th>33295</th>
      <td>33296</td>
      <td>12</td>
      <td>15</td>
      <td>2001</td>
      <td>20</td>
      <td>PB</td>
      <td>M</td>
      <td>25.0</td>
      <td>35.0</td>
    </tr>
    <tr>
      <th>33296</th>
      <td>33297</td>
      <td>12</td>
      <td>15</td>
      <td>2001</td>
      <td>20</td>
      <td>RM</td>
      <td>M</td>
      <td>16.0</td>
      <td>11.0</td>
    </tr>
    <tr>
      <th>33297</th>
      <td>33298</td>
      <td>12</td>
      <td>15</td>
      <td>2001</td>
      <td>20</td>
      <td>RM</td>
      <td>F</td>
      <td>16.0</td>
      <td>8.0</td>
    </tr>
    <tr>
      <th>33298</th>
      <td>33299</td>
      <td>12</td>
      <td>15</td>
      <td>2001</td>
      <td>20</td>
      <td>PB</td>
      <td>F</td>
      <td>25.0</td>
      <td>28.0</td>
    </tr>
    <tr>
      <th>33299</th>
      <td>33300</td>
      <td>12</td>
      <td>15</td>
      <td>2001</td>
      <td>20</td>
      <td>PB</td>
      <td>F</td>
      <td>26.0</td>
      <td>30.0</td>
    </tr>
    <tr>
      <th>33300</th>
      <td>33301</td>
      <td>12</td>
      <td>15</td>
      <td>2001</td>
      <td>20</td>
      <td>PB</td>
      <td>F</td>
      <td>27.0</td>
      <td>31.0</td>
    </tr>
    <tr>
      <th>33301</th>
      <td>33302</td>
      <td>12</td>
      <td>15</td>
      <td>2001</td>
      <td>24</td>
      <td>PE</td>
      <td>M</td>
      <td>20.0</td>
      <td>24.0</td>
    </tr>
    <tr>
      <th>33302</th>
      <td>33303</td>
      <td>12</td>
      <td>15</td>
      <td>2001</td>
      <td>24</td>
      <td>PE</td>
      <td>M</td>
      <td>20.0</td>
      <td>23.0</td>
    </tr>
    <tr>
      <th>33303</th>
      <td>33304</td>
      <td>12</td>
      <td>15</td>
      <td>2001</td>
      <td>24</td>
      <td>RM</td>
      <td>M</td>
      <td>16.0</td>
      <td>10.0</td>
    </tr>
    <tr>
      <th>33304</th>
      <td>33305</td>
      <td>12</td>
      <td>15</td>
      <td>2001</td>
      <td>7</td>
      <td>PB</td>
      <td>M</td>
      <td>29.0</td>
      <td>44.0</td>
    </tr>
    <tr>
      <th>33305</th>
      <td>33306</td>
      <td>12</td>
      <td>15</td>
      <td>2001</td>
      <td>7</td>
      <td>OT</td>
      <td>M</td>
      <td>19.0</td>
      <td>21.0</td>
    </tr>
    <tr>
      <th>33306</th>
      <td>33307</td>
      <td>12</td>
      <td>15</td>
      <td>2001</td>
      <td>7</td>
      <td>OT</td>
      <td>M</td>
      <td>20.0</td>
      <td>19.0</td>
    </tr>
    <tr>
      <th>33307</th>
      <td>33308</td>
      <td>12</td>
      <td>15</td>
      <td>2001</td>
      <td>7</td>
      <td>PP</td>
      <td>M</td>
      <td>24.0</td>
      <td>16.0</td>
    </tr>
    <tr>
      <th>33308</th>
      <td>33309</td>
      <td>12</td>
      <td>16</td>
      <td>2001</td>
      <td>3</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>33309</th>
      <td>33310</td>
      <td>12</td>
      <td>16</td>
      <td>2001</td>
      <td>4</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>33310</th>
      <td>33311</td>
      <td>12</td>
      <td>16</td>
      <td>2001</td>
      <td>5</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>33311</th>
      <td>33312</td>
      <td>12</td>
      <td>16</td>
      <td>2001</td>
      <td>6</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>33312</th>
      <td>33313</td>
      <td>12</td>
      <td>16</td>
      <td>2001</td>
      <td>8</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>33313</th>
      <td>33314</td>
      <td>12</td>
      <td>16</td>
      <td>2001</td>
      <td>9</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>33314</th>
      <td>33315</td>
      <td>12</td>
      <td>16</td>
      <td>2001</td>
      <td>10</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>33315</th>
      <td>33316</td>
      <td>12</td>
      <td>16</td>
      <td>2001</td>
      <td>11</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>33316</th>
      <td>33317</td>
      <td>12</td>
      <td>16</td>
      <td>2001</td>
      <td>13</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>33317</th>
      <td>33318</td>
      <td>12</td>
      <td>16</td>
      <td>2001</td>
      <td>14</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>33318</th>
      <td>33319</td>
      <td>12</td>
      <td>16</td>
      <td>2001</td>
      <td>15</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>33319</th>
      <td>33320</td>
      <td>12</td>
      <td>16</td>
      <td>2001</td>
      <td>16</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
  </tbody>
</table>
<p>33320 rows × 9 columns</p>
</div>








We can define sets of criteria too:








```python
surveys_df[(surveys_df.year >= 1980) & (surveys_df.year <= 1985)]
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>record_id</th>
      <th>month</th>
      <th>day</th>
      <th>year</th>
      <th>site_id</th>
      <th>species_id</th>
      <th>sex</th>
      <th>hindfoot_length</th>
      <th>weight</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>2270</th>
      <td>2271</td>
      <td>1</td>
      <td>15</td>
      <td>1980</td>
      <td>8</td>
      <td>DO</td>
      <td>M</td>
      <td>35.0</td>
      <td>53.0</td>
    </tr>
    <tr>
      <th>2271</th>
      <td>2272</td>
      <td>1</td>
      <td>15</td>
      <td>1980</td>
      <td>11</td>
      <td>PF</td>
      <td>F</td>
      <td>16.0</td>
      <td>10.0</td>
    </tr>
    <tr>
      <th>2272</th>
      <td>2273</td>
      <td>1</td>
      <td>15</td>
      <td>1980</td>
      <td>18</td>
      <td>DM</td>
      <td>F</td>
      <td>34.0</td>
      <td>33.0</td>
    </tr>
    <tr>
      <th>2273</th>
      <td>2274</td>
      <td>1</td>
      <td>15</td>
      <td>1980</td>
      <td>11</td>
      <td>DM</td>
      <td>M</td>
      <td>38.0</td>
      <td>37.0</td>
    </tr>
    <tr>
      <th>2274</th>
      <td>2275</td>
      <td>1</td>
      <td>15</td>
      <td>1980</td>
      <td>8</td>
      <td>DO</td>
      <td>F</td>
      <td>33.0</td>
      <td>29.0</td>
    </tr>
    <tr>
      <th>2275</th>
      <td>2276</td>
      <td>1</td>
      <td>15</td>
      <td>1980</td>
      <td>11</td>
      <td>DS</td>
      <td>M</td>
      <td>47.0</td>
      <td>132.0</td>
    </tr>
    <tr>
      <th>2276</th>
      <td>2277</td>
      <td>1</td>
      <td>15</td>
      <td>1980</td>
      <td>8</td>
      <td>PF</td>
      <td>M</td>
      <td>15.0</td>
      <td>8.0</td>
    </tr>
    <tr>
      <th>2277</th>
      <td>2278</td>
      <td>1</td>
      <td>15</td>
      <td>1980</td>
      <td>9</td>
      <td>OT</td>
      <td>M</td>
      <td>21.0</td>
      <td>23.0</td>
    </tr>
    <tr>
      <th>2278</th>
      <td>2279</td>
      <td>1</td>
      <td>15</td>
      <td>1980</td>
      <td>11</td>
      <td>DM</td>
      <td>F</td>
      <td>36.0</td>
      <td>36.0</td>
    </tr>
    <tr>
      <th>2279</th>
      <td>2280</td>
      <td>1</td>
      <td>15</td>
      <td>1980</td>
      <td>21</td>
      <td>OT</td>
      <td>F</td>
      <td>20.0</td>
      <td>21.0</td>
    </tr>
    <tr>
      <th>2280</th>
      <td>2281</td>
      <td>1</td>
      <td>15</td>
      <td>1980</td>
      <td>11</td>
      <td>OL</td>
      <td>M</td>
      <td>20.0</td>
      <td>29.0</td>
    </tr>
    <tr>
      <th>2281</th>
      <td>2282</td>
      <td>1</td>
      <td>15</td>
      <td>1980</td>
      <td>17</td>
      <td>DM</td>
      <td>F</td>
      <td>36.0</td>
      <td>49.0</td>
    </tr>
    <tr>
      <th>2282</th>
      <td>2283</td>
      <td>1</td>
      <td>15</td>
      <td>1980</td>
      <td>11</td>
      <td>OL</td>
      <td>M</td>
      <td>21.0</td>
      <td>23.0</td>
    </tr>
    <tr>
      <th>2283</th>
      <td>2284</td>
      <td>1</td>
      <td>15</td>
      <td>1980</td>
      <td>9</td>
      <td>OL</td>
      <td>M</td>
      <td>20.0</td>
      <td>32.0</td>
    </tr>
    <tr>
      <th>2284</th>
      <td>2285</td>
      <td>1</td>
      <td>15</td>
      <td>1980</td>
      <td>10</td>
      <td>OL</td>
      <td>F</td>
      <td>20.0</td>
      <td>24.0</td>
    </tr>
    <tr>
      <th>2285</th>
      <td>2286</td>
      <td>1</td>
      <td>15</td>
      <td>1980</td>
      <td>11</td>
      <td>DM</td>
      <td>M</td>
      <td>38.0</td>
      <td>47.0</td>
    </tr>
    <tr>
      <th>2286</th>
      <td>2287</td>
      <td>1</td>
      <td>15</td>
      <td>1980</td>
      <td>21</td>
      <td>OT</td>
      <td>M</td>
      <td>19.0</td>
      <td>22.0</td>
    </tr>
    <tr>
      <th>2287</th>
      <td>2288</td>
      <td>1</td>
      <td>15</td>
      <td>1980</td>
      <td>19</td>
      <td>RM</td>
      <td>F</td>
      <td>17.0</td>
      <td>12.0</td>
    </tr>
    <tr>
      <th>2288</th>
      <td>2289</td>
      <td>1</td>
      <td>15</td>
      <td>1980</td>
      <td>20</td>
      <td>DS</td>
      <td>F</td>
      <td>52.0</td>
      <td>150.0</td>
    </tr>
    <tr>
      <th>2289</th>
      <td>2290</td>
      <td>1</td>
      <td>15</td>
      <td>1980</td>
      <td>11</td>
      <td>DM</td>
      <td>M</td>
      <td>37.0</td>
      <td>49.0</td>
    </tr>
    <tr>
      <th>2290</th>
      <td>2291</td>
      <td>1</td>
      <td>15</td>
      <td>1980</td>
      <td>9</td>
      <td>OL</td>
      <td>F</td>
      <td>21.0</td>
      <td>34.0</td>
    </tr>
    <tr>
      <th>2291</th>
      <td>2292</td>
      <td>1</td>
      <td>15</td>
      <td>1980</td>
      <td>12</td>
      <td>DM</td>
      <td>F</td>
      <td>35.0</td>
      <td>40.0</td>
    </tr>
    <tr>
      <th>2292</th>
      <td>2293</td>
      <td>1</td>
      <td>15</td>
      <td>1980</td>
      <td>18</td>
      <td>DS</td>
      <td>F</td>
      <td>51.0</td>
      <td>132.0</td>
    </tr>
    <tr>
      <th>2293</th>
      <td>2294</td>
      <td>1</td>
      <td>15</td>
      <td>1980</td>
      <td>22</td>
      <td>DM</td>
      <td>F</td>
      <td>34.0</td>
      <td>25.0</td>
    </tr>
    <tr>
      <th>2294</th>
      <td>2295</td>
      <td>1</td>
      <td>15</td>
      <td>1980</td>
      <td>9</td>
      <td>OL</td>
      <td>M</td>
      <td>21.0</td>
      <td>36.0</td>
    </tr>
    <tr>
      <th>2295</th>
      <td>2296</td>
      <td>1</td>
      <td>15</td>
      <td>1980</td>
      <td>8</td>
      <td>DO</td>
      <td>F</td>
      <td>34.0</td>
      <td>50.0</td>
    </tr>
    <tr>
      <th>2296</th>
      <td>2297</td>
      <td>1</td>
      <td>15</td>
      <td>1980</td>
      <td>11</td>
      <td>DM</td>
      <td>M</td>
      <td>37.0</td>
      <td>45.0</td>
    </tr>
    <tr>
      <th>2297</th>
      <td>2298</td>
      <td>1</td>
      <td>15</td>
      <td>1980</td>
      <td>17</td>
      <td>DM</td>
      <td>M</td>
      <td>35.0</td>
      <td>47.0</td>
    </tr>
    <tr>
      <th>2298</th>
      <td>2299</td>
      <td>1</td>
      <td>15</td>
      <td>1980</td>
      <td>9</td>
      <td>DM</td>
      <td>M</td>
      <td>38.0</td>
      <td>46.0</td>
    </tr>
    <tr>
      <th>2299</th>
      <td>2300</td>
      <td>1</td>
      <td>15</td>
      <td>1980</td>
      <td>18</td>
      <td>DM</td>
      <td>F</td>
      <td>32.0</td>
      <td>29.0</td>
    </tr>
    <tr>
      <th>...</th>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
    </tr>
    <tr>
      <th>11197</th>
      <td>11198</td>
      <td>12</td>
      <td>8</td>
      <td>1985</td>
      <td>4</td>
      <td>DS</td>
      <td>M</td>
      <td>45.0</td>
      <td>129.0</td>
    </tr>
    <tr>
      <th>11198</th>
      <td>11199</td>
      <td>12</td>
      <td>8</td>
      <td>1985</td>
      <td>8</td>
      <td>DM</td>
      <td>F</td>
      <td>38.0</td>
      <td>42.0</td>
    </tr>
    <tr>
      <th>11199</th>
      <td>11200</td>
      <td>12</td>
      <td>8</td>
      <td>1985</td>
      <td>7</td>
      <td>AB</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>11200</th>
      <td>11201</td>
      <td>12</td>
      <td>8</td>
      <td>1985</td>
      <td>5</td>
      <td>OL</td>
      <td>M</td>
      <td>21.0</td>
      <td>29.0</td>
    </tr>
    <tr>
      <th>11201</th>
      <td>11202</td>
      <td>12</td>
      <td>8</td>
      <td>1985</td>
      <td>9</td>
      <td>DM</td>
      <td>F</td>
      <td>35.0</td>
      <td>39.0</td>
    </tr>
    <tr>
      <th>11202</th>
      <td>11203</td>
      <td>12</td>
      <td>8</td>
      <td>1985</td>
      <td>7</td>
      <td>PE</td>
      <td>F</td>
      <td>17.0</td>
      <td>19.0</td>
    </tr>
    <tr>
      <th>11203</th>
      <td>11204</td>
      <td>12</td>
      <td>8</td>
      <td>1985</td>
      <td>3</td>
      <td>PP</td>
      <td>F</td>
      <td>22.0</td>
      <td>16.0</td>
    </tr>
    <tr>
      <th>11204</th>
      <td>11205</td>
      <td>12</td>
      <td>8</td>
      <td>1985</td>
      <td>5</td>
      <td>DO</td>
      <td>M</td>
      <td>37.0</td>
      <td>56.0</td>
    </tr>
    <tr>
      <th>11205</th>
      <td>11206</td>
      <td>12</td>
      <td>8</td>
      <td>1985</td>
      <td>11</td>
      <td>DM</td>
      <td>F</td>
      <td>38.0</td>
      <td>38.0</td>
    </tr>
    <tr>
      <th>11206</th>
      <td>11207</td>
      <td>12</td>
      <td>8</td>
      <td>1985</td>
      <td>2</td>
      <td>PE</td>
      <td>M</td>
      <td>18.0</td>
      <td>19.0</td>
    </tr>
    <tr>
      <th>11207</th>
      <td>11208</td>
      <td>12</td>
      <td>8</td>
      <td>1985</td>
      <td>8</td>
      <td>DS</td>
      <td>F</td>
      <td>50.0</td>
      <td>120.0</td>
    </tr>
    <tr>
      <th>11208</th>
      <td>11209</td>
      <td>12</td>
      <td>8</td>
      <td>1985</td>
      <td>2</td>
      <td>DO</td>
      <td>F</td>
      <td>37.0</td>
      <td>52.0</td>
    </tr>
    <tr>
      <th>11209</th>
      <td>11210</td>
      <td>12</td>
      <td>8</td>
      <td>1985</td>
      <td>2</td>
      <td>DM</td>
      <td>F</td>
      <td>35.0</td>
      <td>40.0</td>
    </tr>
    <tr>
      <th>11210</th>
      <td>11211</td>
      <td>12</td>
      <td>8</td>
      <td>1985</td>
      <td>13</td>
      <td>DM</td>
      <td>M</td>
      <td>37.0</td>
      <td>45.0</td>
    </tr>
    <tr>
      <th>11211</th>
      <td>11212</td>
      <td>12</td>
      <td>8</td>
      <td>1985</td>
      <td>4</td>
      <td>DS</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>121.0</td>
    </tr>
    <tr>
      <th>11212</th>
      <td>11213</td>
      <td>12</td>
      <td>8</td>
      <td>1985</td>
      <td>13</td>
      <td>AH</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>11213</th>
      <td>11214</td>
      <td>12</td>
      <td>8</td>
      <td>1985</td>
      <td>1</td>
      <td>DM</td>
      <td>F</td>
      <td>37.0</td>
      <td>44.0</td>
    </tr>
    <tr>
      <th>11214</th>
      <td>11215</td>
      <td>12</td>
      <td>8</td>
      <td>1985</td>
      <td>2</td>
      <td>NL</td>
      <td>F</td>
      <td>32.0</td>
      <td>160.0</td>
    </tr>
    <tr>
      <th>11215</th>
      <td>11216</td>
      <td>12</td>
      <td>8</td>
      <td>1985</td>
      <td>3</td>
      <td>RM</td>
      <td>M</td>
      <td>17.0</td>
      <td>9.0</td>
    </tr>
    <tr>
      <th>11216</th>
      <td>11217</td>
      <td>12</td>
      <td>8</td>
      <td>1985</td>
      <td>4</td>
      <td>OL</td>
      <td>M</td>
      <td>24.0</td>
      <td>34.0</td>
    </tr>
    <tr>
      <th>11217</th>
      <td>11218</td>
      <td>12</td>
      <td>8</td>
      <td>1985</td>
      <td>9</td>
      <td>DM</td>
      <td>F</td>
      <td>36.0</td>
      <td>39.0</td>
    </tr>
    <tr>
      <th>11218</th>
      <td>11219</td>
      <td>12</td>
      <td>8</td>
      <td>1985</td>
      <td>8</td>
      <td>DM</td>
      <td>F</td>
      <td>38.0</td>
      <td>41.0</td>
    </tr>
    <tr>
      <th>11219</th>
      <td>11220</td>
      <td>12</td>
      <td>8</td>
      <td>1985</td>
      <td>5</td>
      <td>DO</td>
      <td>F</td>
      <td>37.0</td>
      <td>56.0</td>
    </tr>
    <tr>
      <th>11220</th>
      <td>11221</td>
      <td>12</td>
      <td>8</td>
      <td>1985</td>
      <td>13</td>
      <td>AH</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>11221</th>
      <td>11222</td>
      <td>12</td>
      <td>8</td>
      <td>1985</td>
      <td>7</td>
      <td>AB</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>11222</th>
      <td>11223</td>
      <td>12</td>
      <td>8</td>
      <td>1985</td>
      <td>4</td>
      <td>DM</td>
      <td>M</td>
      <td>36.0</td>
      <td>40.0</td>
    </tr>
    <tr>
      <th>11223</th>
      <td>11224</td>
      <td>12</td>
      <td>8</td>
      <td>1985</td>
      <td>11</td>
      <td>DM</td>
      <td>M</td>
      <td>37.0</td>
      <td>49.0</td>
    </tr>
    <tr>
      <th>11224</th>
      <td>11225</td>
      <td>12</td>
      <td>8</td>
      <td>1985</td>
      <td>7</td>
      <td>PE</td>
      <td>M</td>
      <td>20.0</td>
      <td>18.0</td>
    </tr>
    <tr>
      <th>11225</th>
      <td>11226</td>
      <td>12</td>
      <td>8</td>
      <td>1985</td>
      <td>1</td>
      <td>DM</td>
      <td>M</td>
      <td>38.0</td>
      <td>47.0</td>
    </tr>
    <tr>
      <th>11226</th>
      <td>11227</td>
      <td>12</td>
      <td>8</td>
      <td>1985</td>
      <td>15</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
  </tbody>
</table>
<p>8957 rows × 9 columns</p>
</div>








### Python Syntax Cheat Sheet

Use can use the syntax below when querying data by criteria from a DataFrame.
Experiment with selecting various subsets of the "surveys" data.

* Equals: `==`
* Not equals: `!=`
* Greater than, less than: `>` or `<`
* Greater than or equal to `>=`
* Less than or equal to `<=`








## Challenge - Queries

1. Select a subset of rows in the `surveys_df` DataFrame that contain data from
   the year 1999 and that contain weight values less than or equal to 8. How
   many rows did you end up with? What did your neighbor get?

2. **(Extra)** You can use the `isin` command in Python to query a DataFrame based upon a
   list of values as follows:

```python
surveys_df[surveys_df['species_id'].isin([listGoesHere])]
```







Use the `isin` function to find all plots that contain particular species
in the "surveys" DataFrame. How many records contain these values?

3. **(Extra)** Experiment with other queries. Create a query that finds all rows with a
   weight value > or equal to 0.

4. **(Extra)** The `~` symbol in Python can be used to return the OPPOSITE of the
   selection that you specify in Python. It is equivalent to **is not in**.
   Write a query that selects all rows with sex NOT equal to 'M' or 'F' in
   the "surveys" data.



# Using masks to identify a specific condition

A **mask** can be useful to locate where a particular subset of values exist or
don't exist - for example,  NaN, or "Not a Number" values. To understand masks,
we also need to understand `BOOLEAN` objects in Python.

Boolean values include `True` or `False`. For example,








```python
# Set x to 5
x = 5

# What does the code below return?
x > 5

# How about this?
x == 5
```




<pre class="output">
<div style="text-align: right; margin: -1em; padding: 0;"><span style="font-size: 0.5em; color: grey">output</span></div>
<code class="text">
True
</code>
</pre>







## Missing Values

Let's try this out. Let's identify all locations in the survey data that have
null (missing or NaN) data values. We can use the `isnull` method to do this.
The `isnull` method will compare each cell with a null value. If an element
has a null value, it will be assigned a value of  `True` in the output object.








```python
pd.isnull(surveys_df).head()
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>record_id</th>
      <th>month</th>
      <th>day</th>
      <th>year</th>
      <th>site_id</th>
      <th>species_id</th>
      <th>sex</th>
      <th>hindfoot_length</th>
      <th>weight</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>True</td>
    </tr>
    <tr>
      <th>1</th>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>True</td>
    </tr>
    <tr>
      <th>2</th>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>True</td>
    </tr>
    <tr>
      <th>3</th>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>True</td>
    </tr>
    <tr>
      <th>4</th>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>True</td>
    </tr>
  </tbody>
</table>
</div>








A snippet of the output is below:







```
record_id  month    day   year plot_id species_id    sex  hindfoot_length weight
0         False  False  False  False   False      False  False   False      True
1         False  False  False  False   False      False  False   False      True
2         False  False  False  False   False      False  False   False      True
3         False  False  False  False   False      False  False   False      True
4         False  False  False  False   False      False  False   False      True

[35549 rows x 9 columns]
```






To select the rows where there are null values, we can use
the mask as an index to subset our data as follows:








```python
# To select just the rows with NaN values, we can use the 'any()' method
surveys_df[pd.isnull(surveys_df).any(axis=1)]
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>record_id</th>
      <th>month</th>
      <th>day</th>
      <th>year</th>
      <th>site_id</th>
      <th>species_id</th>
      <th>sex</th>
      <th>hindfoot_length</th>
      <th>weight</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>1</td>
      <td>7</td>
      <td>16</td>
      <td>1977</td>
      <td>2</td>
      <td>NL</td>
      <td>M</td>
      <td>32.0</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>1</th>
      <td>2</td>
      <td>7</td>
      <td>16</td>
      <td>1977</td>
      <td>3</td>
      <td>NL</td>
      <td>M</td>
      <td>33.0</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>2</th>
      <td>3</td>
      <td>7</td>
      <td>16</td>
      <td>1977</td>
      <td>2</td>
      <td>DM</td>
      <td>F</td>
      <td>37.0</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>3</th>
      <td>4</td>
      <td>7</td>
      <td>16</td>
      <td>1977</td>
      <td>7</td>
      <td>DM</td>
      <td>M</td>
      <td>36.0</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>4</th>
      <td>5</td>
      <td>7</td>
      <td>16</td>
      <td>1977</td>
      <td>3</td>
      <td>DM</td>
      <td>M</td>
      <td>35.0</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>5</th>
      <td>6</td>
      <td>7</td>
      <td>16</td>
      <td>1977</td>
      <td>1</td>
      <td>PF</td>
      <td>M</td>
      <td>14.0</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>6</th>
      <td>7</td>
      <td>7</td>
      <td>16</td>
      <td>1977</td>
      <td>2</td>
      <td>PE</td>
      <td>F</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>7</th>
      <td>8</td>
      <td>7</td>
      <td>16</td>
      <td>1977</td>
      <td>1</td>
      <td>DM</td>
      <td>M</td>
      <td>37.0</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>8</th>
      <td>9</td>
      <td>7</td>
      <td>16</td>
      <td>1977</td>
      <td>1</td>
      <td>DM</td>
      <td>F</td>
      <td>34.0</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>9</th>
      <td>10</td>
      <td>7</td>
      <td>16</td>
      <td>1977</td>
      <td>6</td>
      <td>PF</td>
      <td>F</td>
      <td>20.0</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>10</th>
      <td>11</td>
      <td>7</td>
      <td>16</td>
      <td>1977</td>
      <td>5</td>
      <td>DS</td>
      <td>F</td>
      <td>53.0</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>11</th>
      <td>12</td>
      <td>7</td>
      <td>16</td>
      <td>1977</td>
      <td>7</td>
      <td>DM</td>
      <td>M</td>
      <td>38.0</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>12</th>
      <td>13</td>
      <td>7</td>
      <td>16</td>
      <td>1977</td>
      <td>3</td>
      <td>DM</td>
      <td>M</td>
      <td>35.0</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>13</th>
      <td>14</td>
      <td>7</td>
      <td>16</td>
      <td>1977</td>
      <td>8</td>
      <td>DM</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>14</th>
      <td>15</td>
      <td>7</td>
      <td>16</td>
      <td>1977</td>
      <td>6</td>
      <td>DM</td>
      <td>F</td>
      <td>36.0</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>15</th>
      <td>16</td>
      <td>7</td>
      <td>16</td>
      <td>1977</td>
      <td>4</td>
      <td>DM</td>
      <td>F</td>
      <td>36.0</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>16</th>
      <td>17</td>
      <td>7</td>
      <td>16</td>
      <td>1977</td>
      <td>3</td>
      <td>DS</td>
      <td>F</td>
      <td>48.0</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>17</th>
      <td>18</td>
      <td>7</td>
      <td>16</td>
      <td>1977</td>
      <td>2</td>
      <td>PP</td>
      <td>M</td>
      <td>22.0</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>18</th>
      <td>19</td>
      <td>7</td>
      <td>16</td>
      <td>1977</td>
      <td>4</td>
      <td>PF</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>19</th>
      <td>20</td>
      <td>7</td>
      <td>17</td>
      <td>1977</td>
      <td>11</td>
      <td>DS</td>
      <td>F</td>
      <td>48.0</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>20</th>
      <td>21</td>
      <td>7</td>
      <td>17</td>
      <td>1977</td>
      <td>14</td>
      <td>DM</td>
      <td>F</td>
      <td>34.0</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>21</th>
      <td>22</td>
      <td>7</td>
      <td>17</td>
      <td>1977</td>
      <td>15</td>
      <td>NL</td>
      <td>F</td>
      <td>31.0</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>22</th>
      <td>23</td>
      <td>7</td>
      <td>17</td>
      <td>1977</td>
      <td>13</td>
      <td>DM</td>
      <td>M</td>
      <td>36.0</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>23</th>
      <td>24</td>
      <td>7</td>
      <td>17</td>
      <td>1977</td>
      <td>13</td>
      <td>SH</td>
      <td>M</td>
      <td>21.0</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>24</th>
      <td>25</td>
      <td>7</td>
      <td>17</td>
      <td>1977</td>
      <td>9</td>
      <td>DM</td>
      <td>M</td>
      <td>35.0</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>25</th>
      <td>26</td>
      <td>7</td>
      <td>17</td>
      <td>1977</td>
      <td>15</td>
      <td>DM</td>
      <td>M</td>
      <td>31.0</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>26</th>
      <td>27</td>
      <td>7</td>
      <td>17</td>
      <td>1977</td>
      <td>15</td>
      <td>DM</td>
      <td>M</td>
      <td>36.0</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>27</th>
      <td>28</td>
      <td>7</td>
      <td>17</td>
      <td>1977</td>
      <td>11</td>
      <td>DM</td>
      <td>M</td>
      <td>38.0</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>28</th>
      <td>29</td>
      <td>7</td>
      <td>17</td>
      <td>1977</td>
      <td>11</td>
      <td>PP</td>
      <td>M</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>29</th>
      <td>30</td>
      <td>7</td>
      <td>17</td>
      <td>1977</td>
      <td>10</td>
      <td>DS</td>
      <td>F</td>
      <td>52.0</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>...</th>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
    </tr>
    <tr>
      <th>35187</th>
      <td>35188</td>
      <td>11</td>
      <td>10</td>
      <td>2002</td>
      <td>10</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>35256</th>
      <td>35257</td>
      <td>12</td>
      <td>7</td>
      <td>2002</td>
      <td>22</td>
      <td>PB</td>
      <td>M</td>
      <td>26.0</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>35259</th>
      <td>35260</td>
      <td>12</td>
      <td>7</td>
      <td>2002</td>
      <td>21</td>
      <td>PB</td>
      <td>F</td>
      <td>24.0</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>35277</th>
      <td>35278</td>
      <td>12</td>
      <td>7</td>
      <td>2002</td>
      <td>20</td>
      <td>AH</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>35279</th>
      <td>35280</td>
      <td>12</td>
      <td>7</td>
      <td>2002</td>
      <td>16</td>
      <td>PB</td>
      <td>M</td>
      <td>28.0</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>35322</th>
      <td>35323</td>
      <td>12</td>
      <td>8</td>
      <td>2002</td>
      <td>11</td>
      <td>AH</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>35328</th>
      <td>35329</td>
      <td>12</td>
      <td>8</td>
      <td>2002</td>
      <td>11</td>
      <td>PP</td>
      <td>M</td>
      <td>NaN</td>
      <td>16.0</td>
    </tr>
    <tr>
      <th>35370</th>
      <td>35371</td>
      <td>12</td>
      <td>8</td>
      <td>2002</td>
      <td>14</td>
      <td>AH</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>35378</th>
      <td>35379</td>
      <td>12</td>
      <td>8</td>
      <td>2002</td>
      <td>15</td>
      <td>PB</td>
      <td>F</td>
      <td>26.0</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>35384</th>
      <td>35385</td>
      <td>12</td>
      <td>8</td>
      <td>2002</td>
      <td>10</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>35387</th>
      <td>35388</td>
      <td>12</td>
      <td>29</td>
      <td>2002</td>
      <td>1</td>
      <td>DO</td>
      <td>M</td>
      <td>35.0</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>35403</th>
      <td>35404</td>
      <td>12</td>
      <td>29</td>
      <td>2002</td>
      <td>2</td>
      <td>NL</td>
      <td>F</td>
      <td>30.0</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>35448</th>
      <td>35449</td>
      <td>12</td>
      <td>29</td>
      <td>2002</td>
      <td>20</td>
      <td>OT</td>
      <td>F</td>
      <td>20.0</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>35452</th>
      <td>35453</td>
      <td>12</td>
      <td>29</td>
      <td>2002</td>
      <td>20</td>
      <td>PB</td>
      <td>M</td>
      <td>28.0</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>35457</th>
      <td>35458</td>
      <td>12</td>
      <td>29</td>
      <td>2002</td>
      <td>20</td>
      <td>AH</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>35477</th>
      <td>35478</td>
      <td>12</td>
      <td>29</td>
      <td>2002</td>
      <td>24</td>
      <td>AH</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>35485</th>
      <td>35486</td>
      <td>12</td>
      <td>29</td>
      <td>2002</td>
      <td>16</td>
      <td>DO</td>
      <td>M</td>
      <td>37.0</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>35495</th>
      <td>35496</td>
      <td>12</td>
      <td>31</td>
      <td>2002</td>
      <td>4</td>
      <td>PB</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>35510</th>
      <td>35511</td>
      <td>12</td>
      <td>31</td>
      <td>2002</td>
      <td>11</td>
      <td>DX</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>35511</th>
      <td>35512</td>
      <td>12</td>
      <td>31</td>
      <td>2002</td>
      <td>11</td>
      <td>US</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>35512</th>
      <td>35513</td>
      <td>12</td>
      <td>31</td>
      <td>2002</td>
      <td>11</td>
      <td>US</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>35514</th>
      <td>35515</td>
      <td>12</td>
      <td>31</td>
      <td>2002</td>
      <td>11</td>
      <td>SF</td>
      <td>F</td>
      <td>27.0</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>35519</th>
      <td>35520</td>
      <td>12</td>
      <td>31</td>
      <td>2002</td>
      <td>9</td>
      <td>SF</td>
      <td>NaN</td>
      <td>24.0</td>
      <td>36.0</td>
    </tr>
    <tr>
      <th>35527</th>
      <td>35528</td>
      <td>12</td>
      <td>31</td>
      <td>2002</td>
      <td>13</td>
      <td>US</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>35529</th>
      <td>35530</td>
      <td>12</td>
      <td>31</td>
      <td>2002</td>
      <td>13</td>
      <td>OT</td>
      <td>F</td>
      <td>20.0</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>35530</th>
      <td>35531</td>
      <td>12</td>
      <td>31</td>
      <td>2002</td>
      <td>13</td>
      <td>PB</td>
      <td>F</td>
      <td>27.0</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>35543</th>
      <td>35544</td>
      <td>12</td>
      <td>31</td>
      <td>2002</td>
      <td>15</td>
      <td>US</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>35544</th>
      <td>35545</td>
      <td>12</td>
      <td>31</td>
      <td>2002</td>
      <td>15</td>
      <td>AH</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>35545</th>
      <td>35546</td>
      <td>12</td>
      <td>31</td>
      <td>2002</td>
      <td>15</td>
      <td>AH</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>35548</th>
      <td>35549</td>
      <td>12</td>
      <td>31</td>
      <td>2002</td>
      <td>5</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
  </tbody>
</table>
<p>4873 rows × 9 columns</p>
</div>







**(axis=1)** is a numpy convention to specify columns. 

Note that the `weight` column of our DataFrame contains many `null` or `NaN`
values. Next, we will explore ways of dealing with this.

If we look at the `weight` column in the surveys
data we notice that there are NaN (**N**ot **a** **N**umber) values. *NaN* values are undefined
values that cannot be represented mathematically. Pandas, for example, will read
an empty cell in a CSV or Excel sheet as a NaN. NaNs have some desirable properties: if we
were to average the `weight` column without replacing our NaNs, Python would know to skip
over those cells.








```python
surveys_df['weight'].mean()
42.672428212991356
```




<pre class="output">
<div style="text-align: right; margin: -1em; padding: 0;"><span style="font-size: 0.5em; color: grey">output</span></div>
<code class="text">
42.672428212991356
</code>
</pre>







Dealing with missing data values is always a challenge. It's sometimes hard to
know why values are missing - was it because of a data entry error? Or data that
someone was unable to collect? Should the value be 0? We need to know how
missing values are represented in the dataset in order to make good decisions.
If we're lucky, we have some metadata that will tell us more about how null
values were handled.

For instance, in some disciplines, like Remote Sensing, missing data values are
often defined as -9999. Having a bunch of -9999 values in your data could really
alter numeric calculations. Often in spreadsheets, cells are left empty where no
data are available. Pandas will, by default, replace those missing values with
NaN. However it is good practice to get in the habit of intentionally marking
cells that have no data, with a no data value! That way there are no questions
in the future when you (or someone else) explores your data.

### Where Are the NaN's?

Let's explore the NaN values in our data a bit further. Using the tools we
learned in lesson 02, we can figure out how many rows contain NaN values for
weight. We can also create a new subset from our data that only contains rows
with weight values > 0 (i.e., select meaningful weight values):








```python
len(surveys_df[pd.isnull(surveys_df.weight)])
# How many rows have weight values?
len(surveys_df[surveys_df.weight> 0])
```




<pre class="output">
<div style="text-align: right; margin: -1em; padding: 0;"><span style="font-size: 0.5em; color: grey">output</span></div>
<code class="text">
32283
</code>
</pre>








We can replace all NaN values with zeroes using the `.fillna()` method (after
making a copy of the data so we don't lose our work):








```python
# Creat a new DataFrame using copy
df1 = surveys_df.copy()

# Fill all NaN values with 0
df1['weight'] = df1['weight'].fillna(0)
```






However NaN and 0 yield different analysis results. The mean value when NaN
values are replaced with 0 is different from when NaN values are simply thrown
out or ignored.








```python
df1['weight'].mean()
38.751976145601844
```




<pre class="output">
<div style="text-align: right; margin: -1em; padding: 0;"><span style="font-size: 0.5em; color: grey">output</span></div>
<code class="text">
38.751976145601844
</code>
</pre>








### _Extra Information_
We can fill NaN values with any value that we chose. The code below fills all
NaN values with a mean for all weight values.








```python
df1['weight'] = surveys_df['weight'].fillna(surveys_df['weight'].mean())
```





## Writing Out Data to CSV

We've learned about using manipulating data to get desired outputs. But we've also discussed
keeping data that has been manipulated separate from our raw data. Something we might be interested
in doing is working with only the columns that have full data. First, let's reload the data so
we're not mixing up all of our previous manipulations.








```python
surveys_df = pd.read_csv("data/surveys.csv")
```





Next, let's drop all the rows that contain missing values. We will use the command `dropna`.
By default, dropna removes columns that contain missing data for even just one row.








```python
df_na = surveys_df.dropna()
```






If you now type ```df_na```, you should observe that the resulting DataFrame has 30676 rows
and 9 columns, much smaller than the 35549 row original.

We can now use the `to_csv` command to do export a DataFrame in CSV format. Note that the code
below will by default save the data into the current working directory. We can
save it to a different folder by adding the foldername and a slash before the filename:
`df1.to_csv('foldername/out.csv')`. We use 'index=False' so that
pandas doesn't include the index number for each line.








```python
# Write DataFrame to CSV
df_na.to_csv('data_output/surveys_complete.csv', index=False)
```





## Recap

What we've learned:

+ How to subset and index the dataframe
+ What NaN values are, how they might be represented, and what this means for your work
+ How to replace NaN values, if desired
+ How to use `to_csv` to write manipulated data to a file.







## _Extra_
We can run `isnull` on a particular column too. What does the code below do?








```python
# What does this do?
empty_weights = surveys_df[pd.isnull(surveys_df['weight'])]['weight']
print(empty_weights)
```

<pre class="output">
<div class="output_label">output</div>
<code class="text">
0       NaN
1       NaN
2       NaN
3       NaN
4       NaN
5       NaN
6       NaN
7       NaN
8       NaN
9       NaN
10      NaN
11      NaN
12      NaN
13      NaN
14      NaN
15      NaN
16      NaN
17      NaN
18      NaN
19      NaN
20      NaN
21      NaN
22      NaN
23      NaN
24      NaN
25      NaN
26      NaN
27      NaN
28      NaN
29      NaN
         ..
35138   NaN
35168   NaN
35187   NaN
35256   NaN
35259   NaN
35277   NaN
35279   NaN
35322   NaN
35370   NaN
35378   NaN
35384   NaN
35387   NaN
35403   NaN
35448   NaN
35452   NaN
35457   NaN
35477   NaN
35485   NaN
35495   NaN
35510   NaN
35511   NaN
35512   NaN
35514   NaN
35527   NaN
35529   NaN
35530   NaN
35543   NaN
35544   NaN
35545   NaN
35548   NaN
Name: weight, Length: 3266, dtype: float64

</code>
</pre>






Let's take a minute to look at the statement above. We are using the Boolean
object `pd.isnull(surveys_df['weight'])` as an index to `surveys_df`. We are
asking Python to select rows that have a `NaN` value of weight.








## _Extra Challenges - Putting it all together_

 1. Create a new DataFrame that only contains observations with sex values that
   are **not** female or male. Assign each sex value in the new DataFrame to a
   new value of 'x'. Determine the number of null values in the subset.
   
 2. Create a new DataFrame that contains only observations that are of sex male
   or female and where weight values are greater than 0. Create a stacked bar
   plot of average weight by plot with male vs female values stacked for each
   plot.
  3. Count the number of missing values per column. Hint: The method .count() gives you the number of non-NA observations per column. 




