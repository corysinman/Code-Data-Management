classdef PathManager
    % PathManager
    %   Manage reading/writing directories and persist them to a text file.
    %
    % Usage:
    %   pm = PathManager();    % auto-load from pathInfo.txt or prompt+save

    properties
        rdDir      string = ""   % Reading directory
        rawDataDir string = ""   % Raw data directory
        wrDir      string = ""   % Writing directory
        configFile string        % pathInfo.txt file path
    end

    methods
        function obj = PathManager()
            % Constructor: check for pathInfo.txt in current directory
            obj.configFile = fullfile(pwd, 'pathInfo.txt');

            if isfile(obj.configFile)
                disp("Found pathInfo.txt, loading paths...");
                obj = obj.loadFromFile(obj.configFile);
                obj.printSummary("Loaded from pathInfo.txt");
            else
                disp("pathInfo.txt not found, prompting user...");
                obj = obj.prompt();
                obj.saveToFile(obj.configFile);
                obj.printSummary("Saved new paths to pathInfo.txt");
            end
        end

        function obj = prompt(obj)
            % Prompt user to select directories
            raw = uigetdir(rd, "Choose Raw Data Directory");
            if raw == 0, error("No raw data folder selected."); end

            rd = uigetdir([], "Choose Reading Directory");
            if rd == 0, error("No reading folder selected."); end

            wr = uigetdir(rd, "Choose Writing Directory");
            if wr == 0, error("No writing folder selected."); end

            obj.rdDir      = obj.ensureSep(string(rd));
            obj.rawDataDir = obj.ensureSep(string(raw));
            obj.wrDir      = obj.ensureSep(string(wr));
        end

        function obj = load(obj)
            % Ask user for a file and load paths
            [file, path] = uigetfile({'*.txt','Text Files (*.txt)'}, ...
                                     'Select path info file', pwd);
            if isequal(file,0)
                error('Load cancelled. No file selected.');
            end
            obj = obj.loadFromFile(fullfile(path, file));
            obj.printSummary("Loaded from user-selected file");
        end

        function obj = loadFromFile(obj, cfg)
            % Internal: load from a given filename
            fid = fopen(cfg, 'r');
            if fid == -1, error('Unable to open file: %s', cfg); end
            cleaner = onCleanup(@() fclose(fid));

            lines = strings(0);
            while true
                t = fgetl(fid);
                if ~ischar(t); break; end
                lines(end+1,1) = string(t); %#ok<AGROW>
            end
            if numel(lines) < 3
                error('Config file must contain at least 3 lines: rdDir, rawDataDir, wrDir.');
            end

            obj.rdDir      = obj.ensureSep(lines(1));
            obj.rawDataDir = obj.ensureSep(lines(2));
            obj.wrDir      = obj.ensureSep(lines(3));
        end

        function save(obj)
            % Ask user for a file and save paths
            [file, path] = uiputfile({'*.txt','Text Files (*.txt)'}, ...
                                     'Save path info as', obj.configFile);
            if isequal(file,0)
                disp('Save cancelled.');
                return;
            end
            cfg = fullfile(path, file);
            obj.saveToFile(cfg);
            obj.printSummary("Saved to user-specified file");
        end

        function saveToFile(obj, cfg)
            % Internal: save to a given filename
            fid = fopen(cfg, 'w');
            if fid == -1, error('Unable to write file: %s', cfg); end
            cleaner = onCleanup(@() fclose(fid));

            fprintf(fid, '%s\n', obj.rdDir);
            fprintf(fid, '%s\n', obj.rawDataDir);
            fprintf(fid, '%s\n', obj.wrDir);
            disp("Path information saved to: " + string(cfg));
        end

        function ok = isValid(obj, warnIfMissing)
            % Check that all directories exist
            if nargin < 2, warnIfMissing = false; end
            exists = [isfolder(obj.rdDir), isfolder(obj.rawDataDir), isfolder(obj.wrDir)];
            ok = all(exists);
            if warnIfMissing && ~ok
                names = ["rdDir","rawDataDir","wrDir"];
                for i = 1:numel(exists)
                    if ~exists(i)
                        warning('%s does not exist: %s', names(i), obj.(names(i)));
                    end
                end
            end
        end
    end

    methods (Access = private)
        function p = ensureSep(~, p)
            % Ensure trailing filesep
            if strlength(p) > 0 && ~endsWith(p, filesep)
                p = p + filesep;
            end
        end

        function printSummary(obj, msg)
            % Print out the current path info
            disp("----- PATHS INITIALIZED (" + msg + ") -----");
            disp("Reading Directory: " + obj.rdDir);
            disp("Raw Data Directory: " + obj.rawDataDir);
            disp("Writing Directory: " + obj.wrDir);
            disp("-------------------------------------------");
        end
    end
end
