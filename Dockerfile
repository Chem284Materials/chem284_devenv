FROM taylorabarnes/devenv-cuda:latest

ENV DEBIAN_FRONTEND=noninteractive

# This suppresses some harmless errors when running mpich
ENV HWLOC_HIDE_ERRORS=2

# run the build script
RUN apt-get clean && \
    apt-get update && \
    apt-get install -y \
                       libmpich-dev \
                       mpich \
                       && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Install PyCUDA and other Python packages
RUN python -m pip install --upgrade pip setuptools wheel && \
    python -m pip install \
                          numpy \
                          scipy \
                          matplotlib \
                          pandas \
                          jupyter
