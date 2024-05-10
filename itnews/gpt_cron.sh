sudo -u fox docker exec -it wordpress-itnews php /var/www/html/index.php -- wpaicg_cron=yes >> /var/docker/itnews/cron.log
sudo -u fox docker exec -it wordpress-itnews php /var/www/html/index.php -- wpaicg_rss=yes >> /var/docker/itnews/cron.log
sudo -u fox date >> /var/docker/itnews/cron.log
