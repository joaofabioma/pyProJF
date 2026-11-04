#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")"

VENV_DIR=".venv"
PYTHON_BIN="${VENV_DIR}/bin/python"

if [ ! -x "$PYTHON_BIN" ]; then
  echo "Criando ambiente virtual em ${VENV_DIR}..."
  python3 -m venv "$VENV_DIR"
fi

echo "Instalando dependências com pip..."
"$PYTHON_BIN" -m pip install --upgrade pip
"$PYTHON_BIN" -m pip install -r requirements.txt

echo "Iniciando aplicação em produção com Waitress..."
exec "$PYTHON_BIN" -m waitress --host 0.0.0.0 --port 5191 app:app
