---
layout: page
title: Frequently Asked Questions
---

Don't forget to check the [**forum**](https://ubooquity.userecho.com/) if you don't find here the answer you were looking for.

**Table of content**

* placeholder for TOC generation
{:toc}


### What's the difference between the GUI and the Web Interface ?

The GUI (for Graphical User Interface) is the link:images/screenshot-gui-main.jpg[configuration window] you get when running Ubooquity on a desktop environment. The Web Interface is the link:images/screenshot-web-admin.png[configuration page] you get when accessing the administration page of Ubooquity through a browser.

### I cannot connect to the Ubooquity server from my browser

The URL to access your Ubooquity server is displayed on the first tab of the configuration window. The first URL is the one to use in your local network, the second one when you are accessing the server from the Internet. Check that you can access the server from a browser running on the same computer. If you can, your problem comes from your firewall and/or router configuration. Refer to the documentation to get some help on how to configure them.

### I shared a folder but I can't see it on my Ubooquity page

If you chose to protect shared folders by creating users, you must specify for each folder the list of authorized users. Check that your user is present in the right column, next to the path of your shared folder.

### How can I change the admin password once it has been set ?

If you use Ubooquity on a desktop (with its GUI), just go in the _Security_ section and change it.

If you use the web interface page (if Ubooquity is installed on a NAS for instance), you have to do a manual operation: when you choose your admin password for the first time, Ubooquity creates a *webadmin.cred* file in its working directory (the one from which Ubooquity is launched). To change the password, just logout from the admin page, delete the *webadmin.cred* file and the next time you go on the admin page, Ubooquity will ask you to choose a password again.

### I can download my comics using Ubooquity server, now how do I read them ?

Many comics readers exist for whatever device you might be using, here are only a few suggestions :

