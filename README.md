This software is released by the MIT License (MIT)

>Copyright (c) <2014> <Lin F. Yang>

>Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

>The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

>THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANT ABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

Introduction
============
Kindle uses the amazon cloud to synchronlize files. When we want to send a file to kindle we need to send an email to the specific email address. Amazon will automatically convert the file format so that it can fit to the default formats supported by the original system. The conversion sometimes sucks, and we cannot send files with unsupported formats, e.g. epub. On the other hand, people usually use other cloud services such as dropbox, google drive or skydev etc. This introduces a great incovinence when we want to sync files on these cloud servers. I hereby introduce a simple solution that could sync files from any public cloud services by using bash scripts and cURL.

This solution includes a single script "update.sh". The configuration has two parts. The first configuration file "configure.ini" is on the local drive (i.e. the kinle storage). The second file is an file sync-list. It is on a cloud and must have a public-reachable URL (e.g. use the dropbox public share functional). One should put this URL in the configure.ini. Once this is done, the local part is set up. For the remote part, one could edit the sync-list online without any restriction. The sync-list has the following format:
> <remote url> <kinle director> [option]
> options:
> -e: test the denstination's existancy on the kindle drive, if the file already exists, ignore the updates
> -r: replace the file if it already exists on kindle
> example:
> https://dl.dropboxusercontent.com/u/37882231/KindleSync/test.txt /mnt/us/documents/Others/test.txt -r

The example would synchronize the test.txt in kindle's folder /mnt/us/documents/Others/

Once both ends have been set up, one can use the KUAL/kterm to lanch the script. The files in the sync-list would be synced by simply one-click.

Usage
======
- Put the *FileSyncer* folder into the *extensions* folder in the kindle usb driver root.
- Edit the *FileSyncer/bin/configure.ini* such that it has a link to your online sync-list file. 
- Edit the sync-list file online, put the to-be-synced file urls in the sync-list by following the format string. 
- Click the *Sync* button on kindle. Done.