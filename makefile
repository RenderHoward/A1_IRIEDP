obj/%.o : %.for 
	f77 -g -c $< -o $@ -fPIC 

bin/%.dat : dat/%.dat
	cp $< bin/

bin/%.asc : dat/%.asc
	cp $< bin/

objs = obj/cira.o obj/igrf.o obj/iridreg.o obj/iriflip.o obj/irifun.o obj/irirtam.o obj/iritec.o obj/irisub.o

dats = bin/apf107.dat bin/dgrf1960.dat bin/dgrf1980.dat bin/dgrf2000.dat bin/igrf2020.dat\
 bin/mcsat12.dat bin/mcsat16.dat bin/mcsat20.dat bin/dgrf1945.dat bin/dgrf1965.dat\
 bin/dgrf1985.dat bin/dgrf2005.dat bin/igrf2020s.dat bin/mcsat13.dat bin/mcsat17.dat\
 bin/mcsat21.dat bin/dgrf1950.dat bin/dgrf1970.dat bin/dgrf1990.dat bin/dgrf2010.dat\
 bin/ig_rz.dat bin/mcsat14.dat bin/mcsat18.dat bin/mcsat22.dat bin/dgrf1955.dat\
 bin/dgrf1975.dat bin/dgrf1995.dat bin/dgrf2015.dat bin/mcsat11.dat bin/mcsat15.dat bin/mcsat19.dat   

ascs = bin/ccir11.asc  bin/ccir16.asc  bin/ccir21.asc  bin/ursi14.asc  bin/ursi19.asc\
 bin/ccir12.asc  bin/ccir17.asc  bin/ccir22.asc  bin/ursi15.asc  bin/ursi20.asc\
 bin/ccir13.asc  bin/ccir18.asc  bin/ursi11.asc  bin/ursi16.asc  bin/ursi21.asc\
 bin/ccir14.asc  bin/ccir19.asc  bin/ursi12.asc  bin/ursi17.asc  bin/ursi22.asc\
 bin/ccir15.asc  bin/ccir20.asc  bin/ursi13.asc  bin/ursi18.asc\


all: libIRIsub data

data: $(dats) $(ascs)

$(objs): | obj

$(dats): | bin

$(ascs): | bin

obj:
	mkdir obj
bin:
	mkdir bin

bin/libIRIsub.so: $(objs) irisubshim.for| bin  
	f77 -g -shared -o bin/libIRIsub.so -fPIC irisubshim.for  $(objs)
	
libIRIsub: bin/libIRIsub.so 

.PHONY: clean
clean:
	rm -R obj bin
