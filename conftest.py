import pytest
from unittest.mock import patch


@pytest.fixture(autouse=True, scope="function")
def got_to_tmpdir(request):
    tmpdir = request.getfixturevalue("tmpdir")
    with tmpdir.as_cwd():
        yield  # protocolo de generators


@pytest.fixture(autouse=True, scope="function")
def setup_testing_database(request):  # injeção de dependencias
    """For each test, create a database file on tmpdir
    force database.py to use that filepath
    """
    tmpdir = request.getfixturevalue("tmpdir")
    test_db = str(tmpdir.join("database.test.json"))
    with patch("dundie.database.DATABASE_PATH", test_db):
        yield
