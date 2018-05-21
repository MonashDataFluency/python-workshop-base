# Python workshops base

## TODO

* Convert these TODOs to Github issues, remove them from here.

* Clean up content to make sense in a Jupyter notebook
  - remove references to the terminal, remove chevrons `>>>`
  - make output examples real output from code cells)
  - remove empty newlines at the start/end of cells
  - final code example Extra bit 3 in ggplot notebook broken ?

* Fix image and data links in notebooks (`images/someimg.svg`, `data/surveys.csv`)

* Sort modules in logical order in `mkdocs.yml`.
  - Add module list to `workshops/halfday.md` use numeric prefixes "01 - Intro" here, but not in the module/notebook names (they may be composed in different orders for different workshops).
  
* More carefully crafted multiple choice questions - convert some challenges.

* Add 'challenge' and 'solution' tags to cell (Jupyter Notebook only, no UI yet in Juypter Lab)

* Pull in data via URLs at the start of each module, to make the self contained.

* Add eg `!pip install pandas numpy plotnine` at the top of each module, 
  to pull in required dependencies.

* Move intentional traceback cells into Markdown cells to allow execution on build.


## Setup

Install [Pipenv](https://docs.pipenv.org/).

Run:

```bash
pipenv install
```

## Modifying and building

Workshop modules can be found in `workshops/docs/modules/notebooks`.

To edit and update a module:
* edit the Juypter Notebook
* ensure your code runs
* save the notebook
* **stop the kernel for the notebook**

Then run:

```bash
# Activate the virtualenv
pipenv shell

# Export the notebooks, build the docs
./build.sh
```

This script runs `jupyter nbconvert` to generate Markdown from the notebooks, then run `mkdocs build` to generate the static HTML.

New modules should be added to `workshops/mkdocs.yml` and possibly `workshops/fullday.md` and/or `workshops/halfday.md` if they form part of the full or half day workshops.

## Viewing the generated site

You can view the site locally via:

```bash
cd workshops
mkdocs serve
```

Go to [http://127.0.0.1:8000](http://127.0.0.1:8000)

# License

This workshop material is made available under a [Creative Commons Attribution license (CC-BY 4.0)](https://creativecommons.org/licenses/by/4.0/legalcode)

Parts of this content have been adapted from the [Data Carpentry "Python for ecologists"](http://www.datacarpentry.org/python-ecology-lesson/) workshop material, used under a [CC-BY 4.0 license](https://creativecommons.org/licenses/by/4.0/legalcode).

Code is made available under the [MIT License](http://opensource.org/licenses/mit-license.html).

See [LICENCE.md](LICENSE.md) for the full text.
