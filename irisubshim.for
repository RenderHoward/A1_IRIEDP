       SUBROUTINE IRI_SUB_C(JF,JMAG,ALATI,ALONG,IYYYY,MMDD,DHOUR,
     & HEIBEG,HEIEND,HEISTP,OUTF,OARR) bind ( C, name="iri_sub_c" )

       call read_ig_rz
       call readapf107

       call SUBROUTINE IRI_SUB( JF,JMAG,ALATI,ALONG,IYYYY,MMDD,DHOUR,
     &   HEIBEG,HEIEND,HEISTP,OUTF,OARR )

       end
