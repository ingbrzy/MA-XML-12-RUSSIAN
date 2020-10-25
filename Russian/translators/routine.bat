SET _DEVICE=%1
SET _APKFILE=%2

SET xmlcmp_s=D:\Android\XMLCompare\XMLCompare.exe /au
SET xmlcmp_p=D:\Android\XMLCompare\XMLCompare.exe /fp /au

SET _src=D:\Android\Github\MA-XML-12-RUSSIAN\Russian\translators\__repo\
SET _dst=D:\Android\Github\MA-XML-12-RUSSIAN\Russian\device\
SET _mnt=D:\Android\Github\MA-XML-12-RUSSIAN\Russian\main

SET _dir=\%_APKFILE%\res\values-ru\

IF EXIST %_mnt%%_dir%strings.xml (
  del %_dst%%_DEVICE%%_dir%strings.xml
  copy %_mnt%%_dir%strings.xml %_dst%%_DEVICE%%_dir% 
) ELSE (
  echo "(missing strings.xml)"
  goto _finish_s
)

%xmlcmp_s% /s %_src%%_DEVICE%%_dir%strings.xml /d %_dst%%_DEVICE%%_dir%strings.xml /n 4

IF EXIST %_dst%%_DEVICE%%_dir%result.xml (
  del %_dst%%_DEVICE%%_dir%strings.xml
  ren %_dst%%_DEVICE%%_dir%result.xml strings.xml
) ELSE (
  echo "(missing result.xml)"
)

:_finish_s

IF EXIST %_mnt%%_dir%plurals.xml (
  del %_dst%%_DEVICE%%_dir%plurals.xml
  copy %_mnt%%_dir%plurals.xml %_dst%%_DEVICE%%_dir% 
) ELSE (
  echo "(missing plurals.xml)"
  goto _finish_p
)

%xmlcmp_p% /s %_src%%_DEVICE%%_dir%plurals.xml /d %_dst%%_DEVICE%%_dir%plurals.xml /n 4

IF EXIST %_dst%%_DEVICE%%_dir%result.xml (
  del %_dst%%_DEVICE%%_dir%plurals.xml
  ren %_dst%%_DEVICE%%_dir%result.xml plurals.xml
) ELSE (
  echo "(missing result.xml)"
)

:_finish_p

IF EXIST %_mnt%%_dir%arrays.xml (
  copy %_mnt%%_dir%arrays.xml %_dst%%_DEVICE%%_dir% 
)

