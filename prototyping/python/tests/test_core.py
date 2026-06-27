"""Tests for prototyping/python/logic/core.py"""

import sys
import os
import unittest

# Ensure the package root is on the path
sys.path.insert(0, os.path.join(os.path.dirname(__file__), ".."))

from logic.core import validate_name, parse_args, Result


class TestValidateName(unittest.TestCase):

    def test_valid_name(self):
        result = validate_name("my-skill")
        self.assertTrue(result.success)
        self.assertEqual(result.message, "Name is valid")

    def test_empty_name(self):
        result = validate_name("")
        self.assertFalse(result.success)
        self.assertEqual(result.message, "Name cannot be empty")

    def test_name_with_spaces(self):
        result = validate_name("my skill")
        self.assertFalse(result.success)
        self.assertEqual(result.message, "Name cannot contain spaces")

    def test_name_with_special_chars(self):
        result = validate_name("my_skill!")
        self.assertFalse(result.success)

    def test_name_with_numbers(self):
        result = validate_name("skill-2")
        self.assertTrue(result.success)


class TestParseArgs(unittest.TestCase):

    def test_empty_args(self):
        self.assertEqual(parse_args([]), {})

    def test_single_arg(self):
        self.assertEqual(parse_args(["name=test"]), {"name": "test"})

    def test_multiple_args(self):
        result = parse_args(["a=1", "b=2"])
        self.assertEqual(result, {"a": "1", "b": "2"})

    def test_no_equals_sign(self):
        self.assertEqual(parse_args(["just-a-value"]), {})


class TestResult(unittest.TestCase):

    def test_result_defaults(self):
        r = Result(True, "test")
        self.assertTrue(r.success)
        self.assertEqual(r.message, "test")
        self.assertIsNone(r.data)

    def test_result_with_data(self):
        r = Result(True, "test", data={"key": "value"})
        self.assertEqual(r.data, {"key": "value"})


if __name__ == "__main__":
    unittest.main()
