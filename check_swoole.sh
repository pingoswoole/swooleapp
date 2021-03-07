# this file is check swoole status and relauch it, please use crontab to run this file, "docker exec php73 sh -c '/www/chat/check_swoole.sh'"
ListeningPort=`netstat -an | grep ":9501" | awk '$1 == "tcp" && $NF == "LISTEN" {print $0}' | wc -l`
if [ $ListeningPort -eq 0 ]
then
	{
		echo "`date` : listener port is down">>/www/default/check_swoole.log
		# 如果9502端口down了，重启服务
		/usr/local/bin/php /www/chat_douyin/bin/pingswoole server:start -d
			
	}
else
	{
		echo "`date` : 9501端口正常" >>/www/default/check_swoole.log
	}
fi
