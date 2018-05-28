#!/bin/bash
set -e

INPUT_DIR="workshops/docs/modules/notebooks"
OUT_DIR="workshops/docs/modules"
TEMPLATE_DIR="workshops/docs/modules/notebooks/nbconvert_templates"

# We allow errors (--allow-errors) when executing to catch and broken examples.
# Any example that requires printing a traceback should be moved into a
# Markdown example cell so that code is displayed by not executed.

# ggplot/plotnine cells are sometimes slow, so we increase the default timeout
# EXECUTE="--execute --allow-errors --ExecutePreprocessor.timeout=240"
EXECUTE="--execute --ExecutePreprocessor.timeout=240"

generate_html='no'
generate_instructor_notes='no'

index=1
for f in ${INPUT_DIR}/*.ipynb; do
  fn=$(basename -- "$f")
  name="${fn%.*}"

  if [ -d ${OUT_DIR}/${name}_files ]; then
    echo "Removing old generated images from ${OUT_DIR}/${name}_files/"
    rm ${OUT_DIR}/${name}_files/*
  fi

  printf -v i "%02d" $index

  if [[ generate_html == 'yes' ]]; then
    if [[ generate_instructor_notes == 'yes' ]]; then
      jupyter nbconvert ${EXECUTE} \
                        --to html \
                        --config=export_config.py \
                        --output-dir=$OUT_DIR \
                        --template=$TEMPLATE_DIR/instructor.tpl \
                        --output=${name}_instructor_notes.html \
                        $INPUT_DIR/${name}.ipynb
    fi

    jupyter nbconvert ${EXECUTE} \
                      --to html \
                      --config=export_config.py \
                      --output-dir=$OUT_DIR \
                      --template=$TEMPLATE_DIR/student.tpl \
                      --output=${name}.html \
                      $INPUT_DIR/${name}.ipynb
  fi

  if [[ generate_instructor_notes == 'yes' ]]; then
    jupyter nbconvert ${EXECUTE} \
                      --to markdown \
                      --config=export_config.py \
                      --output-dir=$OUT_DIR \
                      --template=$TEMPLATE_DIR/instructor_markdown.tpl \
                      --output=${name}_instructor_notes.md \
                      $INPUT_DIR/${name}.ipynb
  fi

  jupyter nbconvert ${EXECUTE} \
                    --to markdown \
                    --config=export_config.py \
                    --output-dir=$OUT_DIR \
                    --template=$TEMPLATE_DIR/student_markdown.tpl \
                    --output=${name}.md \
                    $INPUT_DIR/${name}.ipynb

  let "index++"

done

#jupyter nbconvert --to slides --output-dir=docs/slides \
#                              --reveal-prefix reveal.js \
#                              --output=Preamble \
#                              docs/slides/Preamble.ipynb

cd workshops
mkdocs build
cd ..
