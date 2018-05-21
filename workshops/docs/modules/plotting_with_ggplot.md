

<style>
.output_label {
    text-align: right;
    margin: -1em;
    padding: 0;
    font-size: 0.5em;
    color: grey
}
</style>


# Making Plots With ggplot (aka plotnine)

*Estimated teaching time:* 40 min

*Estimated challenge time:* 50 min

*Key questions:*

  - " How can I visualize data in Python ?"
  - " What is 'grammar of graphics' ?"
    
*Learning objectives:*

  - "Familiarise yourself with The Gramma of Graphics through plotinine library"
  - "Create a ggplot object."
  - "Explore different geom objects"
  - "Explore other layers of ggplot, including themes and labels"

*Key points:*

  - "plotnine is python implementation of The Gramma of Graphics"
  - "ggplot is a set of gramma rules to make publication quality plots"
  - "ggplot has idea of layer, building a plot is just adding different layers together"





## Introduction

Python has powerful built-in plotting capabilities such as [`matplotlib`](https://matplotlib.org/), but with great power comes great complexity. For this exercise, we are going to use different python library, [`plotnine`](https://plotnine.readthedocs.io/en/stable/). There are a number of different libraries to choose from, but we are setting on [`plotnine`](https://plotnine.readthedocs.io/en/stable) as this is python port of original [`ggplot2`](http://ggplot2.org/) an R library (package), which is a very nice way to create publication quality plots and syntax is preserved, meaning you can take your python ggplot code and run it in R if you want it.
Strictly speaking [`plotnine`](https://plotnine.readthedocs.io/en/stable/) is just another implementation of [The Grammar of Graphics](http://link.springer.com/book/10.1007%2F0-387-28695-0) by Leland Wilkinson, which in theory could go on it own direction and diverge away from an R `ggplot` .

#### The Grammar of Graphics

> statistical graphic is a mapping from data to aesthetic attributes (colour, shape, size) of geometric objects (points, lines, bars)
> Faceting can be used to generate the same plot for different subsets of the dataset

These are basic building blocks according to the grammar of graphics:

- **data** The data + a set of aesthetic mappings that describing variables mapping
- **geom** Geometric objects, represent what you actually see on the plot: points, lines, polygons, etc.
- **stats** Statistical transformations, summarise data in many useful ways.
- **scale** The scales map values in the data space to values in an aesthetic space
- **coord** A coordinate system, describes how data coordinates are mapped to the plane of the graphic.
- **facet** A faceting specification describes how to break up the data into subsets for plotting individual set

Let's explore those in details





First, install the `pandas` and `plotnine` packages to ensure they are available.






```python
!pip install pandas plotnine
```

<pre class="output">
<div class="output_label">output</div>
<code class="text">
Requirement already satisfied: pandas in /Users/perry/.virtualenvs/python-workshop-base-ufuVBSbV/lib/python3.6/site-packages (0.23.0)
Requirement already satisfied: plotnine in /Users/perry/.virtualenvs/python-workshop-base-ufuVBSbV/lib/python3.6/site-packages (0.3.0)
Requirement already satisfied: pytz>=2011k in /Users/perry/.virtualenvs/python-workshop-base-ufuVBSbV/lib/python3.6/site-packages (from pandas) (2018.4)
Requirement already satisfied: python-dateutil>=2.5.0 in /Users/perry/.virtualenvs/python-workshop-base-ufuVBSbV/lib/python3.6/site-packages (from pandas) (2.7.3)
Requirement already satisfied: numpy>=1.9.0 in /Users/perry/.virtualenvs/python-workshop-base-ufuVBSbV/lib/python3.6/site-packages (from pandas) (1.14.3)
Requirement already satisfied: six in /Users/perry/.virtualenvs/python-workshop-base-ufuVBSbV/lib/python3.6/site-packages (from plotnine) (1.11.0)
Requirement already satisfied: mizani>=0.4.1 in /Users/perry/.virtualenvs/python-workshop-base-ufuVBSbV/lib/python3.6/site-packages (from plotnine) (0.4.6)
Requirement already satisfied: scipy>=1.0.0 in /Users/perry/.virtualenvs/python-workshop-base-ufuVBSbV/lib/python3.6/site-packages (from plotnine) (1.1.0)
Requirement already satisfied: matplotlib>=2.1.0 in /Users/perry/.virtualenvs/python-workshop-base-ufuVBSbV/lib/python3.6/site-packages (from plotnine) (2.2.2)
Requirement already satisfied: statsmodels>=0.8.0 in /Users/perry/.virtualenvs/python-workshop-base-ufuVBSbV/lib/python3.6/site-packages (from plotnine) (0.9.0)
Requirement already satisfied: patsy>=0.4.1 in /Users/perry/.virtualenvs/python-workshop-base-ufuVBSbV/lib/python3.6/site-packages (from plotnine) (0.5.0)
Requirement already satisfied: palettable in /Users/perry/.virtualenvs/python-workshop-base-ufuVBSbV/lib/python3.6/site-packages (from mizani>=0.4.1->plotnine) (3.1.1)
Requirement already satisfied: pyparsing!=2.0.4,!=2.1.2,!=2.1.6,>=2.0.1 in /Users/perry/.virtualenvs/python-workshop-base-ufuVBSbV/lib/python3.6/site-packages (from matplotlib>=2.1.0->plotnine) (2.2.0)
Requirement already satisfied: kiwisolver>=1.0.1 in /Users/perry/.virtualenvs/python-workshop-base-ufuVBSbV/lib/python3.6/site-packages (from matplotlib>=2.1.0->plotnine) (1.0.1)
Requirement already satisfied: cycler>=0.10 in /Users/perry/.virtualenvs/python-workshop-base-ufuVBSbV/lib/python3.6/site-packages (from matplotlib>=2.1.0->plotnine) (0.10.0)
Requirement already satisfied: setuptools in /Users/perry/.virtualenvs/python-workshop-base-ufuVBSbV/lib/python3.6/site-packages (from kiwisolver>=1.0.1->matplotlib>=2.1.0->plotnine) (39.1.0)

</code>
</pre>






```python
# We run this to suppress various deprecation warnings from plotnine - keeps our notebook cleaner
import warnings
warnings.filterwarnings('ignore')
```





# Plotting in ggplot style

Let set up our working environment with necessary libraries and also load our csv file into data frame called `survs_df`,






```python
import numpy as np
import pandas as pd
from plotnine import *

%matplotlib inline
survs_df = pd.read_csv('data/surveys.csv').dropna()
```






Producing a plot with ggplot, we must give three things:

1. A data frame containing our data.
2. How the columns of the data frame can be translated into positions, colors, sizes, and shapes of graphical elements ("aesthetics").
3. The actual graphical elements to display ("geometric objects").







## Introduction to plotting








```python
ggplot(survs_df, aes('weight', 'hindfoot_length')) + geom_point()
```


![png](plotting_with_ggplot_files/plotting_with_ggplot_9_0.png)





<pre class="output">
<div style="text-align: right; margin: -1em; padding: 0;"><span style="font-size: 0.5em; color: grey">output</span></div>
<code class="text">
<ggplot: (284767005)>
</code>
</pre>








Lets see if we can also include information about species and year








```python
ggplot(survs_df, aes('weight', 'hindfoot_length',
    size = 'year')) + geom_point()
```


![png](plotting_with_ggplot_files/plotting_with_ggplot_11_0.png)





<pre class="output">
<div style="text-align: right; margin: -1em; padding: 0;"><span style="font-size: 0.5em; color: grey">output</span></div>
<code class="text">
<ggplot: (286380601)>
</code>
</pre>















```python
ggplot(survs_df, aes('weight', 'hindfoot_length', 
    size = 'year', color = 'species_id')) + geom_point()
```


![png](plotting_with_ggplot_files/plotting_with_ggplot_13_0.png)





<pre class="output">
<div style="text-align: right; margin: -1em; padding: 0;"><span style="font-size: 0.5em; color: grey">output</span></div>
<code class="text">
<ggplot: (-9223372036569201569)>
</code>
</pre>








We can do simple counting plot, to see how many observation (data points) we have for each year for example








```python
ggplot(survs_df, aes('year')) + \
    geom_bar(stat = 'count')
```


![png](plotting_with_ggplot_files/plotting_with_ggplot_15_0.png)





<pre class="output">
<div style="text-align: right; margin: -1em; padding: 0;"><span style="font-size: 0.5em; color: grey">output</span></div>
<code class="text">
<ggplot: (278496583)>
</code>
</pre>








Let's now also color by species to see how many observation we have per species in a given year








```python
ggplot(survs_df, aes('year', fill = 'species_id')) + \
    geom_bar(stat = 'count')
```


![png](plotting_with_ggplot_files/plotting_with_ggplot_17_0.png)





<pre class="output">
<div style="text-align: right; margin: -1em; padding: 0;"><span style="font-size: 0.5em; color: grey">output</span></div>
<code class="text">
<ggplot: (286449640)>
</code>
</pre>














## Challenges

> Is there a better visualisation for comparing weight across years? The plot should have categorical data on x axis and continuous on y axis
> Plot a boxplot of `hindfoot_length` across different species (`species_id` column)







## More geom types








```python
ggplot(survs_df, aes('year', 'weight')) + \
    geom_boxplot()
```


![png](plotting_with_ggplot_files/plotting_with_ggplot_21_0.png)





<pre class="output">
<div style="text-align: right; margin: -1em; padding: 0;"><span style="font-size: 0.5em; color: grey">output</span></div>
<code class="text">
<ggplot: (285581467)>
</code>
</pre>







    
Why are we not seeing mulitple boxplots, one for each year?
This is because year variable is continues in our data frame, but for the purpose we want it to be categorical.








```python
survs_df['year_fact'] = pd.Series(survs_df['year'], dtype = "category")

ggplot(survs_df, aes('year_fact', 'weight')) + \
    geom_boxplot()
```


![png](plotting_with_ggplot_files/plotting_with_ggplot_23_0.png)





<pre class="output">
<div style="text-align: right; margin: -1em; padding: 0;"><span style="font-size: 0.5em; color: grey">output</span></div>
<code class="text">
<ggplot: (278186872)>
</code>
</pre>















```python
ggplot(survs_df, aes('year_fact', 'weight')) + \
    geom_violin()
```


![png](plotting_with_ggplot_files/plotting_with_ggplot_25_0.png)





<pre class="output">
<div style="text-align: right; margin: -1em; padding: 0;"><span style="font-size: 0.5em; color: grey">output</span></div>
<code class="text">
<ggplot: (277922673)>
</code>
</pre>








To save an image for later








```python
plt1 = ggplot(survs_df, aes('year_fact', 'weight')) + \
           geom_boxplot() + \
           xlab("Years") + \
           ylab("Weight log2(kg)") + \
           ggtitle("Boxplots, summary of species wieght in each year")

ggsave(filename = "plot1.png", \
       plot = plt1, \
       device = 'png', \
       dpi = 300, \
       height = 25, \
        width = 25)
```

<pre class="output">
<div class="output_label">output</div>
<code class="text">
/Users/perry/.virtualenvs/python-workshop-base-ufuVBSbV/lib/python3.6/site-packages/plotnine/ggplot.py:688: UserWarning: Saving 25 x 25 in image.
  from_inches(height, units), units))
