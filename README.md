# pysection
Dissection, analysis and decompilation toolbox for Python compiled files, dockerized. 

# What is pysection?

pysection is a docker container that contains:
* binutils (with objcopy)
* [deadsnakes (for specific python versions)](https://launchpad.net/~deadsnakes/+archive/ubuntu/ppa)
* [pyinstextractor.py from extremecoders](https://github.com/extremecoders-re/pyinstxtractor)
* [python-exe-unpacker from FSecure Countercept](https://github.com/countercept/python-exe-unpacker)
* [uncompyle6, for bytecode to source code conversion](https://pypi.org/project/uncompyle6/)
* [bandit, to find common security issues ](https://bandit.readthedocs.io/en/latest/)

The container is based on Ubuntu 20.04, so it's easy to apt additional tools, and the principle of least suprise should be followed if you want to add more tools. Instead of polluting your local python env, just run pysection docker, see if you can dissect that py binary and off you go. 


# Build

Build the image with: `docker build -t pysection .`

Run the container, and export the current working dir to /data with: `docker run --rm -it -v $(pwd):/data pysection`

After that, you can use the container to conduct your analysis.


# NOTE

According to the DeadSnakes wiki : `Supported Ubuntu and Python Versions`:
- Ubuntu 16.04 (xenial) Python 2.3 - Python 2.6, Python 3.1 - Python3.4, Python 3.6 - Python3.9
- Ubuntu 18.04 (bionic) Python2.3 - Python 2.6, Python 3.1 - Python 3.5, Python3.7 - Python3.9
- Ubuntu 20.04 (focal) Python3.5 - Python3.7, Python3.9
- Note: Python2.7 (all), Python 3.5 (xenial), Python 3.6 (bionic), Python 3.8 (focal) are not provided by deadsnakes as upstream ubuntu provides those packages.
- Note: for focal, older python versions require libssl1.0.x so they are not currently built

The packages provided here are loosely based on the debian upstream packages with some modifications to make them more usable as non-default pythons and on ubuntu. As such, the packages follow debian's patterns and often do not include a full python distribution with just `apt install python#.#`. Here is a list of packages that may be useful along with the default install:

- `python#.#-dev`: includes development headers for building C extensions
- `python#.#-venv`: provides the standard library `venv` module
- `python#.#-distutils`: provides the standard library `distutils` module
- `python#.#-lib2to3`: provides the `2to3-#.#` utility as well as the standard library `lib2to3` module
- `python#.#-gdbm`: provides the standard library `dbm.gnu` module
- `python#.#-tk`: provides the standard library `tkinter` module


**You can rebuild the docker container for a specific version of Ubuntu to get other versions of python.**

## Useful docs

* https://github.com/extremecoders-re/pyinstxtractor/wiki/Extracting-Linux-ELF-binaries
