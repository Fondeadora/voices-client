"""Package definition."""

from setuptools import find_packages, setup

setup(
    name='voices',
    packages=find_packages(),
    description='Layer for F4B Voices services',
    url='https://github.com/Fondeadora/f4b-voices-layer.git',
    author='Fondeadora',
    author_email='tech@fondeadora.com',
    keywords=['layer', 'voices', 'package'],
    install_requires=[
        'requests==2.24.0',
    ],
)
