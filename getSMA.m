function [ data ] = getSMA( data )
%Takes data and generates SMA info
global nSMAs nSMAl
stocks = fieldnames(data);
%% SMA
if isempty(nSMAs)
    nSMAs = 20;
end
if isempty(nSMAl)
    nSMAl = 80;
end

for i = 1:numel(stocks)
    hold on
    [data.(stocks{i}).SMAs,ind] = sma(data.(stocks{i}).Close,nSMAs);
    
    [data.(stocks{i}).SMAl,ind] = sma(data.(stocks{i}).Close,nSMAl);
end


end

