#!/bin/bash
set -e
dir=$(find . -maxdepth 1 -type d -name "hwrs564a_cours_materials_*" | head -n 1)
cd $dir
uv venv
uv sync
source ./.venv/bin/activate
cd ..
mkdir -p ./modflow
python -c "from flopy.utils import get_modflow; get_modflow('./modflow')"
python -m ipykernel install --user --name hwrs564a
