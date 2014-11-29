#!/bin/sh
##Provisioning Vagrant Ubuntu VM for Variant Analysis and Primer Design

## Primer design pre-requisites. - should go to puppet
sudo easy_install Biopython bcbio-gff

if ! type "primer3" 2> /dev/null; then
  sudo apt-get -y install primer3
fi

## set up for Gisting
sudo gem install gist

###Screen config
# sudo apt-get -y install screen
# curl -o ~/.screenrc https://gist.githubusercontent.com/cfljam/610e9fe0a8ca23e80199/raw

### install  R2Py,PyBedtools and PyVCF - should go to puppet
sudo pip install rpy2 pyvcf

##install bedtools,cython and pybedtools
if ! type "bedtools" 2> /dev/null; then
  sudo apt-get -y install bedtools
fi

sudo pip install -U cython
#sudo pip install pybedtools
git clone https://github.com/daler/pybedtools.git
cd pybedtools
git pull
sudo python setup.py develop
cd
sudo rm -rf pybedtools



## install vcftools
if ! type "vcftools" 2> /dev/null; then
    echo "Installing vcftools"
    wget http://downloads.sourceforge.net/project/vcftools/vcftools_0.1.12b.tar.gz
    tar xzf vcftools_0.1.12b.tar.gz
    cd vcftools_0.1.12b/
    make
    sudo cp ./bin/* /usr/local/bin
    sudo cp ./perl/* /usr/local/bin
    echo "export PERL5LIB=$PERL5LIB:/usr/local/bin" >> ~/.bashrc
    cd ..
    rm -rf vcftools_0.1.12b*
fi

### Install vcflib
if ! type "vcfcheck" 2> /dev/null; then
  git clone --recursive https://github.com/ekg/vcflib.git
  cd vcflib
  make
  sudo cp bin/* /usr/local/bin
  cd
  rm -rf vcflib
fi

### Install BCFTools
if ! type "bcftools" 2> /dev/null; then
    git clone --branch=develop git://github.com/samtools/htslib.git
    git clone --branch=develop git://github.com/samtools/bcftools.git
    git clone --branch=develop git://github.com/samtools/samtools.git
    cd htslib; make; make test; sudo make install; cd ..
    cd samtools; make HTSDIR=../htslib; make test; sudo make install; cd ..
    cd bcftools; make HTSDIR=../htslib; make test; sudo make install; cd ..
    rm -r bcftools samtools htslib

fi

### Install Beagle 4
wget http://faculty.washington.edu/browning/beagle/beagle.r1398.jar
sudo mv beagle.r1398.jar /usr/local/bin
