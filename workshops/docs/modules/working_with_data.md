

<style>
.output_label {
    text-align: right;
    margin: -1em;
    padding: 0;
    font-size: 0.5em;
    color: grey
}
</style>


# Data Analysis in Python

*Estimated teaching time:* 30 min

*Estimated challenge time:* 30 min

*Key questions:*

  - "How can I import data in Python ?"
  - "What is Pandas ?"
  - "Why should I use Pandas to work with data ?"
    
*Learning objectives:*

  - "Navigate the workshop directory and download a dataset."
  - "Explain what a library is and what libraries are used for."
  - "Describe what the Python Data Analysis Library (Pandas) is."
  - "Load the Python Data Analysis Library (Pandas)."
  - "Use `read_csv` to read tabular data into Python."
  - "Describe what a DataFrame is in Python."
  - "Access and summarize data stored in a DataFrame."
  - "Define indexing as it relates to data structures."
  - "Perform basic mathematical operations and summary statistics on data in a Pandas DataFrame."
  - "Create simple plots."
---





# Working With Pandas DataFrames

We can automate the process of performing data manipulations in Python. It's efficient to spend time
building the code to perform these tasks because once it's built, we can use it
over and over on different datasets that use a similar format. This makes our
methods easily reproducible. We can also easily share our code with colleagues
and they can replicate the same analysis.

### The Dataset

