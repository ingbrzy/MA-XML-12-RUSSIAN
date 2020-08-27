cls

SET _run=D:\Android\XMLCompare\
SET _dst=D:\Android\Github\MA-XML-12-RUSSIAN\Russian\translators\

%_run%XMLCompare /s %_run%empty.xml /d %_run%translate.xml /n 4

IF EXIST %_run%result.xml (
  del %_run%translate.xml
  rename %_run%result.xml translate.xml
  copy %_run%translate.xml %_dst%
) ELSE (
  echo NOT FOUND
)
