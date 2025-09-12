#!/bin/bash
set -e
cd hwrs564a_course_materials
uv sync
mv .venv ..
cd ..
mkdir -p ./modflow
source ./.venv/bin/activate
python -c "from flopy.utils import get_modflow; get_modflow('./modflow')"
python -m ipykernel install --user --name hwrs564a
