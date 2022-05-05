[top]
components : pesticide

[pesticide]
type : cell
dim : (10, 10)
delay : transport
defaultDelayTime  : 100
border : nowrapped 
neighbors :              	                pesticide(-2,0)
neighbors :                pesticide(-1,-1) pesticide(-1,0) pesticide(-1,1) 
neighbors : pesticide(0,-2) pesticide(0,-1)  pesticide(0,0)  pesticide(0,1) pesticide(0,2)
neighbors :				   pesticide(1,-1)	pesticide(1,0)  pesticide(1,1)
initialvalue : 0
initialrowvalue :  0      0000000000
initialrowvalue :  1      0000000000
initialrowvalue :  2      0000000000
initialrowvalue :  3      0000000000
initialrowvalue :  4      0000000000
initialrowvalue :  5      0000000000
initialrowvalue :  6      0000000000
initialrowvalue :  7      0000000000
initialrowvalue :  8      0000000000
initialrowvalue :  9      0000000000

zone : top    { (0,0)..(0,9) }  
zone : bottom { (9,0)..(9,9) }
zone : left   { (1,0)..(8,0) }
zone : left2  { (1,1)..(8,1) } 
zone : right  { (1,9)..(8,9) }
zone : right2 { (1,8)..(8,8) }
localtransition : pesticide-rule

% 0 = empty space
% 2 = clean soil
% 3 to 5 = soil with pesticide
% -1 = clean water 
% 1 = water with pesticide

[top]
%Flood Condition 
rule : {-1} 100 { t } 

[bottom]
%Emtpy Space Rules
rule : {(-1,0)} 100 {(0,0)<2 AND (-1,0)<2}

%Dirty Soil Rules
rule : {2} {100} {(0,0)=3 AND ((-1,0)=-1 OR
							   (0,-1)=-1 OR
							   (0,1)=-1) }
							   
rule : {3} {100} {(0,0)=4 AND ((-1,0)=-1 OR
							   (0,-1)=-1 OR
							   (0,1)=-1)  }
rule : {4} {100} {(0,0)=5 AND ((-1,0)=-1 OR
							   (0,-1)=-1 OR
							   (0,1)=-1) }
rule : {(0,0)} 100 { t } 


[left]
%Emtpy Space Rules

rule : {-1} 100 {(0,0)=0 AND 
				(((0,1)=-1 AND (1,1)!=0 AND (1,1)<=2 AND (-1,1)<=2 AND (0,2)<=2 ) OR
				 ((-1,0)=-1 AND (-1,-1)<=2 AND (-2,0)<=2 AND (-1,1)<=2 )) }

rule : {1} 100 {(0,0)=0 AND 
				NOT((-1,0)=-1 AND (-1,-1)<=2 AND (-2,0)<=2 AND (-1,1)<=2 ) AND
				(((0,1)=-1 AND (1,1)!=0 AND ((1,1)>2 OR (-1,1)>2 OR (0,2)>2) ) OR
				 ((0,1)=1 AND (1,1)!=0 )) } % From Right

rule : {1} 100 {(0,0)=0 AND 
				NOT((0,1)=-1 AND (1,1)!=0 AND (1,1)<=2 AND (-1,1)<=2 AND (0,2)<=2 ) AND
				(((-1,0)=-1 AND ((-1,-1)>2 OR (-2,0)>2 OR (-1,1)>2) ) OR
				 ((-1,0)=1 )) } % From Top
				 
%Dirty Soil Rules
rule : {2} {100} {(0,0)=3 AND ((-1,0)=-1 OR
							   (0,1)=-1 OR
							   (1,0)=-1) }
rule : {3} {100} {(0,0)=4 AND ((-1,0)=-1 OR
							   (0,1)=-1 OR
							   (1,0)=-1) }
rule : {4} {100} {(0,0)=5 AND ((-1,0)=-1 OR
							   (0,1)=-1 OR
							   (1,0)=-1) }

