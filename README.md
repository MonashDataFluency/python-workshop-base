# Python workshops base

This is a base repository for Data Fluency Python Workshop modules.

To add or modify content, edit the Quarto `.qmd` files in 
`workshops/docs/modules`.

## Quick start
```bash
# Clone the repo
git clone https://github.com/MonashDataFluency/python-workshop-base.git
cd python-workshop-base

# Create a conda environment
conda env create -n python-workshop -f conda-environment.frozen.yml

# ... or without exact dependency versions
# conda create -n python-workshop -f conda-environment.yml

conda activate python-workshop

# Install quarto from https://quarto.org/download/
# NOTE: In the future, `conda install -c conda-forge quarto` should work, 
# and will be included in conda-environment.yml 
# however the package appears broken on Linux at the moment, so you'll
# need to install Quarto manually for now.

# Preview your changes in the browser
quarto preview

# To generate the rendered html into the `docs/` folder
# Github Actions will do this automatically when you push to the main branch
quarto render
```

To modify the content, edit the Quarto files in `workshop/modules/*.qmd`. You can even do this directly within Github and send a pull request (PR) of your proposed changes.

When a new version of the site is rendered via Github Actions, Jupyter notebooks are automatically generated from the Quarto Markdown.

## Quarto fork plan / checklist
- [x] Convert notebooks to qmds with `quarto convert`
- [ ] Investigate rendering of challenge solutions (`code-fold: true` or [custom hide/reveal like ?](http://melbournebioinformatics.github.io/MelBioInf_docs/tutorials/qiime2/qiime2/#tutorial-layout)), extra instructor notes
- Github Actions:
  - [ ] HTML is generated via Github Action, into `docs` [`quarto render`](https://quarto.org/docs/websites/#website-render)
  - [ ] Automatically generate notebooks are automatically regenerated using [`for md in *.qmd; do quarto convert $md; done`](https://quarto.org/docs/tools/jupyter-lab.html#converting-notebooks). These are kept alongside the `*.qmd` files on the main branch.

- [ ] Ensure that https://monashdatafluency.github.io/python-workshop-base/ link is still the same with new published version
- [ ] Ensure https://monashdatafluency.github.io/python-workshop-base/fullday and https://monashdatafluency.github.io/python-workshop-base/halfday are correct
- [ ] Ensure data download link (`surveys.csv`) near start of "Working with Data" is still correct.
- [ ] Refactor notebook `functions.qmd` to generate `.csv` files in a separate folder
----------------

### Content conventions

For small / quick edits to the content, the Quarto markdown files can be edited directly - send a PR.

For more involved development, including new workshop modules, working Jupyter notebooks might be more efficient when testing code examples. Use [`quarto convert`](https://quarto.org/docs/computations/python.html#jupyter-lab) to convert between Quarto (`.qmd`) and IPython notebooks (`.ipynb`).

Some guidelines:

- Make each module a self-contained unit, including pulling in dependencies.
- Ensure your code examples run correctly in the context of the whole module. These should work when running the module from start to finish in a freshly initialized Python session.
- Check the rendered HTML output using `quarto preview` - as a final check be sure to look at that whole module (_after_ the part you've edited) to ensure your changes didn't break any downstream example.

Here are some conventions to follow to help achieve this:

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
