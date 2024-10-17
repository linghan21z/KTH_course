function GB = feedbacksym(G,H,sign)
%方框图中包含符号，要先编写feedbacksym函数
if nargin==2;
    sign=-1;
end
GB=G/(sym(1)-sign*G*H); %传函，缺省默认单位负反馈
GB=simplify(GB);
