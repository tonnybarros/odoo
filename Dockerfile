FROM odoo:18.0

USER root

# Instale e configure o ambiente virtual
RUN apt-get update && apt-get install -y python3-venv \
    && python3 -m venv /opt/venv \
    && /opt/venv/bin/pip install --no-cache-dir erpbrasil.base email-validator num2words phonenumbers brazilcep \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Configurar o PATH para incluir o ambiente virtual
ENV PATH="/opt/venv/bin:$PATH"

# Copiar o script de inicialização
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Voltar para o usuário padrão do Odoo
USER odoo

# Configurar o entrypoint e o comando padrão
ENTRYPOINT ["/entrypoint.sh"]
CMD ["odoo"]
