r=512,c=r;                            %�����������ϵĳ�����
a=zeros(r,c);                         %Ԥ��������
a(r/2-r/4:r/2+r/4,c/2-c/4:c/2+c/4)=1; %���������
lamda=6328*10^(-10);k=2*pi/lamda;     %��ֵ����������
L0=5*10^(-3);                         %��ֵ������ߴ磬��λ:��
d=0.1;                                %��ֵ�۲�����������ľ���,��λ:�� 
x0=linspace(-L0/2,L0/2,c);            %����������x������
y0=linspace(-L0/2,L0/2,r);            %����������y������
kethi=linspace(-1./2./L0,1./2./L0,c).*c; %����Ƶ������
nenta=linspace(-1./2./L0,1./2./L0,r).*r;
[kethi,nenta]=meshgrid(kethi,nenta);
H=exp(j*k*d.*(1-lamda.*lamda.*(kethi.*kethi+nenta.*nenta)./2)); %���ݺ���H
fa=fftshift(fft2(a));                 %�������Ϲⳡ�ĸ���Ҷ�任
Fuf=fa.*H;                            %�ⳡ��Ƶ���봫�ݺ������
U=ifft2(Fuf);                         %�ڹ۲����ϵĹⳡ�ֲ�
I=U.*conj(U);                         %�ڹ۲����ϵĹ�ǿ�ֲ�
figure,imshow(I,[0,max(max(I))]),colormap(gray)