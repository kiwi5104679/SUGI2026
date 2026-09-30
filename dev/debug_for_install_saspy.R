sasquatch::install_saspy()
sasquatch::configure_saspy()


# 原因の考察 ----
# 1. reticulate が virtualenv として認識しているか
reticulate::virtualenv_exists("r-saspy")

# 2. 一覧に出るか
reticulate::virtualenv_list()

# 3. フォルダの中身を確認（pyvenv.cfg があるか）
list.files("~/.virtualenvs/r-saspy", all.files = TRUE)

# 対処法----
# 1. 壊れた環境を完全削除（lib だけの残骸を消す）
reticulate::virtualenv_remove("r-saspy", confirm = FALSE)
# もし上が効かなければフォルダごと削除
unlink("~/.virtualenvs/r-saspy", recursive = TRUE, force = TRUE)

# 2. PYTHONPATH を必ず遮断（EB混入防止）
Sys.unsetenv("PYTHONPATH")

# 3. sasquatch でクリーンに作り直し
sasquatch::install_saspy()


# Check ----
# ★R再起動直後。まだ reticulate を一切呼ばない状態で
# 1. EB混入を遮断
Sys.unsetenv("PYTHONPATH")

# 2. 使う仮想環境を「Python初期化前に」固定する（最重要）
reticulate::use_virtualenv("/home/gotosh3/.virtualenvs/r-saspy", required = TRUE)

# 3. ここで初めて import（この時点で python が確定する）
reticulate::py_config()   # python: が .virtualenvs/r-saspy/bin/python を指すか確認
reticulate::py_run_string("import numpy; print(numpy.__file__)")
