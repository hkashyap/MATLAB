function f=maxdiagno(x,varargin)
% Maximizaton of the diagonality of hte matrix. 
covmat = varargin{1};   % #pix X #pix X #taus 
sizevec = varargin{2};
W = reshape(x, sizevec(1)*sizevec(2), sizevec(3)); % #pix X #comp
% W = max(W,eps);
ntau = size(covmat,3); % #taus (different time delays)
ftmp = zeros(1,ntau);
fcol = zeros(1,sizevec(3));
for tau=1:ntau
    covmattmp = covmat(:,:,tau);    
    ftmp(tau) = 0.5*(sum(fcol)-log(abs(det(W'*covmattmp*W))));
end

f = sum(ftmp);



