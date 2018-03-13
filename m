Return-Path: jacob.schooley@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c5e65774
 for <wireguard@lists.zx2c4.com>;
 Tue, 13 Mar 2018 01:41:38 +0000 (UTC)
Received: from mail-wr0-f173.google.com (mail-wr0-f173.google.com
 [209.85.128.173])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 08a9636e
 for <wireguard@lists.zx2c4.com>;
 Tue, 13 Mar 2018 01:41:38 +0000 (UTC)
Received: by mail-wr0-f173.google.com with SMTP id d10so5608308wrf.3
 for <wireguard@lists.zx2c4.com>; Mon, 12 Mar 2018 18:51:49 -0700 (PDT)
MIME-Version: 1.0
Sender: jacob.schooley@gmail.com
From: Jacob Schooley <jacob.schooley+wgvpn@gmail.com>
Date: Mon, 12 Mar 2018 21:51:47 -0400
Message-ID: <CAHjFYUJnEvhB27dKcUXLzj-KYK5U+gMLuQORNiiQwG2Zp8E9TQ@mail.gmail.com>
Subject: Android app and command line
To: wireguard@lists.zx2c4.com
Content-Type: multipart/alternative; boundary="089e0824e40c62c8520567418020"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--089e0824e40c62c8520567418020
Content-Type: text/plain; charset="UTF-8"

There is an option in the Android app to enable wg and wg-quick, which will
be extremely useful to me as most of my VPN stuff is taken care of with
Tasker. There are two major bugs with this however.

One is that the app doesn't automatically update the status of wireguard,
so the switch inside the app won't flip if I use wg-quick up or down until
I swipe off and reopen the app, and the quick settings toggle won't change.

The other is that if I run wg-quick up, then try to bring it down through
the app or the quick settings toggle, it says "Error bringing down tunnel:
Unable to configure tunnel (wg-quick returned 2)." So as of now it really
doesn't work well with tasker because I can't bring it down manually if I
need to.

--089e0824e40c62c8520567418020
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">There is an option in the Android app to enable wg and wg-=
quick, which will be extremely useful to me as most of my VPN stuff is take=
n care of with Tasker. There are two major bugs with this however.<div><br>=
</div><div>One is that the app doesn&#39;t automatically update the status =
of wireguard, so the switch inside the app won&#39;t flip if I use wg-quick=
 up or down until I swipe off and reopen the app, and the quick settings to=
ggle won&#39;t change.</div><div><br></div><div>The other is that if I run =
wg-quick up, then try to bring it down through the app or the quick setting=
s toggle, it says &quot;Error bringing down tunnel: Unable to configure tun=
nel (wg-quick returned 2).&quot; So as of now it really doesn&#39;t work we=
ll with tasker because I can&#39;t bring it down manually if I need to.</di=
v></div>

--089e0824e40c62c8520567418020--
