
# !/bin/bash
# backup MongoDB
#mongodump命令路径
DUMP=/usr/bin/mongodump
#临时备份目录
OUT_DIR=/usr/dataBak/mongodb_bak/mongodb_bak_now
#备份存放路径
TAR_DIR=/usr/dataBak/mongodb_bak/mongodb_bak_list
#获取当前系统时间
DATE=`date +%Y_%m_%d`
#数据库账号
#DB_USER="admin"
#数据库密码
#DB_PASS="123456"
#DAYS=15代表删除15天前的备份，即只保留近15天的备份
DAYS=6
#最终保存的数据库备份文件
TAR_BAK="mongodb_bak_$DATE.tar.gz"
cd $OUT_DIR
rm -rf $OUT_DIR/*
mkdir -p $OUT_DIR/$DATE
$DUMP -o $OUT_DIR/$DATE
# 压缩格式为 .tar.gz 格式
tar -zcvf $TAR_DIR/$TAR_BAK $OUT_DIR/$DATE
# 删除 15 天前的备份文件
find $TAR_DIR/ -mtime +$DAYS -delete
find $OUT_DIR/ -mtime +$DAYS -exec rm -rf {} \;

exit
