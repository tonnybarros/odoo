FROM odoo:18.0

USER root

# Instalar dependências do sistema e Python
RUN apt-get update && apt-get install -y --no-install-recommends \
    libxml2-dev libxslt1-dev zlib1g-dev python3-dev python3-pip && \
    pip install --no-cache-dir brazilcep erpbrasil.base email-validator num2words phonenumbers && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Ajustar permissões
RUN chown -R odoo:odoo /usr/local/lib/python3.*/dist-packages

USER odoo
