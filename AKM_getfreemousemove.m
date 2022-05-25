clc;
clearvars;
close all;

path = 'C:\Users\moranan\Documents\MATLAB\ConnorCode\TL15_rencodeDLC_resnet50_Onecam_WholeMouseMar24shuffle1_500000.csv'; 

fps = 30;

T = readtable(path,'Format','auto');
A = table2array(T);

% get all tracked bodyparts
bodyparts = unique(A(1,2:end));
% alignedReaches=[];

% get values for each bodypart rounded and formatted
% NB: this is clunky due to weird formatting of input files, could definitely be improved
for i = 1:length(bodyparts)
    
    % find which columns contain bodypart data
    hasBP = strfind(A(1,:),string(bodyparts(i)));
    columns = find(~(cellfun('isempty',hasBP)));

    % get x and y data in corresponding columns
    xvals = A(3:end,columns(1));
    yvals = A(3:end,columns(2));
    
    maxLengthCell = 30;
    xVals_new = DJCS_padCells(xvals,maxLengthCell);
    yVals_new = DJCS_padCells(yvals,maxLengthCell);
    
    kins = [xVals_new,yVals_new];
    kins = round(kins,6);
    
    BPvalues(i) = {kins};

end

% put data in struct
data = cell2struct(BPvalues',bodyparts);

%% process kinematic data

fields = fieldnames(data);

% loop through every field of stucture
for bp = 1:length(bodyparts)

    Expt = data.(string(fields(bp)));
    tdiff = 1/fps;

    % get x and y velocity
    Expt(:,3) = gradient(Expt(:,1))/tdiff;
    Expt(:,4) = gradient(Expt(:,2))/tdiff;

    % get x and y acceleration
    Expt(:,5) = gradient(Expt(:,3))/tdiff;
    Expt(:,6) = gradient(Expt(:,4))/tdiff;

    % filter the data
    %Set up filter. 10Hz cutoff (10/(100/2)) (cutoff / 0.5*camera sampling
    %frequency), second order doubles to 4th order in filtfilt
    Wn = 10/(fps/2);
    [f1,f2] = butter(2,Wn);
    filtered = filtfilt(f1,f2,Expt);
    data.(string(fields(bp))) = filtered;
    
end
