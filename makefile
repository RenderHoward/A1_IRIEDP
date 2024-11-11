obj/%.o : %.for 
	f77 -c $< -o $@ 

bin/%.dat : dat/%.dat
	cp $< bin/

objs = obj/irirtam-test.o obj/cira.o obj/igrf.o obj/iridreg.o obj/iriflip.o obj/irifun.o\
 obj/irirtam.o obj/irisub.o obj/iritec.o

dats = bin/apf107.dat bin/dgrf1960.dat bin/dgrf1980.dat bin/dgrf2000.dat bin/igrf2020.dat\
 bin/mcsat12.dat bin/mcsat16.dat bin/mcsat20.dat bin/dgrf1945.dat bin/dgrf1965.dat\
 bin/dgrf1985.dat bin/dgrf2005.dat bin/igrf2020s.dat bin/mcsat13.dat bin/mcsat17.dat\
 bin/mcsat21.dat bin/dgrf1950.dat bin/dgrf1970.dat bin/dgrf1990.dat bin/dgrf2010.dat\
 bin/ig_rz.dat bin/mcsat14.dat bin/mcsat18.dat bin/mcsat22.dat bin/dgrf1955.dat\
 bin/dgrf1975.dat bin/dgrf1995.dat bin/dgrf2015.dat bin/mcsat11.dat bin/mcsat15.dat bin/mcsat19.dat   

$(objs): | obj

$(dats): | bin

obj:
	mkdir obj
bin:
	mkdir bin

bin/iri: $(objs) $(dats) 
	f77 -o bin/iri $(objs)
	
iri: bin/iri

clean:
	rm -R obj bin
