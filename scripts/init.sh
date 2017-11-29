mkdir /datadisks/disk1/azurefiles | tee -a /tmp/nfinstall.log

chmod 777 /datadisks/disk1/azurefiles

echo //mmmsamples.file.core.windows.net/samples /datadisks/disk1/azurefiles cifs vers=3.0,username=mmmsamples,password=7rArlISE8o38mDxrKCq0DSVPQiEHFZ4G0De46FUfA7GPZSkpGhg4X5EhVa8hpypYOL0QyDP+D/LquM40SKnUqg==,dir_mode=0777,file_mode=0777,sec=ntlmssp >> /etc/fstab

mount -a  | tee -a /tmp/nfinstall.log

if mountpoint -q /datadisks/disk1/azurefiles
then
   echo "CIFS in Shared RG Mounted" >> /tmp/nfinstall.log
else
   echo "FAILED, CIFS not mounted" >> /tmp/nfinstall.log
   shutdown
fi
