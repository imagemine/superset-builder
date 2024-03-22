FROM apache/superset:3.1.0-dev

USER root

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get clean

RUN pip install --trusted-host pypi.org --trusted-host files.pythonhosted.org --upgrade pip setuptools
RUN pip install --trusted-host pypi.org --trusted-host files.pythonhosted.org psycopg2 pyhive elasticsearch-dbapi ibm_db_sa sqlalchemy-trino authlib
RUN pip install 'jinja2==3.1.3' --force-reinstall
RUN pip install 'werkzeug==2.3.8' --force-reinstall
RUN pip install 'paramiko==3.4.0' --force-reinstall
RUN pip install 'urllib3==1.26.18' --force-reinstall
RUN pip install 'gevent==23.9.0' --force-reinstall
RUN pip install 'cryptography==41.0.6' --force-reinstall
RUN pip install 'Pillow==10.2.0' --force-reinstall
RUN python3.9 -m pip install 'Pillow==10.2.0' --force-reinstall

RUN chown -R superset /usr/local/share/ca-certificates/ && \
    chown -R superset /etc/ssl/certs && \
    chown -R superset /usr/share/ca-certificates && \
    chown -R superset /etc/ca-certificates.conf
COPY docker-entrypoint.sh /usr/bin/docker-entrypoint.sh
ENTRYPOINT ["/usr/bin/docker-entrypoint.sh"]
USER superset