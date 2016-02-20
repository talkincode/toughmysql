#!/usr/bin/env python
from fabric.api import *

__version__ = '0.0.2'

def tag():
    local("git tag -a v%s -m 'version %s'"%(__version__,__version__))
    local("git push origin v%s:v%s"%(__version__,__version__))