* Windows users might want to try [**Comic Rack**](http://comicrack.cyolito.com/) (for advanced comics management) or [**Sumatra PDF**](http://www.sumatrapdfreader.org/free-pdf-reader.html) (for easy reading of a lot of formats like cbr, cbz, epub, pdf...).
* on iPad, [**Chunky Reader**](http://chunkyreader.com/) has implemented Ubooquity specific comic streaming support and can also be used to access a Ubooquity server through its internal browser. [**Comic Glass**](http://comicglass.net/en/) is also quite good (although it does not support streaming and its internal browser is not as intuitive to use).
* Android users also have excellent viewers at their disposal, [**Challenger Comics Viewer**](https://play.google.com/store/apps/details?id=org.kill.geek.bdviewer) and [**Comic Viewer for Ubooquity**](https://play.google.com/store/apps/details?id=com.sethchhim.comicviewerforubooquity) for instance


### How can I make Ubooquity start with Windows ?

It's easy, just create a shortcut to the **Ubooquity.jar** file (right-click, create shortcut) and put it in your **Startup** directory (which you will find in your programs, in the **Start** menu).

### How do I run Ubooquity on a Linux server ?

You can use the `ubooquity.sh` script [available here](http://vaemendis.net/ubooquity/downloads/scripts/).

### Why does Ubooquity connect to the internet when it starts ?

Ubooquity checks once a day if a newer version is available so that you can download it if you want.

### Can I use Ubooquity to share my Calibre library ?

Yes, just share your Calibre library folder. Ubooquity will even read and display Calibre-specific informations like rating and series name and we have a [special page for Calibre related tips]({{ site.baseurl }}/pages/calibre-sharing.html).

### Some of the information I see in Calibre do not appear in Ubooquity

You must force Calibre to write information in the epub files containing your books. Everything is explained in [the Calibre related tips]({{ site.baseurl }}/pages/calibre-sharing.html).

### Some of my books appear duplicated in Ubooquity but not in Calibre

Sometimes Calibre generates extra epub files when a problem occurs during file modification. To remove them, follow the procedure described in [the Calibre related tips]({{ site.baseurl }}/pages/calibre-sharing.html).

### How can I add metadata to my comics so that Ubooquity displays them ?
Here is a [detailed tutorial]]({{ site.baseurl }}/pages/tutorials/add-metadata-with-comicrack.html) on using ComicRack to update comics matadata. (thanks to _Matthew Sanders_)

### Can I run Ubooquity on a Raspberry Pi ?

Yes, Ubooquity has been succesfully tested on a Pi.

Raspbian images ship with Oracle Java by default.
It also can be installed with the following command:

```bash
sudo apt-get update && sudo apt-get install oracle-java7-jdk
```

Once you have the Java Runtime Environment installed, just follow the command line installation instructions in Ubooquity documentation like you would do for an installation on any regular Linux.

### Can Ubooquity read DRM protected files ?

No, unfortunately it can't. These files are designed to be read only on some specific ebooks reader. They are protected against access by any other software or device, including Ubooquity.

### How do I install Ubooquity on an Asustor NAS ?

Here is a [detailed tutorial]({{ site.baseurl }}/pages/tutorials/install-on-asustor.html) for the Asustor NAS. (thanks to _lavraielilybellule_)


### How do I install Ubooquity on an Synology NAS ?

Here is a [detailed tutorial]({{ site.baseurl }}/pages/tutorials/install-on-synology.html). (thanks to _Matthew Sanders_)

### I have "java.lang.OutOfMemoryError: Java heap space" messages in the logs

The quantity of memory allocated to Ubooquity depends on the hardware your are running it on.
If this quantity is too small, you might sometime saturate it with when performing memory intensive operations.
That's when you get **java.lang.OutOfMemoryError: Java heap space** errors.

To fix the problem, you can explicitly set the amount of memory Ubooquity is allowed to use (be careful to set a value lower than the actual physical memory of your hardware).

If you use the startup script provided by the documentation, find and uncomment (remove the "#") the following line:

```
#MEM_OPT=-Xmx512m
```

512 is the number of MegaBytes Ubooquity will be allowed to occupy, change it to the value that suits you.

### How do I customize the format of my logs ?

Follow the instructions of [this tutorial]({{ site.baseurl }}/pages/tutorials/log-customization.html).

### Can I have a Docker container for Ubooquity?

Docker containers have been set up by some users and are available here:
##
####HurricaneHernandez
Docker repository: [https://registry.hub.docker.com/u/hurricane/ubooquity/](https://registry.hub.docker.com/u/hurricane/ubooquity/)  
Forum thread: [http://lime-technology.com/forum/index.php?topic=36278.0](http://lime-technology.com/forum/index.php?topic=36278.0)  
Github repository for scripts: [https://github.com/HurricaneHernandez/ubooquity](https://github.com/HurricaneHernandez/ubooquity)  

(not packaged by me, please address your questions directly on the Lime Technology forums) 
##
####[LinuxServer.io](https://linuxserver.io)
**For x64 devices**
Docker repository: [https://hub.docker.com/r/linuxserver/ubooquity/](https://hub.docker.com/r/linuxserver/ubooquity/)  
Github repository: [https://github.com/linuxserver/docker-ubooquity](https://github.com/linuxserver/docker-ubooquity)  

(not packaged by me, please address setup queries directly on the [LinuxServer.io forum](https://forum.linuxserver.io/), [LinuxServer.io IRC chatroom](https://www.linuxserver.io/irc/) or, for Unraid users, the [Lime Technology forum](http://lime-technology.com/forum/index.php?topic=54543.0))

**For ARM devices**
 Docker repository: [https://hub.docker.com/r/lsioarmhf/ubooquity/](https://hub.docker.com/r/lsioarmhf/ubooquity/)  
Github repository: [https://github.com/linuxserver/docker-ubooquity-armhf](https://github.com/linuxserver/docker-ubooquity-armhf)  

(not packaged by me, please address setup queries directly on the [LinuxServer.io forum](https://forum.linuxserver.io/) or the  [LinuxServer.io IRC chatroom](https://www.linuxserver.io/irc/))
##
### Where can I find the source code of Ubooquity ?

Ubooquity is free to use but is not open source.
That is not to say it will never be. Just not in the foreseeable future.
