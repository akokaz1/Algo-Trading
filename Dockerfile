# Start from a core stack version
FROM jupyter/datascience-notebook

RUN jupyter labextension install @jupyter-widgets/jupyterlab-manager
RUN jupyter labextension install @jupyterlab/toc
RUN jupyter labextension install @aquirdturtle/collapsible_headings
# JupyterLab renderer support
RUN jupyter labextension install jupyterlab-plotly@4.14.3

# OPTIONAL: Jupyter widgets extension
RUN jupyter labextension install @jupyter-widgets/jupyterlab-manager plotlywidget@4.14.3
USER root
RUN apt-get update


USER $NB_UID
ADD ./requirements.txt /home/jovyan/requirements.txt
RUN pip install -r /home/jovyan/requirements.txt