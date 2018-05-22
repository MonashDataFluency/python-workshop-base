# Python workshops base

This is a base repository for Data Fluency Python Workshop modules.

To add or modify content, edit the notebooks in 
`workshops/docs/modules/notebooks`.

## Setup

Install [Pipenv](https://docs.pipenv.org/) (eg `pip install pipenv`).

Run:

```bash
pipenv install
```

You can enter the virtualenv with `pipenv shell`, or run single commands in the 
enviroment of the virtualenv with `pipenv run`.

## Modifying and building

Workshop modules can be found in `workshops/docs/modules/notebooks`.

To edit and update a module:
* edit the Jupyter Notebook, following the required [conventions](#jupyter-notebook-conventions).
* ensure your code runs
* save the notebook
* **stop the kernel for the notebook**

Then run:

```bash
# Export the notebooks, build the docs
pipenv run ./build.sh
```

This script runs `jupyter nbconvert` to generate Markdown from the notebooks, 
then runs `mkdocs build` to generate the static HTML.

New modules should be listed in `workshops/mkdocs.yml`, `workshops/docs/index.md` 
and possibly `workshops/docs/fullday.md` and/or `workshops/docs/halfday.md` if they form part of the 
full or half day workshops.

### Jupyter notebook conventions

* Challenges should be tagged `challenge` and **solutions should be tagged** `solution`.
  The `nbconvert` templates hide cells tagged `solution` from the main student notes,
  but output them for instructor notes.
  
Currently (May-2018) only `jupyter notebook` allows editing cell tags - the 
required UI for `jupyter lab` hasn't been completed yet. 

## Viewing the generated site

You can view the site locally via:

```bash
pipenv shell
cd workshops
mkdocs serve

# or, run
# pipenv run bash -c "cd workshops; mkdocs serve"
```

Go to [http://127.0.0.1:8000](http://127.0.0.1:8000)

## Deploying the static site to Github Pages

To update the site at https://MonashDataFluency.github.io/python-workshop-base/, run:

```bash
pipenv run ./deploy.sh
```

# License

This workshop material is made available under a 
[Creative Commons Attribution license (CC-BY 4.0)](https://creativecommons.org/licenses/by/4.0/legalcode)

Parts of this content have been adapted from the 
[Data Carpentry "Python for ecologists"](http://www.datacarpentry.org/python-ecology-lesson/) 
workshop material, used under a [CC-BY 4.0 license](https://creativecommons.org/licenses/by/4.0/legalcode).

Code is made available under the 
[MIT License](http://opensource.org/licenses/mit-license.html).

See [LICENCE.md](LICENSE.md) for the full text.
