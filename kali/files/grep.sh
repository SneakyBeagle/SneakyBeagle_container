#!/bin/bash

cmd=$1

$cmd | grep --color=auto -E '[uU][sS][eE][rR]|[Pp][aA][sS]{2}|[dD][bB]|[vV][eE][rR][sS][iI][oO][nN]|[cC][rR][eE][dD]|[rR][oO]{2}[tT]|[aA][dD][mM][iI][nN]|href|JSESSION|JWT|jwt|[cC][oO]{2}[kK][iI][eE]|[hH][aA][sS][hH]|[0-9]{1,3}(\.[0-9]{1,3}){1,3}\:{0,1}[0-9]+'

