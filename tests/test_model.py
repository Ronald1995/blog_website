from pytest import mark, raises

from ..app.model import User


@mark.unit
class TestUserModel:

    @staticmethod
    def test_password_setter():
        u = User(password='cat')
        assert u.password_hash is not None

    @staticmethod
    def test_no_password_getter():
        u = User(password='cat')
        with raises(AttributeError):
            u.password

    @staticmethod
    def test_password_verification():
        u = User(password='cat')
        assert (
            u.verify_password('cat') is True
            and u.verify_password('dog') is False
        )

    @staticmethod
    def test_password_salt_are_random():
        u = User(password='cat')
        u1 = User(password='cat')
        assert u.password_hash != u1.password_hash
