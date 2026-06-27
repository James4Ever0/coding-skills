#!/usr/bin/env python3
"""
Standalone test runner — no pytest dependency.

Discovers and runs all TestCase classes in the tests/ directory.
"""

import os
import sys
import unittest


def main():
    loader = unittest.TestLoader()
    suite = unittest.TestSuite()

    # Discover tests in this script's directory
    test_dir = os.path.dirname(os.path.abspath(__file__))
    discovered = loader.discover(start_dir=test_dir, pattern="test_*.py")
    suite.addTests(discovered)

    runner = unittest.TextTestRunner(verbosity=2)
    result = runner.run(suite)

    sys.exit(0 if result.wasSuccessful() else 1)


if __name__ == "__main__":
    main()
