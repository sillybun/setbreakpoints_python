import unittest
import setbreakpoints_python as sut


class Setbreakpoints_PythonTests(unittest.TestCase):

    def test_example_fail(self):
        input = ['a = 1',
                 'for i in range(10):',
                 '\tset_trace()',
                 '\tprint(i)']
        expected_output = ['from pdb import set_trace',
                           'a = 1',
                           'for i in range(10):',
                           '\tset_trace()',
                           '\tprint(i)']
        actual_output = sut.create_import(input, True)
        self.assertEqual(expected_output, actual_output)

    def test_example_fail1(self):
        input = ['#!/bin/python',
                 'a = 1',
                 'for i in range(10):',
                 '\tset_trace()',
                 '\tprint(i)']
        expected_output = ['#!/bin/python',
                           'from pdb import set_trace',
                           'a = 1',
                           'for i in range(10):',
                           '\tset_trace()',
                           '\tprint(i)']
        actual_output = sut.create_import(input, True)
        self.assertEqual(expected_output, actual_output)


unittest.main()
