#!/bin/sh

PKGNAME=aimp
SUPPORTEDARCHES="x86_64"
DESCRIPTION="AIMP (Wine based audio player) from the official site"

. $(dirname $0)/common.sh

pkgtype="$($DISTRVENDOR -p)"

if ! which wine ; then
    epm play wine || fatal
fi

repack=''
[ "$($DISTRVENDOR -s)" = "alt" ] && repack='--repack'

case $pkgtype in
    deb)
        epm install "https://www.aimp.ru/?do=download.file&id=26"
        ;;
    rpm)
        epm $repack install "https://www.aimp.ru/?do=download.file&id=32"
        ;;
    *)
        fatal "Unsupported $pkgtype"
        ;;
esac

