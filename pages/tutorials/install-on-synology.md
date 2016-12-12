---
layout: page
title: Synology NAS installation tutorial
---

_written by Matthew Sanders_

>I recommend that you assign a static local IP address to your server through your router. This enables you to bookmark the Ubooquity web interface.

>In this tutorial, 192.168.1.2 is used as an example of local IP for a Synology NAS. Replace it with your own.

## Requirements

#### Summary

* Install Java JRE 8 or greater on your server
* Download the Ubooquity jar to a convenient place on your server
* Tell Linux to run ubooquity on boot with an Upstart script in /etc/init
* Start the jar with -webadmin then use the web interface to configure Ubooquity

#### Steps

1. [Synology](https://www.synology.com/en-us/products/) brand NAS
2. [Putty](http://www.chiark.greenend.org.uk/~sgtatham/putty/download.html) SSH/Telnet client (windows only)
3. Internet access
4. Synology DSM version 5 or greater
5. A Synology model capable of running the Java Manager. Check [this page](https://www.synology.com/en-uk/dsm/app_packages/JavaManager) for a list of applicable models. If your model is not listed try installing Java using [this separate tutorial](http://pcloadletter.co.uk/2011/08/23/java-package-for-synology/).

> **UPDATE 2016-11-19**
>(Tested on Synology ds215j running DSM 6.0.2-8451 Update 4) Java Manager application is not available on tested DSM SW/HW combination. Luckily it's not necessary because Synology issued packages Java7 and Java8 that are platform specific so the process is even simpler. Just install the Java package and skip to next step. Ubooquity 1.10.1 definitely works with Java 8. 

## Configure the Synology NAS

#### Summary

* Enable SSH access
* Use the Java Manager app supplied by Synology to install the latest JRE

#### Steps

1. Open the webadmin interface 192.168.1.2:5000. Log in to the DSM and open the Control Panel  
![]({{site.baseurl}}/assets/images/install-synology/synology_tutorial_image_01.jpg)

2. Open the Terminal & SNMP tab and enable the SSH service.  
![]({{site.baseurl}}/assets/images/install-synology/synology_tutorial_image_02.jpg)

3. Open the Package Center and install the Java Manager.  
![]({{site.baseurl}}/assets/images/install-synology/synology_tutorial_image_03.jpg)

4. Open the Java Manager application and follow the instructions to download the most recent Java SE Development Kit for your server architecture then choose the archive you downloaded and use it to install Java.  
![]({{site.baseurl}}/assets/images/install-synology/synology_tutorial_image_05.jpg))
![]({{site.baseurl}}/assets/images/install-synology/synology_tutorial_image_04.jpg)

5. Create a shared folder titled “Comics”.  
![]({{site.baseurl}}/assets/images/install-synology/synology_tutorial_image_09.png)

## Connect with SSH

#### Summary

* SSH in to your server using your admin password, but as the root user
* Browse to /var/packages/ and download the Ubooquity archive
* Unarchive Ubooquity.zip and start the jar

#### Steps

1. If you are using Windows download and run the [Putty SSH client](http://www.chiark.greenend.org.uk/~sgtatham/putty/download.html).
2. Connect to your server through SSH at 192.168.1.2 then log in as the root user using the admin password. That is the same user you used to log in to the Synology DSM web interface.  
![]({{site.baseurl}}/assets/images/install-synology/synology_tutorial_image_06.jpg)
3. Browse to /var/packages/ using the command cd /var/packages
4. Create the Ubooquity directory then enter it with `[ -d Ubooquity ] || mkdir Ubooquity && cd Ubooquity`
5. Download the Ubooquity archive with `wget -O ubooquity.zip http://vaemendis.net/ubooquity/service/download.php`
6. Unzip the archive then remove it with `7z x ubooquity.zip && rm ubooquity.zip`
7. Move to the Synology Upstart services directory. All services listed here are started on boot. `cd /etc/init`
8.  Download the Ubooquity service script with `wget https://vaemendis.github.io/ubooquity-doc/assets/files/install-synology/ubooquity.conf`
9. Make the service script executable with `chmod 755 ubooquity.conf`

The Ubooquity service is now installed. It will start on boot and you can start or stop it at anytime using `start ubooquity` or `stop ubooquity`. 

**NOTE if Java8 is used**

If you used Synology Java8 package instead of Java Manager then the service script will have the wrong path to the java binary. Edit the `/etc/init/ubooquity.conf` and change path to java binary from: 

`exec /var/packages/JavaManager/target/Java/bin/java -jar -Xmx1024m /var/packages/Ubooquity/Ubooquity.jar -port 2202 -webadmin -workdir "/volume1/Comics/Ubooquity"`

to

`exec /var/packages/Java8/target/j2sdk-image/bin/java -jar -Xmx1024m /var/packages/Ubooquity/Ubooquity.jar -port 2202 -webadmin -workdir "/volume1/Comics/Ubooquity"`


## Configure Ubooquity

#### Summary

* Browse to the Ubooquity administrator page
* Set the admin password
* Add your comics directory, enable OPDS then initiate a scan

#### Steps

1. The Ubooquity web interface should be running at `192.168.1.2:2202`. Go to `192.168.1.2:2202/admin` and you will be asked to set the administrator password. Set the password.  
2. Edit the comics settings and add `/volume1/Comics` in the shared directory text area.  
![]({{site.baseurl}}/assets/images/install-synology/synology_tutorial_image_07.jpg)
3. Edit the advanced settings. Enable OPDS and add `.*Ubooquity` to the scan exclusion pattern.   
![]({{site.baseurl}}/assets/images/install-synology/synology_tutorial_image_08.png)
4. Scroll to the top of the admin page to the General area and click 'Launch new scan'. Your comics are now available at `192.168.1.2:2202` and should be bookmarked.

## Update Ubooquity

When a new version of Ubooquity is released you can use the following line to automatically update your existing Ubooquity installation. 

`cd /var/packages && [ -d Ubooquity ] || mkdir Ubooquity && cd Ubooquity && wget -O ubooquity.zip http://vaemendis.net/ubooquity/service/download.php && 7z x ubooquity.zip && rm ubooquity.zip && cd /etc/init && wget https://vaemendis.github.io/ubooquity-doc/assets/files/install-synology/ubooquity.conf && chmod 755 ubooquity.conf`

## Troubleshooting


* When you SSH or telnet in to your server remember to log in as the “root” user and not “admin”. You will get permission errors if you log in as admin.
* It is sometimes useful to edit the Ubooquity service script. This allows you to specify how much RAM you want to allocate to Ubooquity and to tell Java where to store Ubooquity's files. Open the script with the vi /etc/init/ubooquity.conf command. Press i on your keyboard to enter edit mode, make your changes, press escape to exit edit mode, then hold LEFT-SHIFT and press z twice to save.

Here is the service script for reference. You may want to change the Xmx parameter and the workdir. 1024m is 1GB (1,024MB). To give 256MB of RAM to Ubooquity use -Xmx256m.


```bash
start on started httpd-user
stop on runlevel [06]
 
exec /var/packages/JavaManager/target/Java/bin/java -jar -Xmx1024m /var/packages/Ubooquity/Ubooquity.jar -port 2202 -webadmin -workdir "/volume1/Comics/Ubooquity"
```









