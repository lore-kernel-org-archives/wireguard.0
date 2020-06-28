Return-Path: <SRS0=JnmV=AK=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9DD9C433DF
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 29 Jun 2020 19:08:50 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6B7DF20720
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 29 Jun 2020 19:08:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sMpzQgaT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6B7DF20720
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9b360b26;
	Mon, 29 Jun 2020 18:49:08 +0000 (UTC)
Received: from mail-vk1-xa31.google.com (mail-vk1-xa31.google.com
 [2607:f8b0:4864:20::a31])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id a185811c
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 28 Jun 2020 13:45:07 +0000 (UTC)
Received: by mail-vk1-xa31.google.com with SMTP id y3so2895579vkg.11
 for <wireguard@lists.zx2c4.com>; Sun, 28 Jun 2020 07:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=dCmTz0yU+uckW65RoUOhaSsmDXzm0ziN0ZxMPNTcXRM=;
 b=sMpzQgaTXQDrEA9TkEBfEtxcuDCz9Ftt96vHQb4EHz8WfLaRbh2FW4YUwhLTHmgmfy
 YpQjRR0G5P4vJi/A+LRJhlzkxWUi+vTAl4njjOIWNJ0t/FkeSv5ZyOYTtp2Wlpz7137X
 D3DvvlJva3FQzvvfzrhU/JZOkkzcW79OaceZ7Ab05yeC2P/p5Sj+bjyooxZh90F7vbju
 /7GCdggflcwlFXoi+7y927kZ0Eg/UBF4dZ7Bm6UbsAikEfn9YhaosC+cd5TDq58EHsOP
 ue0W8RpCg9B6CkNcXWlg+ZaLmn9ZSr3sqesvGPJQLjnvnQQgmcP0Jc6HTsl1Z6lLZBTK
 w0yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=dCmTz0yU+uckW65RoUOhaSsmDXzm0ziN0ZxMPNTcXRM=;
 b=a7i3OJELkcC8uHqjMZviWIllQmel1hCmYp2iDGAq5b7hq4dYVTIFV4bFxcEtC+Be7r
 BJ7YqxzFQ++lRCrrGLUsh7KOTahk5edJDTc2huEIJDpJSNALXogrXvlH5L8qfMwznM1z
 C37Gv1KKwnr1giF7LahmMJ0GIADdDJkPfjgcYCnoIUGJ4QuXnHrkCTt5M4/zMYwcq9/f
 jWIcC77YMSKGdV2e6F5rjcV8o1RGM5dR2X36cbhu9g2ABSL1+tB9x3HxtdlD1C/eZ5Ge
 3VBcOA2zuJq6oFdAOPVvB3ZzcgafDbF3aJp6IHqLQ3uL6tHmFp1PsuJkLL8EaeytkY1z
 a87w==
X-Gm-Message-State: AOAM531r8W6ckD3k8VMgE/pxspO3FHiWl2ftHLlReDXRbutzEvvx048R
 gcNJEliJYeLjkkjOu7JrJvBGe52SSVHtYF1OYaM2bpN9
X-Google-Smtp-Source: ABdhPJzC68eaw2q8KkFIjhJkm83AGjf/skbQGx46qu4kSc1loR4O/RFpopH5HPAcnNbnfYWW08Z89u/voxGt3LAbSxc=
X-Received: by 2002:a1f:b44d:: with SMTP id d74mr7605725vkf.59.1593353078750; 
 Sun, 28 Jun 2020 07:04:38 -0700 (PDT)
MIME-Version: 1.0
From: Felix Tang <felix.gofaster@gmail.com>
Date: Sun, 28 Jun 2020 10:04:27 -0400
Message-ID: <CALJizUM+ORyc5V-J5eqNqYbPEPDcruZOkvv3iv1KPJOi60YYyQ@mail.gmail.com>
Subject: DKMS build failure 1.0.20200623 on Ubuntu 16.04 kernel
 4.4.0-159-generic x86_64
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Mon, 29 Jun 2020 20:49:05 +0200
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.30rc1
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Hello. Updating Wireguard from PPA fails.


