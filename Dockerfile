FROM odoo:18.0

USER root

# Instale as dependências e configure o ambiente virtual
RUN apt-get update && apt-get install -y python3-venv libxml2-dev libxslt1-dev zlib1g-dev \
    && python3 -m venv /opt/venv \
    && /opt/venv/bin/pip install --no-cache-dir erpbrasil.base email-validator num2words phonenumbers brazilcep psycopg2-binary \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Configurar o PATH para incluir o ambiente virtual
ENV PATH="/opt/venv/bin:$PATH"

# Voltar para o usuário padrão do Odoo
USER odoo

# Configurar o comando padrão
CMD ["odoo"]
