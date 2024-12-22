#!/bin/bash
set -e

# Ativar o ambiente virtual
source /opt/venv/bin/activate

# Executar o comando original
exec "$@"
