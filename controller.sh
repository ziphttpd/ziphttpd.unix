#!/bin/bash
SCRIPT=$0

#case "$1" in
#	ziphttpd|selector)
#		PROGID=$1
#		;;
#	*)
#		echo "Usage: ${SCRIPT} {ziphttpd|selector} {start|stop|restart|status}"
#		exit 1
#		;;
#esac

filepath=$0
filename=$(echo ${filepath##*/})
PROGID=$(echo ${filename%.*})

ARG=$1
SCRIPT_DIR=$(cd $(dirname ${SCRIPT}); pwd)
EXE_FILE=${SCRIPT_DIR}/${PROGID}
PID_FILE=${SCRIPT_DIR}/${PROGID}.pid
RUNNING=0

if [ -f ${PID_FILE} ]; then
	PID=$(cat ${PID_FILE})
	ps -p ${PID} -C ${PROGID} >/dev/null 2>&1
	res=$?
	if [ ${res} -eq 0 ]; then
		RUNNING=1
	else
		RUNNING=0
		rm ${PID_FILE}
	fi
fi

case "${ARG}" in
	start)
		if [ ${RUNNING} == 0 ]; then
			${EXE_FILE} > ${SCRIPT_DIR}/log/${PROGID}.out 2>&1 &
		fi
		;;
	stop)
		if [ ${RUNNING} == 1 ]; then
			kill -9 ${PID}
			rm ${PID_FILE}
		fi
		;;
	restart)
		bash ${SCRIPT} stop
		bash ${SCRIPT} start
		;;
	status)
		if [ ${RUNNING} == 1 ]; then
			echo "${PROGID} is running";
		else
			echo "${PROGID} is NOT running";
		fi
		exit 0;
		;;
	*)
		echo "Usage: ${EXE_FILE} {start|stop|restart|status}"
		exit 1
		;;
esac

exit 0
