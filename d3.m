Ic2 = 5e-3;
Ic1 = 0.1e-3;
VCE1 = 5-(5/6);

Vcc = 10; 
VE2 = 5; 
VCE2 = 5; 
Vb2 = 5.6; 
beta = 200;
VT = 25e-3
f = 1e3;

Ib2 = Ic2 / beta 
IR34 = 20*Ib2 %can change

R4 = Vb2 / IR34 
R3 = (Vcc / IR34) - R4 
Re = VE2 / Ic2

r_pi = beta * (VT / Ic2);

Rs2 = 1/((1/R3) + (1/R4));
Ro2 = 1/((1/Re) + (1/((r_pi + Rs2)/(beta + 1))))

Rin2 = r_pi + (beta + 1)*Re;

Rc = Rin2/6 %can change

Re2 = Rc/6 % wiggle room

R1R2 = 1/ (1/40e3 - 1/((beta + 1)*Re2))

Ib1 = Ic1 / beta

r_pi1 = beta * (VT / Ic1);


Re1 = (Vcc - Rc*Ic1 - VCE1 - Ic1*Re2) / Ic1 

Vb1 = VCE1 + 0.6

R1 = R1R2 * (Vb1/Vcc)
R2 = ((Vb1/Vcc)*R1)/(1-(Vb1/Vcc))

Rs = 1/((1/R1)+(1/R2));

bracket3 = 1/((1/R1)+(1/R2));
bracket2 = Re2 + ((r_pi1)/(beta+1))+(bracket3/(beta+1));
bracket1 = 1/((1/Re1)+(1/bracket2));
Ce = 10 / (2*pi*f*bracket1)

bracket4 = 1/((1/R1)+(1/R2)+(1/(r_pi1 + (beta + 1)*Re2)));
Ci = 10/(2*pi*f*(Rs + bracket4))

R_in1 = r_pi1 + (beta+1)*(Re1+Re2)
