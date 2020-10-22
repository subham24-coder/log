AREA     appcode, CODE, READONLY
     EXPORT __main
	 ENTRY 
__main  FUNCTION		         
       VLDR.F32   s7, = 15 ;here store the value of x(I have taken 15) 
                VLDR.F32   s2, = 1 ;initial value taken 1
		VLDR.F32   s1, = 1 ; initial value taken 1 
		VLDR.F32   s6, = 1 ;initial value taken 1
				
	    MOV R5 , #0110 ; R5 stored the value 110 so that the last term is X^(110)/110 (for infinity loop below I have written what should be modified)
loop   CMP R5 , #0x01 ;
		VMUL.F32 s2 , s2, s7 ;s2=s2*s7
	    VDIV.F32  s4 , s2, s1 ;s4=s2/s1
	    VADD.f32 s8, s8, s4 ;s8=s8+s4
	    VADD.f32 s1 , s1 , s6 ;  s1=s1+s6
        VMUL.f32 s2 , s2 ,s7  ;s2=s2*s7
	    VDIV.f32  s4 , s2, s1 ;s4=s2/s1
	    VSUB.f32 s8, s8, s4 ;s8=s8-s4
		VADD.f32 s1 , s1 , s6 ;s1=s1+s6
		SUB R5 ,R5 , #01 ;decreasing r5 value by 1(if I do not write this line It would run infinity times as required)
	   BNE loop 
      
          
stop    b stop		
     ENDFUNC
     END
