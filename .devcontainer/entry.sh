#!/bin/bash

#echo "export PATH=$PATH:/opt/conda/bin" >> ~/.bashrc

# Install VS Code extensions and themes
mkdir -p /home/jovyan/.local/share/code-server/extensions
code-server --install-extension ms-python.python \
    && code-server --install-extension ms-toolsai.jupyter \
    && code-server --install-extension charliermarsh.ruff \
    && code-server --install-extension catppuccin.catppuccin-vsc \
    && code-server --install-extension arcticicestudio.nord-visual-studio-code

git clone https://github.com/HWRS564-hydrogeologic-analysis/hwrs564a_course_materials.git
cd hwrs564a_course_materials

source .venv/bin/activate
uv sync

echo "Python environment activated."
echo `which python`
echo "Python version: $(python --version)"

echo "Installing required Python packages..."
python -c "from flopy.utils import get_modflow; get_modflow('./modflow')"
python -m ipykernel install --user --name hwrs564a --display-name "Python (hwrs564a)"

code-server --auth none --host 0.0.0.0 --disable-telemetry --disable-update-check --port 8080 .