find rdiff-backup_testfiles -user 1000 \! -type l -print0 | xargs -0 chown ${1:-$SUDO_UID}
find rdiff-backup_testfiles -group 1000 \! -type l -print0 | xargs -0 chgrp ${2:-$SUDO_GID}
find rdiff-backup_testfiles -user 1000 -type l -print0 | xargs -0 chown -h ${1:-$SUDO_UID}
find rdiff-backup_testfiles -group 1000 -type l -print0 | xargs -0 chgrp -h ${2:-$SUDO_GID}
