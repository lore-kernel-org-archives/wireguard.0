Return-Path: germano.massullo@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fb353dba
 for <wireguard@lists.zx2c4.com>; Fri, 1 Dec 2017 17:44:48 +0000 (UTC)
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4efb3318
 for <wireguard@lists.zx2c4.com>; Fri, 1 Dec 2017 17:44:48 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id g75so4997780wme.0
 for <wireguard@lists.zx2c4.com>; Fri, 01 Dec 2017 09:51:05 -0800 (PST)
Return-Path: <germano.massullo@gmail.com>
Received: from [192.168.1.100]
 (host179-8-dynamic.56-79-r.retail.telecomitalia.it. [79.56.8.179])
 by smtp.googlemail.com with ESMTPSA id x13sm5234684wre.65.2017.12.01.09.51.04
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 01 Dec 2017 09:51:04 -0800 (PST)
Subject: Re: Wireguard ceased to work after Fedora 26->27 upgrade
From: Germano Massullo <germano.massullo@gmail.com>
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
References: <b984758b-93ce-f909-e63e-f31fb575a5f9@gmail.com>
Message-ID: <2d50500c-bebb-146d-fbfd-ab9e212101a4@gmail.com>
Date: Fri, 1 Dec 2017 18:51:03 +0100
MIME-Version: 1.0
In-Reply-To: <b984758b-93ce-f909-e63e-f31fb575a5f9@gmail.com>
Content-Type: text/plain; charset=utf-8
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

jdoss helped me in #wireguard IRC channel. I post the resolution, it
could be useful for other Fedora users

[18:28] <jdoss> sudo dnf remove wireguard-dkms wireguard-tools; sudo dnf
install wireguard-dkms wireguard-tools
[18:31] <me> jdoss: dnf cannot remove wireguard-dkms, output below

=============
Transazione in corso
  Preparazione in corso                     
:                                                                                                                  
1/1
  Esecuzione scriptlet in corso              :
wireguard-dkms-1:0.0.20171127-1.fc27.noarch                                                                      
1/1
errore: scriptlet %preun(wireguard-dkms-1:0.0.20171127-1.fc27.noarch)
fallita, uscita con stato 3
Error in PREUN scriptlet in rpm package wireguard-dkms
Error in PREUN scriptlet in rpm package wireguard-dkms
wireguard-dkms-1:0.0.20171127-1.fc27.noarch doveva essere eliminato, ma
non lo è stato!
  Verifica in corso                          :
wireguard-dkms-1:0.0.20171127-1.fc27.noarch                                                                      
1/1
 
Non riuscito:
  wireguard-dkms.noarch 1:0.0.20171127-1.fc27
Errore: Transazione non riuscita
=============

[18:32] <jdoss> rpm -qa |grep wireguard
[18:33] <me> jdoss: wireguard-dkms-0.0.20171127-1.fc27.noarch
[18:35] <jdoss> dkms remove -m wireguard -v 0.0.20171127 --all
[18:36] <me> jdoss: Error! There are no instances of module:
wireguard       0.0.20171127 located in the DKMS tree.
[18:37] <jdoss> That's a doozy
[18:37] <me> uh
[18:37] <jdoss> sounds like your dkms went rogue or you removed
wireguard outside of the RPM doing it's job
[18:37] <me> jdoss: no, I have never messed up with that stuff
[18:38] <me> I always used dnf and the copr repo
[18:38] <jdoss> sudo dkms add -m wireguard -v 0.0.20171127
[18:38] <me> jdoss: Creating symlink
/var/lib/dkms/wireguard/0.0.20171127/source ->          
/usr/src/wireguard-0.0.20171127          DKMS: add completed.
[18:39] <jdoss> sudo dkms build -m wireguard -v 0.0.20171127; sudo dkms
install -m wireguard -v 0.0.20171127
[18:40] <jdoss> the upgrade to 27 prob didn't care over well with dkms.
[18:41] <me> jdoss: output below

=============
# dkms build -m wireguard -v 0.0.20171127; dkms install -m wireguard -v
0.0.20171127

Kernel preparation unnecessary for this kernel.  Skipping...

Building module:
cleaning build area...
make -j4 KERNELRELEASE=4.13.16-300.fc27.x86_64 -C
/lib/modules/4.13.16-300.fc27.x86_64/build
M=/var/lib/dkms/wireguard/0.0.20171127/build.......
cleaning build area...

DKMS: build completed.

wireguard:
Running module version sanity check.
 - Original module
   - No original module exists within this kernel
 - Installation
   - Installing to /lib/modules/4.13.16-300.fc27.x86_64/extra/
Adding any weak-modules

depmod......

DKMS: install completed.
output below =============

[18:41] <jdoss> dkms status
[18:41] <me> jdoss: wireguard, 0.0.20171127, 4.13.16-300.fc27.x86_64,
x86_64: installed
[18:42] <jdoss> should be good now
[18:42] <me> I suppose that now I have to reinstall the other wireguard
packages
[18:42] <jdoss> yea reinstall wireguard-tools
[18:43] <me> jdoss: yeah, now everything works fine, thank you very much
[18:43] <jdoss> no problem
[18:44] <me> jdoss: I am going to post the resolution to the mailing
list, in case anyone else is affected by the same problem
