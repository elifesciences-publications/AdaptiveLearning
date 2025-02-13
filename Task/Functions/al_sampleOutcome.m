function outcome = al_sampleOutcome(mean, concentration)
% AL_SAMPLEOUTCOME    This function is used to sample an outcome given the
% mean and concentration of a van Mises distribution
%   
%   Input
%       mean: mean of distribution
%       concentration: concentration of distribution
%
%   Output
%       outcome: sampled outcome

    outcome = round(180 + rad2deg(circ_vmrnd(deg2rad(mean - 180), concentration, 1)));
end