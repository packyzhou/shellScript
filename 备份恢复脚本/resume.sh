#!/bin/bash
#恢复文件

#使用方式:./resume.sh -> 按提示输入指令 -> /Users/userName/backup/,/Users/userName/目标目录/

#备份目录
#backupDir="/Users/zhoujingwei/Desktop/shell/backup/"
#恢复目录
#resumeDir="/Users/zhoujingwei/Desktop/shell/"
#备份到备份目录
#参数$1为备份目录，参数$2为恢复目录
function resume(){
#查看目录是否存在，不存在则创建
if [ ! -d "$1" ];then
echo "备份目录[$1]不存在,请输入正确的备份目录……"
fi
if [ ! -d "$2" ];then
echo "恢复目录[$2]不存在,请输入正确的恢复目录……"
fi

#获取备份目录下所有文件
for item in $(ls $1)
do
#echo "rs:$resumeDir | bd:$item"
mv "$1""$item" "$resumeDir"
printlnFile "$1""$item" $resumeDir
done
echo "恢复成功！"
}

#打印拷贝信息替换
function printlnFile(){
    echo "$1 to $2 copying……"
}

echo "请输入备份和恢复目录的路径,并用逗号分开：\c"
read files
oldIFS=$IFS
IFS=","
count=0
i=0

for item in $files
do
if [ $i -eq 0 ];then
echo "备份目录：$item"
backupDir=$item
elif [ $i -eq 1 ];then
echo "恢复目录：$item"
resumeDir=$item
else
echo "输入有误，输入目录只能是备份目录和恢复目录路径"
exit 1;
fi
i=$(($i+1))
done;
IFS=$oldIFS
#判断是否执行
echo -n "是否还原备份，还原后不可恢复?(y/n)"
read check
if [ "$check" == "y" ];then
resume $backupDir $resumeDir
else
echo "停止恢复……"
fi
