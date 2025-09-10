%% PathInitializer.m
% Initialize codes running from Github to get required directories
% Saves and loads path info from pathInfo.txt

% --- Path to config file ---
configFile = fullfile(pwd, 'pathInfo.txt');

if isfile(configFile)
    % --- Load from pathInfo.txt ---
    disp('Loading paths from pathInfo.txt ...');
    fid = fopen(configFile, 'r');
    rdDir = string(fgetl(fid));
    rawDataDir = string(fgetl(fid));
    wrDir = string(fgetl(fid));
    fclose(fid);
else
    % --- Ask User for Paths ---
    rdDir = uigetdir([], "Choose Reading Directory");
    if rdDir == 0, error("No reading folder selected."); end
    rdDir = string(rdDir) + filesep;

    rawDataDir = uigetdir(rdDir, "Choose Raw Data Directory");
    if rawDataDir == 0, error("No raw data folder selected."); end
    rawDataDir = string(rawDataDir) + filesep;

    wrDir = uigetdir(rdDir, "Choose Writing Directory");
    if wrDir == 0, error("No writing folder selected."); end
    wrDir = string(wrDir) + filesep;

    % --- Save to pathInfo.txt ---
    fid = fopen(configFile, 'w');
    fprintf(fid, '%s\n', rdDir);
    fprintf(fid, '%s\n', rawDataDir);
    fprintf(fid, '%s\n', wrDir);
    fclose(fid);
    disp('Path information saved to pathInfo.txt');
end

% --- Summary Output ---
disp("----- PATHS INITIALIZED -----");
disp("Reading Directory: " + rdDir);
disp("Raw Data Directory: " + rawDataDir);
disp("Writing Directory: " + wrDir);
disp("-----------------------------");
