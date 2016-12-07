---
layout: page
title: Asustor NAS installation tutorial
---

_written by lavraielilybellule_

 Here is my solution to install Ubooquity on an Asustor NAS (example network address : `192.168.1.3`) and accessing it with a PC under Ubuntu (should work with a PC under Windows as well, except for the **sshfs** utility that you should replace by **win-sshfs**).
 
Windows 8:  
Win-sshfs requires Dokany: [https://github.com/dokan-dev/dokany/releases/tag/v0.7.4](https://github.com/dokan-dev/dokany/releases/tag/v0.7.4)  
Win-sshfs can be found here: [https://github.com/Foreveryone-cz/win-sshfs/releases/tag/1.5.12.8](https://github.com/Foreveryone-cz/win-sshfs/releases/tag/1.5.12.8)

First we need to install **Java** : go to [App Central](http://www.asustor.com/apps) and look for [JRE](http://www.asustor.com/apps/search_app?type=&keyword=JRE).  
Second we need to install **Shell in a Box** : go to [App Central](http://www.asustor.com/apps) and look for it.
Commands will be run manually from **Shell in a Box**.  
Go to services and enable terminal SSH service (otherwise you can't login)

Extract / unzip the Ubooquity files.  
Open the sshfs utility.  
Mount the Asustor NAS  
Browse to /home/admin and upload all Ubooquitity files (*create the admin folder is it doesn't exist*)

----

You can run Ubooquity from now using **Shell in a box** (direct access: `https://192.168.1.3:4200/`)  
Click on Shell in a box, log in (*Login with admin and your usual Asustor admin password*), browse to the Ubooquity directory (`cd /volume1/home/admin` in my case) and launch the following command : 

```
java -Xmx256m -jar Ubooquity.jar -webadmin 1> /dev/null 2> /dev/null &
```

It will work perfectly and you will be able to go to admin screen typing in your favorite browser : `192.168.1.3:8079/admin`.

As after that it will not be so easy to stop and restart, I would recommand to create the following script called start-stop.sh in same folder as Ubooquity : 

```
#!/bin/sh
 
# ums files
UBOOQUITY_DIR=/volume1/home/admin
UBOOQUITY_PID=$(ps ax | grep java | grep Ubooquity | awk '{ print $1 }')
 
case $1 in
 
start)
echo "Starting Ubooquity..."
java -Xmx256m -jar $UBOOQUITY_DIR/Ubooquity.jar -webadmin 1> /dev/null 2> /dev/null &
;;
 
stop)
echo "Killing Ubooquity..."
kill $UBOOQUITY_PID
;;
 
reload)
echo "Reload Ubooquity..."
kill $UBOOQUITY_PID
sleep 3
java -Xmx256m -jar $UBOOQUITY_DIR/Ubooquity.jar -webadmin 1> /dev/null 2> /dev/null &
sleep 3
;;
 
info)
echo "Checking for Ubooquity PID..."
echo $UBOOQUITY_PID
;;
 
*)
echo "usage: $0 {start|stop|reload|info}"
exit 1
;;
 
esac
exit 0
```

You should change permissions to allow execution : 

```
chmod +x /volume1/home/admin/start-stop.sh
```

You will now be able always from Shell in a Box to start, stop, restart, check Ubooquity with following command : 

```
sh start-stop.sh start
sh start-stop.sh stop
sh start-stop.sh info
sh start-stop.sh reload
```

You can even add it to autostart/autostop with following commands

```
ln -s /volume1/home/admin/start-stop.sh /usr/local/etc/init.d/S50ubooquity
ln -s /volume1/home/admin/start-stop.sh /usr/local/etc/init.d/K50ubooquity
```
