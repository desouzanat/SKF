%% Nathalia De Souza -- Standard Kalman Filter Function

function [y_khat, K_k, x_khat, P_k] = SKF(F_k1, G_k1, H_k1, Q, R,  u_k1, y_k, x_k1hat, P_k1minus)


% prediction step
x_kminushat = (F_k1 * x_k1hat) + (G_k1 * u_k1); % a priori state estimate
P_kminus = (F_k1 * P_k1minus * transpose(F_k1)) + (G_k1 * Q * G_k1'); % a priori covariance

% correction step
W = (H_k1 * P_kminus * transpose(H_k1)) + (H_k1 * R * transpose(H_k1));
K_k = P_kminus * transpose(H_k1) * (W^-1); % kalman gain
y_kminushat = H_k1 * x_kminushat; % predicted measurement given the a priori estimate
x_khat = x_kminushat + (K_k .* (y_k - y_kminushat)); % linear correction/update equation
P_k = P_kminus - (K_k * H_k1 * P_kminus) - (P_kminus * transpose(H_k1) * transpose(K_k)) + (K_k * W * transpose(K_k)); % a posteriori covariance
 
% estimation
y_khat = H_k1 * x_khat; % output estimaton

end
