FROM nvcr.io/nvidia/pytorch:22.01-py3

# Set environment variable to non-interactive (this avoids some prompts)
ENV DEBIAN_FRONTEND noninteractive

# Install system dependencies
RUN apt-get update && \
    apt-get install -yq --no-install-recommends \
    wget \
    build-essential \
    g++ \
    gcc \
    libgl1-mesa-glx \
    libglib2.0-0 \
    openmpi-bin \
    openmpi-common \
    libopenmpi-dev \
    libgtk2.0-dev \
    git \
    tmux \
    vim && \
    rm -rf /var/lib/apt/lists/*

# Set up Conda environment and path
ENV CONDA_DIR /opt/conda
ENV PATH=$CONDA_DIR/bin:$PATH

# Install Python packages
RUN pip install --no-cache-dir Pillow==8.4.0 tqdm torchpack \
    mmcv==1.4.0 mmcv-full==1.4.0 mmdet==2.20.0 nuscenes-devkit \
    mpi4py==3.0.3 openmim opendatalab odl

# Install numba and llvmlite via Conda to avoid uninstall issues
RUN conda install -c conda-forge numba==0.48.0
