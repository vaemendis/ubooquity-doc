---
title: Log format customization
---

If the default formatting used for the log file does not suits your needs (for instance if you use [Fail2ban](http://www.fail2ban.org/wiki/index.php/Main_Page), you need a specific time format), you can override the default log configuration file.

Here are the required steps.

#### Step 1
Extract the **log-config.xml** configuration file from the **Ubooquity.jar** file. You can do that with any archive management software, as a ".jar" file is only a zip file with a different name.

#### Step 2
Modify the **log-config.xml** configuration file to get the log format you want.
 
 
**Example:**  
Let's say you want to change the way the date is displayed. A Ubooquity log line withe the default settings looks like that:

```
20140623 19:20:59.178 [main] INFO com.ubooquity.Ubooquity - Starting Ubooquity
```

We are going to change the configuration to get:

```
[Mon Jun 23 19:20:59 2014] [INFO][main] com.ubooquity.Ubooquity - Starting Ubooquity
```

You can do that by replacing the following configuration line in the log-config.xml file:

```
<pattern>%d{yyyyMMdd HH:mm:ss} [%thread] %-5level %logger{36} - %msg%n</pattern>
```

with:

```
<pattern>[%d{EEE MMM d HH:mm:ss yyyy}] [%-5level][%thread] %logger{36} - %msg%n</pattern>
```

Be careful, there are two lines to replace (twice the same). 
You can find [here](http://docs.oracle.com/javase/7/docs/api/java/text/SimpleDateFormat.html) a table explaining how the date patterns work.  
If you want complete control of your logs, take a look at the [Logback configuration documentation](http://logback.qos.ch/manual/configuration.html).  

#### Step 3
Modify your starting script to force the use of your new configuration at startup.  
Your configuration file **_must_** be placed in your Ubooquity working directory (the directory where ubooquity creates its own folders, database and prederences files) or it will be ignored.  
Add the `-Dlogback.configurationFile` parameter with the **_absolute_** path to your configuration file:

```
java -Dlogback.configurationFile=/home/pi/ubooquity/log-config.xml -jar Ubooquity.jar
```

#### Step 4 
Run Ubooquity.
