#!/bin/bash

#Author: HoChihchou
#School: NCIST
#Date: 2022/04/17 
#README:
#  Put this script(AutoUpload.sh) into a new file folder.
#  Copy the java files and images of work to the folder. (The script and work content must be in the same folder!)
#  Rename the java files to zy01.java, zy02.java ... and rename the images to img01.jpg,img02.jpg..., and so on.

#读我：
#  把此脚本(AutoUpload.sh)放入到新文件夹。
#  作业的Java文件和图片复制到此文件夹。（脚本和作业内容必须在同一个文件夹！）
#  将Java文件重命名为zy01.java,zy02.java ...，将图片重命名为img01.jpg, img02.jpg ..., 以此类推。



export indexContent=''
export viewstate=''
export generator=''
export workContent=''
export workViewstate=''
export name=''
export class=''
export password=''
export mode=''
export index=''
export workFile=''
export url=''

function login() {
	curl 'http://ncists.top/zygl_sy/index.aspx' \
  -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9' \
  -H 'Accept-Language: zh-CN,zh;q=0.9,en;q=0.8' \
  -H 'Cache-Control: max-age=0' \
  -H 'Connection: keep-alive' \
  -H 'Content-Type: application/x-www-form-urlencoded' \
  -H 'Upgrade-Insecure-Requests: 1' \
  -H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36' \
  --data-urlencode "__EVENTTARGET=" \
  --data-urlencode "__EVENTARGUMENT=" \
  --data-urlencode "__LASTFOCUS=" \
  --data-urlencode "__VIEWSTATE=${viewstate}" \
  --data-urlencode "__VIEWSTATEGENERATOR=${generator}" \
  --data-urlencode "DropDownList_js=3" \
  --data-urlencode "DropDownList_bj=${class}" \
  --data-urlencode "DropDownList_yhm=${name}" \
  --data-urlencode "Text_mm=${password}" \
  --data-urlencode "ImageButton1.x=0" \
  --data-urlencode "ImageButton1.y=0" \
  --data-urlencode "HiddenField_gao=1034" \
  --data-urlencode "HiddenField_kuan=1194" \
  --compressed \
  --insecure \
  -b ho.cookie \
  -s \
  -L \
  -c ho.cookie
}

function visitIndex() {
	curl -L -o indexContent.html 'http://ncists.top/zygl_sy/index.aspx' 
}

function visitIndexAgain() {
	curl 'http://ncists.top/zygl_sy/index.aspx' \
  -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9' \
  -H 'Accept-Language: zh-CN,zh;q=0.9,en;q=0.8' \
  -H 'Cache-Control: max-age=0' \
  -H 'Connection: keep-alive' \
  -H 'Content-Type: application/x-www-form-urlencoded' \
  -H 'Upgrade-Insecure-Requests: 1' \
  -H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36' \
  --data-urlencode "__EVENTTARGET=" \
  --data-urlencode "__EVENTARGUMENT=" \
  --data-urlencode "__LASTFOCUS=" \
  --data-urlencode "__VIEWSTATE=${viewstate}" \
  --data-urlencode "__VIEWSTATEGENERATOR=${generator}" \
  --data-urlencode "DropDownList_js=3" \
  --data-urlencode "DropDownList_bj=${class}" \
  --data-urlencode "DropDownList_yhm=${name}" \
  --data-urlencode "Text_mm=${password}" \
  --data-urlencode "ImageButton1.x=0" \
  --data-urlencode "ImageButton1.y=0" \
  --data-urlencode "HiddenField_gao=1034" \
  --data-urlencode "HiddenField_kuan=1194" \
  --compressed \
  --insecure \
  -b ho.cookie \
  -s \
  -L \
  -c ho.cookie \
  -o indexContent.html
}

function visitWork() {
	curl -s -b ho.cookie -c ho.cookie -o workContent.html -L ${url}
}

function visitWorkAgain() {
	curl -b ho.cookie -o workContent.html ${url} \
	--data-raw __EVENTTARGET=${mode} \
	--data-urlencode __VIEWSTATE=${workViewstate} \
	--data-raw HiddenField_dqxh=${index} \
	--compressed \
	--insecure \
	-s \
	-L 
}

function visitWorkAAgain() {
	curl -b ho.cookie -o workContent.html ${url} \
	--data-raw __EVENTTARGET='LinkButton_cx' \
	--data-urlencode __VIEWSTATE=${workViewstate} \
	--data-raw HiddenField_dqxh=${index} \
	--compressed \
	--insecure \
	-s \
	-L 
}

function visitWorkAAgainImg() {
	curl -b ho.cookie -o workContent.html ${url} \
	--data-raw __EVENTTARGET='LinkButton_tp' \
	--data-urlencode __VIEWSTATE=${workViewstate} \
	--data-raw HiddenField_dqxh=${index} \
	--compressed \
	--insecure \
	-s \
	-L 
}

function handleIndexContent() {
	export viewstate=`cat indexContent.html | grep __VIEWSTATE\" | awk '{print $5}' | sed -e 's/value="//g' -e 's/"$//g'` 
	export generator=`cat indexContent.html | grep __VIEWSTATEGENERATOR\"\ value | awk '{print $5}' | sed -e 's/value="//g' -e 's/"//g'`
	#echo $viewstate
	#echo $generator
}

