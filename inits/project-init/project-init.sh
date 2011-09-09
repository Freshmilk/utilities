#!/bin/bash
set -x

init
{
    #virtualenv
    virtualenv $1 && cd $1
    source bin/activate

    #buildout
    bin/easy_install zc.buildout
    mkdir buildout && cd buildout
    buildout init
    wget http://svn.zope.org/*checkout*/zc.buildout/trunk/bootstrap/bootstrap.py
    svn export svn+ssh://develop/utils/configs/buildout/buildout.cfg
    (python bootstrap.py || python bootstrap.py)
}
