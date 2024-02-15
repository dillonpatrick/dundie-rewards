import os

curdir_ = os.getcwd().replace("\\", "/")  # windows -> unix path

PEOPLE_FILE = os.path.join(f"{curdir_}/tests/assets/people.csv")
