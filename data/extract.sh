#!/bin/bash

if [ "$2" == "access_home" ];
then
	DATES=`cat $1 | grep '^127.0.0.1 - anonymous' | grep -i '] GET /showPage.yaws?node=home HTTP/1.1 200' | awk '{print $4}' | cut -c 2-`
	for i in ${DATES[@]}
  do
		DATE="$i"
		# src time is in UTC, ...
		FOO=`date -j -u -f '%d/%b/%Y:%T' "$DATE" '+%s'`
		# ... now it will be local time:
		BAR=`date -j -f '%s' "$FOO" "+%s | %V | %a | %u | %D | %T"`
		echo $BAR
  done
elif [ "$2" == "days_all" ];
then
	file="$1"
	while read i; do
		SECS=`echo "$i" | awk -F "|" '{printf("%d", $1);}'`
		DAY=`echo "$i" | awk -F "|" '{printf("%s", $5);}'`
		DAY_START=`date -j -f ' %D  %T' "${DAY} 00:00:00" '+%s'`
		SECONDS=`echo "${SECS}-${DAY_START}" | bc`
		echo "${DAY} ${SECONDS}"
	done < "$file"
elif [ "$2" == "weeks_all" ];
then
	file="$1"
	while read i; do
		SECS=`echo "$i" | awk -F "|" '{printf("%d", $1);}'`
		WEEK=`echo "$i" | awk -F "|" '{printf("%d", $2);}'`
		WEEK_START=`date -j -f '%V - %a %Y %T' "${WEEK} - Mon 2015 00:00:00" '+%s'`
		DSECS=`echo "${SECS}-${WEEK_START}" | bc`
		echo "${WEEK} | ${DSECS}"
	done < "$file"
elif [ "$2" == "weeks" ];
then
	MIN=`cat $1 | awk -F "|" 'BEGIN{m=100} {m=(m<$1)?m:$1;} END{print m;}'`
	MAX=`cat $1 | awk -F "|" 'BEGIN{m=0} {m=(m>$1)?m:$1;} END{print m;}'`
	for i in `seq $MIN $MAX`
	do
		cat $1 | grep "^$i" | awk -F '|' '{print $2 }'  >> "$3/week_${i}.txt"
	done
fi
