rsync -a /home/fox/ /tmp/backup/home/
rsync -a /var/docker/activepieces /tmp/backup/config/
rsync -a /var/docker/nextcloud /tmp/backup/config/
rsync -a /var/docker/npm /tmp/backup/config/
rsync -a /var/docker/tailscale /tmp/backup/config/
rsync -a /var/docker/wordpress /tmp/backup/config/
rsync -a /var/lib/docker/volumes/ /tmp/backup/volume/
tar -czvf /vps_backup/backup_`date +%F`.tar.gz /tmp/backup/
sudo -u fox gpg --passphrase-file /home/fox/.gnupg/vps-passphrase --batch --pinentry-mode loopback -se -r VPS_backup /vps_backup/backup_`date +%F`.tar.gz
backblaze-b2 sync /vps_backup/backup_*.tar.gz.gpg b2://fox-vps-backup
find /vps_backup/ -mtime +33 -exec rm {} \;

