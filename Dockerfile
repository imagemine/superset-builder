FROM preset/superset:dev

USER root
RUN pip install --trusted-host pypi.org --trusted-host files.pythonhosted.org --upgrade pip setuptools
RUN pip install --trusted-host pypi.org --trusted-host files.pythonhosted.org psycopg2 pyhive elasticsearch-dbapi ibm_db_sa sqlalchemy-trino

RUN chown -R superset /usr/local/share/ca-certificates/ && \
    chown -R superset /etc/ssl/certs
COPY docker-entrypoint.sh /usr/bin/docker-entrypoint.sh
ENTRYPOINT ["/usr/bin/docker-entrypoint.sh"]
USER superset