function handleWorkContent() {
	export workViewstate=`cat workContent.html | grep __VIEWSTATE\"\ value | awk '{print $5}' | sed -e 's/value="//g' -e 's/"//g'` 
}

function inputPayload() {
	export class='计科B21-1班'
	export name='何之洲'
	export password='1213abac'
	export workFile='zy01.java'
	export imgFile='img01.jpg'
	export mode='LinkButton_1'
	export index=1
	echo $url
}

function numberIncrease() {
	export index=$[${index}+1]
	export mode="LinkButton_${index}"
	export workFile=`printf "zy%02d.java" $index`
	export imgFile=`printf "img%02d.jpg" $index`
	echo $workFile
	echo $imgFile
}

function fileUpload() {
	curl ${url} \
	-X POST \
	-H Content-Type:multipart/form-data \
	-F __EVENTTARGET='LinkButton_cx' \
	-F __VIEWSTATE=${workViewstate} \
	-F imgupload=@${workFile} \
	-F Button_wjsc='上传' \
	-F HiddenField_dqxh=${index} \
	-b ho.cookie \
	-o tmp.html \
	-L \
	-c ho.cookie 
}

function imgUpload() {
	curl ${url} \
	-X POST \
	-H Content-Type:multipart/form-data \
	-F __EVENTTARGET='LinkButton_tp' \
	-F __VIEWSTATE=${workViewstate} \
	-F imgupload=@${imgFile} \
	-F Button_wjsc='上传' \
	-F HiddenField_dqxh=${index} \
	-b ho.cookie \
	-o tmp.html \
	-L \
	-c ho.cookie 

}

function fileDelete() {
	curl ${url} \
	-X POST \
	-H Content-Type:multipart/form-data \
	-F __EVENTTARGET='LinkButton_cx' \
	-F __VIEWSTATE=${workViewstate} \
	-F Button_sc='删除' \
	-F HiddenField_dqxh=${index} \
	-b ho.cookie \
	-o tmp.html \
	-L 
}

function imgDelete {
	curl ${url} \
	-X POST \
	-H Content-Type:multipart/form-data \
	-F __EVENTTARGET='LinkButton_tp' \
	-F __VIEWSTATE=${workViewstate} \
	-F Button_sctp='删除' \
	-F HiddenField_dqxh=${index} \
	-b ho.cookie \
	-o tmp.html \
	-L 
}

function circle() {
	for((i=1; i<=$count; i++))
	do
	#echo "第${i}题======================================================="
	visitWork
	handleWorkContent

	visitWorkAgain
	handleWorkContent

	visitWorkAAgain
	handleWorkContent

	[ "$1" == "-d" ] && fileDelete && imgDelete
	[ "$1" != "-d" ] && fileUpload

	visitWorkAAgainImg
	handleWorkContent
	[ "$1" != "-d" ] && imgUpload

	numberIncrease
	#echo "================================================================"
	done
}

function handleLogin() {
	visitIndex
	handleIndexContent
	visitIndexAgain
	handleIndexContent
	login
}

function removeRunningFile(){
	rm ho.cookie
	rm indexContent.html
	rm workContent.html
	rm tmp.html
}

function isParmsTure(){
	   echo '输入用户名:' 
	   read name
	   echo '输入密码:' 
	   read -s password
}

function visitNewestWork() {
   curl 'http://ncists.top/zygl_zyylx/zygl_zydtlb_sjt.aspx' \
   -b ho.cookie \
   -o indexContent.html \
   --compressed \
   -L \
   --insecure
}

function visitNewestWorkAgain() {
   curl 'http://ncists.top/zygl_zyylx/zygl_zydtlb_sjt.aspx' \
   -b ho.cookie \
   -o indexContent.html \
   --data-raw '__EVENTTARGET=GridView2%24ctl02%24LinkButton_dt' \
   --data-urlencode "__VIEWSTATE=${viewstate}" \
   --data-urlencode "__VIEWSTATEGENERATOR=${generator}" \
   --compressed \
   -L \
   --insecure
}

function getNewestWorkId(){
	export workId=`cat indexContent.html | grep action | awk -F '=' '{print $4}' | sed 's/" id//g'`
	export url="http://ncists.top/zygl_zyylx/zygl_zydtxx_sjt.aspx?id=$workId"
}

function getCount() {
	export count=$[`cat indexContent.html | grep ';LinkButton' | wc -l`-1]
}

function handleNewest(){
	visitNewestWork
	handleIndexContent
	visitNewestWorkAgain
	getCount
	getNewestWorkId
	#[ -z $1 ] && getNewestWorkId
	#[ ! -z $1 ] && export workId=$1
}

function handleDelete() {
	[ "$1" == "-d" ] && fileDelete || imgDelete
}

function response() {
	[ "$1" == "-d" ] && echo '删除成功'
	[ "$1" != "-d" ] && echo '上传成功'
}

function main() {
   	isParmsTure
	inputPayload 

	handleLogin

	handleNewest $1

	#visitWork
	#handleWorkContent
   	
	#visitWorkAgain
	#handleWorkContent

	# visitWorkAAgain
	# handleWorkContent

	# do a switch
	# handleDelete $1
	# response $1
	# response $1
	# [ "$1" == "-d" ] && return 0

	# fileUpload

	# visitWorkAAgainImg
	# handleWorkContent

	# imgUpload

	circle $1

	response $1
	removeRunningFile
	echo $count

}

main $1
