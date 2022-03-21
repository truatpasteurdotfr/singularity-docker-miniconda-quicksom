# a miniconda based quicksom (https://github.com/bougui505/quicksom) container with pymol/pytorch
docker: [![Docker and Singularity build](https://github.com/truatpasteurdotfr/singularity-docker-miniconda-quicksom/actions/workflows/docker-singularity-publish.yml/badge.svg)](https://github.com/truatpasteurdotfr/singularity-docker-miniconda-quicksom/actions/workflows/docker-singularity-publish.yml)
```
docker pull ghcr.io/truatpasteurdotfr/singularity-docker-miniconda-quicksom:main
```
singularity:
```
singularity shell --nv oras://ghcr.io/truatpasteurdotfr/singularity-docker-miniconda-quicksom:latest
```

# test the examples
```
$ git clone https://github.com/bougui505/quicksom.git
$ cd quicksom
$ singularity --nv -B `pwd` oras://ghcr.io/truatpasteurdotfr/singularity-docker-miniconda-quicksom:latest
Singularity> dcd2npy --pdb data/2lj5.pdb --dcd data/2lj5.dcd --select 'name CA'
Singularity> time quicksom_fit -i data/2lj5.npy -o data/som_2lj5.p --n_iter 100 --batch_size 50 --periodic --alpha 0.5
Singularity> quicksom_gui -i data/som_2lj5.p
```
