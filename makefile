obj/%.o : %.for 
	f77 -c $< -o $@ 

objs = obj/irirtam-test.o obj/cira.o obj/igrf.o obj/iridreg.o obj/iriflip.o obj/irifun.o obj/irirtam.o obj/irisub.o obj/iritec.o

$(objs): | obj

obj:
	mkdir obj
bin:
	mkdir bin

bin/iri: $(objs) | bin
	f77 -o bin/iri $(objs)
	
iri: bin/iri

clean:
	rm -R obj bin
