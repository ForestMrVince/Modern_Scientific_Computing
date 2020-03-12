function [varargout] = default_vals(vals, varargin)
% default_vals 为上级函数配置默认值的函数
%   输入: 
%       vals: 用于输入给定默认值的cell型的数组，例如{1, 2, 3}
%       varargin: 来自上级函数的输入，用以判定用户是否有给定值
%   输出: 
%       varargout: 按位置返回运算结果变量

if nargout ~= length(vals)
    error('number of arguments mismatch');
else, nn = length(varargin) + 1;
    varargout = varargin;
    for i = nn : nargout
        varargout{i} = vals{i};
    end
end
end

