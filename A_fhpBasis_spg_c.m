function y = A_fhpBasis_spg_c(z,pilot_positions,AmbGenNoOffset,norm_vecBasis,mode)

%%  Copyright: (c) Georg Tauböck, 2006-2010

%%	Generates CS Measurement Matrix 
%%  Éú³É²âÁ¿¾ØÕó


z=[real(z) ; imag(z)];

if mode==1

    y=A_fhpBasis(z,pilot_positions,AmbGenNoOffset,norm_vecBasis);

else if mode==2
        
    y = At_fhpBasis(z,pilot_positions,AmbGenNoOffset,norm_vecBasis);

    end
end

m=  length(y); 
y=y(1:m/2)+1i*y(m/2+1:end);