/Users/perry/.virtualenvs/python-workshop-base-ufuVBSbV/lib/python3.6/site-packages/plotnine/ggplot.py:689: UserWarning: Filename: plot1.png
  warn('Filename: {}'.format(filename))

</code>
</pre>












## Challenges

> Can you log2 transform `weight` and plot "normalised" boxplot. Hint: use `np.log2()` function and name new column `weight_log`

Also will log2 transforming make this data visualisation better? 








```python
survs_df['weight_log'] = np.log2(survs_df['weight'])
    
ggplot(survs_df, aes('year_fact', 'weight_log')) + \
    geom_boxplot() + \
    xlab("Years") + \
    ylab("Weight log2(kg)") + \
    ggtitle("Boxplots, summary of species wieght in each year")
```


![png](plotting_with_ggplot_files/plotting_with_ggplot_30_0.png)





<pre class="output">
<div style="text-align: right; margin: -1em; padding: 0;"><span style="font-size: 0.5em; color: grey">output</span></div>
<code class="text">
<ggplot: (-9223372036569380359)>
</code>
</pre>














## Faceting

ggplot has a special technique called *faceting* that allows to split one plot
into multiple plots based on a factor included in the dataset. We will use it to
make one plot for a time series for each species.








```python
ggplot(survs_df, aes('year_fact', 'weight')) + \
    geom_boxplot() + \
    facet_wrap("~sex")
```


