---
title: Using a certificate (HTTPS)
---

**Table of content**

* placeholder for TOC generation
{:toc}

The default behavior of Ubooquity is to serve pages over HTTP.  
If you want to secure connections to your instance, Ubooquity can be configured to serve pages over [HTTP**S**](https://en.wikipedia.org/wiki/HTTPS) by using a [certificate](https://en.wikipedia.org/wiki/Public_key_certificate), either a [self-signed one](https://en.wikipedia.org/wiki/Self-signed_certificate), one you bought from a [certification authority](https://en.wikipedia.org/wiki/Certificate_authority) or one that Ubooquity will automatically get for you from the free [Let's Encrypt](https://letsencrypt.org/) certification authority.

## Generate and use a self-signed certificate

Your first and easiest option to enable HTTPS is to use a self-signed certificate.

1. Generate a keystore (you can see it as a vault containing your certificate) with a self-signed certificate by following [this short tutorial](https://www.sslshopper.com/article-how-to-create-a-self-signed-certificate-using-java-keytool.html).
2. Configure Ubooquity to use it (by setting its path and password in the "Security" section).

Self-signed are quite easy to generate. But being less secure than certificates provided by a certification authority, they trigger a warning in most browsers (usually with a "Connection untrusted" or "Certificate not trusted" message). Things can get worse on some mobile browsers or in-app browsers, as some of them don't allow connection which use a self-signed certificate at all. 

## Use an existing certificate

To use a certificate you already have, you'll need to import it into a keystore.

1. [Follow this tutorial](https://alvinalexander.com/java/java-using-keytool-import-certificate-keystore) that explains how to do it. Note that you don't need a pre-existing keystore, the import command will create it (as noted in the tutorial).
2. Configure Ubooquity to use the updated keystore (by setting its path and password in the "Security" section).

Like the first option (generating a self-signed certificate), you'll need to use the "keytool" tool, which is avaible in all Java distributions (look for it in the "bin" directory of your Java version).

## Obtain and use a Let's Encrypt certificate

Getting a certificate was quite costly until a group of web related organisations decided to create the [**Let's Encrypt**](https://letsencrypt.org/) certification authority, to promote the usage of HTTPS by providing certificates for free.

> Let's Encrypt is a service provided by the Internet Security Research Group (ISRG), a public benefit organization. 
 Major sponsors are the Electronic Frontier Foundation (EFF), the Mozilla Foundation, OVH, Akamai, and Cisco Systems. Other partners include the certificate authority IdenTrust, the University of Michigan (U-M), the Stanford Law School and the Linux Foundation. (_Wikipedia_)

 With the appropriate configuration, Ubooquity can create a Let's Encrypt account, obtain a certificate for your domain and automatically renew it every 3 months (the maximum Let's Encrypt certificates validity period).

<div class="infobox">
    All the files related to the Let's Encrypt certificate (configuration, private key, logs...) are located in the <b>"acme"</b> directory of your Ubooquity installation.
</div>

 ### Requirements

The certificate acquisition process requires **the Let's Encrypt server to connect to Ubooquity on port 80**. This means that your network must be properly configured to allow access to Ubooquity from the internet on this port. There is no need to configure Ubooquity to use port 80 though, another internal server will be listening to this port for this purpose only).  

#### If you use a reverse proxy

This constraint also excludes using a reverse proxy prefix for the certificate acquisition.  
 Reverse proxy settings are not used by Ubooquity for this process, so you can keep them, but you still need to ensure that your domain root on port 80 points directly to Ubooquity instance.

This access is only necessary for the duration of the "challenge" (the part of the process where Let's Encrypt checks you actually control the domain). So you can temporarily change your network configuration to get the certificate and revert back to the original one afterwards.  
 In that case, don't forget to disable automatic renewal of your certificate in the configuration file (see below). You will also have to manually renew the certificate every three months by clicking the "Renew" button in the "Security" tab of Ubooquity admin page (after having made Ubooquity accessible from the internet again, like the first time).

 ### Step 1 - Configuration

Configuring Ubooquity to get a Let's Encrypt certificate is done in the file `acme.properties`.

Here are the configuration keys you have to modify and what they mean:

**domain**

**test.mode**

**automatic.certificate.renewal**

**i.accept.letsencrypt.subscriber.agreement**

**i.have.made.a.backup.of.my.key.pair**


 ### Step 2 - Testing



The first time you run Ubooquity with the Let's Encrypt option activated, it will create a key pair that will be used to identify your Let's Encrypt account.  
The private key of this key pair is saved to the `acme-private-key.pem` file.

<div class="warnbox">
    This private key is the only way to identify yourself. Should you lose it, you will be locked out of your Let's Encrypt account and certificates. <b>Keep a copy of this key in a safe place !</b>
</div>

explain staging + check reachability from the net




 ### Step 3 - Activation







