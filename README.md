# Python workshops base

This is a base repository for Data Fluency Python Workshop modules.

To add or modify content, edit the notebooks in 
`workshops/docs/modules/notebooks`.

## Quick start
```bash

# Create a virtualenv
conda create -n python-workshop -f conda-environment.frozen.yml

# ... or without exact dependency versions
# conda create -n python-workshop -f conda-environment.yml

git clone https://github.com/MonashDataFluency/python-workshop-base.git
cd python-workshop-base

# jupyter lab

# To generate the rendered html
jupyter-book build workshop/
```

You can edit notebooks in Jupyterlab, but the final version will be rendered based on the corresponding Markdown (MyST) files. Ensure any new notebooks you create are `jupytext` "Paired MyST notebooks".

If everything looks fine, commit your changes (ideally to a branch), `git push` and send a Pull Request.

## Jupyter-book fork plan

- All notebooks are `jupytext` MyST paired notebooks
- HTML (Github pages) is generated via `jupyter-book build`
- Contributers can edit the MyST Markdown (eg via the Github web interface)
  - Github Actions automatically runs `jupyter-book build`, pushes to `gh-pages` branch.
  - Notebooks are automatically regenerated using `jupytext --to notebook *.md`. These are kept alongside the `*.md` files on the main branch.
- Content developers can also edit the notebooks in JupyterLab - this requires with `jupytext` extension with MyST Markdown paired notebooks. The notebook and MyST output should be synchronised (by saving !) before committing.

### TODO:
- Ensure that https://monashdatafluency.github.io/python-workshop-base/ link is still the same with new published version
  - Also for https://monashdatafluency.github.io/python-workshop-base/fullday and https://monashdatafluency.github.io/python-workshop-base/halfday
- Ensure data download link (`surveys.csv`) near start of "Working with Data" is still correct.
- Investigate the possibility of generating student and instructor notes from a single source (ie, special cell tags recognized by MyST and/or Jupyter Book)
- Refactor notebook `functions.ipynb` to generate `.csv` files in a separate folder
- Make solutions hidden under [content reveal](https://jupyterbook.org/interactive/hiding.html#toggle-admonition-content-with-dropdowns)
----------------

### Jupyter notebook conventions

For small / quick edits to the content, the MyST markdown files can be edited directly - send a PR.

For more involved development, including new workshop modules, working Jupyter notebooks might be more comfortable.

The intention of developing the workshop materials directly from Jupyter notebooks is to:

1. Ensure code examples run correctly, catch errors early.
2. Make each module a self-contained unit, including pulling in dependencies.

Here are some conventions to follow to achieve this:

* **Package dependencies**: Include a `!pip install somepackage` cell near to start of every module
  that installs any required dependencies. This makes the modules work as standalone units in a range 
  of environments (local Jupyter or IPython REPL, Azure Notebooks, Colaboratory, Python Anywhere).
* **Acquire data via URLs in the notebook**: Include cells like `import urllib; urllib.request.urlretrieve("https://files.rcsb.org/download/3FPR.pdb")` to download external data.
  This allows the notes to be used in various hosted or local Jupyter environments 
  (it's also a useful operation for students to learn).


# License

This workshop material is made available under a 
[Creative Commons Attribution license (CC-BY 4.0)](https://creativecommons.org/licenses/by/4.0/legalcode)

Parts of this content have been adapted from the 
[Data Carpentry "Python for ecologists"](http://www.datacarpentry.org/python-ecology-lesson/) 
workshop material, used under a [CC-BY 4.0 license](https://creativecommons.org/licenses/by/4.0/legalcode).

Code is made available under the 
[MIT License](http://opensource.org/licenses/mit-license.html).

See [LICENCE.md](LICENSE.md) for the full text.
