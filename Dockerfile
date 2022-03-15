FROM continuumio/miniconda3
MAINTAINER Tru Huynh <tru@pasteur.fr>

RUN	conda update --yes -n base -c defaults conda && \
	conda update --yes --all 
RUN eval "$(/opt/conda/bin/conda shell.bash hook)" && \
	conda install pytorch torchvision torchaudio cudatoolkit=11.3 -c pytorch

# jupyter/ conda packages.
ENV PATH="/opt/conda/bin:$PATH"
RUN conda update -qy conda \
    && conda install -y -c conda-forge \
      jupyterlab \
      py3dmol \
      matplotlib

# pymol requirements
RUN apt-get update && apt-get -y install \
	gcc g++ git    \
	libglew-dev    \
	libglm-dev     \
	libnetcdf-dev  \
	libmsgpack-dev \
	libxi6 \
	libxinerama1 \
	xkb-data \
	libxkbcommon0

RUN	git clone https://github.com/schrodinger/pymol-open-source.git && \
	git clone https://github.com/rcsb/mmtf-cpp.git && \
	mv mmtf-cpp/include/mmtf* pymol-open-source/include/ && \
	cd pymol-open-source && \
	python3 setup.py build install 

# quicksom
RUN python3 -m pip install quicksom
RUN date +"%Y-%m-%d-%H%M" > /last_update

