Uo=imread('guang.bmp');          %������Ϊ���ͼ��
Uo=double(Uo(:,:,1));            %ȡ��һ�㣬��תΪ˫����
figure,imshow(Uo,[]),title('ԭʼ��')
[r,c]=size(Uo);
lamda=6328*10^(-10);k=2*pi/lamda;%��ֵ����������
zo=0.3086;                       %�ﵽȫϢ��¼��ľ���,��λ:��
Lo=5*10^(-3)                     %��ֵ������(��)�ĳߴ�,��λ:��
%= = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = 
%��T-FFT�㷨���ȫϢͼ��¼���̵ļ���
xo=linspace(-Lo/2,Lo/2,c);yo=linspace(-Lo/2,Lo/2,r);
[xo,yo]=meshgrid(xo,yo);
F0=exp(j*k*zo)/(j*lamda*zo);
F1=exp(j*k/2/zo.*(xo.^2+yo.^2));
fa=fft2(Uo); fF1=fft2(F1);
Fuf=fa.*fF1; 
O=F0.*fftshift(ifft2(Fuf));      %��ȫϢ��¼���ϵĹⳡ�ֲ�
I=O.*conj(O);                    %ȫϢ��¼�������ǿ�ֲ�
figure,imshow(I,[]),colormap(pink),title('����ͼ')
%�����������ο���
xr=0.005;                        %�ο����Դ��x����
yr=0.005;                        %�ο����Դ��y����
zr=0.5                           %�ο����Դ�İ뾶
R=exp(j*k*zr).*exp(j*k.*((xo-xr).^2+(yo-yr).^2)/2/zr); %��������Ⲩ
%�������Ρ������ȫϢ��¼���ϵĸ���,�õ�ȫϢͼ
inter=O./max(max(sqrt(I)))+R;    %���ڹ����ȣ���ʹ�Ρ�������
IH=inter.*conj(inter);           %����õ�ȫϢͼ
figure,imshow(IH,[]),title('ȫϢͼ')
%= = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
%������T-FFT�㷨����ȫϢ��
%����ʾ�ò����ŵķ����ع�������
zi=zo;                           %ȫϢͼ���۲���ľ���
fa2=fft2(IH.*conj(R).*1);        %��ȫϢͼ�ϳ�R*,����ƽ�йⴹֱ����
Fuf2=fa2.*fF1; 
Ui1=F0.*fftshift(ifft2(Fuf2));   %�ڹ۲����ϵĹⳡ�ֲ�
Ii1=Ui1.*conj(Ui1);              %�۲����ϵĹ�ǿ
figure,imshow(Ii1,[]),colormap(pink),title('δ���ŵ�-1���ع���')
%= = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
%����ʾ�ɿطŴ��ʵķ����ع�������
M=0.5+eps                       %��ֵ�Ŵ���,��eps����M=1�����
%���÷���һ������,��ȫϢͼ�ϲ��˲ο���Ĺ����R*
zp=M.*zo.*zr/(M.*(zr-zo)-zr)    %����ο���İ뾶
%����ʹ�����ŵ�����ο���
RF=exp(j*k*zp).*exp(j*k.*(xo.^2+yo.^2)/2/zp); %��������Ⲩ
zi=M.*zo                        %�µĳ������
F0=exp(j*k*zi)/(j*lamda*zo);
F1=exp(j*k/2/zi.*(xo.^2+yo.^2));
fF1=fft2(F1);
fa2=fft2(IH.*RF);               %������ⴹֱ����
Fuf2=fa2.*fF1; 
Ui2=F0.*fftshift(ifft2(Fuf2));  %�ڹ۲����ϵĹⳡ�ֲ�
Ii2=Ui2.*conj(Ui2);             %�۲����ϵĹ�ǿ
figure,imshow(Ii2,[]),colormap(pink),title('���ŵ�-1���ع���')
%= = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
%���÷�����������,��ȫϢͼ�ϳ˲ο���Ĺ����R*
zp=M.*zo/(M-1)                 %����������İ뾶
%����ʹ�����ŵ�����ο���
RF=exp(j*k*zp).*exp(j*k.*(xo.^2+yo.^2)/2/zp); %���������Ⲩ
zi=M.*zo                       %�µĳ������
F0=exp(j*k*zi)/(j*lamda*zo);
F1=exp(j*k/2/zi.*(xo.^2+yo.^2));
fF1=fft2(F1);
fa2=fft2(IH.*conj(R).*RF);     %��ȫϢͼ�ϳ�R*,��������ⴹֱ����
Fuf2=fa2.*fF1; 
Ui3=F0.*fftshift(ifft2(Fuf2)); %�ڹ۲����ϵĹⳡ�ֲ�
Ii3=Ui3.*conj(Ui3);            %�۲����ϵĹ�ǿ
figure,imshow(Ii3,[]),colormap(pink),title('���ŵ�-1���ع���')