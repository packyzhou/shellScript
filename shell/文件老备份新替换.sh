#!/bin/bash
#老文件备份，新文件替换
#备份
#备份函数
function backupFile(){
echo "文件为：{$1}"
copyFile = "/Users/zjw/Desktop/backup/"
fileName = 'basename "$1"'

if [ ! -f “$1” ];then
    cp filePath copyFile+fileName
else
echo “你输入的{$filePath}文件不存在”
fi
}

function test(){
echo "test: $1"
}

export -f test

fileArray=(1 2 3 4 5)
echo -e “请输入备份文件绝对路径，多文件请用逗号分开:\c”
read files
echo "$files" | awk -F: '{n=split($1,a,",");for(i=1;i<=n;i++){ print a[i]}}'

#echo "$files" |  awk '{for(i=1;i<NF;i++) {print NF,$i}}'
#awk -F: '{for(i=1;i<=NF;i++) {if (length($i)>=4) {print $i}}}' /etc/passwd

