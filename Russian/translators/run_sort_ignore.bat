cls

SET _run=D:\Android\XMLCompare\
SET _dst=D:\Android\Github\MA-XML-12-RUSSIAN\Russian\translators\

%_run%XMLCompare /s %_dst%empty.xml /d %_dst%ignore.xml /n 4

IF EXIST %_dst%result.xml (
  del %_dst%ignore.xml
  rename %_dst%result.xml ignore.xml
) ELSE (
  echo NOT FOUND
)
