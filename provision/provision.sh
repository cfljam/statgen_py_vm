#!/bin/sh
##Provisioning Vagrant Ubuntu VM for Variant Analysis and Primer Design

## Primer design pre-requisites. - should go to puppet
sudo easy_install Biopython bcbio-gff
sudo apt-get -y install primer3

## set up for Gisting
sudo gem install gist

###Screen config
# sudo apt-get -y install screen
# curl -o ~/.screenrc https://gist.githubusercontent.com/cfljam/610e9fe0a8ca23e80199/raw


##install bedtools
#sudo apt-get -y install bedtools
git clone https://github.com/daler/pybedtools.git
cd pybedtools
git pull
sudo python setup.py develop
cd

## install vcftools
if ! type "vcftools" 2> /dev/null; then
    echo "Installing vcftools"
    wget http://downloads.sourceforge.net/project/vcftools/vcftools_0.1.12b.tar.gz
    tar xzf vcftools_0.1.12b.tar.gz
    cd vcftools_0.1.12b/
    make
    sudo cp ./bin/* /usr/local/bin
    cd ..
    rm -rf vcftools_0.1.12b
fi

### install  R2Py,PyBedtools and PyVCF - should go to puppet
sudo pip install rpy2 pyvcf pybedtools
