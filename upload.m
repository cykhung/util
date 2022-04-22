function upload(varargin)

%%
%       SYNTAX: upload(zipfilename);
%               upload(zipfilename, classdir);
%
%  DESCRIPTION: Zip and upload class folder (e.g. c:\class) onto GitHub.
%
%        INPUT: - zipfilename (char)
%                   Zip filename.
%
%               - classdir (char)
%                   Class folder. Optional. Default = 'c:\class'.
%
%       OUTPUT: none.


%% Assign input arguments.
classdir = 'c:\class';
switch nargin
case 1
    zipfilename = varargin{1};
case 2
    zipfilename = varargin{1};
    classdir    = varargin{2};
otherwise    
    error('Invalid number of input arguments.');
end


%% Create zip file.
folder      = fileparts(mfilename('fullpath'));
zipfilename = fullfile(folder, zipfilename);
zip(zipfilename, classdir);


%% Upload zip file.
try     %#ok<TRYNC> 
    [~] = svn('add', zipfilename);
end
svn('ci ', zipfilename, '-m ""');


end
