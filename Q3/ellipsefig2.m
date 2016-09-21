function  h = ellipsefig2(a,b,c,d,e,f)
% ��һ����Բ��ax*x+bx*y+c*y*y+d*x+e*y = f
P = [a b/2;b/2 c];
delta = b^2-4*a*c;
% if delta >= 0
%     warning('�ⲻ��һ����Բ')
%     return;
% end
x0 = (b*e-2*c*d)/delta;
y0 = (b*d-2*a*e)/delta;
r = a*x0^2 + b*x0*y0 +c*y0^2 + f;
if r <= 0
    warning('�ⲻ��һ����Բ')
    return;
end

[V, D] = eig(P); 
aa = sqrt(r/D(1));
bb = sqrt(r/D(4));
t = linspace(0, 2*pi, 60);
xy = V*[aa*cos(t);bb*sin(t)];
h = plot(xy(1,:)-x0,xy(2,:)-y0, 'k', 'linewidth', 2);