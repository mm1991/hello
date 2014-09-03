function Y = A_F_selectcols(T,pilot_positions,delay,dop)

%%  Copyright: (c) Georg Taub鯿k, 2006-2010

%%	Selects columns out of CS Measurement Matrix
%%  从CS测量矩阵中选择列
% permute_matrix=repmat(1:dop,delay,1)+((0:dop:((delay-1)*dop)).')*ones(1,dop);
% permute_vec=vec(permute_matrix);

Z=full(sparse(T,1:length(T),1,2*delay*dop,length(T)));


A=reshape((reshape((repmat((exp((-j)*pi*((0:(dop-1))'))),1,length(T)*delay).*ifft(reshape((((sqrt(dop)/sqrt(delay))*fft(reshape(Z(1:(dop*delay),:)+j*Z((dop*delay+1):(2*dop*delay),:),delay,length(T)*dop))).'),dop,length(T)*delay))),dop*length(T),delay)).',dop*delay,length(T));

%B=A(permute_vec,:)

Y=[real(A(pilot_positions,:)) ; imag(A(pilot_positions,:))]*sqrt(dop*delay/length(pilot_positions));
