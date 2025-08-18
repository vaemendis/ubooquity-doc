---
title: Frequently Asked Questions
---

Don't forget to check the [**forum**](https://ubooquity.userecho.com/) if you don't find here the answer you were looking for.

**Table of content**

* placeholder for TOC generation
{:toc}


### I shared a folder but I can't see it on my Ubooquity page

If you chose to protect shared folders by creating users, you must specify for each folder the list of authorized users. 

### How can I change the admin password once it has been set ?

When you choose your admin password for the first time, Ubooquity creates a *webadmin.cred* file in its working directory. To change the password, just delete the *webadmin.cred* file and the next time you go on the admin page, Ubooquity will ask you to choose a password again.

### How can I make Ubooquity start with Windows ?

Just create a shortcut to the **Ubooquity.jar** file (right-click, create shortcut) and put it in your **Startup** folder (located at `C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp`).

### How do I run Ubooquity on a Linux server ?

You can use the `ubooquity.sh` script [available here](http://vaemendis.net/ubooquity/downloads/scripts/).

### Why does Ubooquity connect to the internet when it starts ?

Ubooquity checks once a day if a newer version is available so that you can download it if you want.

### Can I use Ubooquity to share my Calibre library ?

Yes, just share your Calibre library folder. Ubooquity will even read and display Calibre-specific informations like rating and series name and we have a [special page for Calibre related tips](calibre-sharing.html).

### Some of the information I see in Calibre do not appear in Ubooquity

You must force Calibre to write information in the epub files containing your books. Everything is explained in [the Calibre related tips](calibre-sharing.html).

### Some of my books appear duplicated in Ubooquity but not in Calibre

Sometimes Calibre generates extra epub files when a problem occurs during file modification. To remove them, follow the procedure described in [the Calibre related tips](calibre-sharing.html).

### Can Ubooquity read DRM protected files ?

No, unfortunately it can't. These files are designed to be read only on some specific ebooks reader. They are protected against access by any other software or device, including Ubooquity.

### How do I install Ubooquity on an Asustor NAS ?

Here is a [detailed tutorial](tutorials/install-on-asustor.html) for the Asustor NAS. (thanks to _lavraielilybellule_)


### How do I install Ubooquity on an Synology NAS ?

Here is a [detailed tutorial](tutorials/install-on-synology.html). (thanks to _Matthew Sanders_)

### Files with non-ASCII characters are ignored by Uboquity

The problem comes from the underlying OS. If your environment is not configured to run processes with more than just the ASCII charset (as it happens on some NAS), you'll have issues.

There is no single workaround (different users reported different results with different system settings), but you can take a look at this thread:  
[https://ubooquity.userecho.com/forums/1-general/topics/84-comics-not-imported-umlaut-mark-bug/](https://ubooquity.userecho.com/forums/1-general/topics/84-comics-not-imported-umlaut-mark-bug/)

Also, these ones might contain interesting info as well:  
[https://ubooquity.userecho.com/forums/1-general/topics/496-script-for-ubooquity-202-on-synology/](https://ubooquity.userecho.com/forums/1-general/topics/496-script-for-ubooquity-202-on-synology/)  
[http://ubooquity.userecho.com/forums/1-general/topics/92-tutorial-install-ubooquity-on-a-synology-nas/](http://ubooquity.userecho.com/forums/1-general/topics/92-tutorial-install-ubooquity-on-a-synology-nas/)

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

Follow the instructions of [this tutorial](tutorials/log-customization.html).

### Where can I find the source code of Ubooquity ?

Ubooquity is free to use but is not open source.
That is not to say it will never be. Just not in the foreseeable future.

### Can I generate password hashes myself for the admin and users ?

Although Ubooquity generates theses hashes for you, if you need to generate hashes separately (for the `webadmin.cred` and `preferences.json` files), you can do it using this page:  
[https://vaemendis.github.io/ubooquity-doc/pages/hash-generator.html](https://vaemendis.github.io/ubooquity-doc/pages/hash-generator.html)
