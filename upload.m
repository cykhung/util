function upload(varargin)

%%
%       SYNTAX: upload(zipfilename);
%               upload(zipfilename, classdir);
%
%  DESCRIPTION: Zip and upload class folder (e.g. c:\class) onto GitHub.
%
%        INPUT: - zipfilename (char)
%                   Zip filename, e.g. kevin.zip. No folder path (just
%                   filename).
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
folder          = fileparts(mfilename('fullpath'));
zipfilename_abs = fullfile(folder, zipfilename);
zip(zipfilename_abs, classdir);
% fprintf('Zip up all files under "%s" in %s.\n', classdir, zipfilename);


%% Upload zip file.
try     %#ok<TRYNC> 
    [~] = svn('add', zipfilename_abs);
end
[~] = svn('ci ', zipfilename_abs, '-m ""');
% fprintf('Upload %s to GitHub.\n', zipfilename);


%%
url = sprintf('https://github.com/cykhung/util/blob/main/%s', zipfilename);
fprintf('\nGo to %s to download the zip file.\n\n', url)


end
