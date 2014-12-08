FROM  ipython/scipystack

MAINTAINER John McCallum john.mccallum@plantandfood.co.nz

# Set noninterative mode
ENV DEBIAN_FRONTEND noninteractive

################## BEGIN INSTALLATION ######################

#RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
#RUN apt-get update
#RUN apt-get upgrade -y

##Note tweak to set Python 2.7 default

RUN apt-get install python-biopython -y; sed -i 's/python3/python2/' /usr/local/bin/ipython; pip install terminado bcbio-gff


##################### INSTALLATION END #####################

## Extremely basic test of install
RUN python2 -c  "import Bio,BCBio.GFF"