$ sudo apt list --upgradable
Listing... Done
wireguard-dkms/xenial,xenial 1.0.20200623-1~16.04 all [upgradable
from: 1.0.20200611-0ppa1~16.04]

$ sudo apt upgrade
Reading package lists... Done
Building dependency tree
Reading state information... Done
Calculating upgrade... Done
The following packages will be upgraded:
  wireguard-dkms
1 upgraded, 0 newly installed, 0 to remove and 0 not upgraded.
Need to get 252 kB of archives.
After this operation, 2,048 B of additional disk space will be used.
Do you want to continue? [Y/n]
Get:1 http://ppa.launchpad.net/wireguard/wireguard/ubuntu xenial/main
amd64 wireguard-dkms all 1.0.20200623-1~16.04 [252 kB]
Fetched 252 kB in 0s (395 kB/s)
(Reading database ... 309479 files and directories currently installed.)
Preparing to unpack .../wireguard-dkms_1.0.20200623-1~16.04_all.deb ...

------------------------------
Deleting module version: 1.0.20200611
completely from the DKMS tree.
------------------------------
Done.
Unpacking wireguard-dkms (1.0.20200623-1~16.04) over
(1.0.20200611-0ppa1~16.04) ...
Setting up wireguard-dkms (1.0.20200623-1~16.04) ...
Loading new wireguard-1.0.20200623 DKMS files...
Building for 4.4.0-159-generic and 4.4.0-161-generic
Building initial module for 4.4.0-159-generic
Error! Bad return status for module build on kernel: 4.4.0-159-generic (x86=
_64)
Consult /var/lib/dkms/wireguard/1.0.20200623/build/make.log for more
information.

=3D=3D=3D=3D

$cat /var/lib/dkms/wireguard/1.0.20200623/build/make.log

DKMS make.log for wireguard-1.0.20200623 for kernel 4.4.0-159-generic (x86_=
64)
Sun Jun 28 09:05:14 EDT 2020
make: Entering directory '/usr/src/linux-headers-4.4.0-159-generic'
  LD      /var/lib/dkms/wireguard/1.0.20200623/build/built-in.o
  CC [M]  /var/lib/dkms/wireguard/1.0.20200623/build/main.o
In file included from include/linux/phy.h:22,
                 from include/net/dsa.h:19,
                 from include/linux/netdevice.h:44,
                 from include/net/ip_tunnels.h:5,
                 from include/net/udp_tunnel.h:4,
                 from
/var/lib/dkms/wireguard/1.0.20200623/build/compat/udp_tunnel/udp_tunnel_par=
tial_compat.h:143,
                 from
/var/lib/dkms/wireguard/1.0.20200623/build/compat/compat.h:73,
                 from <command-line>:
