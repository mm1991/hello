function B = A_Basis_selectcols(T,pilot_positions,A,normalize_vec)

%%  Copyright: (c) Georg Taub�ck, 2006-2010

%%	Selects columns out of CS Measurement Matrix 
%% ��CS����������ѡ����


[numb_vec tau_max Nsymb]=size(A);

B=zeros(2*length(pilot_positions),length(T));
for schleife=1:length(T)
    z=zeros(2*numb_vec*tau_max,1);
    z(T(schleife),1)=1;
    B(:,schleife) = A_fhpBasis(z,pilot_positions,A,normalize_vec);   
end    