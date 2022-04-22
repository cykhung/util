function setup

unzip https://github.com/cykhung/svn/archive/refs/heads/master.zip c:\svn
addpath(genpath('c:\svn'))
svn co https://github.com/cykhung/util.git c:\util --username cykhung --password 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
rmpath(genpath('c:\svn'))
rmdir c:\svn s
com.mathworks.mlservices.MLCommandHistoryServices.add('addpath(genpath(''c:\svn''))');  %#ok<JAPIMATHWORKS> 

end