%Water Rules
rule : {0} 100 {((0,0)=1 OR (0,0)=-1) AND(1,0)=0 }
rule : {0} 100 {((0,0)=1 OR (0,0)=-1) AND(0,1)=0 }
							       							       
rule : {(0,0)} 100 { t } 

[left2]
%Emtpy Space Rules

rule : {-1} 100 {(0,0)=0 AND 
				(((0,-1)=-1 AND (1,-1)!=0 AND (1,-1)<=2 AND (-1,-1)<=2 ) OR
				 ((0,1)=-1 AND (1,1)!=0 AND (1,1)<=2 AND (-1,1)<=2 AND (0,2)<=2 ) OR
				 ((-1,0)=-1 AND (-1,-1)<=2 AND (-2,0)<=2 AND (-1,1)<=2 )) }

rule : {1} 100 {(0,0)=0 AND 
				NOT((-1,0)=-1 AND (-1,-1)<=2 AND (-2,0)<=2 AND (-1,1)<=2 ) AND
				NOT((0,1)=-1 AND (1,1)!=0 AND (1,1)<=2 AND (-1,1)<=2 AND (0,2)<=2 ) AND
				(((0,-1)=-1 AND (1,-1)!=0 AND ((1,-1)>2 OR (-1,-1)>2) ) OR
				 ((0,-1)=1 AND (1,-1)!=0 )) } % From Left

rule : {1} 100 {(0,0)=0 AND 
				NOT((-1,0)=-1 AND (-1,-1)<=2 AND (-2,0)<=2 AND (-1,1)<=2 ) AND
				NOT((0,-1)=-1 AND (1,-1)!=0 AND (1,-1)<=2 AND (-1,-1)<=2 ) AND
				(((0,1)=-1 AND (1,1)!=0 AND ((1,1)>2 OR (-1,1)>2 OR (0,2)>2) ) OR
				 ((0,1)=1 AND (1,1)!=0 )) } % From Right

rule : {1} 100 {(0,0)=0 AND 
				NOT((0,1)=-1 AND (1,1)!=0 AND (1,1)<=2 AND (-1,1)<=2 AND (0,2)<=2 ) AND
				NOT((0,-1)=-1 AND (1,-1)!=0 AND (1,-1)<=2 AND (-1,-1)<=2 ) AND
				(((-1,0)=-1 AND ((-1,-1)>2 OR (-2,0)>2 OR (-1,1)>2) ) OR
				 ((-1,0)=1 )) } % From Top

%Dirty Soil Rules
rule : {2} {100} {(0,0)=3 AND ((-1,0)=-1 OR
							   (0,-1)=-1 OR
							   (0,1)=-1 OR
							   (1,0)=-1) }
rule : {3} {100} {(0,0)=4 AND ((-1,0)=-1 OR
							   (0,-1)=-1 OR
							   (0,1)=-1 OR
							   (1,0)=-1) }
rule : {4} {100} {(0,0)=5 AND ((-1,0)=-1 OR
							   (0,-1)=-1 OR
							   (0,1)=-1 OR
							   (1,0)=-1) }

%Water Rules
rule : {0} 100 {((0,0)=1 OR (0,0)=-1) AND(1,0)=0 }
rule : {0} 100 {((0,0)=1 OR (0,0)=-1) AND ((0,1)=0 OR (0,-1)=0) }
							       							       
rule : {(0,0)} 100 { t } 

[right]
%Emtpy Space Rules

rule : {-1} 100 {(0,0)=0 AND 
				(((0,-1)=-1 AND (1,-1)!=0 AND (1,-1)<=2 AND (-1,-1)<=2 AND (0,-2)<=2 ) OR
				 ((-1,0)=-1 AND (-1,-1)<=2 AND (-2,0)<=2 AND (-1,1)<=2 )) }

