# Testfiles for rdiff-backup automated testing

## Usage

The archive `rdiff-backup_testfiles.tar` needs to be extracted as root in the
same directory where the `rdiff-backup` git repository lies, so that the
tox-tests can be successful as per the variable `old_test_dir` in
`testing/commontest.py` pointing to `${PWD}_testfiles` (in Python terms).

The extraction as root (e.g. `sudo tar xvzf rdiff-backup_testfiles.tar.gz`) is
sadly necessary because else the device files won't be extracted as normal user.
You then possibly need to fix as root the access rights so that the user/group
you're using normally in your daily development life is set instead of the
default user and group 1000. For this you may use the script and call
`sudo ./rdiff-backup-filesrepo/rdiff-backup_testfiles.fix.sh`.

So in summary:

```
# you're in the cloned rdiff-backup Git repository
cd ..
git clone https://github.com/rdiff-backup/rdiff-backup-filesrepo.git
sudo tar xvf ./rdiff-backup-filesrepo/rdiff-backup_testfiles.tar
sudo ./rdiff-backup-filesrepo/rdiff-backup_testfiles.fix.sh
```

> **IMPORTANT:** the script normally uses the variables `SUDO_UID` and `SUDO_GID`
handled by sudo to set the files' ownership to the current *normal* user.
If you want to assign the files to a different user/group, you may call
`sudo ./rdiff-backup-filesrepo/rdiff-backup_testfiles.fix.sh <uid> <gid>`.
It should be the same non-root user/group as which you'll be calling `tox`.

## Notes

* the tar file is necessary and the files it contains can't be put directly
  in Git because of the special aspects like user rights, ACLs, devices...
* by not compressing the tar file, it looks more like a text file to Git
  and should allow it to better handle deltas between versions.
* we'll be working on making more of the testfiles be generated during the
  tests but (again) due to the special aspects required, it is not as easy as
  it could seem.
