function y = A_fhpBasis(z,pilot_positions,A,normalize_vec)

%%  Copyright: (c) Georg Tauböck, 2006-2010

%%	Generates CS Measurement Matrix 
%% Éú³ÉCS²âÁ¿¾ØÕó

[numb_vec tau_max Nsymb]=size(A);

z=z.*normalize_vec;

a=vec(fft(sum(repmat(vec2mat((z(1:(numb_vec*tau_max))+j*z((numb_vec*tau_max+1):(2*numb_vec*tau_max))),tau_max),[1 1 Nsymb]).*conj(A),1)));

y=[real(a(pilot_positions)) ; imag(a(pilot_positions))];
