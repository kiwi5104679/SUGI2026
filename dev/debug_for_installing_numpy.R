Sys.unsetenv("PYTHONPATH")
reticulate::use_virtualenv("/home/gotosh3/.virtualenvs/r-saspy", required = TRUE)

reticulate::py_run_string("import sys; print(sys.path)")
reticulate::py_run_string("import os; print('CWD =', os.getcwd())")
# numpyがどこから読まれるか（importせずに場所だけ探す）
reticulate::py_run_string(
  "import importlib.util as u; s=u.find_spec('numpy'); print(s.origin if s else 'NOT FOUND')"
)

reticulate::virtualenv_install(
  envname = "/home/gotosh3/.virtualenvs/r-saspy",
  packages = c("numpy", "pandas", "saspy"),
  ignore_installed = TRUE
)

reticulate::py_run_string("import numpy; print(numpy.__version__, numpy.__file__)")
reticulate::py_run_string("import pandas; print(pandas.__version__)")
reticulate::py_run_string("import saspy; print(saspy.__version__)")