![png](plotting_with_ggplot_files/plotting_with_ggplot_33_0.png)





<pre class="output">
<div style="text-align: right; margin: -1em; padding: 0;"><span style="font-size: 0.5em; color: grey">output</span></div>
<code class="text">
<ggplot: (287051826)>
</code>
</pre>















```python
ggplot(survs_df, aes('year_fact', 'weight_log')) + \
    geom_boxplot() + \
    theme(axis_text_x = element_text(angle = 90, hjust = 1)) + \
    facet_wrap("~species_id") 
```


![png](plotting_with_ggplot_files/plotting_with_ggplot_35_0.png)





<pre class="output">
<div style="text-align: right; margin: -1em; padding: 0;"><span style="font-size: 0.5em; color: grey">output</span></div>
<code class="text">
<ggplot: (287767279)>
</code>
</pre>














## Theming








```python
ggplot(survs_df, aes('year_fact', 'weight')) + \
    geom_boxplot() + \
    theme_bw()
```


![png](plotting_with_ggplot_files/plotting_with_ggplot_38_0.png)





<pre class="output">
<div style="text-align: right; margin: -1em; padding: 0;"><span style="font-size: 0.5em; color: grey">output</span></div>
<code class="text">
<ggplot: (287209024)>
</code>
</pre>















