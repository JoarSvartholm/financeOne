function [data,OMX] = GetData(symbols,date1)

 date2 = date;
 
 if isempty(symbols)
     symbols = {'HM-B.ST','BALD-B.ST'};
 end
 if isempty(date1)
     date1 = '01-01-2015';
 end

 
%% symbols

temp = getYahooDailyData(symbols,date1,date2,'dd-mmm-yyyy');
names = fieldnames(temp);
name = strrep(symbols,'.ST','');
name = strrep(name,'-B','');
name = strrep(name,'-A','');
name = strrep(name,'^','');
name = strrep(name,'-SDB','');
name = strrep(name,'-SEK','');
if iscell(name) == 0
    name = {name};
end

for i=1:size(names,1)
    data.(name{i}) = temp.(names{i});
end

%% OMX

temp = getYahooDailyData('^OMX',date1,date2,'dd-mmm-yyyy');
names = fieldnames(temp);
name = strrep(symbols,'.ST','');
name = strrep(name,'-B','');
name = strrep(name,'-A','');
name = strrep(name,'^','');
if iscell(name) == 0
    name = {name};
end

OMX = temp.(names{1});


end
