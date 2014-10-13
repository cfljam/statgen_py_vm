stats_py_vm
===========

* VM for statistical genetics with iPython, R and CL tools
* Forked from https://github.com/gavinln/stats_py_vm
* Puppet Module for R from https://github.com/forward3d/puppet-r





About
-----

This project provides a [Ubuntu (14.04 )][2] [Vagrant][3] Virtual Machine (VM) with numerical and
scientific libraries for Python and R.

It includes the following Python libraries.

* [Numpy][4]
* [Scipy][5]
* [Matplotlib][6]
* [IPython-console][7]
* [IPython-notebook][8]
* [Sympy][9]
* [Pandas][10]
* [Statsmodels][11]
* [Scikit learn][12]

It will also include libraries and core programs for manipulation of genomic and genetics data

- vcftools
- vcflib
- PyVCF
- BedTools
- PyBedtools


There are [Puppet][13] scripts that automatically install the software when the VM is started.

[2]: http://releases.ubuntu.com/trusty/
[3]: http://www.vagrantup.com/
[4]: http://www.numpy.org/
[5]: http://www.scipy.org/
[6]: http://matplotlib.org/
[7]: http://ipython.org/
[8]: http://ipython.org/ipython-doc/dev/interactive/htmlnotebook.html
[9]: http://sympy.org/en/index.html
[10]: http://pandas.pydata.org/
[11]: http://statsmodels.sourceforge.net/
[12]: http://scikit-learn.org/stable/
[13]: http://puppetlabs.com/

Running
-------

- clone this repository 
```
git clone --recursive  https://github.com/cfljam/statgen_py_vm.git
cd statgen_py_vm
```

- ensure the parent directory contains a shared data directory **data**
```
	mkdir data
```
-  If you are behind a firewall you may need to 
		1. set system proxy 
		2. install [vagrant proxy conf](https://github.com/tmatilai/vagrant-proxyconf) 
		3. set Vagrant proxy variables
        4. create or edit your default vagrant settings in $HOME/.vagrant.d/Vagrantfile
 
 See https://gist.github.com/cfljam/298d5a91abbd9f9c971f 


- change into the repo directory
```
	cd statgen_py_vm
 ```
- To start the virtual machine(VM) type

    ```
    vagrant up
    ```
- If you have any timeout errors you may need to re-run provisioning to complete installation
```
vagrant provision
```
- and it may be advisable to 

```
vagrant reload
```


- connect to the ipython notbook server from your host machine 

    ```
    http://localhost:8888/

    ```
 - access the VM by SSH
 ```
 	vagrant ssh
 ```

Requirements
------------

The following software is needed to get the software from github and run
Vagrant to set up the Python development environment. The Git environment
also provides an [SSH  client][14] for Windows.

* [Oracle VM VirtualBox][15]
* [Vagrant][16]
* [Git][17]

[14]: http://en.wikipedia.org/wiki/Secure_Shell
[15]: https://www.virtualbox.org/
[16]: http://vagrantup.com/
[17]: http://git-scm.com/

Credits
-------

Thanks to (in no particular order):

* Gavin Noronha - gavinln@hotmail.com
