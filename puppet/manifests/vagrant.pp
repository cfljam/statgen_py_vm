#
# puppet magic for dev boxes
#
import "classes/*.pp"

## Workaround for OSX
if $virtual == "virtualbox" and $kernel == 'Darwin' {
  $fqdn = 'localhost'
  notice("Kernel is ${kernel}")
}

$PROJ_DIR = "/vagrant"
$HOME_DIR = "/home/vagrant"

Exec {
    path => "/usr/local/bin:/usr/bin:/usr/sbin:/sbin:/bin",
}

class dev {
    class {
        init: ;
        python: require => Class[init];
    }
}

## Install R plus selected packages
$R_packages = ['ggplot2','reshape2', 'plyr']

class { 'r': }
r::package { $R_packages :
  dependencies => true}

include dev
include r
