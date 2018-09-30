from distutils.core import setup
from setuptools import find_packages

setup(
  name         = 'minimal_setup',
  version      = '1.0',
  description  = 'minimal setup',
  author       = 'ymatsukawa',
  author_email = 'ymatsukawa27@example.com',
  url          = 'https://github.com/ymatsukawa/',
  license      = 'MIT',
  packages     = find_packages(where = '.'),
)
