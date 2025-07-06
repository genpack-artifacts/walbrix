set -e
git clone https://github.com/wbrxcorp/weston-deferred.git /tmp/weston-deferred
cd /tmp/weston-deferred
make
PREFIX=/usr make install
