function [varargout] = default_vals(vals, varargin)
% default_vals Ϊ�ϼ���������Ĭ��ֵ�ĺ���
%   ����: 
%       vals: �����������Ĭ��ֵ��cell�͵����飬����{1, 2, 3}
%       varargin: �����ϼ����������룬�����ж��û��Ƿ��и���ֵ
%   ���: 
%       varargout: ��λ�÷�������������

if nargout ~= length(vals)
    error('number of arguments mismatch');
else, nn = length(varargin) + 1;
    varargout = varargin;
    for i = nn : nargout
        varargout{i} = vals{i};
    end
end
end