```python
ggplot(survs_df, aes('year_fact', 'weight_log')) + \
    geom_boxplot() + \
    theme(axis_text_x = element_text(angle = 90, hjust = 1)) + \
    facet_wrap("~species_id") + \
    theme_xkcd()
```


![png](plotting_with_ggplot_files/plotting_with_ggplot_40_0.png)





<pre class="output">
<div style="text-align: right; margin: -1em; padding: 0;"><span style="font-size: 0.5em; color: grey">output</span></div>
<code class="text">
<ggplot: (-9223372036567434573)>
</code>
</pre>














## Extra bits 1

Let's try to bin years into decades, which could be crude but might gives simple images to look at.








```python
bins = [(survs_df['year'] < 1980),
        (survs_df['year'] < 1990),
        (survs_df['year'] < 2000),
        (survs_df['year'] >= 2000)]

labels = ['70s', '80s', '90s', 'Z']

survs_df['year_bins'] = np.select(bins, labels)
```













```python
plt2 = ggplot(survs_df, aes('year_bins', 'weight_log')) + \
           geom_boxplot()
plt2
```


![png](plotting_with_ggplot_files/plotting_with_ggplot_45_0.png)





<pre class="output">
<div style="text-align: right; margin: -1em; padding: 0;"><span style="font-size: 0.5em; color: grey">output</span></div>
<code class="text">
<ggplot: (277922659)>
</code>
</pre>















```python
plt2 = ggplot(survs_df, aes('year_bins', 'weight_log')) + \
           geom_boxplot() + \
           theme(axis_text_x = element_text(angle = 90, hjust = 1)) + \
           facet_wrap("~species_id") 
plt2
```


![png](plotting_with_ggplot_files/plotting_with_ggplot_47_0.png)





<pre class="output">
<div style="text-align: right; margin: -1em; padding: 0;"><span style="font-size: 0.5em; color: grey">output</span></div>
<code class="text">
<ggplot: (-9223372036569952245)>
</code>
</pre>














## Extra bits 2

This is a different way to look at your data








```python
ggplot(survs_df, aes("year_fact", "weight")) + \
    stat_summary(fun_y = np.mean, fun_ymin=np.min, fun_ymax=np.max) + \
    theme(axis_text_x = element_text(angle = 90, hjust = 1))
    
ggplot(survs_df, aes("year_fact", "weight")) + \
    stat_summary(fun_y = np.median, fun_ymin=np.min, fun_ymax=np.max) + \
    theme(axis_text_x = element_text(angle = 90, hjust = 1))
    
ggplot(survs_df, aes("year_fact", "weight_log")) + \
    stat_summary(fun_y = np.mean, fun_ymin=np.min, fun_ymax=np.max) + \
    theme(axis_text_x = element_text(angle = 90, hjust = 1))
```


![png](plotting_with_ggplot_files/plotting_with_ggplot_50_0.png)





<pre class="output">
<div style="text-align: right; margin: -1em; padding: 0;"><span style="font-size: 0.5em; color: grey">output</span></div>
<code class="text">
<ggplot: (-9223372036568109347)>
</code>
</pre>







    






## Extra bits 3

It is very informative to look across years, year by year, it becomes apparent straight away that for some species there is a lot of data is missing.And going forward, maybe, you'd want to filter those low counting species. (this is after faceting by `species_id` in section [Extra bits 1](#extra-bits-1)).








