#!/usr/bin/env bash

set -euo pipefail
cd "$(git rev-parse --show-toplevel)"

PYTHON=${PYTHON:-python3.7}

${PYTHON} -mvenv pex.venv
pex.venv/bin/pip install -U pip
pex.venv/bin/pip install pex==2.1.24
pex.venv/bin/pex -D src/ fastapi==0.63.0 -o apigateway.pex --include-tools

docker build -t pex-issues-1181 .
docker run --mount type=bind,src="$(pwd)/config/",dst=/docker-entrypoint.d/ -p8000:8000 pex-issues-1181