include/linux/module.h:130:6: warning: =E2=80=98init_module=E2=80=99 specif=
ies less
restrictive attribute than its target =E2=80=98mod_init=E2=80=99: =E2=80=98=
cold=E2=80=99
[-Wmissing-attributes]
  130 |  int init_module(void) __attribute__((alias(#initfn)));
      |      ^~~~~~~~~~~
/var/lib/dkms/wireguard/1.0.20200623/build/main.c:61:1: note: in
expansion of macro =E2=80=98module_init=E2=80=99
   61 | module_init(mod_init);
      | ^~~~~~~~~~~
/var/lib/dkms/wireguard/1.0.20200623/build/main.c:20:19: note:
=E2=80=98init_module=E2=80=99 target declared here
   20 | static int __init mod_init(void)
      |                   ^~~~~~~~
In file included from include/linux/phy.h:22,
                 from include/net/dsa.h:19,
                 from include/linux/netdevice.h:44,
                 from include/net/ip_tunnels.h:5,
                 from include/net/udp_tunnel.h:4,
                 from
/var/lib/dkms/wireguard/1.0.20200623/build/compat/udp_tunnel/udp_tunnel_par=
tial_compat.h:143,
                 from
/var/lib/dkms/wireguard/1.0.20200623/build/compat/compat.h:73,
                 from <command-line>:
include/linux/module.h:136:7: warning: =E2=80=98cleanup_module=E2=80=99 spe=
cifies less
restrictive attribute than its target =E2=80=98mod_exit=E2=80=99: =E2=80=98=
cold=E2=80=99
[-Wmissing-attributes]
  136 |  void cleanup_module(void) __attribute__((alias(#exitfn)));
      |       ^~~~~~~~~~~~~~
/var/lib/dkms/wireguard/1.0.20200623/build/main.c:62:1: note: in
expansion of macro =E2=80=98module_exit=E2=80=99
   62 | module_exit(mod_exit);
      | ^~~~~~~~~~~
/var/lib/dkms/wireguard/1.0.20200623/build/main.c:55:20: note:
=E2=80=98cleanup_module=E2=80=99 target declared here
   55 | static void __exit mod_exit(void)
      |                    ^~~~~~~~
  CC [M]  /var/lib/dkms/wireguard/1.0.20200623/build/noise.o
  CC [M]  /var/lib/dkms/wireguard/1.0.20200623/build/device.o
  CC [M]  /var/lib/dkms/wireguard/1.0.20200623/build/peer.o
  CC [M]  /var/lib/dkms/wireguard/1.0.20200623/build/timers.o
  CC [M]  /var/lib/dkms/wireguard/1.0.20200623/build/queueing.o
  CC [M]  /var/lib/dkms/wireguard/1.0.20200623/build/send.o
  CC [M]  /var/lib/dkms/wireguard/1.0.20200623/build/receive.o
  CC [M]  /var/lib/dkms/wireguard/1.0.20200623/build/socket.o
/var/lib/dkms/wireguard/1.0.20200623/build/socket.c: In function =E2=80=98s=
end6=E2=80=99:
/var/lib/dkms/wireguard/1.0.20200623/build/socket.c:139:20: error:
=E2=80=98const struct ipv6_stub=E2=80=99 has no member named =E2=80=98ipv6_=
dst_lookup_flow=E2=80=99;
did you mean =E2=80=98ipv6_dst_lookup=E2=80=99?
  139 |   dst =3D ipv6_stub->ipv6_dst_lookup_flow(sock_net(sock), sock, &fl=
,
      |                    ^~~~~~~~~~~~~~~~~~~~
      |                    ipv6_dst_lookup
scripts/Makefile.build:285: recipe for target
'/var/lib/dkms/wireguard/1.0.20200623/build/socket.o' failed
make[1]: *** [/var/lib/dkms/wireguard/1.0.20200623/build/socket.o] Error 1
Makefile:1454: recipe for target
'_module_/var/lib/dkms/wireguard/1.0.20200623/build' failed
make: *** [_module_/var/lib/dkms/wireguard/1.0.20200623/build] Error 2
make: Leaving directory '/usr/src/linux-headers-4.4.0-159-generic'

=3D=3D=3D=3D
$ uname -a
Linux sandbox 4.4.0-159-generic #187-Ubuntu SMP Thu Aug 1 16:28:06 UTC
2019 x86_64 x86_64 x86_64 GNU/Linux

$ apt policy |grep -i wireguard
 500 http://ppa.launchpad.net/wireguard/wireguard/ubuntu xenial/main
i386 Packages
     release v=3D16.04,o=3DLP-PPA-wireguard-wireguard,a=3Dxenial,n=3Dxenial=
,l=3DWireGuard,c=3Dmain,b=3Di386
 500 http://ppa.launchpad.net/wireguard/wireguard/ubuntu xenial/main
amd64 Packages
     release v=3D16.04,o=3DLP-PPA-wireguard-wireguard,a=3Dxenial,n=3Dxenial=
,l=3DWireGuard,c=3Dmain,b=3Damd64