```python
#survs_cnts_df = survs_df.groupby(['species_id'], as_index=False).count().sort_values(['record_id'])
survs_cnts_df = survs_df[['species_id']].groupby(['species_id']).size().reset_index()
species_to_remove = list(survs_cnts_df[survs_cnts_df['record_id'] < 200].species_id)
survs_df_filt = survs_df[survs_df['species_id'].isin(species_to_remove) == False]
```


    ---------------------------------------------------------------------------

    KeyError                                  Traceback (most recent call last)

    ~/.virtualenvs/python-workshop-base-ufuVBSbV/lib/python3.6/site-packages/pandas/core/indexes/base.py in get_loc(self, key, method, tolerance)
       3062             try:
    -> 3063                 return self._engine.get_loc(key)
       3064             except KeyError:


    pandas/_libs/index.pyx in pandas._libs.index.IndexEngine.get_loc()


    pandas/_libs/index.pyx in pandas._libs.index.IndexEngine.get_loc()


    pandas/_libs/hashtable_class_helper.pxi in pandas._libs.hashtable.PyObjectHashTable.get_item()


    pandas/_libs/hashtable_class_helper.pxi in pandas._libs.hashtable.PyObjectHashTable.get_item()


    KeyError: 'record_id'

    
    During handling of the above exception, another exception occurred:


    KeyError                                  Traceback (most recent call last)

    <ipython-input-22-ded750b9ed33> in <module>()
          1 #survs_cnts_df = survs_df.groupby(['species_id'], as_index=False).count().sort_values(['record_id'])
          2 survs_cnts_df = survs_df[['species_id']].groupby(['species_id']).size().reset_index()
    ----> 3 species_to_remove = list(survs_cnts_df[survs_cnts_df['record_id'] < 200].species_id)
          4 survs_df_filt = survs_df[survs_df['species_id'].isin(species_to_remove) == False]


    ~/.virtualenvs/python-workshop-base-ufuVBSbV/lib/python3.6/site-packages/pandas/core/frame.py in __getitem__(self, key)
       2683             return self._getitem_multilevel(key)
       2684         else:
    -> 2685             return self._getitem_column(key)
       2686 
       2687     def _getitem_column(self, key):


    ~/.virtualenvs/python-workshop-base-ufuVBSbV/lib/python3.6/site-packages/pandas/core/frame.py in _getitem_column(self, key)
       2690         # get column
       2691         if self.columns.is_unique:
    -> 2692             return self._get_item_cache(key)
       2693 
       2694         # duplicate columns & possible reduce dimensionality


    ~/.virtualenvs/python-workshop-base-ufuVBSbV/lib/python3.6/site-packages/pandas/core/generic.py in _get_item_cache(self, item)
       2484         res = cache.get(item)
       2485         if res is None:
    -> 2486             values = self._data.get(item)
       2487             res = self._box_item_values(item, values)
       2488             cache[item] = res


    ~/.virtualenvs/python-workshop-base-ufuVBSbV/lib/python3.6/site-packages/pandas/core/internals.py in get(self, item, fastpath)
       4113 
       4114             if not isna(item):
    -> 4115                 loc = self.items.get_loc(item)
       4116             else:
       4117                 indexer = np.arange(len(self.items))[isna(self.items)]


    ~/.virtualenvs/python-workshop-base-ufuVBSbV/lib/python3.6/site-packages/pandas/core/indexes/base.py in get_loc(self, key, method, tolerance)
       3063                 return self._engine.get_loc(key)
       3064             except KeyError:
    -> 3065                 return self._engine.get_loc(self._maybe_cast_indexer(key))
       3066 
       3067         indexer = self.get_indexer([key], method=method, tolerance=tolerance)


    pandas/_libs/index.pyx in pandas._libs.index.IndexEngine.get_loc()


    pandas/_libs/index.pyx in pandas._libs.index.IndexEngine.get_loc()


    pandas/_libs/hashtable_class_helper.pxi in pandas._libs.hashtable.PyObjectHashTable.get_item()


    pandas/_libs/hashtable_class_helper.pxi in pandas._libs.hashtable.PyObjectHashTable.get_item()


    KeyError: 'record_id'














```python
ggplot(survs_df_filt, aes('year_fact', 'weight_log')) + \
    geom_boxplot() + \
    theme(axis_text_x = element_text(angle = 90, hjust = 1))

ggplot(survs_df_filt, aes('year_fact', 'weight_log')) + \
    geom_boxplot() + \
    theme(axis_text_x = element_text(angle = 90, hjust = 1)) + \
    facet_wrap("~species_id")
```


    ---------------------------------------------------------------------------

    NameError                                 Traceback (most recent call last)

    <ipython-input-23-56233734ec96> in <module>()
    ----> 1 ggplot(survs_df_filt, aes('year_fact', 'weight_log')) +     geom_boxplot() +     theme(axis_text_x = element_text(angle = 90, hjust = 1))
          2 
          3 ggplot(survs_df_filt, aes('year_fact', 'weight_log')) +     geom_boxplot() +     theme(axis_text_x = element_text(angle = 90, hjust = 1)) +     facet_wrap("~species_id")


    NameError: name 'survs_df_filt' is not defined










