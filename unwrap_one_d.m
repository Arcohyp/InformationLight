function varargout=unwrap_one_d(w_ph,s_ph,th)
%���������һ�У����У�������λ�Ľ��������
%��ʽ un_ph= unwrap_one_d(w_ph,s_ph,th)��
%�������������:w_phΪ������λ��s_ph��Ϊ��ʼ��λֵ����thΪ��ֵ��
%����λֵ������(-��,��]����ֵthȡ�У�����λֵ������(-��/2,��/2]��thȡ��/2
%�������un_phΪ�������λֵ
numb=length(w_ph);            %���������λ�Ĵ�С��Ԫ�ظ�����
un_ph=w_ph;                   %��������λֵ��ֵ��un_ph����Ԥ��������λ
un_ph(1)=s_ph;                %�������λ��ֵ��un_ph�ĵ�һ��Ԫ�أ����ٲμӽ������
for n=2:numb                  %�ӵڶ���Ԫ�ؿ�ʼ���������
   delta=w_ph(n)-w_ph(n-1);   %��������������λ���Ƚϣ������
   if (abs(delta)<=th)        %��ֵ��������ֵ
       un_ph(n)=un_ph(n-1)+delta;  %�������λ����ǰһ���������λֵ�Ӳ�ֵ
   elseif (delta<0)           %��ֵ������ֵ���Ҳ�ֵΪ��
       un_ph(n)=un_ph(n-1)+delta+2*th;%ǰһ���������λֵ�Ӳ�ֵ�ټ�2����ֵ
   else                       %��ֵ������ֵ���Ҳ�ֵΪ��
       un_ph(n)=un_ph(n-1)+delta-2*th; %ǰһ���������λֵ�Ӳ�ֵ�ټ�2����ֵ
   end
end
varargout{1}=un_ph;           %���������λֵ��ֵ���������