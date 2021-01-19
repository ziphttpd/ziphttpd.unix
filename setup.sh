#!/bin/bash
set -e

ZH_HOME=$1

if [ ! "${ZH_HOME}" ]; then
	echo "$0 {ZIPHTTPD_HOME_DIR}"
	exit 1
fi

function MAKELINK() {
	PRJ=$1
	LINKNAME=${ZH_HOME}/${PRJ}.sh
	if [ ! -L ${LINKNAME} ]; then
		ln -s ${ZH_HOME}/controller.sh ${LINKNAME}
		chmod +x ${LINKNAME}
	fi
}

cp controller.sh ${ZH_HOME}/

MAKELINK ziphttpd
MAKELINK selector

exit 0
