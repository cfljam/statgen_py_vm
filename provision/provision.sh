#!/bin/sh
##Provisioning Vagrant Ubuntu VM for Variant Analysis and Primer Design
sudo apt-get update
## Primer design pre-requisites
sudo easy_install Biopython bcbio-gff
sudo apt-get -y install primer3

## set up for Gisting
sudo apt-get -y install rubygems
sudo gem install gist

###Screen config
sudo apt-get -y install screen
curl -o ~/.screenrc https://gist.githubusercontent.com/cfljam/610e9fe0a8ca23e80199/raw

### install R base and R2Py
sudo apt-get -y install r-base-dev r-base-dev
sudo pip install rpy2

## install automake
sudo apt-get -y install autoconf
