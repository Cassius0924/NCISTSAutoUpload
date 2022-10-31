#!/bin/bash

[ -f ./RememberMe.sh ] && . ./RememberMe.sh || { echo "错误：请检查脚本完整性，缺少RememberMe.sh文件" && exit 1; }

count=$#

function options(){
	if [ "$#" -ge "3" ]	#参数多于2个时候
	then
		echo "错误：参数错误"
		exit
	fi
	
	case $1 in
		-h) 
			validateParams 1
			help
			;;
		-d) 
			validateParams 2
			echo "删除网站作业文件"
			;;
		-D) 
			validateParams 1 
			echo "删除本地作业文件"
			;;
		-r) 
			validateParams 1
			rememberMe
			;;
		-n) 
			validateParams 1
			echo "自动重命名作业文件"
			;;
		[1-9]|[10-19])
		   	validateParams 1
			echo "上传第$1题"
			;;
		*) echo "错误：参数错误"
			;;
	esac
}

function help() {
	echo '=============================='
	echo "||   NcsisAutoUpload 帮助： ||"
	echo '=============================='
	echo -e "运行：\n\tbash NcistsAutoUpload"
	echo -e "参数：\n\t-d 删除网站作业文件\n\t-D 删除本地作业文件\n\t-r 自动重命名作业文件"
}

function validateParams() {
	[ "$count" -gt "$1" ] && echo '错误：参数错误' && exit 1
}

options $1 $2 $3
