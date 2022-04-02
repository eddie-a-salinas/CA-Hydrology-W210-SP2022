# w210 final
# docker build -t w210 -f Dockerfile .
# docker run --rm --gpus all -p 8888:8888 -p 6006:6006 -it -v ${PWD}/:/content "w210" bash
# docker run --rm -p 8888:8888 -p 6006:6006 -it -v ${PWD}/:/content "w210" bash

FROM nvcr.io/nvidia/tensorflow:21.08-tf2-py3

RUN pip3 install numpy
RUN pip3 install h5py
RUN pip3 install matplotlib
RUN pip3 install Keras
RUN pip3 install pydot
RUN pip3 install graphviz
RUN pip3 install ipywidgets

RUN apt-get update -y
RUN apt install graphviz -y
RUN pip3 install pandas
RUN pip3 install sklearn
RUN pip3 install torch
RUN pip3 install statsmodels
RUN pip3 install seaborn

#for geopandas and related plotting
RUN apt-get install -y libproj-dev proj-data proj-bin  
RUN apt-get install -y libgeos-dev 
RUN pip3 install geopandas
RUN pip3 install cartopy==0.19.0.post1
RUN pip3 install geoplot


RUN jupyter nbextension enable --py widgetsnbextension

WORKDIR /content/
