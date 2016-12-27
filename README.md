ftp-discovery
=======================

More information about the archiving project can be found on the ArchiveTeam wiki: [FTP](http://archiveteam.org/index.php?title=FTP)

Setup instructions
=========================

Be sure to replace `YOURNICKHERE` with the nickname that you want to be shown as, on the tracker. You don't need to register it, just pick a nickname you like.

In most of the below cases, there will be a web interface running at http://localhost:8001/. If you don't know or care what this is, you can just ignore it—otherwise, it gives you a fancy view of what's going on.

**If anything goes wrong while running the commands below, please scroll down to the bottom of this page. There's troubleshooting information there.**

Running with a warrior
-------------------------

Follow the [instructions on the ArchiveTeam wiki](http://archiveteam.org/index.php?title=Warrior) for installing the Warrior, and select the "FTP Discovery" project in the Warrior interface.

Running without a warrior
-------------------------
To run this outside the warrior, clone this repository, cd into its directory and run:

    pip install seesaw requests


then start downloading with:

    run-pipeline pipeline.py --concurrent 2 YOURNICKHERE

For more options, run:

    run-pipeline --help

If you don't have root access and/or your version of pip is very old, you can replace "pip install seesaw" with:

    wget https://raw.github.com/pypa/pip/master/contrib/get-pip.py ; python get-pip.py --user ; ~/.local/bin/pip install --user seesaw

so that pip and seesaw are installed in your home, then run

    ~/.local/bin/run-pipeline pipeline.py --concurrent 2 YOURNICKHERE

Running multiple instances on different IPs
-------------------------------------------

Not supported on this project


Distribution-specific setup
-------------------------
### For Debian/Ubuntu:

    adduser --system --group --shell /bin/bash archiveteam
    apt-get install -y git-core libgnutls-dev screen python-dev python-pip bzip2 zlib1g-dev
    pip install seesaw requests
    su -c "cd /home/archiveteam; git clone https://github.com/ArchiveTeam/ftp-discovery.git; cd ftp-discovery;" archiveteam
    screen su -c "cd /home/archiveteam/ftp-discovery/; run-pipeline pipeline.py --concurrent 2 --address '127.0.0.1' YOURNICKHERE" archiveteam
    [... ctrl+A D to detach ...]

### For CentOS:

Ensure that you have the CentOS equivalent of bzip2 installed as well. You might need the EPEL repository to be enabled.

    yum -y install gnutls-devel python-pip zlib-devel
    pip install seesaw requests
    [... pretty much the same as above ...]

### For openSUSE:

    zypper install screen python-pip libgnutls-devel bzip2 python-devel gcc make
    pip install seesaw requests
    [... pretty much the same as above ...]

### For OS X:

You need Homebrew. Ensure that you have the OS X equivalent of bzip2 installed as well.

    brew install python gnutls
    pip install seesaw requests
    [... pretty much the same as above ...]

**There is a known issue with some packaged versions of rsync. If you get errors during the upload stage, ftp-discovery will not work with your rsync version.**

This supposedly fixes it:

    alias rsync=/usr/local/bin/rsync

### For Arch Linux:

Ensure that you have the Arch equivalent of bzip2 installed as well.

1. Make sure you have `python2-pip` installed.
3. Run `pip2 install seesaw`.
4. Modify the run-pipeline script in seesaw to point at `#!/usr/bin/python2` instead of `#!/usr/bin/python`.
5. `useradd --system --group users --shell /bin/bash --create-home archiveteam`
6. `screen su -c "cd /home/archiveteam/ftp-discovery/; run-pipeline pipeline.py --concurrent 2 --address '127.0.0.1' YOURNICKHERE" archiveteam`

Troubleshooting
=========================

Broken? These are some of the possible solutions:

### ImportError: No module named seesaw

If you're sure that you followed the steps to install `seesaw`, permissions on your module directory may be set incorrectly. Try the following:

    chmod o+rX -R /usr/local/lib/python2.7/dist-packages

### Issues in the code

If you notice a bug and want to file a bug report, please use the GitHub issues tracker.

Are you a developer? Help write code for us! Look at our [developer documentation](http://archiveteam.org/index.php?title=Dev) for details.

### Other problems

Have an issue not listed here? Join us on IRC and ask! We can be found at irc.efnet.org #effteepee.
