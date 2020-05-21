# Start from a core stack version
FROM jupyter/datascience-notebook

RUN jupyter labextension install @oriolmirosa/jupyterlab_materialdarker
RUN jupyter labextension install @jupyter-widgets/jupyterlab-manager
RUN jupyter labextension install @jupyterlab/toc
RUN jupyter labextension install @aquirdturtle/collapsible_headings
RUN jupyter labextension install qgrid2
USER root
RUN apt-get update
RUN apt-get install libpq-dev -y


USER $NB_UID
ADD ./requirements.txt /home/jovyan/requirements.txt
RUN pip install -r /home/jovyan/requirements.txt
RUN pip install git+https://github.com/statsmodels/statsmodels.git