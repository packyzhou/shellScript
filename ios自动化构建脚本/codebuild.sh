#!/bin/sh

xcodebuild clean -configuration Distribution      //clean项目

distDir="/Users/xxxx/dist"
releaseDir="build/Distribution-iphoneos"
version="1_0_0"
rm -rdf "$distDir"
mkdir "$distDir"
for line in $(cat data.dat)        //读取所有渠道号data.dat文件
do
ipafilename=`echo $line|cut -f1 -d':'` //渠道名
sourceid=`echo $line|cut -f2 -d':'`    //渠道号
echo "ipafilename=$ipaname"
echo "sourceid=$sourceid"
targetName="youtargename"   //项目名称(xcode左边列表中显示的项目名称)
echo "sourceid=$sourceid"
echo "ipafilename=$ipafilename"
echo "$sourceid" > sourceid.dat
echo "sourceid.dat: "
cat sourceid.dat
rm -rdf "$releaseDir"

ipapath="${distDir}/${targetName}_${version}_from_${sourceid}.ipa"

echo "***开始build app文件***"
xcodebuild -target "$targetName" -configuration Distribution  -sdk iphoneos build
appfile="${releaseDir}/${targetName}.app"
if [ $sourceid == "appstore" ]
then
cd $releaseDir
zip -r "${targetName}_${ipafilename}_${version}.zip" "${targetName}.app"
mv "${targetName}_${ipafilename}.zip" $distDir 2> /dev/null
cd ../..
else
echo "***开始打ipa渠道包****"
/usr/bin/xcrun -sdk iphoneos PackageApplication -v "$appfile" -o "$ipapath" --sign "iPhone Distribution:xxxxxx"
fi
done