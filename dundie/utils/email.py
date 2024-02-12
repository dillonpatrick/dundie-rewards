import re

regex = r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$"


def check_valid_email(adress):
    """Return True if email is valid."""
    return bool(re.fullmatch(regex, adress))
