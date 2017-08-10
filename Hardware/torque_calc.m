%% Calculate required torque per servo
% Based on http://www.robotshop.com/blog/en/robot-leg-torque-tutorial-3587
% with 1 left leg in contact and 2 right legs in contact.

% weights:
W_uno = 0.025; % Arduino UNO weight in kg
W_pap = W_uno; % Papilio Pro weight in kg
W_batt = 0.5; % Battery weight in kg
W_frame = 0.25; % Frame weight in kg
W_servo = 0.012; % Servo (individual) weight in kg - assumes identical servos
W_leg = 0.1+(3*W_servo); % Leg weight in kg (includes shoulder)

W_body = W_uno+W_pap+W_batt+W_frame;
W_tot = W_body + 6*W_leg

% link lengths:
L1 = 0.05; % length of distal leg segment in m
L2 = 0.05; % length of proximal leg segment in m
L3 = 0.05; % distance from shoulder to body midline in m

% joint limits:
th1 = 60; % knee joint limit in deg
th2 = 30; % shoulder joint limit in deg

% calculate right-side normal force (N):
N_right = (W_servo*L1*cosd(th1) + 2*W_servo*(L1*cosd(th1) + L2*cosd(th2)) ...
+ W_body*(L1*cosd(th1) + L2*cosd(th2) + L3) + ...
4*W_servo*(L1*cosd(th1) + L2*cosd(th2) + 2*L3) + ...
2*W_servo*(L1*cosd(th1) + 2*L2*cosd(th2) + 2*L3))...
/(2*(2*L1*cosd(th1) + 2*L2*cosd(th2) + 2*L3));

% calculate left-side normal force (N):
N_left = W_tot - 2*N_right;

% calculate required knee torque (N-m):
T_knee = -2*N_right*(2*L2*cosd(th2) + 2*L3 + L1*cosd(th1)) ...
+ N_left*L1*cosd(th1) + 2*W_servo*L2*cosd(th2) ...
+ W_body*(L2*cosd(th2) + L3) + 4*W_servo*(L2*cosd(th2) + 2*L3) ...
+ 2*W_servo*(2*L2*cosd(th2) + 2*L3)

% calculate required hip torque (N-m):
T_shoulder = N_left*(L1*cosd(th1) + L2*cosd(th2)) ...
- W_servo*L2*cosd(th2) + W_body*L3 + 4*W_servo*L3 ...
+ 2*W_servo*(2*L3 + L2*cosd(th2)) ...
- 2*N_right*(2*L3 + L2*cosd(th2) + L1*cosd(th1))