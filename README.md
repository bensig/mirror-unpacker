This is an unpacker for recursively extracting deb and tar files from a Debian / Ubuntu mirror.

To clone a mirror, just run:

`apt-get install apt-mirror`

Verify your sources:
`cat /etc/apt/sources.list`

Edit if necessary:
`nano /etc/apt/mirror.list`

Clone:
`su - apt-mirror -c apt-mirror`

On Ubuntu, you will have a clone in /var/spool/apt-mirror/
