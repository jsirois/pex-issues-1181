FROM docker.io/nginx/unit:1.21.0-python3.7
RUN apt update && apt install -y python3 python3-distutils
COPY apigateway.pex /app.pex
RUN PEX_TOOLS=1 ./app.pex venv /app

