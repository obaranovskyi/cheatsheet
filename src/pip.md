* `pip show <package_name>` - Show package info
* `pip install -r requirements.txt` - Install packages from requirements.txt
* `pip list` - Show installed packages
* `python3 -m pip install -e git+https://github.com/obaranovskyi/cmdtaskmanager.git#egg=cmdtaskmanager` - Install python package from the git repository
* `pip freeze > requirements.txt` - Add all dependencies to requirements.txt file
* `pip freeze | xargs pip uninstall -y && pip freeze > requirements.txt` - Uninstall all project dependencies
