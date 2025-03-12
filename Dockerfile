FROM condaforge/miniforge3:24.11.3-0

ENV CONDA_DIR=/opt/conda
# Use bash as a login shell so that conda is initialized
SHELL ["/bin/bash", "--login", "-c"]

# Copy environment file
COPY environment.yml /tmp/environment.yml

RUN conda create -v -y --prefix ${CONDA_DIR}/envs/paintshop -c conda-forge -c bioconda python=3.6 mamba snakemake && \
   source activate paintshop && \
   mamba env create --prefix ${CONDA_DIR}/envs/paintshop_snakemake -f /tmp/environment.yml && \
   source activate ${CONDA_DIR} && \
   mamba install --prefix ${CONDA_DIR}/envs/paintshop python=3.8.3 && \
   mamba install --prefix ${CONDA_DIR}/envs/paintshop_snakemake -c conda-forge -c bioconda libdeflate=1.6 tbb=2020.2 biopython=1.77 xgboost=1.3.3 && \
   conda clean --tarballs --index-cache --packages --yes && \
   conda clean --force-pkgs-dirs --all --yes


# Copy the entrypoint script into the container
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
