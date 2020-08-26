SET _DEVICE=%1
SET _APKFILE=%2
SET _EXT=%3

SET _src=D:\Android\Github\MA-XML-12-Compare\%_DEVICE%\%_APKFILE%.apk\res\values\
SET _dst=D:\Android\Github\MA-XML-12-RUSSIAN\Russian\main\%_APKFILE%.apk\res\values-ru%_EXT%\

IF EXIST %_src%strings.xml (
  copy %_src%strings.xml D:\Android\XMLCompare\SRC 
  copy %_dst%strings.xml D:\Android\XMLCompare\DST 
) ELSE (
  echo NOT FOUND
  goto _failed
)

XMLCompare /s D:\Android\XMLCompare\SRC\strings.xml /d D:\Android\XMLCompare\DST\strings.xml /i D:\Android\XMLCompare\ignore.xml /t D:\Android\XMLCompare\translate.xml /n 4 /silent_t

IF EXIST .\DST\result.xml (
  copy .\DST\result.xml .\DST\strings.xml
  del .\DST\result.xml

  copy .\DST\strings.xml %_dst%
) ELSE (
  echo FAILED
  goto _failed
)

:_failed