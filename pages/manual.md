---
layout: page
title: User Manual
---

**Table of content**

* placeholder for TOC generation
{:toc}

## What is Ubooquity ?

Ubooquity is small **content server** that you can use on any computer on which Java is installed (virtually every computer running on Windows, Linux or Mac OS).
Once installed, it runs in the background and makes all the comics and books you chose to share available through a web page.
The idea behind Ubooquity is to be able to browse your personal digital library from your tablet (e.g an iPad), your e-reader or your smartphone, either at home or from anywhere else.

## The 5-minutes installation guide


### Requirements

Ubooquity server requires Java (version 8 or more). [You can download it here](http://www.java.com/en/download/manual.jsp).  
These instructions are valid for **Windows**, **Linux** and **Mac OS** (or any OS supporting Java and having a graphical interface).  
If you want to install Ubooquity using the command line and web admin interface, see the appropriate section, later in this documentation.

### Installation

First, download the Ubooquity package from [this page](http://vaemendis.net/ubooquity/static2/download).  
Unzip the downloaded file in the location of your choice on your computer and double-click on the *Ubooquity.jar* file.
Ubooquity is now running.

Ubooquity window has a tab for each group of functionality.  
Just select the tab corresponding to the type of documents you want to share (_Raw files_, _Comics_, etc.) and choose the directories of your computer that you want to make available (using the _Add_ button).  
Click _Apply_. You can now access you content in your web browser: click on the first link on the first tab of Ubooquity window.

That's all for Ubooquity.  
But if you want to be able to access your documents from outside your computer, you will have to configure Windows and possibly your network equipment to allow it.

### Network configuration

To access Ubooquity server from your local network, you must authorize its port in the Windows firewall configuration. The port is displayed in the first tab of Ubooquity window. You can change it as you like, but you will have to change the Windows firewall configuration accordingly. Here is how to do it for:

* [Windows XP](https://support.microsoft.com/en-us/kb/308127)
* [Windows Vista](http://windows.microsoft.com/en-us/windows/open-port-windows-firewall#1TC=windows-vista)
* [Windows 7](http://windows.microsoft.com/en-us/windows/open-port-windows-firewall#1TC=windows-7)
* [Windows 8.1](http://windows.microsoft.com/en-us/windows-8/windows-firewall-from-start-to-finish)

(If you are using another firewall the the default Windows firewall, you should be able to do it without help. The same goes for Linux.)
If you want to make your Ubooquity server available **on the Internet** and if you are behind a **router**, you will also have to **forward the Ubooquity port** to the computer hosting it.
This configuration depends on your brand of router.
Once your router is configured (or just after the firewall configuration if you don't go through a router), the Ubooquity server will be available from anywhere using the second link displayed in the configuration window.

## Using the command line mode

Although the fastest way to install and configure Ubooquity is to use its graphical interface, you can also run it from the command line and configure it using a web administration page.
This way Ubooquity can be installed on servers without graphical environment (usually on Linux, but the command line mode can be used on Windows too).

### Installation and configuration

Here are the steps of an installation without using the graphical interface.

1. Get the Ubooquity jar file and put it somewhere on your server, in its own directory (name the directory whatever you want).
2. The minimal command to launch ubooquity is:

    ```
    java -jar Ubooquity.jar -webadmin
    ```
    
    This will launch Ubooquity on the default port (2202) and activate the remote administration page.  
    You might however want to use a script to have more control on the launched process.  
    Under Linux you can use [these scripts](http://vaemendis.net/ubooquity/downloads/scripts/) to run Ubooquity and monitor logs (don't forget to "chmod" them).
    Copy them in Ubooquity's directory (alongside the jar file) and type:

    ```
    ./ubooquity.sh start
    ```

3. Once Ubooquity is running, go to the administration page on **http://YOUR_IP:2202/admin** and choose an administration password.
4. Add the directories you want to share (comics, ebooks or other types of files) in the appropriate sections of the administration page. At this point you can also define users and password to restrict files access.
5. Your files are now available on **http://YOUR_IP:2202**

### Command line options
**-port**  
>This option must be followed (after a blank space) by a port number between 1024 and 65535.
For instance, if the IP address of your server is _10.0.0.3_ and set the port to _3456_, your Ubooquity server will be reachable in your browser at the address _10.0.0.3:3456_
Default port is 2202.

**-webadmin**
>This option activate the administration page of Ubooquity.
Without it you will not be able to configure Ubooquity through your browser.
Once your configuration is done however, you can remove this parameter to be sure nobody will be able to remotely modify it (although it is already password-protected).

**-headless**
>This option forces Java "headless" mode.
Use it if you launch Ubooquity using the command line and don't want the Ubooquity interface to be displayed.
