# Python workshops base

This is a base repository for Data Fluency Python Workshop modules.

To add or modify content, edit the notebooks in `workshops/docs/modules/notebooks`.

## Setup

Install [Pipenv](https://docs.pipenv.org/) (eg `pip install pipenv`).

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

## Deploying the static site to Github Pages

To update the site at https://MonashDataFluency.github.io/python-workshop-base/, run:

```bash
deploy.sh
```

# License

This workshop material is made available under a [Creative Commons Attribution license (CC-BY 4.0)](https://creativecommons.org/licenses/by/4.0/legalcode)

Parts of this content have been adapted from the [Data Carpentry "Python for ecologists"](http://www.datacarpentry.org/python-ecology-lesson/) workshop material, used under a [CC-BY 4.0 license](https://creativecommons.org/licenses/by/4.0/legalcode).

Code is made available under the [MIT License](http://opensource.org/licenses/mit-license.html).

See [LICENCE.md](LICENSE.md) for the full text.
