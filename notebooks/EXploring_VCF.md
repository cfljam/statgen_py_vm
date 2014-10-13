Exploring the VCF File Format
==========================

- VCF= variant call format
- developed for 1000 genome project variant data
- an interval format
- [VCF Specifications ](http://vcftools.sourceforge.net/specs.html)
- usually stored compressed

#### List vcf files in our vagrant share
ls /vagrant_data/*vcf*

#### Inspect the top 100 lines of the file using zcat

- this command is one of several for looking at compressed files
- see [this link](http://www.thegeekstuff.com/2009/05/zcat-zless-zgrep-zdiff-zcmp-zmore-gzip-file-operations-on-the-compressed-files/) for more info
- we pipe the output into the head command

!zcat /vagrant_data/Chr1_1Mb.vcf.gz | head -n 100

#### Try to get a list of the sample names

!vcfsamplenames /vagrant_data/Chr1_1Mb.vcf.gz

#### Index with Tabix

- indices are central to high performance file access
- typically compress vcf files with **bgzip**, then index with **tabix**
- use the %%bash cell magic. Read about iPython cell **magics** [here](http://nbviewer.ipython.org/github/ipython/ipython/blob/1.x/examples/notebooks/Cell%20Magics.ipynb)
- list the files. We can see a tabix index file has been created

%%bash
tabix -f /vagrant_data/Chr1_1Mb.vcf.gz
ls -l /vagrant_data

#### get a list of the sample names

- capture the output of a shell command in a Python string variable

%%bash --out=vcf_names
vcfsamplenames /vagrant_data/Chr1_1Mb.vcf.gz

vcf_names.strip().split('\n')
