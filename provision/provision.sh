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

### install  R2Py - should go to puppet

sudo pip install rpy2
