Return-Path: najoll@posteo.net
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9fbdc4e5
 for <wireguard@lists.zx2c4.com>;
 Mon, 18 Dec 2017 14:21:16 +0000 (UTC)
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0e78d335
 for <wireguard@lists.zx2c4.com>;
 Mon, 18 Dec 2017 14:21:16 +0000 (UTC)
Received: from submission (posteo.de [89.146.220.130])
 by mout01.posteo.de (Postfix) with ESMTPS id 767EF20DF1
 for <wireguard@lists.zx2c4.com>; Mon, 18 Dec 2017 15:29:40 +0100 (CET)
Received: from customer (localhost [127.0.0.1])
 by submission (posteo.de) with ESMTPSA id 3z0k2C54GBz9rxG
 for <wireguard@lists.zx2c4.com>; Mon, 18 Dec 2017 15:29:39 +0100 (CET)
To: wireguard@lists.zx2c4.com
From: Nicholas Joll <najoll@posteo.net>
Subject: Bug report: WG won't reinstall after some OS recover procedures
Message-ID: <2d4283b6-e379-cbbe-d084-91de4e023eca@posteo.net>
Date: Mon, 18 Dec 2017 14:29:43 +0000
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary="------------7EB301E319834F3BD46D73E9"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

This is a multi-part message in MIME format.
--------------7EB301E319834F3BD46D73E9
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

To Whom It May Concern

What happened. (1) On a system on which Wireguard was working, I used
the 'TimeShift' program to restore Linux Mint from backup - twice, on
one occasion including within the restore a reinstall of Grub and
rebuild of initramfs. (Points 2-3 that follow apply to both versions of
the restore.) (2) After the restore, WG still worked. (3) I updated the
kernel (on one occasion before rebooting, or another after rebooting).
(4) WG no longer worked. When I tried to reinstall it, it gave
'post-install' messages about how the dkms module was installed already.
All manner of package removal and purging and file deletion failed to
achieve anything - until I discovered that deleting a file in
/var/lib/dkms/wireguard/ (together with 'sudo dkms --reconfigure -a'?)
fixed things.

What should have happened. WG should be able to cope with such a
restore. At worst, it should give the user messages about how to fix the
problem.

System Concerned: Linux Mint 18.3 Cinnamon; WG 0.0.20171211.

Nicholas


--------------7EB301E319834F3BD46D73E9
Content-Type: text/html; charset=windows-1252
Content-Transfer-Encoding: 7bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=windows-1252">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <pre wrap="">To Whom It May Concern

What happened. (1) On a system on which Wireguard was working, I used
the 'TimeShift' program to restore Linux Mint from backup - twice, on
one occasion including within the restore a reinstall of Grub and
rebuild of initramfs. (Points 2-3 that follow apply to both versions of
the restore.) (2) After the restore, WG still worked. (3) I updated the
kernel (on one occasion before rebooting, or another after rebooting).
(4) WG no longer worked. When I tried to reinstall it, it gave
'post-install' messages about how the dkms module was installed already.
All manner of package removal and purging and file deletion failed to
achieve anything - until I discovered that deleting a file in
<i class="moz-txt-slash"><span class="moz-txt-tag">/</span>var/lib/dkms/wireguard<span class="moz-txt-tag">/</span></i> (together with 'sudo dkms --reconfigure -a'?)
fixed things.

What should have happened. WG should be able to cope with such a
restore. At worst, it should give the user messages about how to fix the
problem.

System Concerned: Linux Mint 18.3 Cinnamon; WG 0.0.20171211.

Nicholas
</pre>
  </body>
</html>

--------------7EB301E319834F3BD46D73E9--
