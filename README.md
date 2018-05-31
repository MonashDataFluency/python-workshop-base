# Python workshops base

This is a base repository for Data Fluency Python Workshop modules.

To add or modify content, edit the notebooks in 
`workshops/docs/modules/notebooks`.

## Quick start
```bash
# Install pipenv to ~/.local/bin/pipenv
pip install --user pipenv

git clone https://github.com/MonashDataFluency/python-workshop-base.git
cd python-workshop-base

# Install dependencies
pipenv install

# Enter the virtual environment
pipenv shell
jupyter notebook
# Edit the notebooks in workshops/docs/modules/notebooks
# Ctrl-C in terminal to stop Jupyter when you are done
./build.sh

# To view the generated site
cd workshops
open http://127.0.0.1:8000 && mkdocs serve
```

If everything looks fine, commit your changes (ideally to a branch), `git push` and send a Pull Request.

To deploy the public docs, [see here](#deploying-the-static-site-to-github-pages).

----

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

The intention of developing the workshop materials directly from Jupyter notebooks is to:

1. Ensure code examples run correctly, catch errors early.
2. Make each module a self-contained unit, including pulling in dependencies.
3. Enable generation of student and instructor notes from a single source.

Here are some conventions to follow to achieve this:

* **Cell tagging**: challenges should be tagged `challenge` and **solutions should be tagged** `solution`.
  The `nbconvert` templates hide cells tagged `solution` from the main student notes,
  but output them for instructor notes. Currently (May-2018) only `jupyter notebook` 
  allows editing cell tags - the required UI for `jupyter lab` hasn't been completed yet.
* **Package dependencies**: Include a `!pip install somepackage` cell near to start of every module
  that installs any required dependencies. This makes the modules work as standalone units in a range 
  of environments (local Jupyter or IPython REPL, Azure Notebooks, Colaboratory, Python Anywhere).
* **Acquire data via URLs in the notebook**: Include cells like `import urllib; urllib.request.urlretrieve("https://files.rcsb.org/download/3FPR.pdb")` to download external data.
  This allows the notes to be used in various hosted or local Jupyter environments 
  (it's also a useful operation for students to learn).

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
