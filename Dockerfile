FROM apache/superset:3.1.3-dev

USER root

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get clean

RUN pip install --trusted-host pypi.org --trusted-host files.pythonhosted.org --upgrade pip setuptools
RUN pip install --trusted-host pypi.org --trusted-host files.pythonhosted.org psycopg2 pyhive elasticsearch-dbapi ibm_db_sa sqlalchemy-trino authlib


RUN chown -R superset /usr/local/share/ca-certificates/ && \
    chown -R superset /etc/ssl/certs && \
    chown -R superset /usr/share/ca-certificates && \
    chown -R superset /etc/ca-certificates.conf
COPY docker-entrypoint.sh /usr/bin/docker-entrypoint.sh
ENTRYPOINT ["/usr/bin/docker-entrypoint.sh"]
USER superset