For this lesson, we will be using the Portal Teaching data, a subset of the data
from Ernst et al
[Long-term monitoring and experimental manipulation of a Chihuahuan Desert ecosystem near Portal, Arizona, USA](http://www.esapubs.org/archive/ecol/E090/118/default.htm)

We will be using this dataset, which is stored under your login/account under the **Files** tab.

We are studying the species and weight of animals caught in plots in our study
area. The dataset is stored as a `.csv` file: each row holds information for a
single animal, and the columns represent:

| Column           | Description                        |
|------------------|------------------------------------|
| record_id        | Unique id for the observation      |
| month            | month of observation               |
| day              | day of observation                 |
| year             | year of observation                |
| plot_id          | ID of a particular plot            |
| species_id       | 2-letter code                      |
| sex              | sex of animal ("M", "F")           |
| hindfoot_length  | length of the hindfoot in mm       |
| weight           | weight of the animal in grams      |


The first few rows of our first file look like this:

```
record_id,month,day,year,plot_id,species_id,sex,hindfoot_length,weight
1,7,16,1977,2,NL,M,32,
2,7,16,1977,3,NL,M,33,
3,7,16,1977,2,DM,F,37,
4,7,16,1977,7,DM,M,36,
5,7,16,1977,3,DM,M,35,
6,7,16,1977,1,PF,M,14,
7,7,16,1977,2,PE,F,,
8,7,16,1977,1,DM,M,37,
9,7,16,1977,1,DM,F,34,
```

---





## About Libraries
A library in Python contains a set of tools (called functions) that perform
tasks on our data. Importing a library is like getting a piece of lab equipment
out of a storage locker and setting it up on the bench for use in a project.
Once a library is set up, it can be used or called to perform many tasks.







## Pandas in Python
One of the best options for working with tabular data in Python is to use the
[Python Data Analysis Library](http://pandas.pydata.org/) (a.k.a. Pandas). The
Pandas library provides data structures, produces high quality plots with
[matplotlib](http://matplotlib.org/) and integrates nicely with other libraries
that use [NumPy](http://www.numpy.org/) (which is another Python library) arrays.

Python doesn't load all of the libraries available to it by default. We have to
add an `import` statement to our code in order to use library functions. To import
a library, we use the syntax `import libraryName`. If we want to give the
library a nickname to shorten the command, we can add `as nickNameHere`.  An
example of importing the pandas library using the common nickname `pd` is below.









```python
import pandas as pd

```






Each time we call a function that's in a library, we use the syntax
`LibraryName.FunctionName`. Adding the library name with a `.` before the
function name tells Python where to find the function. In the example above, we
have imported Pandas as `pd`. This means we don't have to type out `pandas` each
time we call a Pandas function.


# Reading CSV Data Using Pandas

We will begin by locating and reading our survey data which are in CSV format. CSV stands for Comma-Separated Values and is a common way store formatted data. Other symbols my also be used, so you might see tab-separated, colon-separated or space separated files. It is quite easy to replace one separator with another, to match your application. The first line in the file often has headers to explain what is in each column. CSV (and other separators) make it easy to share data, and can be imported and exported from many applications, including Microsoft Excel. For mo

We can use Pandas' `read_csv` function to pull the file directly into a
[DataFrame](http://pandas.pydata.org/pandas-docs/stable/dsintro.html#dataframe).







## So What's a DataFrame?

A DataFrame is a 2-dimensional data structure that can store data of different
types (including characters, integers, floating point values, factors and more)
in columns. It is similar to a spreadsheet or an SQL table or the `data.frame` in
R. A DataFrame always has an index (0-based). An index refers to the position of
an element in the data structure.








```python
# Note that pd.read_csv is used because we imported pandas as pd
pd.read_csv("data/surveys.csv")

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
      <th>35520</th>
      <td>35521</td>
      <td>12</td>
      <td>31</td>
      <td>2002</td>
      <td>9</td>
      <td>DM</td>
      <td>M</td>
      <td>37.0</td>
      <td>48.0</td>
    </tr>
    <tr>
      <th>35521</th>
      <td>35522</td>
      <td>12</td>
      <td>31</td>
      <td>2002</td>
      <td>9</td>
      <td>DM</td>
      <td>F</td>
      <td>35.0</td>
      <td>45.0</td>
    </tr>
    <tr>
      <th>35522</th>
      <td>35523</td>
      <td>12</td>
      <td>31</td>
      <td>2002</td>
      <td>9</td>
      <td>DM</td>
      <td>F</td>
      <td>36.0</td>
      <td>44.0</td>
    </tr>
    <tr>
      <th>35523</th>
      <td>35524</td>
      <td>12</td>
      <td>31</td>
      <td>2002</td>
      <td>9</td>
      <td>PB</td>
      <td>F</td>
      <td>25.0</td>
      <td>27.0</td>
    </tr>
    <tr>
      <th>35524</th>
      <td>35525</td>
      <td>12</td>
      <td>31</td>
      <td>2002</td>
      <td>9</td>
      <td>OL</td>
      <td>M</td>
      <td>21.0</td>
      <td>26.0</td>
    </tr>
    <tr>
      <th>35525</th>
      <td>35526</td>
      <td>12</td>
      <td>31</td>
      <td>2002</td>
      <td>8</td>
      <td>OT</td>
      <td>F</td>
      <td>20.0</td>
      <td>24.0</td>
    </tr>
    <tr>
      <th>35526</th>
      <td>35527</td>
      <td>12</td>
      <td>31</td>
      <td>2002</td>
      <td>13</td>
      <td>DO</td>
      <td>F</td>
      <td>33.0</td>
      <td>43.0</td>
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
      <th>35528</th>
      <td>35529</td>
      <td>12</td>
      <td>31</td>
      <td>2002</td>
      <td>13</td>
      <td>PB</td>
      <td>F</td>
      <td>25.0</td>
      <td>25.0</td>
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
      <th>35531</th>
      <td>35532</td>
      <td>12</td>
      <td>31</td>
      <td>2002</td>
      <td>14</td>
      <td>DM</td>
      <td>F</td>
      <td>34.0</td>
      <td>43.0</td>
    </tr>
    <tr>
      <th>35532</th>
      <td>35533</td>
      <td>12</td>
      <td>31</td>
      <td>2002</td>
      <td>14</td>
      <td>DM</td>
      <td>F</td>
      <td>36.0</td>
      <td>48.0</td>
    </tr>
    <tr>
      <th>35533</th>
      <td>35534</td>
      <td>12</td>
      <td>31</td>
      <td>2002</td>
      <td>14</td>
      <td>DM</td>
      <td>M</td>
      <td>37.0</td>
      <td>56.0</td>
    </tr>
    <tr>
      <th>35534</th>
      <td>35535</td>
      <td>12</td>
      <td>31</td>
      <td>2002</td>
      <td>14</td>
      <td>DM</td>
      <td>M</td>
      <td>37.0</td>
      <td>53.0</td>
    </tr>
    <tr>
      <th>35535</th>
      <td>35536</td>
      <td>12</td>
      <td>31</td>
      <td>2002</td>
      <td>14</td>
      <td>DM</td>
      <td>F</td>
      <td>35.0</td>
      <td>42.0</td>
    </tr>
    <tr>
      <th>35536</th>
      <td>35537</td>
      <td>12</td>
      <td>31</td>
      <td>2002</td>
      <td>14</td>
      <td>DM</td>
      <td>F</td>
      <td>36.0</td>
      <td>46.0</td>
    </tr>
    <tr>
      <th>35537</th>
      <td>35538</td>
      <td>12</td>
      <td>31</td>
      <td>2002</td>
      <td>15</td>
      <td>PB</td>
      <td>F</td>
      <td>26.0</td>
      <td>31.0</td>
    </tr>
    <tr>
      <th>35538</th>
      <td>35539</td>
      <td>12</td>
      <td>31</td>
      <td>2002</td>
      <td>15</td>
      <td>SF</td>
      <td>M</td>
      <td>26.0</td>
      <td>68.0</td>
    </tr>
    <tr>
      <th>35539</th>
      <td>35540</td>
      <td>12</td>
      <td>31</td>
      <td>2002</td>
      <td>15</td>
      <td>PB</td>
      <td>F</td>
      <td>26.0</td>
      <td>23.0</td>
    </tr>
    <tr>
      <th>35540</th>
      <td>35541</td>
      <td>12</td>
      <td>31</td>
      <td>2002</td>
      <td>15</td>
      <td>PB</td>
      <td>F</td>
      <td>24.0</td>
      <td>31.0</td>
    </tr>
    <tr>
      <th>35541</th>
      <td>35542</td>
      <td>12</td>
      <td>31</td>
      <td>2002</td>
      <td>15</td>
      <td>PB</td>
      <td>F</td>
      <td>26.0</td>
      <td>29.0</td>
    </tr>
    <tr>
      <th>35542</th>
      <td>35543</td>
      <td>12</td>
      <td>31</td>
      <td>2002</td>
      <td>15</td>
      <td>PB</td>
      <td>F</td>
      <td>27.0</td>
      <td>34.0</td>
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
      <th>35546</th>
      <td>35547</td>
      <td>12</td>
      <td>31</td>
      <td>2002</td>
      <td>10</td>
      <td>RM</td>
      <td>F</td>
      <td>15.0</td>
      <td>14.0</td>
    </tr>
    <tr>
      <th>35547</th>
      <td>35548</td>
      <td>12</td>
      <td>31</td>
      <td>2002</td>
      <td>7</td>
      <td>DO</td>
      <td>M</td>
      <td>36.0</td>
      <td>51.0</td>
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
<p>35549 rows × 9 columns</p>
</div>








The above command yields the **output** below:

```
record_id  month  day  year  plot_id species_id sex  hindfoot_length  weight
0          1      7   16  1977        2         NL   M               32   NaN
1          2      7   16  1977        3         NL   M               33   NaN
2          3      7   16  1977        2         DM   F               37   NaN
3          4      7   16  1977        7         DM   M               36   NaN
4          5      7   16  1977        3         DM   M               35   NaN
...
35544      35545     12   31  2002       15     AH  NaN              NaN  NaN
35545      35546     12   31  2002       15     AH  NaN              NaN  NaN
35546      35547     12   31  2002       10     RM    F               15   14
35547      35548     12   31  2002        7     DO    M               36   51
35548      35549     12   31  2002        5     NaN  NaN             NaN  NaN

[35549 rows x 9 columns]
```

We can see that there were 33,549 rows parsed. Each row has 9
columns. The first column is the index of the DataFrame. The index is used to
identify the position of the data, but it is not an actual column of the DataFrame.
It looks like  the `read_csv` function in Pandas  read our file properly. However,
we haven't saved any data to memory so we can work with it.We need to assign the
DataFrame to a variable. Remember that a variable is a name for a value, such as `x`,
or  `data`. We can create a new  object with a variable name by assigning a value to it using `=`.

Let's call the imported survey data `surveys_df`:








```python
surveys_df = pd.read_csv("data/surveys.csv")

```






Notice when you assign the imported DataFrame to a variable, Python does not
produce any output on the screen. We can view the value of the `surveys_df`
object by typing its name into the Python command prompt.








```python
surveys_df

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
      <th>35520</th>
      <td>35521</td>
      <td>12</td>
      <td>31</td>
      <td>2002</td>
      <td>9</td>
      <td>DM</td>
      <td>M</td>
      <td>37.0</td>
      <td>48.0</td>
    </tr>
    <tr>
      <th>35521</th>
      <td>35522</td>
      <td>12</td>
      <td>31</td>
      <td>2002</td>
      <td>9</td>
      <td>DM</td>
      <td>F</td>
      <td>35.0</td>
      <td>45.0</td>
    </tr>
    <tr>
      <th>35522</th>
      <td>35523</td>
      <td>12</td>
      <td>31</td>
      <td>2002</td>
      <td>9</td>
      <td>DM</td>
      <td>F</td>
      <td>36.0</td>
      <td>44.0</td>
    </tr>
    <tr>
      <th>35523</th>
      <td>35524</td>
      <td>12</td>
      <td>31</td>
      <td>2002</td>
      <td>9</td>
      <td>PB</td>
      <td>F</td>
      <td>25.0</td>
      <td>27.0</td>
    </tr>
    <tr>
      <th>35524</th>
      <td>35525</td>
      <td>12</td>
      <td>31</td>
      <td>2002</td>
      <td>9</td>
      <td>OL</td>
      <td>M</td>
      <td>21.0</td>
      <td>26.0</td>
    </tr>
    <tr>
      <th>35525</th>
      <td>35526</td>
      <td>12</td>
      <td>31</td>
      <td>2002</td>
      <td>8</td>
      <td>OT</td>
      <td>F</td>
      <td>20.0</td>
      <td>24.0</td>
    </tr>
    <tr>
      <th>35526</th>
      <td>35527</td>
      <td>12</td>
      <td>31</td>
      <td>2002</td>
      <td>13</td>
      <td>DO</td>
      <td>F</td>
      <td>33.0</td>
      <td>43.0</td>
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
      <th>35528</th>
      <td>35529</td>
      <td>12</td>
      <td>31</td>
      <td>2002</td>
      <td>13</td>
      <td>PB</td>
      <td>F</td>
      <td>25.0</td>
      <td>25.0</td>
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
      <th>35531</th>
      <td>35532</td>
      <td>12</td>
      <td>31</td>
      <td>2002</td>
      <td>14</td>
      <td>DM</td>
      <td>F</td>
      <td>34.0</td>
      <td>43.0</td>
    </tr>
    <tr>
      <th>35532</th>
      <td>35533</td>
      <td>12</td>
      <td>31</td>
      <td>2002</td>
      <td>14</td>
      <td>DM</td>
      <td>F</td>
      <td>36.0</td>
      <td>48.0</td>
    </tr>
    <tr>
      <th>35533</th>
      <td>35534</td>
      <td>12</td>
      <td>31</td>
      <td>2002</td>
      <td>14</td>
      <td>DM</td>
      <td>M</td>
      <td>37.0</td>
      <td>56.0</td>
    </tr>
    <tr>
      <th>35534</th>
      <td>35535</td>
      <td>12</td>
      <td>31</td>
      <td>2002</td>
      <td>14</td>
      <td>DM</td>
      <td>M</td>
      <td>37.0</td>
      <td>53.0</td>
    </tr>
    <tr>
      <th>35535</th>
      <td>35536</td>
      <td>12</td>
      <td>31</td>
      <td>2002</td>
      <td>14</td>
      <td>DM</td>
      <td>F</td>
      <td>35.0</td>
      <td>42.0</td>
    </tr>
    <tr>
      <th>35536</th>
      <td>35537</td>
      <td>12</td>
      <td>31</td>
      <td>2002</td>
      <td>14</td>
      <td>DM</td>
      <td>F</td>
      <td>36.0</td>
      <td>46.0</td>
    </tr>
    <tr>
      <th>35537</th>
      <td>35538</td>
      <td>12</td>
      <td>31</td>
      <td>2002</td>
      <td>15</td>
      <td>PB</td>
      <td>F</td>
      <td>26.0</td>
      <td>31.0</td>
    </tr>
    <tr>
      <th>35538</th>
      <td>35539</td>
      <td>12</td>
      <td>31</td>
      <td>2002</td>
      <td>15</td>
      <td>SF</td>
      <td>M</td>
      <td>26.0</td>
      <td>68.0</td>
    </tr>
    <tr>
      <th>35539</th>
      <td>35540</td>
      <td>12</td>
      <td>31</td>
      <td>2002</td>
      <td>15</td>
      <td>PB</td>
      <td>F</td>
      <td>26.0</td>
      <td>23.0</td>
    </tr>
    <tr>
      <th>35540</th>
      <td>35541</td>
      <td>12</td>
      <td>31</td>
      <td>2002</td>
      <td>15</td>
      <td>PB</td>
      <td>F</td>
      <td>24.0</td>
      <td>31.0</td>
    </tr>
    <tr>
      <th>35541</th>
      <td>35542</td>
      <td>12</td>
      <td>31</td>
      <td>2002</td>
      <td>15</td>
      <td>PB</td>
      <td>F</td>
      <td>26.0</td>
      <td>29.0</td>
    </tr>
    <tr>
      <th>35542</th>
      <td>35543</td>
      <td>12</td>
      <td>31</td>
      <td>2002</td>
      <td>15</td>
      <td>PB</td>
      <td>F</td>
      <td>27.0</td>
      <td>34.0</td>
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
      <th>35546</th>
      <td>35547</td>
      <td>12</td>
      <td>31</td>
      <td>2002</td>
      <td>10</td>
      <td>RM</td>
      <td>F</td>
      <td>15.0</td>
      <td>14.0</td>
    </tr>
    <tr>
      <th>35547</th>
      <td>35548</td>
      <td>12</td>
      <td>31</td>
      <td>2002</td>
      <td>7</td>
      <td>DO</td>
      <td>M</td>
      <td>36.0</td>
      <td>51.0</td>
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
<p>35549 rows × 9 columns</p>
</div>








which prints contents like above.

Note: if the output is too wide to print on your narrow terminal window, you may see something 
slightly different as the large set of data scrolls past. You may see simply the last column
of data:







```python
17        NaN  
18        NaN  
19        NaN  
20        NaN  
21        NaN  
22        NaN  
23        NaN  
24        NaN  
25        NaN  
26        NaN  
27        NaN  
28        NaN  
29        NaN  
...       ...  
35519    36.0  
35520    48.0  
35521    45.0  
35522    44.0  
35523    27.0  
35524    26.0  
35525    24.0  
35526    43.0  
35527     NaN  
35528    25.0  
35529     NaN  
35530     NaN  
35531    43.0  
35532    48.0  
35533    56.0  
35534    53.0  
35535    42.0  
35536    46.0  
35537    31.0  
35538    68.0  
35539    23.0  
35540    31.0  
35541    29.0  
35542    34.0  
35543     NaN  
35544     NaN  
35545     NaN  
35546    14.0  
35547    51.0  
35548     NaN  

[35549 rows x 9 columns]

```


      File "<ipython-input-5-6b622d1530fb>", line 1
        17        NaN
                    ^
    SyntaxError: invalid syntax







Never fear, all the data is there, if you scroll up. Selecting just a few rows, so it is
easier to fit on one window, you can see that pandas has neatly formatted the data to fit
our screen:








```python

>>> surveys_df.head() # The head() function displays the first several lines of a file. It
		      # is discussed below.
   record_id  month  day  year  plot_id species_id sex  hindfoot_length  \
5          6      7   16  1977        1         PF   M             14.0   
6          7      7   16  1977        2         PE   F              NaN   
7          8      7   16  1977        1         DM   M             37.0   
8          9      7   16  1977        1         DM   F             34.0   
9         10      7   16  1977        6         PF   F             20.0   

   weight  
5     NaN  
6     NaN  
7     NaN  
8     NaN  
9     NaN  

```


      File "<ipython-input-6-d7d7288f1688>", line 4
        record_id  month  day  year  plot_id species_id sex  hindfoot_length  5          6      7   16  1977        1         PF   M             14.0
        ^
    IndentationError: unexpected indent














## Exploring Our Species Survey Data

Again, we can use the `type` function to see what kind of thing `surveys_df` is:








```python
type(surveys_df)

## Returns
pandas.core.frame.DataFrame

```


    ---------------------------------------------------------------------------

    NameError                                 Traceback (most recent call last)

    <ipython-input-7-268d34800047> in <module>()
          2 
          3 ## Returns
    ----> 4 pandas.core.frame.DataFrame
    

    NameError: name 'pandas' is not defined







As expected, it's a DataFrame (or, to use the full name that Python uses to refer
to it internally, a `pandas.core.frame.DataFrame`).

What kind of things does `surveys_df` contain? DataFrames have an attribute
called `dtypes` that answers this:








```python
surveys_df.dtypes

## Returns
record_id            int64
month                int64
day                  int64
year                 int64
plot_id              int64
species_id          object
sex                 object
hindfoot_length    float64
weight             float64
dtype: object

```


      File "<ipython-input-8-03de3d6eb642>", line 4
        record_id            int64
                                 ^
    SyntaxError: invalid syntax








All the values in a column have the same type. For example, months have type
`int64`, which is a kind of integer. Cells in the month column cannot have
fractional values, but the weight and hindfoot_length columns can, because they
have type `float64`. The `object` type doesn't have a very helpful name, but in
this case it represents strings (such as 'M' and 'F' in the case of sex).


### Useful Ways to View DataFrame objects in Python

There are many ways to summarize and access the data stored in DataFrames,
using attributes and methods provided by the DataFrame object.

To access an attribute, use the DataFrame object name followed by the attribute
name `df_object.attribute`. Using the DataFrame `surveys_df` and attribute
`columns`, an index of all the column names in the DataFrame can be accessed
with `surveys_df.columns`.

Methods are called in a similar fashion using the syntax `df_object.method()`.
As an example, `surveys_df.head()` gets the first few rows in the DataFrame
`surveys_df` using **the `head()` method**. With a method, we can supply extra
information in the parens to control behaviour.

Let's look at the data using these.







## Challenge - DataFrames

Using our DataFrame `surveys_df`, try out the attributes & methods below to see
what they return.

1. `surveys_df.columns`
2. `surveys_df.shape` Take note of the output of `shape` - what format does it
   return the shape of the DataFrame in?   HINT: [More on tuples, here](https://docs.python.org/3/tutorial/datastructures.html#tuples-and-sequences).
3. `surveys_df.head()` Also, what does `surveys_df.head(15)` do?
4. `surveys_df.tail()`








## Calculating Statistics From Data In A Pandas DataFrame

We've read our data into Python. Next, let's perform some quick summary
statistics to learn more about the data that we're working with. We might want
to know how many animals were collected in each plot, or how many of each
species were caught. We can perform summary stats quickly using groups. But
first we need to figure out what we want to group by.

Let's begin by exploring our data:








```python
# Look at the column names
surveys_df.columns

```




<pre class="output">
<div style="text-align: right; margin: -1em; padding: 0;"><span style="font-size: 0.5em; color: grey">output</span></div>
<code class="text">
Index(['record_id', 'month', 'day', 'year', 'site_id', 'species_id', 'sex',
       'hindfoot_length', 'weight'],
      dtype='object')
</code>
</pre>








which **returns**:

```
Index(['record_id', 'month', 'day', 'year', 'plot_id', 'species_id', 'sex',
       'hindfoot_length', 'weight'],
      dtype='object')
```

Let's get a list of all the species. The `pd.unique` function tells us all of
the unique values in the `species_id` column.








```python
pd.unique(surveys_df['species_id'])

```




<pre class="output">
<div style="text-align: right; margin: -1em; padding: 0;"><span style="font-size: 0.5em; color: grey">output</span></div>
<code class="text">
array(['NL', 'DM', 'PF', 'PE', 'DS', 'PP', 'SH', 'OT', 'DO', 'OX', 'SS',
       'OL', 'RM', nan, 'SA', 'PM', 'AH', 'DX', 'AB', 'CB', 'CM', 'CQ',
       'RF', 'PC', 'PG', 'PH', 'PU', 'CV', 'UR', 'UP', 'ZL', 'UL', 'CS',
       'SC', 'BA', 'SF', 'RO', 'AS', 'SO', 'PI', 'ST', 'CU', 'SU', 'RX',
       'PB', 'PL', 'PX', 'CT', 'US'], dtype=object)
</code>
</pre>








which **returns**:








```python
array(['NL', 'DM', 'PF', 'PE', 'DS', 'PP', 'SH', 'OT', 'DO', 'OX', 'SS',
       'OL', 'RM', nan, 'SA', 'PM', 'AH', 'DX', 'AB', 'CB', 'CM', 'CQ',
       'RF', 'PC', 'PG', 'PH', 'PU', 'CV', 'UR', 'UP', 'ZL', 'UL', 'CS',
       'SC', 'BA', 'SF', 'RO', 'AS', 'SO', 'PI', 'ST', 'CU', 'SU', 'RX',
       'PB', 'PL', 'PX', 'CT', 'US'], dtype=object)

```


    ---------------------------------------------------------------------------

    NameError                                 Traceback (most recent call last)

    <ipython-input-11-7e0dd798cafd> in <module>()
    ----> 1 array(['NL', 'DM', 'PF', 'PE', 'DS', 'PP', 'SH', 'OT', 'DO', 'OX', 'SS',
          2        'OL', 'RM', nan, 'SA', 'PM', 'AH', 'DX', 'AB', 'CB', 'CM', 'CQ',
          3        'RF', 'PC', 'PG', 'PH', 'PU', 'CV', 'UR', 'UP', 'ZL', 'UL', 'CS',
          4        'SC', 'BA', 'SF', 'RO', 'AS', 'SO', 'PI', 'ST', 'CU', 'SU', 'RX',
          5        'PB', 'PL', 'PX', 'CT', 'US'], dtype=object)


    NameError: name 'array' is not defined













## Challenge - Statistics

1. Create a list of unique plot ID's found in the surveys data. Call it
  `plot_names`. How many unique plots are there in the data? How many unique
  species are in the data?

2. What is the difference between `len(plot_names)` and `surveys_df['plot_id'].nunique()`?

# Groups in Pandas

We often want to calculate summary statistics grouped by subsets or attributes
within fields of our data. For example, we might want to calculate the average
weight of all individuals per plot.

We can calculate basic statistics for all records in a single column using the
syntax below:








```python
surveys_df['weight'].describe()

```




<pre class="output">
<div style="text-align: right; margin: -1em; padding: 0;"><span style="font-size: 0.5em; color: grey">output</span></div>
<code class="text">
count    32283.000000
mean        42.672428
std         36.631259
min          4.000000
25%         20.000000
50%         37.000000
75%         48.000000
max        280.000000
Name: weight, dtype: float64
</code>
</pre>







gives **output**








```python
count    32283.000000
mean        42.672428
std         36.631259
min          4.000000
25%         20.000000
50%         37.000000
75%         48.000000
max        280.000000
Name: weight, dtype: float64

```


      File "<ipython-input-13-85b785d1d6fc>", line 1
        count    32283.000000
                            ^
    SyntaxError: invalid syntax








We can also extract one specific metric if we wish:








```python
surveys_df['weight'].min()
surveys_df['weight'].max()
surveys_df['weight'].mean()
surveys_df['weight'].std()
surveys_df['weight'].count()

```




<pre class="output">
<div style="text-align: right; margin: -1em; padding: 0;"><span style="font-size: 0.5em; color: grey">output</span></div>
<code class="text">
32283
</code>
</pre>








But if we want to summarize by one or more variables, for example sex, we can
use **Pandas' `.groupby` method**. Once we've created a groupby DataFrame, we
can quickly calculate summary statistics by a group of our choice.








```python
# Group data by sex
grouped_data = surveys_df.groupby('sex')

```






The **pandas function `describe`** will return descriptive stats including: mean,
median, max, min, std and count for a particular column in the data. Pandas'
`describe` function will only return summary values for columns containing
numeric data.








```python
# Summary statistics for all numeric columns by sex
grouped_data.describe()
# Provide the mean for each numeric column by sex
grouped_data.mean()

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
      <th>hindfoot_length</th>
      <th>weight</th>
    </tr>
    <tr>
      <th>sex</th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>F</th>
      <td>18036.412046</td>
      <td>6.583047</td>
      <td>16.007138</td>
      <td>1990.644997</td>
      <td>11.440854</td>
      <td>28.836780</td>
      <td>42.170555</td>
    </tr>
    <tr>
      <th>M</th>
      <td>17754.835601</td>
      <td>6.392668</td>
      <td>16.184286</td>
      <td>1990.480401</td>
      <td>11.098282</td>
      <td>29.709578</td>
      <td>42.995379</td>
    </tr>
  </tbody>
</table>
</div>








`grouped_data.mean()` **OUTPUT:**








```python
        record_id     month        day         year    plot_id  \
sex                                                              
F    18036.412046  6.583047  16.007138  1990.644997  11.440854   
M    17754.835601  6.392668  16.184286  1990.480401  11.098282   

     hindfoot_length     weight  
sex                              
F          28.836780  42.170555  
M          29.709578  42.995379  


```


      File "<ipython-input-17-791f853201b3>", line 1
        record_id     month        day         year    plot_id  sex
                          ^
    SyntaxError: invalid syntax








The `groupby` command is powerful in that it allows us to quickly generate
summary stats.







## Challenge - Summary Data

1. How many recorded individuals are female `F` and how many male `M`
2. What happens when you group by two columns using the following syntax and
    then grab mean values:
	- `grouped_data2 = surveys_df.groupby(['plot_id','sex'])`
	- `grouped_data2.mean()`
3. Summarize weight values for each plot in your data. HINT: you can use the
  following syntax to only create summary statistics for one column in your data
  `by_plot['weight'].describe()`







## Did you get #3 right?
 **A Snippet of the Output from challenge 3 looks like:**

```
	plot
	1     count    1903.000000
	      mean       51.822911
	      std        38.176670
	      min         4.000000
	      25%        30.000000
	      50%        44.000000
	      75%        53.000000
	      max       231.000000
         ...
```







## Quickly Creating Summary Counts in Pandas

Let's next count the number of samples for each species. We can do this in a few
ways, but we'll use `groupby` combined with **a `count()` method**.









```python
# Count the number of samples by species
species_counts = surveys_df.groupby('species_id')['record_id'].count()
print(species_counts)

```

<pre class="output">
<div class="output_label">output</div>
<code class="text">
species_id
AB      303
AH      437
AS        2
BA       46
CB       50
CM       13
CQ       16
CS        1
CT        1
CU        1
CV        1
DM    10596
DO     3027
DS     2504
DX       40
NL     1252
OL     1006
OT     2249
OX       12
PB     2891
PC       39
PE     1299
PF     1597
PG        8
PH       32
PI        9
PL       36
PM      899
PP     3123
PU        5
PX        6
RF       75
RM     2609
RO        8
RX        2
SA       75
SC        1
SF       43
SH      147
SO       43
SS      248
ST        1
SU        5
UL        4
UP        8
UR       10
US        4
ZL        2
Name: record_id, dtype: int64

</code>
</pre>






Or, we can also count just the rows that have the species "DO":








```python
surveys_df.groupby('species_id')['record_id'].count()['DO']

```




<pre class="output">
<div style="text-align: right; margin: -1em; padding: 0;"><span style="font-size: 0.5em; color: grey">output</span></div>
<code class="text">
3027
</code>
</pre>














## Basic Math Functions

If we wanted to, we could perform math on an entire column of our data. For
example let's multiply all weight values by 2. A more practical use of this might
be to normalize the data according to a mean, area, or some other value
calculated from our data.








```python

# Multiply all weight values by 2 but does not change the original weight data

surveys_df['weight']*2


```




<pre class="output">
<div style="text-align: right; margin: -1em; padding: 0;"><span style="font-size: 0.5em; color: grey">output</span></div>
<code class="text">
0          NaN
1          NaN
2          NaN
3          NaN
4          NaN
5          NaN
6          NaN
7          NaN
8          NaN
9          NaN
10         NaN
11         NaN
12         NaN
13         NaN
14         NaN
15         NaN
16         NaN
17         NaN
18         NaN
19         NaN
20         NaN
21         NaN
22         NaN
23         NaN
24         NaN
25         NaN
26         NaN
27         NaN
28         NaN
29         NaN
         ...  
35519     72.0
35520     96.0
35521     90.0
35522     88.0
35523     54.0
35524     52.0
35525     48.0
35526     86.0
35527      NaN
35528     50.0
35529      NaN
35530      NaN
35531     86.0
35532     96.0
35533    112.0
35534    106.0
35535     84.0
35536     92.0
35537     62.0
35538    136.0
35539     46.0
35540     62.0
35541     58.0
35542     68.0
35543      NaN
35544      NaN
35545      NaN
35546     28.0
35547    102.0
35548      NaN
Name: weight, Length: 35549, dtype: float64
</code>
</pre>














## Quick & Easy Plotting Data Using Pandas

We can plot our summary stats using Pandas, too.








```python

## To make sure figures appear inside Jupyter Notebook
%matplotlib inline

# Create a quick bar chart
species_counts.plot(kind='bar');

```


![png](working_with_data_files/working_with_data_54_0.png)







![Weight by Species Plot](../images/each_species.jpg)

Weight by species plot

We can also look at how many animals were captured in each plot:








```python
total_count = surveys_df.groupby('plot_id')['record_id'].nunique()
# Let's plot that too
total_count.plot(kind='bar');

```


    ---------------------------------------------------------------------------

    KeyError                                  Traceback (most recent call last)

    <ipython-input-22-a50060d93aea> in <module>()
    ----> 1 total_count = surveys_df.groupby('plot_id')['record_id'].nunique()
          2 # Let's plot that too
          3 total_count.plot(kind='bar');


    ~/.virtualenvs/python-workshop-base-ufuVBSbV/lib/python3.6/site-packages/pandas/core/generic.py in groupby(self, by, axis, level, as_index, sort, group_keys, squeeze, observed, **kwargs)
       6657         return groupby(self, by=by, axis=axis, level=level, as_index=as_index,
       6658                        sort=sort, group_keys=group_keys, squeeze=squeeze,
    -> 6659                        observed=observed, **kwargs)
       6660 
       6661     def asfreq(self, freq, method=None, how=None, normalize=False,


    ~/.virtualenvs/python-workshop-base-ufuVBSbV/lib/python3.6/site-packages/pandas/core/groupby/groupby.py in groupby(obj, by, **kwds)
       2150         raise TypeError('invalid type: %s' % type(obj))
       2151 
    -> 2152     return klass(obj, by, **kwds)
       2153 
       2154 


    ~/.virtualenvs/python-workshop-base-ufuVBSbV/lib/python3.6/site-packages/pandas/core/groupby/groupby.py in __init__(self, obj, keys, axis, level, grouper, exclusions, selection, as_index, sort, group_keys, squeeze, observed, **kwargs)
        597                                                     sort=sort,
        598                                                     observed=observed,
    --> 599                                                     mutated=self.mutated)
        600 
        601         self.obj = obj


    ~/.virtualenvs/python-workshop-base-ufuVBSbV/lib/python3.6/site-packages/pandas/core/groupby/groupby.py in _get_grouper(obj, key, axis, level, sort, observed, mutated, validate)
       3289                 in_axis, name, level, gpr = False, None, gpr, None
       3290             else:
    -> 3291                 raise KeyError(gpr)
       3292         elif isinstance(gpr, Grouper) and gpr.key is not None:
       3293             # Add key to exclusions


    KeyError: 'plot_id'













## _Extra Plotting Challenge_

1. Create a plot of average weight across all species per plot.

2. Create a plot of total males versus total females for the entire dataset.
 
3. Create a stacked bar plot, with weight on the Y axis, and the stacked variable being sex. The plot should show total weight by sex for each plot. Some tips are below to help you solve this challenge:

* [For more on Pandas plots, visit this link.](http://pandas.pydata.org/pandas-docs/stable/visualization.html#basic-plotting-plot)
* You can use the code that follows to create a stacked bar plot but the data to stack
 need to be in individual columns.  Here's a simple example with some data where
  'a', 'b', and 'c' are the groups, and 'one' and 'two' are the subgroups.

```
d = {'one' : pd.Series([1., 2., 3.], index=['a', 'b', 'c']),'two' : pd.Series([1., 2., 3., 4.], index=['a', 'b', 'c', 'd'])}
pd.DataFrame(d)
```

shows the following data

```
      one  two
   a    1    1
   b    2    2
   c    3    3
   d  NaN    4
```

We can plot the above with

```
# Plot stacked data so columns 'one' and 'two' are stacked
my_df = pd.DataFrame(d)
my_df.plot(kind='bar',stacked=True,title="The title of my graph")
```


* You can use the `.unstack()` method to transform grouped data into columns
for each plotting.  Try running `.unstack()` on some DataFrames above and see
 what it yields.

 Start by transforming the grouped data (by plot and sex) into an unstacked layout, then create
 a stacked plot.








## _Solution to Extra Challenge 3_

First we group data by plot and by sex, and then calculate a total for each plot.








```python
by_plot_sex = surveys_df.groupby(['plot_id','sex'])
plot_sex_count = by_plot_sex['weight'].sum()

```


    ---------------------------------------------------------------------------

    KeyError                                  Traceback (most recent call last)

    <ipython-input-23-2d137cef00de> in <module>()
    ----> 1 by_plot_sex = surveys_df.groupby(['plot_id','sex'])
          2 plot_sex_count = by_plot_sex['weight'].sum()


    ~/.virtualenvs/python-workshop-base-ufuVBSbV/lib/python3.6/site-packages/pandas/core/generic.py in groupby(self, by, axis, level, as_index, sort, group_keys, squeeze, observed, **kwargs)
       6657         return groupby(self, by=by, axis=axis, level=level, as_index=as_index,
       6658                        sort=sort, group_keys=group_keys, squeeze=squeeze,
    -> 6659                        observed=observed, **kwargs)
       6660 
       6661     def asfreq(self, freq, method=None, how=None, normalize=False,


    ~/.virtualenvs/python-workshop-base-ufuVBSbV/lib/python3.6/site-packages/pandas/core/groupby/groupby.py in groupby(obj, by, **kwds)
       2150         raise TypeError('invalid type: %s' % type(obj))
       2151 
    -> 2152     return klass(obj, by, **kwds)
       2153 
       2154 


    ~/.virtualenvs/python-workshop-base-ufuVBSbV/lib/python3.6/site-packages/pandas/core/groupby/groupby.py in __init__(self, obj, keys, axis, level, grouper, exclusions, selection, as_index, sort, group_keys, squeeze, observed, **kwargs)
        597                                                     sort=sort,
        598                                                     observed=observed,
    --> 599                                                     mutated=self.mutated)
        600 
        601         self.obj = obj


    ~/.virtualenvs/python-workshop-base-ufuVBSbV/lib/python3.6/site-packages/pandas/core/groupby/groupby.py in _get_grouper(obj, key, axis, level, sort, observed, mutated, validate)
       3289                 in_axis, name, level, gpr = False, None, gpr, None
       3290             else:
    -> 3291                 raise KeyError(gpr)
       3292         elif isinstance(gpr, Grouper) and gpr.key is not None:
       3293             # Add key to exclusions


    KeyError: 'plot_id'







This calculates the sums of weights for each sex within each plot as a table

```
plot  sex
plot_id  sex
1        F      38253
         M      59979
2        F      50144
         M      57250
3        F      27251
         M      28253
4        F      39796
         M      49377
<other plots removed for brevity>
```

Below we'll use `.unstack()` on our grouped data to figure out the total weight that each sex contributed to each plot.








```python
by_plot_sex = surveys_df.groupby(['plot_id','sex'])
plot_sex_count = by_plot_sex['weight'].sum()
plot_sex_count.unstack()

```


    ---------------------------------------------------------------------------

    KeyError                                  Traceback (most recent call last)

    <ipython-input-24-b5fe6fd21c8a> in <module>()
    ----> 1 by_plot_sex = surveys_df.groupby(['plot_id','sex'])
          2 plot_sex_count = by_plot_sex['weight'].sum()
          3 plot_sex_count.unstack()


    ~/.virtualenvs/python-workshop-base-ufuVBSbV/lib/python3.6/site-packages/pandas/core/generic.py in groupby(self, by, axis, level, as_index, sort, group_keys, squeeze, observed, **kwargs)
       6657         return groupby(self, by=by, axis=axis, level=level, as_index=as_index,
       6658                        sort=sort, group_keys=group_keys, squeeze=squeeze,
    -> 6659                        observed=observed, **kwargs)
       6660 
       6661     def asfreq(self, freq, method=None, how=None, normalize=False,


    ~/.virtualenvs/python-workshop-base-ufuVBSbV/lib/python3.6/site-packages/pandas/core/groupby/groupby.py in groupby(obj, by, **kwds)
       2150         raise TypeError('invalid type: %s' % type(obj))
       2151 
    -> 2152     return klass(obj, by, **kwds)
       2153 
       2154 


    ~/.virtualenvs/python-workshop-base-ufuVBSbV/lib/python3.6/site-packages/pandas/core/groupby/groupby.py in __init__(self, obj, keys, axis, level, grouper, exclusions, selection, as_index, sort, group_keys, squeeze, observed, **kwargs)
        597                                                     sort=sort,
        598                                                     observed=observed,
    --> 599                                                     mutated=self.mutated)
        600 
        601         self.obj = obj


    ~/.virtualenvs/python-workshop-base-ufuVBSbV/lib/python3.6/site-packages/pandas/core/groupby/groupby.py in _get_grouper(obj, key, axis, level, sort, observed, mutated, validate)
       3289                 in_axis, name, level, gpr = False, None, gpr, None
       3290             else:
    -> 3291                 raise KeyError(gpr)
       3292         elif isinstance(gpr, Grouper) and gpr.key is not None:
       3293             # Add key to exclusions


    KeyError: 'plot_id'







The `unstack` function above will display the following output:

```
sex          F      M
plot_id              
1        38253  59979
2        50144  57250
3        27251  28253
4        39796  49377
<other plots removed for brevity>
```

Now, create a stacked bar plot with that data where the weights for each sex are stacked by plot.

Rather than display it as a table, we can plot the above data by stacking the values of each sex as follows:








```python
by_plot_sex = surveys_df.groupby(['plot_id','sex'])
plot_sex_count = by_plot_sex['weight'].sum()
spc = plot_sex_count.unstack()
s_plot = spc.plot(kind='bar',stacked=True,title="Total weight by plot and sex")
s_plot.set_ylabel("Weight")
s_plot.set_xlabel("Plot")

```


    ---------------------------------------------------------------------------

    KeyError                                  Traceback (most recent call last)

    <ipython-input-25-24fccb5ab92d> in <module>()
    ----> 1 by_plot_sex = surveys_df.groupby(['plot_id','sex'])
          2 plot_sex_count = by_plot_sex['weight'].sum()
          3 spc = plot_sex_count.unstack()
          4 s_plot = spc.plot(kind='bar',stacked=True,title="Total weight by plot and sex")
          5 s_plot.set_ylabel("Weight")


    ~/.virtualenvs/python-workshop-base-ufuVBSbV/lib/python3.6/site-packages/pandas/core/generic.py in groupby(self, by, axis, level, as_index, sort, group_keys, squeeze, observed, **kwargs)
       6657         return groupby(self, by=by, axis=axis, level=level, as_index=as_index,
       6658                        sort=sort, group_keys=group_keys, squeeze=squeeze,
    -> 6659                        observed=observed, **kwargs)
       6660 
       6661     def asfreq(self, freq, method=None, how=None, normalize=False,


    ~/.virtualenvs/python-workshop-base-ufuVBSbV/lib/python3.6/site-packages/pandas/core/groupby/groupby.py in groupby(obj, by, **kwds)
       2150         raise TypeError('invalid type: %s' % type(obj))
       2151 
    -> 2152     return klass(obj, by, **kwds)
       2153 
       2154 


    ~/.virtualenvs/python-workshop-base-ufuVBSbV/lib/python3.6/site-packages/pandas/core/groupby/groupby.py in __init__(self, obj, keys, axis, level, grouper, exclusions, selection, as_index, sort, group_keys, squeeze, observed, **kwargs)
        597                                                     sort=sort,
        598                                                     observed=observed,
    --> 599                                                     mutated=self.mutated)
        600 
        601         self.obj = obj


    ~/.virtualenvs/python-workshop-base-ufuVBSbV/lib/python3.6/site-packages/pandas/core/groupby/groupby.py in _get_grouper(obj, key, axis, level, sort, observed, mutated, validate)
       3289                 in_axis, name, level, gpr = False, None, gpr, None
       3290             else:
    -> 3291                 raise KeyError(gpr)
       3292         elif isinstance(gpr, Grouper) and gpr.key is not None:
       3293             # Add key to exclusions


    KeyError: 'plot_id'







![Stacked Bar Plot](../images/stacked_barplot.png)





