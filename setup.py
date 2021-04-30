"""Package definition."""

from setuptools import find_packages, setup

setup(
    name='<layer-name>',
    packages=find_packages(),
    description='Layer for F4B services',
    url='https://github.com/Fondeadora/f4b-db-layer.git',
    author='Fondeadora',
    author_email='tech@fondeadora.com',
    keywords=['layer'],
    install_requires=[
        # 'psycopg2-binary~=2.8.6',
    ],
)