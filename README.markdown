AhnHub.com
==========

GWOBHub is a Github-based site for sharing GWOB applications with the greater GWOB community.

When you create a new GWOB app and upload it to Github, notifying GWOBHub of your app is as simple as making `http://gwob.heroku.com` a post-receive hook for the repository. When you commit to the project, Github will POST information about your repository to GWOBHub. Thanks to Github, GWOBHub will always be up to date.

Generating fake development data
----------

To generate fake data for development purposes, run...

    rake db:seed

This will create a bunch of sample components (with silly, randomly-generated descriptions).

-------

LICENSE
-------
Copyright (c) 2010 Chris Matthieu

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
