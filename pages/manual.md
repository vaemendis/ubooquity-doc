---
title: User Manual
---

**Table of content**

* placeholder for TOC generation
{:toc}

## What is Ubooquity ?

Ubooquity is small **content server** that you can use on any device on which Java is installed (virtually everything running on Windows, Linux or Mac OS, including NAS).
Once installed, it runs in the background and makes all the comics and books you chose to share available through a web page.
The idea behind Ubooquity is to be able to browse your personal digital library from your tablet (e.g an iPad), your e-reader or your smartphone, either at home or from anywhere else.

## Installing Ubooquity

To install Ubooquity on a desktop computer (Windows, Linux or MacOS), or just to test it quickly, read the [5-minutes installation guide](installation-guide.html).

To install Ubooquity on device without graphical environment (on a NAS for instance), read below.

### Using the command line

Here are the steps of an installation without using the graphical interface.

1. First, you need to install Java on your device. You can [get it here](https://www.java.com/en/download/manual.jsp) for desktop computers. Others devices, like NAS or Raspberry Pi, require specific versions though.  

2. Then download the Ubooquity package from the [download page](http://vaemendis.net/ubooquity/static2/download).  

3. Unzip the downloaded file in a dedicated folder of your choice (the folder must be empty, Ubooquity will create here [all the files](dir-structure.html) it needs to function).  

    ---
    ![](../assets/images/info.png) Since Ubooquity will write files in this folder, you must provide the appropriate rights (read _and_ write) to the user which will launch the Ubooquity process.
        
    ---
<br>
  

4. When you are in the Ubooquity folder, the minimal command to launch ubooquity is (on all operating systems):
    ```
    java -jar Ubooquity.jar
    ```
    This will launch Ubooquity on the default ports: **2202** for the library, **2203** for the administration page.  

    You might however want to use a script to have more control on the launched process.  
    Under Linux you can use [these scripts](http://vaemendis.net/ubooquity/downloads/scripts/) to run Ubooquity and monitor logs (don't forget to "chmod" them).

5. Once Ubooquity is running, go to the administration page on **http://YOUR_IP:2203/admin** and choose an administration password.  

    ---
    ![](../assets/images/info.png) For security reasons, the administration is only reachable from the device Ubooquity is running on. To allow access from a remote computer, use the `--remoteadmin` option. Example: `java -jar Ubooquity.jar --remoteadmin`
    
    ---
    
<br>

6. Now, add the directories you want to share (comics, ebooks or other types of files) in the appropriate sections of the administration page. At this point you can also define users and password to restrict files access.  

7. Your files are now available on **http://YOUR_IP:2202**

### Command line options

Available options can be listed with the `--help` option:
```
java -jar Ubooquity.jar --help
```

**--remoteadmin**  
Allow access to the administration page from a remote machine. By default the adminstration page can only be reached from the local host.

**--libraryport** _\<library port\>_  
This option must be followed (after a blank space) by a port number between 1024 and 65535.
For instance, if the IP address of your server is _10.0.0.3_ and set the port to _3456_, your library will be reachable in your browser at the address _10.0.0.3:3456_
Default port is **2202**.

**--adminport** _\<admin port\>_  
This option must be followed (after a blank space) by a port number between 1024 and 65535.  
For instance, if the IP address of your server is _10.0.0.3_ and set the port to _3457_, the admin page will be reachable in your browser at the address _10.0.0.3:3457_  
Default port is **2203**.

**--headless**  
Use it if you don't want the Ubooquity interface to be displayed, or to avoid compatibility issues on devices with no graphical environment (e.g. NAS).

**--workdir** _\<directory path\>_  
This option allows you to specify where Ubooquity should create its own files (database, logs, preferences, cache, etc). The default working directory is simply the one from which you run Ubooquity.

**--host** _\<hostname or IP address\>_  
By default, Ubooquity binds itself to all available network interfaces. This option allows you to specify the hostname Ubooquity should use when configuring its binding.  

_Example_: if you launch Ubooquity on your local machine (with the address 192.168.0.42, for instance), you will be able to access it with your browser on localhost:2202 and 192.168.0.42:2202. Now if you add "--host 192.168.0.42" to your command line, localhost:2202 won't work anymore.
