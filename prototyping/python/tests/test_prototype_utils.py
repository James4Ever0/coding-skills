"""Tests for prototyping/python/prototype_utils.py"""

import sys
import os
import tempfile
import unittest

sys.path.insert(0, os.path.join(os.path.dirname(__file__), ".."))

from prototype_utils import (
    read_file,
    write_file,
    format_error,
    format_success,
    read_json,
    write_json,
)


class TestFileUtils(unittest.TestCase):

    def setUp(self):
        self.temp_dir = tempfile.mkdtemp()

    def test_write_and_read_file(self):
        path = os.path.join(self.temp_dir, "test.txt")
        write_file(path, "hello")
        content = read_file(path)
        self.assertEqual(content, "hello")

    def test_write_creates_dirs(self):
        path = os.path.join(self.temp_dir, "a", "b", "test.txt")
        write_file(path, "nested")
        self.assertTrue(os.path.exists(path))

    def test_write_and_read_json(self):
        path = os.path.join(self.temp_dir, "data.json")
        data = {"key": "value", "num": 42}
        write_json(path, data)
        loaded = read_json(path)
        self.assertEqual(loaded, data)


class TestFormatUtils(unittest.TestCase):

    def test_format_error(self):
        self.assertEqual(format_error("something broke"), "Error: something broke")

    def test_format_success(self):
        self.assertEqual(format_success("all good"), "OK: all good")


if __name__ == "__main__":
    unittest.main()
