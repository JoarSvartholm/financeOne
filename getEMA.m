function [ data ] = getEMA( data )
%Takes data an generates EMA info
global nEMA 
stocks = fieldnames(data);

%% EMA
if isempty(nEMA)
    nEMA = 10;
end

for i = 1:numel(stocks)
    [data.(stocks{i}).EMA,ind] = ema(data.(stocks{i}).Close,nEMA);   
end

end