rule : {1} 100 {(0,0)=0 AND 
				NOT((-1,0)=-1 AND (-1,-1)<=2 AND (-2,0)<=2 AND (-1,1)<=2 ) AND
				(((0,-1)=-1 AND (1,-1)!=0 AND ((1,-1)>2 OR (-1,-1)>2 OR (0,-2)>2) ) OR
				 ((0,-1)=1 AND (1,-1)!=0 )) } % From Left

rule : {1} 100 {(0,0)=0 AND
				NOT((0,-1)=-1 AND (1,-1)!=0 AND (1,-1)<=2 AND (-1,-1)<=2 AND (0,-2)<=2 ) AND
				(((-1,0)=-1 AND ((-1,-1)>2 OR (-2,0)>2 OR (-1,1)>2) ) OR
				 ((-1,0)=1 )) } % From Top
				 
%Dirty Soil Rules
rule : {2} {100} {(0,0)=3 AND ((-1,0)=-1 OR
							   (0,-1)=-1 OR
							   (1,0)=-1) }
rule : {3} {100} {(0,0)=4 AND ((-1,0)=-1 OR
							   (0,-1)=-1 OR
							   (1,0)=-1) }
rule : {4} {100} {(0,0)=5 AND ((-1,0)=-1 OR
							   (0,-1)=-1 OR
							   (1,0)=-1) }

%Water Rules
rule : {0} 100 {((0,0)=1 OR (0,0)=-1) AND(1,0)=0 }
rule : {0} 100 {((0,0)=1 OR (0,0)=-1) AND (0,-1)=0 }
							       							       
rule : {(0,0)} 100 { t } 

[right2]
%Emtpy Space Rules

rule : {-1} 100 {(0,0)=0 AND 
				(((0,-1)=-1 AND (1,-1)!=0 AND (1,-1)<=2 AND (-1,-1)<=2 AND (0,-2)<=2 ) OR
				 ((0,1)=-1 AND (1,1)!=0 AND (1,1)<=2 AND (-1,1)<=2 ) OR
				 ((-1,0)=-1 AND (-1,-1)<=2 AND (-2,0)<=2 AND (-1,1)<=2 )) }

rule : {1} 100 {(0,0)=0 AND 
				NOT((-1,0)=-1 AND (-1,-1)<=2 AND (-2,0)<=2 AND (-1,1)<=2 ) AND
				NOT((0,1)=-1 AND (1,1)!=0 AND (1,1)<=2 AND (-1,1)<=2 ) AND
				(((0,-1)=-1 AND (1,-1)!=0 AND ((1,-1)>2 OR (-1,-1)>2 OR (0,-2)>2) ) OR
				 ((0,-1)=1 AND (1,-1)!=0 )) } % From Left

rule : {1} 100 {(0,0)=0 AND 
				NOT((-1,0)=-1 AND (-1,-1)<=2 AND (-2,0)<=2 AND (-1,1)<=2 ) AND
				NOT((0,-1)=-1 AND (1,-1)!=0 AND (1,-1)<=2 AND (-1,-1)<=2 AND (0,-2)<=2 ) AND
				(((0,1)=-1 AND (1,1)!=0 AND ((1,1)>2 OR (-1,1)>2) ) OR
				 ((0,1)=1 AND (1,1)!=0 )) } % From Right

rule : {1} 100 {(0,0)=0 AND 
				NOT((0,1)=-1 AND (1,1)!=0 AND (1,1)<=2 AND (-1,1)<=2) AND
				NOT((0,-1)=-1 AND (1,-1)!=0 AND (1,-1)<=2 AND (-1,-1)<=2 AND (0,-2)<=2 ) AND
				(((-1,0)=-1 AND ((-1,-1)>2 OR (-2,0)>2 OR (-1,1)>2) ) OR
				 ((-1,0)=1 )) } % From Top

%Dirty Soil Rules
rule : {2} {100} {(0,0)=3 AND ((-1,0)=-1 OR
							   (0,-1)=-1 OR
							   (0,1)=-1 OR
							   (1,0)=-1) }
