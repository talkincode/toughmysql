#!/usr/bin/env python
from fabric.api import *

def tag():
    __version__ = raw_input("release new version:")
    local("git tag -a v%s -m 'version %s'"%(__version__,__version__))
    local("git push origin v%s:v%s"%(__version__,__version__))