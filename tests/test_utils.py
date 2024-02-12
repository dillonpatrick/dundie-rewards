import pytest

from dundie.utils.email import check_valid_email
from dundie.utils.user import generate_simple_password


@pytest.mark.unit
@pytest.mark.parametrize(
    "address", ["dillon@patrick.com", "patrick@silva.com", "a@b.com.br"]
)
def test_positive_check_valid_email(address):
    """Ensure email is valid"""
    assert check_valid_email(address) is True


@pytest.mark.unit
@pytest.mark.parametrize("address", ["dillon@.com", "@patrick.com"])
def test_negative_check_valid_email(address):
    """Ensure email is invalid"""
    assert check_valid_email(address) is False


@pytest.mark.unit
def test_generate_simple_password():
    """Test generation of random simple password
    TODO: Generate hashed complex passwords, encrypt it
    """

    passwords = []
    for _ in range(100):
        passwords.append(generate_simple_password(8))

    assert len(set(passwords)) == 100
