import unittest
import setbreakpoints_python as sut


@unittest.skip("Don't forget to test!")
class Setbreakpoints_PythonTests(unittest.TestCase):

    def test_example_fail(self):
        result = sut.setbreakpoints_python_example()
        self.assertEqual("Happy Hacking", result)
