#!/usr/bin/env python3
# Hacky script to take Markdown with ```python code blocks
# and convert to a ipynb format Jupyter notebook.
# The result will almost always need hand editing in Jupyter after
# conversion.
#
# Usage:
#
# python markdown2ipynb.py some_markdown.md >a_notebook.ipynb

import sys
import json

with open(sys.argv[1], 'r') as f:
    content = f.readlines()

metadata = {
    "metadata": {
        "celltoolbar": "Tags",
        "kernelspec": {
            "display_name": "Python 3",
            "language": "python",
            "name": "python3"
        },
        "language_info": {
            "codemirror_mode": {
                "name": "ipython",
                "version": 3
            },
            "file_extension": ".py",
            "mimetype": "text/x-python",
            "name": "python",
            "nbconvert_exporter": "python",
            "pygments_lexer": "ipython3",
            "version": "3.6.3"
        }
    },
    "nbformat": 4,
    "nbformat_minor": 2
}

cells = {"cells": []}
split_at_markdown_h2 = True
in_python_block = False
source = []
for line in content:
    if line.startswith("```python"):
        in_python_block = True
        # source_lines = ["%s\n" % l for l in source]
        cells['cells'].append(
            {"cell_type": "markdown",
             "metadata": {},
             "source": list(source)})
        source = []
        continue

    if in_python_block and line.startswith("```"):
        in_python_block = False
        cells['cells'].append(
            {"cell_type": "code",
             "metadata": {},
             "outputs": [],
             "execution_count": 0,
             "source": list(source)})
        source = []
        continue

    if not in_python_block:
        if split_at_markdown_h2 and line.startswith("## "):
            cells['cells'].append(
                {"cell_type": "markdown",
                 "metadata": {},
                 "source": list(source)})
            source = []
            source.append(line)
            continue

    source.append(line)

cells.update(metadata)
print(json.dumps(cells, indent=2))
