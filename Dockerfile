FROM preset/superset:dev

USER root
RUN pip install --trusted-host pypi.org --trusted-host files.pythonhosted.org --upgrade pip setuptools
RUN pip install --trusted-host pypi.org --trusted-host files.pythonhosted.org psycopg2 pyhive elasticsearch-dbapi ibm_db_sa sqlalchemy-trino

USER superset


