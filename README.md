Piwi-Bash-Library
=================

The Bash library package of Les Ateliers Pierrot


## What is *bash* ?

**Bash**, the "Bourne-Again-SHell", is a Unix shell written for the GNU Project as a free
software replacement for the original Bourne shell (sh). The present library is a tool for
Bash scripts facilities. Bash is the language mostly used by Linux/Unix devices terminal or
console.


## Usage of the library

### Installation

#### Classic install

Once you have downloaded or cloned the package sources, just copy the `src/piwi-bash-library.sh`
file to your project directory and begin to use it ...

For a global usage on your machine, you can copy the library in your `bin/` directory.

As for any script file, it must have execution rights for all users.

A direct and complete installation, including downloading sources, could be:

    ~$ wget --no-check-certificate https://github.com/atelierspierrot/piwi-bash-library/archive/master.tar.gz
    ~$ tar -xvf master.tar.gz
    ~$ cp piwi-bash-library-master/src/piwi-bash-library.sh path/to/your/project/bin/
    ~$ chmod +x path/to/your/project/bin/piwi-bash-library.sh

#### Composer install

If you are a [Composer](http://getcomposer.org/) user, you can add to your package requirements:

    "atelierspierrot/piwi-bash-library": "1.*"

The library will automatically be added in your package's `bin` directory.

#### Install in a package file system

It is sometimes useful to include the library file to your project and manage it manually
under version control. To embed the library in a project, you can use the `src/piwi-bash-library-installer.sh`
script which will handle the installation and update of the library files.

### Usage

To use the library in a bash script, just `source` it at the top of your code or before any
call of its methods or variables:

    #!/bin/bash
    source path/to/piwi-bash-library.sh

For a complete loading writing an error if the library is not found, use the following:

    LIBFILE="path/to/piwi-bash-library.sh"
    if [ -f "$LIBFILE" ]; then source "$LIBFILE"; else
        PADDER=$(printf '%0.1s' "#"{1..1000})
        printf "\n### %*.*s\n    %s\n    %s\n%*.*s\n\n" 0 $(($(tput cols)-4)) "ERROR! $PADDER" \
            "Unable to find required library file '$LIBFILE'!" \
            "Sent in '$0' line '${LINENO}' by '`whoami`' - pwd is '`pwd`'" \
            0 $(tput cols) "$PADDER";
        exit 1
    fi

This way, if the library was not found, your script will end with an error and write:

    ### ERROR! ###########################################################
        Unable to find required library file 'path/to/piwi-bash-library.sh'!
        Sent in 'current-file.sh' line '0' by 'username' - pwd is '...'
    ######################################################################

### Developer documentation

Documentation files are included in the [`doc/` directory](doc) of the package.

A quick overview of the whole library methods or variables can be written on screen running
(the `-v` option renders a complete doc with comments for each method):

    ~$ ./path/to/my-script.sh (-v) --libdoc


### Demonstration files

A set of test and demonstration files is included in the `bin/` directory of the package.
These files are not required for a normal usage of the library.

To run one of these tests, just run, depending on your system:

    ~$ cd path/to/downloaded/package/piwi-bash-library
    ~$ ./bin/file-test.sh
    OR
    ~$ sh bin/file-test.sh
    OR
    ~$ bash bin/file-test.sh

You can use the `-h` option to get help or info:

    ~$ ./bin/file-test.sh -h


## Author & License

>    Piwi Bash Library - The open source bash library of Les Ateliers Pierrot

>    http://github.com/atelierspierrot/piwi-bash-library

>    Copyleft 2013, Pierre Cassat and contributors

>    Licensed under the GPL Version 3 license.

>    http://opensource.org/licenses/GPL-3.0

>    ----

>    Les Ateliers Pierrot - Paris, France

>    <www.ateliers-pierrot.fr> - <contact@ateliers-pierrot.fr>
