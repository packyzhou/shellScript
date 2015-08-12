#!/bin/bash
#备份文件

#使用方式:./backup.sh -> 按提示输入指令 -> /Users/userName/目录或文件1,/Users/userName/目录或文件2,……
#backup目录会在当前路径下创建

#当前路径
pwdPath=$(pwd)
#备份目录
backupDir="$pwdPath/backup/"
#备份到备份目录
function copyFile(){
#查看目录是否存在，不存在则创建
    if [ ! -d "$backupDir" ];then
    mkdir $backupDir
    fi
    cp -a $1 $backupDir
    echo "$1 copying……"
}

echo "请输入备份文件路径,并用逗号分开：\c"
read files
IFS=","
count=0
for item in $files
do
copyFile $item
done;