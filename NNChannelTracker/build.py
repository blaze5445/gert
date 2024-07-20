#!/usr/bin/env python
# -*- coding: utf-8 -*-

# Copyright (C) 2016 ScorpicSavior
#
# This file is part of NNChannelTracker.
#
# NNChannelTracker is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# NNChannelTracker is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with NNChannelTracker.  If not, see <http://www.gnu.org/licenses/>.

FILENAME = 'nnchannel.ipf'
EMOTICON = u'📜'

import sys, os, subprocess
sys.dont_write_bytecode = True
sys.path.append('tools')

import ipf

print 'Building IPF...'

f = ipf.IpfArchive(FILENAME, verbose=True)
f.open('wb')
args = type('Args', (object,), {})()
args.target = 'src'
ipf.args = args # Workaround for a bug in the ipf library
ipf.create_archive(f, args)
f.close()

print '\nEncrypting IPF...'
subprocess.check_call([os.path.join('tools', 'ipf_unpack.exe'), FILENAME, 'encrypt'])

print '\nRenaming IPF...'
if os.path.exists(EMOTICON + FILENAME):
    os.unlink(EMOTICON + FILENAME)
os.rename(FILENAME, EMOTICON + FILENAME)

print 'Done.'
