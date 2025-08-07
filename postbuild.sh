#!/bin/bash
set -e
uv sync
source ./.venv/bin/activate
mkdir -p ./modflow
python -c "from flopy.utils import get_modflow; get_modflow('./modflow')"
python -m ipykernel install --user --name hwrs564a
