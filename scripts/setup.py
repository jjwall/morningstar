from setuptools import setup

setup(
   name='morningstar',
   version='0.0.1',
   description='Test automation software for PicoScope & MIRcat initialization and orchestration.',
   author='Jake Wallace',
   author_email='jacob.wallace@utexas.edu',
   packages=['morningstar'],  #same as name
   install_requires=['numpy'], #external packages as dependencies
   scripts=[
            'morningstar/modules/mircatsdk/utils.py',
            # 'modules/picosdk_utils',
           ]
)