rule : {3} {100} {(0,0)=4 AND ((-1,0)=-1 OR
							   (0,-1)=-1 OR
							   (0,1)=-1 OR
							   (1,0)=-1) }
rule : {4} {100} {(0,0)=5 AND ((-1,0)=-1 OR
							   (0,-1)=-1 OR
							   (0,1)=-1 OR
							   (1,0)=-1) }

%Water Rules
rule : {0} 100 {((0,0)=1 OR (0,0)=-1) AND(1,0)=0 }
rule : {0} 100 {((0,0)=1 OR (0,0)=-1) AND ((0,1)=0 OR (0,-1)=0) }
							       							       
rule : {(0,0)} 100 { t } 

[pesticide-rule]

%Emtpy Space Rules

rule : {-1} 100 {(0,0)=0 AND 
				(((0,-1)=-1 AND (1,-1)!=0 AND (1,-1)<=2 AND (-1,-1)<=2 AND (0,-2)<=2 ) OR
				 ((0,1)=-1 AND (1,1)!=0 AND (1,1)<=2 AND (-1,1)<=2 AND (0,2)<=2 ) OR
				 ((-1,0)=-1 AND (-1,-1)<=2 AND (-2,0)<=2 AND (-1,1)<=2 )) }

rule : {1} 100 {(0,0)=0 AND 
				NOT((-1,0)=-1 AND (-1,-1)<=2 AND (-2,0)<=2 AND (-1,1)<=2 ) AND
				NOT((0,1)=-1 AND (1,1)!=0 AND (1,1)<=2 AND (-1,1)<=2 AND (0,2)<=2 ) AND
				(((0,-1)=-1 AND (1,-1)!=0 AND ((1,-1)>2 OR (-1,-1)>2 OR (0,-2)>2) ) OR
				 ((0,-1)=1 AND (1,-1)!=0 )) } % From Left

rule : {1} 100 {(0,0)=0 AND 
				NOT((-1,0)=-1 AND (-1,-1)<=2 AND (-2,0)<=2 AND (-1,1)<=2 ) AND
				NOT((0,-1)=-1 AND (1,-1)!=0 AND (1,-1)<=2 AND (-1,-1)<=2 AND (0,-2)<=2 ) AND
				(((0,1)=-1 AND (1,1)!=0 AND ((1,1)>2 OR (-1,1)>2 OR (0,2)>2) ) OR
				 ((0,1)=1 AND (1,1)!=0 )) } % From Right

rule : {1} 100 {(0,0)=0 AND 
				NOT((0,1)=-1 AND (1,1)!=0 AND (1,1)<=2 AND (-1,1)<=2 AND (0,2)<=2 ) AND
				NOT((0,-1)=-1 AND (1,-1)!=0 AND (1,-1)<=2 AND (-1,-1)<=2 AND (0,-2)<=2 ) AND
				(((-1,0)=-1 AND ((-1,-1)>2 OR (-2,0)>2 OR (-1,1)>2) ) OR
				 ((-1,0)=1 )) } % From Top

%Dirty Soil Rules
rule : {2} {100} {(0,0)=3 AND ((-1,0)=-1 OR
							   (0,-1)=-1 OR
							   (0,1)=-1 OR
							   (1,0)=-1) }
rule : {3} {100} {(0,0)=4 AND ((-1,0)=-1 OR
							   (0,-1)=-1 OR
							   (0,1)=-1 OR
							   (1,0)=-1) }
rule : {4} {100} {(0,0)=5 AND ((-1,0)=-1 OR
							   (0,-1)=-1 OR
							   (0,1)=-1 OR
							   (1,0)=-1) }

%Water Rules
rule : {0} 100 {((0,0)=1 OR (0,0)=-1) AND(1,0)=0 }
rule : {0} 100 {((0,0)=1 OR (0,0)=-1) AND ((0,1)=0 OR (0,-1)=0) }
							       							       
rule : {(0,0)} 100 { t } 

