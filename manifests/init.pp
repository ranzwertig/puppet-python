class python {
    package {
        "build-essential": ensure => installed;
        "python": ensure => installed;
        "python-dev": ensure => installed;
        "python-setuptools": ensure => installed;
    }
    exec { "easy_install pip":
        path => "/usr/local/bin:/usr/bin:/bin",
        unless => "which pip",
    }
    
    define pip($ensure = installed) {
        case $ensure {
            installed: {
                exec { "pip install $name":
                    path => "/usr/local/bin:/usr/bin:/bin",
                }
            }
            latest: {
                exec { "pip install --upgrade $name":
                    path => "/usr/local/bin:/usr/bin:/bin",
                }
            }
            default: {
                exec { "pip install $name==$ensure":
                    path => "/usr/local/bin:/usr/bin:/bin",
                }
            }
        }
    }
}
