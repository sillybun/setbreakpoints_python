import unittest
import setbreakpoints_python as sut


class Setbreakpoints_PythonTests(unittest.TestCase):

    def test_example_fail(self):
        input = ['a = 1',
                 'for i in range(10):',
                 '\tset_trace()',
                 '\tprint(i)']
        expected_output = ['a = 1',
                           'for i in range(10):',
                           '\tprint(i)']
        actual_output = sut.remove_breakpoints(input)
        self.assertEqual(expected_output, actual_output)


unittest.main()
