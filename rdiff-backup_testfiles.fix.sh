find rdiff-backup_testfiles -user 1000 \! -type l -print0 | xargs -0 chown -v ${1:-$SUDO_UID}
find rdiff-backup_testfiles -group 1000 \! -type l -print0 | xargs -0 chgrp -v ${2:-$SUDO_GID}
find rdiff-backup_testfiles -user 1000 -type l -print0 | xargs -0 chown -vh ${1:-$SUDO_UID}
find rdiff-backup_testfiles -group 1000 -type l -print0 | xargs -0 chgrp -vh ${2:-$SUDO_GID}
