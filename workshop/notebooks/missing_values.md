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

## Handling Missing data

*Estimated teaching time:* 20 min

*Estimated challenge time:* 0 min


## Module information

*Key questions:*

  - "What is missing data?"
  - "How  can I analyse my data with missing values using Pandas?"
    
*Learning objectives:*

  - Describe what missing values mean.
  - How to access missing values in dataset.
  - What NaN values are, how they might be represented, and what this means for your work
  - How to replace NaN values, if desired
  - How to use `to_csv` to write manipulated data to a file.
---


+++

# Handling Missing Data

Most of the times real-world data is rarely clean and homogeneous. In many cases, dataset of interest will have some amount of data missing. To make matters even more complicated, different data sources may indicate missing data in different ways.

In this module, we will discuss some general considerations for missing data, discuss how Pandas chooses to represent it, and demonstrate some built-in Pandas tools for handling missing data in Python. We refer the missing data as null, NaN, or NA values in general.

+++

Before we start, lets make sure the Pandas and matplotlib packages are **installed**. 

```{code-cell} ipython3
!pip install pandas matplotlib
```

```{code-cell} ipython3
---
jupyter:
  outputs_hidden: true
---
# Now import pandas into your notebook as pd
import pandas as pd
```

Now again import `surveys.csv` dataset into our notebook as we did in previous lesson.

```{code-cell} ipython3
surveys_df = pd.read_csv("surveys.csv")
```

### Using masks to identify a specific condition

A **mask** can be useful to locate where a particular subset of values exist or
don't exist - for example,  NaN, or "Not a Number" values. To understand masks,
we also need to understand `BOOLEAN` objects in Python.

Boolean values include `True` or `False`. For example,

```{code-cell} ipython3
---
jupyter:
  outputs_hidden: true
---
# set value of x to be 5
x = 5
```

```{code-cell} ipython3
x > 5
```

```{code-cell} ipython3
x == 5
```

### Finding Missing Values

Let's identify all locations in the survey data that have
null (missing or NaN) data values. We can use the `isnull` method to do this.
The `isnull` method will compare each cell with a null value. If an element
has a null value, it will be assigned a value of  `True` in the output object.

```{code-cell} ipython3
pd.isnull(surveys_df).head()
```

### How to select rows with missing data

To select the rows where there are null values, we can use
the mask as an index to subset our data as follows:


```{code-cell} ipython3
# To select only the rows with NaN values, we can use the 'any()' method
surveys_df[pd.isnull(surveys_df).any(axis=1)]
```

### Explaination

Notice that we have `4873` observations/rows that contain one or more missing values. 
Thats roughly `14%` of data contains missing values.

We have used `[]` convension to select subset of data. 

More information about slicing and indexing can be found out [here](indexing.md).

**(axis=1)** is a numpy convention to specify columns. 

Note that the `weight` column of our DataFrame contains many `null` or `NaN`
values. Next, we will explore ways of dealing with this.

If we look at the `weight` column in the surveys
data we notice that there are NaN (**N**ot **a** **N**umber) values. *NaN* values are undefined
values that cannot be represented mathematically. Pandas, for example, will read
an empty cell in a CSV or Excel sheet as a NaN. NaNs have some desirable properties: if we
were to average the `weight` column without replacing our NaNs, Python would know to skip
over those cells.


+++

### Dealing with missing values.

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


```{code-cell} ipython3
## How many missing values are there in weight column?
len(surveys_df[pd.isnull(surveys_df.weight)])
```

```{code-cell} ipython3
# How many rows have weight values?
len(surveys_df[surveys_df.weight> 0])
```

We can replace all NaN values with zeroes using the `.fillna()` method (after
making a copy of the data so we don't lose our work):

```{code-cell} ipython3
---
jupyter:
  outputs_hidden: true
---
# Creat a new DataFrame using copy
df1 = surveys_df.copy()

# Fill all NaN values with 0
df1['weight'] = df1['weight'].fillna(0)
```


However NaN and 0 yield different analysis results. The mean value when NaN
values are replaced with 0 is different from when NaN values are simply thrown
out or ignored.

```{code-cell} ipython3
surveys_df['weight'].mean()
```

```{code-cell} ipython3
df1['weight'].mean()
```

### _Extra Information_
We can fill NaN values with any value that we chose. The code below fills all
NaN values with a mean for all weight values.

```{code-cell} ipython3
---
jupyter:
  outputs_hidden: true
---
df1['weight'] = surveys_df['weight'].fillna(surveys_df['weight'].mean())
```

```{code-cell} ipython3
df1['weight'].mean()
```

## Writing Out Data to CSV

We've learned about using manipulating data to get desired outputs. But we've also discussed
keeping data that has been manipulated separate from our raw data. Something we might be interested
in doing is working with only the columns that have full data. First, let's reload the data so
we're not mixing up all of our previous manipulations.

```{code-cell} ipython3
---
jupyter:
  outputs_hidden: true
---
df_na = surveys_df.dropna()
```

If you now type ```df_na```, you should observe that the resulting DataFrame has `30676` rows
and 9 columns, much smaller than the `35549` row original.

We can now use the `to_csv` command to do export a DataFrame in CSV format. Note that the code
below will by default save the data into the current working directory. We can
save it to a different folder by adding the foldername and a slash before the filename:
`df1.to_csv('foldername/out.csv')`. 
We use 'index=False' so that
pandas doesn't include the index number for each line.


```{code-cell} ipython3
---
jupyter:
  outputs_hidden: true
---
# Write DataFrame to CSV
df_na.to_csv('output/surveys_complete.csv', index=False)
```

### Recap

What we've learned:

+ What NaN values are, how they might be represented, and what this means for your work
+ How to replace NaN values, if desired
+ How to use `to_csv` to write manipulated data to a file.


+++

## _Extra_
We can run `isnull` on a particular column too. What does the code below do?

```{code-cell} ipython3
# What does this do?
empty_weights = surveys_df[pd.isnull(surveys_df['weight'])]['weight']
print(empty_weights)
```

Let's take a minute to look at the statement above. We are using the Boolean
object `pd.isnull(surveys_df['weight'])` as an index to `surveys_df`. We are
asking Python to select rows that have a `NaN` value of weight.
