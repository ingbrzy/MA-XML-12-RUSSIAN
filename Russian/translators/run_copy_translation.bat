SET _DEVICE=%1
SET _APKFILE=%2
SET _EXT=%3

SET _run=D:\Android\XMLCompare\
SET _src=D:\Android\Github\MA-XML-12-Compare\%_DEVICE%\%_APKFILE%.apk\res\values\
SET _dst=D:\Android\Github\MA-XML-12-RUSSIAN\Russian\main\%_APKFILE%.apk\res\values-ru%_EXT%\
SET _dat=D:\Android\Github\MA-XML-12-RUSSIAN\Russian\translators\

IF EXIST %_src%strings.xml (
  copy %_src%strings.xml D:\Android\XMLCompare\SRC 
  copy %_dst%strings.xml D:\Android\XMLCompare\DST 
) ELSE (
  echo NOT FOUND
  goto _failed
)

%_run%XMLCompare /s %_run%SRC\strings.xml /d %_run%DST\strings.xml /i %_dat%ignore.xml /t %_dat%translate.xml /n 4 /silent_t

IF EXIST %_run%DST\result.xml (
  copy %_run%DST\result.xml %_run%DST\strings.xml
  copy %_run%DST\strings.xml %_dst%
) ELSE (
  echo FAILED
  goto _failed
)

:_failed