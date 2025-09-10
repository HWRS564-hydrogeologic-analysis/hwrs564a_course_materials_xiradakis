#!/bin/bash
set -e
cd hwrs564a_course_materials
uv sync
source ./.venv/bin/activate
cd ..
mkdir -p ./modflow
python -c "from flopy.utils import get_modflow; get_modflow('./modflow')"
python -m ipykernel install --user --name hwrs564a
