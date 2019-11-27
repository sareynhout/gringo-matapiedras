function pacoshot(x,n)
% Simulated dispersion patterns of a 12-pellet shotgun cartridge fired from
% a cylinder barrel.
%
% Inputs:
% x = distance downrange, in meters (float), valid from 15-60 meters
% n = number of shots (integer).
% 
% Outputs:
% Polar scatter plot of superimposed shot patterns for all shots.
% 
% Other m-files required: none
% Subfunctions: none
% MAT-files required: none
%
% Author: Scott Reynhout
% Departamento de Geologia, FCFM, Universidad de Chile
% email: scott.a.reynhout@gmail.com
% Last revision: 26 November 2018

% ------------ BEGIN CODE ------------

p = -60.32.*log(x)+257.77; %Determine percent of pellets within a 0.762 m circle at range x
z = norminv((1-(0.5-p./200))); %Calculate Z-score of p
sd = 0.381/z; %Calculate 1 standard deviation (in meters) in the shot pattern at range x
r = sqrt(normrnd(0,sd,[12.*n,1]).^2); %Generate randomized radius from bullseye per Gaussian distribution with sd
th = 360.*rand(12.*n,1).*pi./180; %Generate random theta in radians
polarscatter(th,r,2,'black','filled') %Generate dispersion plot

end

% ------------ END CODE -----------