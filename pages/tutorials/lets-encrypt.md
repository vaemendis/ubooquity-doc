---
layout: page
title: Enabling HTTPS With LetsEncrypt
---

_Written by Saltypoison_

## A few caveats...

 * If your domain is a sub domain on a popular domain, there is a good chance you won't be able to get a certificate, as they are distributed in limited quantities per domain.
 * You can't have a service running on port 9999
 * If you are running the server at home, your ISP can't be blocking port 443 (used to verify ownership of the domain)

I'm running Ubooquity on Ubuntu Server 14.04.3 LTS, Your mileage may vary with other distros. You'll need some basic terminal skills and sudo.

##Procedure

First, you'll need to install Letsencrypt 

```bash
#Install Git if needed
apt-get install git
#Create a directory for Letsencrypt
mkdir /opt/letsencrypt
cd /opt
git clone https://github.com/letsencrypt/letsencrypt
cd letsencrypt
```

You'll may need to edit a file (I did) in /letsencrypt to account for Ubuntu having an older version of Python in the repository.  
[See this post for more info…](https://community.letsencrypt.org/t/insecureplatformwarning-on-ubuntu-14-04-w-python-2-7-6/2871/3)

Once this prereqs are done, here is the script you'll need to run. It won't work out of the box so make sure you read the comments and update the info as needed.  
Create a script, set it to executable, and paste this in with your preferred editor. 

```bash
#!/bin/bash
#Original author Ivan Tichy - Original http://blog.ivantichy.cz/blogpost/view/74 -- Updated for Ubooquity by Salty
#Please modify these values according to your environment
certdir=/etc/letsencrypt/live/yourdomain.com/ #just replace the domain name after /live/
keytooldir=/usr/lib/jvm/java-7-openjdk-amd64/jre/bin/ #java keytool located in jre/bin (see this post if you need help finding this dir http://ubuntuforums.org/showthread.php?t=1054731&p=6643281#post6643281 )
letsencryptdir=/opt/letsencrypt/ #letsencrypt directory here
mydomain=yourdomain.com #put your domain name here
myemail=your@email.com #your email
networkdevice=eth0 #your network device  (run ifconfig to get the name)
keystoredir=/home/salty/.keystore #located in home dir of user running Ubooquity
keystorepass=yoursuperstrongpassword #the password for your keystore
 
 
#the script itself:
cd /opt/letsencrypt #the location of your letsencrypt install
git pull origin master #update letsencrypt with the latest files
 
 
#this temporarily reroutes your traffic to port 443 to port 9999 for the domain ownership test letsencrypt does.  
#it keeps you from having to shut down Ubooq service
iptables -I INPUT -p tcp -m tcp --dport 9999 -j ACCEPT
 
 
iptables -t nat -I PREROUTING -i $networkdevice -p tcp -m tcp --dport 443 -j REDIRECT --to-ports 9999
 
 
#Leave the top one uncommented for testing, it creates fake certs and won't count against the certificate limit from letsencrypt.  
#Comment out top one and uncomment second command when ready to generate real cert
 
 
$letsencryptdir/letsencrypt-auto certonly --verbose --standalone --test-cert --break-my-certs -d $mydomain --standalone-supported-challenges tls-sni-01 --tls-sni-01-port 9999 --renew-by-default --email $myemail --agree-tos
#$letsencryptdir/letsencrypt-auto certonly --standalone -d $mydomain --standalone-supported-challenges tls-sni-01 --tls-sni-01-port 9999 --renew-by-default --email $myemail --agree-tos
 
 
#deletes rerouting rule
iptables -t nat -D PREROUTING -i $networkdevice -p tcp -m tcp --dport 443 -j REDIRECT --to-ports 9999
iptables -D INPUT -p tcp -m tcp --dport 9999 -j ACCEPT
 
 
#deletes any previous JKS keys
$keytooldir/keytool -delete -alias root -storepass $keystorepass -keystore $keystoredir/ubooq_key.jks
$keytooldir/keytool -delete -alias ubooq_key -storepass $keystorepass -keystore $keystoredir/ubooq_key.jks
 
 
#builds a usable keystore from the CA provided by letsencrypt
openssl pkcs12 -export -in $certdir/fullchain.pem -inkey $certdir/privkey.pem -out $certdir/cert_and_key.p12 -name ubooq_key -CAfile $certdir/chain.pem -caname root -password pass:aaa
$keytooldir/keytool -importkeystore -srcstorepass aaa -deststorepass $keystorepass -destkeypass $keystorepass -srckeystore $certdir/cert_and_key.p12 -srcstoretype PKCS12 -alias ubooq_key -keystore $keystoredir/ubooq_key.jks
$keytooldir/keytool -import -trustcacerts -alias root -deststorepass $keystorepass -file $certdir/chain.pem -noprompt -keystore $keystoredir/ubooq_key.jks
```

Run the script, do whatever tweaking you need, then when you are generating a good fake cert and keystore, swap the commented out lines in the middle and generate your real certificate and keystore. Add the keystore and password to Ubooquity using the admin web interface and you should be good to go. Afterwards, you can add this to a cron job to re-up your certificate when it expires. GLHF! 