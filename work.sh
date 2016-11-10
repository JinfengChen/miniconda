wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh
bash Miniconda3-latest-Linux-x86_64.sh
source ~/.bashrc
conda config --add channels r
conda config --add channels bioconda
conda config --add channels conda-forge
conda install -c bioconda whatshap

echo "add bwa to bioconda-recipes"
git clone https://github.com/JinfengChen/bioconda-recipes.git
#add recipes in recipes/bwa/0.6.2/
git checkout -b relocate2
git branch
git add recipes/bwa/0.6.2/** 
git commit -m "bwa_v0.6.2"
git remote add update https://github.com/JinfengChen/bioconda-recipes.git
git push --set-upstream origin bwa-0.6.2
#pull request in github

echo "RelocaTE2 recipes"
wget https://repo.continuum.io/miniconda/Miniconda2-latest-Linux-x86_64.sh
bash Miniconda2-latest-Linux-x86_64.sh
source ~/.bashrc
conda config --add channels r
conda config --add channels bioconda
conda config --add channels conda-forge
conda update conda
conda install conda-build
git clone https://github.com/conda/conda-recipes.git
#install ncurses, which cause problem when using -n
#conda build conda-recipes/ncurses/
#cd conda-recipes/ncurses/
#conda install ncurses --use-local -n relocate2 -m
#install relocate2
cd conda-recipes/relocate2
conda build .
conda install relocate2 --use-local -n relocate2 -m
#conda search bwa
#resintall relocate2
conda remove relocate2 -n relocate2
conda build .
conda install relocate2 --use-local -n relocate2 -m
#conda user install
#--mkdir Create the environment directory if necessary
#--use-local Use locally built packages
#--name Name of environment (in envs dirs).
conda install --mkdir --use-local --name RelocaTE2 relocate2
#conda user uninstall
#remove only relocate2
conda remove --name RelocaTE2 relocate2
#remove all env
conda remove --name RelocaTE2 --all


echo "add relocate2 to bioconda-recipes"
git branch
git add recipes/relocate2/**
git commit -m "RelocaTE2.v2.0.0"
git remote add update https://github.com/JinfengChen/bioconda-recipes.git
git push --set-upstream origin relocate2

