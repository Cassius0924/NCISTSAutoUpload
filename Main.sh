#!/bin/bash

#条件测试: 验证文件是否存在
#加载函数
[ -f ./Login.sh ] && . ./Login.sh || { echo "错误：请检查脚本完整性，缺少Login.sh文件" && exit; }
[ -f ./RemoveTmpFile.sh ] && . ./RemoveTmpFile.sh || { echo "错误：请检查脚本完整性，缺少RemoveTmpFile.sh文件" && exit}

function main() {
	echo "NcistsAutoUpload";
	handleLogin
}

echo "NcistsAutoUpload";

main
