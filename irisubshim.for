       SUBROUTINE IRI_SUB_C(JF,JMAG,ALATI,ALONG,IYYYY,MMDD,DHOUR,
     & HEIBEG,HEIEND,HEISTP,OUTF,OARR) bind ( C, name="iri_sub_c" )
       LOGICAL JF(50)

       DIMENSION OUTF(20, 1000), OARR(100)

       call read_ig_rz
       call readapf107

       call IRI_SUB( JF,JMAG,ALATI,ALONG,IYYYY,MMDD,DHOUR,
     &   HEIBEG,HEIEND,HEISTP,OUTF,OARR )

       end
