#!/bin/bash

function isRemember() {
	if [ -f ./.Account.json ] 
	then
		echo "1"
	fi

	return false
}

function rememberMe() {
	touch .Account.txt
	read -t 15 -p "输入用户名：" name
	read -t 15 -s -p "输入密码：" password 
	[ -f ./.Account.txt ] && echo -e "\n=====保存成功=====" || echo -e "\n=====保存失败======"
	echo "false" > .Account.txt
	echo "$name" | base64 | base64 >> .Account.txt
	echo "$password" | base64 | base64 >> .Account.txt
	
	echo `cat .Account.txt | sed -n '2p' | base64 -d | base64 -d`
	echo `cat .Account.txt | sed -n '3p' | base64 -d | base64 -d`
}
