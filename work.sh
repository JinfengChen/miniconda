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
cd conda-recipes/relocate2
conda build .
conda install relocate2 --use-local
#conda search bwa
