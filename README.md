Prerequsites:

Real FORTRAN compiler, Intel f77 or gfortran-7
>> N.B. NOT a translator like fort77

Gnuplot package

To build:

> Clone repo.
>
> Make default target, by just typing “make.”

>> (or with explicit target "make CClient")

> Change to newly made bin directory.

> Set load path to find FORTRAN shared library

```
	cd bin
	export LD_LIBRARY_PATH=`realpath .`
	
	./CClient
```

To use:

> USAGE: (9 numeric fields)

> mm dd yyyy hr lat lon start_height stop_height, num_meas

> Lat, Lon in decimal degrees west longitudes negative height in km

Requested plots could be:

```
 ./CClient 03 03 2021 11.0 37.8 -75.4 10.0 1000.0 50

 ./CClient 03 04 2021 23.0 37.8 -75.4 10.0 1000.0 50
```
CClient is thin C wrapper calling shareable FORTRAN library IRISub

All FORTRAN code from
[<u>http://irimodel.org/</u>](http://irimodel.org/) used unmodified. One
shim file added to make a C binding wrapper for IRI_SUB method.

\> "...lesson/insights learned by doing this exercise."

Most striking thing is the enormous number of different configuration
parameters and outputs supported by single FORTRAN subroutine. I plotted
just one of 20 outputs, with default setting as described in FORTRAN
code comments. I do not know enough of the underlying geophysics to be
100% sure I made correct assumptions, but plots had encouraging lumps
~200-300 km altitude which matched expectation from superficial
Wikipedia research.

Possible areas for further work include making a ui that can plot
multiple profiles together, and even a ui that uses a pipe to Gnuplot
process to add/remove/edit plot choices interactively.
