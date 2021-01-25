clear all; clc;

%% Load logs
% KUKA datalogger logs starts with a % symbol. Remove this manually first.
% Compare to raw folder for examples.

filename = 'DataRecorder000F.0001.0000000D.log'

raw_T = readtable(filename);

%% Create time.. yeah!
t = raw_T.ZeitInSec + raw_T.ZeitInNanoSec/1e9; % Time in seconds

h = figure(1);clf;
h.Name = filename + " " + "Time in seconds";
h.NumberTitle = 'off';
subplot(211)
plot(t)
title('This should be a continous line with not gaps')
subplot(212)
plot(diff(t))
title('This should be a constant straight line')

%% Plot all variables

for i = 3:length(raw_T.Properties.VariableNames)
    
    var_name = replace(raw_T.Properties.VariableNames{i},'_',' ');
    h = figure(i);clf;
    h.Name = filename+" "+var_name;
    h.NumberTitle = 'off';
    plot(t, raw_T{:,i});
    title(var_name)
    
end



