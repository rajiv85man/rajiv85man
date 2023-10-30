@SET PATH=%PATH%;"C:\Program Files\Python310";"C:\Program Files\Python310\Scripts";"C:\Program Files (x86)\GnuWin32\bin"
@SET PYTHONPATH="C:\Program Files\Python310\Lib"

@ASSOC .py=Python.File
@ASSOC .pyc=Python.CompiledFile
@ASSOC .pyo=Python.CompiledFile
@ASSOC .pyw=Python.NoConFile

@FTYPE Python.CompiledFile="C:\Program Files\Python310\python.exe" "%%1" %%*
@FTYPE Python.File="C:\Program Files\Python310\python.exe" "%%1" %%*
@FTYPE Python.NoConFile="C:\Program Files\Python310\pythonw.exe" "%%1" %%*
@SET PATHEXT=.py;%PATHEXT%