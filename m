Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 04a90a93
 for <wireguard@lists.zx2c4.com>;
 Wed, 20 Sep 2017 20:48:08 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3cd61c02
 for <wireguard@lists.zx2c4.com>;
 Wed, 20 Sep 2017 20:48:08 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0f7aa8cd
 for <wireguard@lists.zx2c4.com>;
 Wed, 20 Sep 2017 21:07:11 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id e4759599
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 20 Sep 2017 21:07:10 +0000 (UTC)
Received: by mail-io0-f177.google.com with SMTP id g32so6655892ioj.2
 for <wireguard@lists.zx2c4.com>; Wed, 20 Sep 2017 14:15:24 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170920170055.Horde.VMh86cFTXHMnql4s7ycIl7z@www.vdorst.com>
References: <20170919151533.Horde.MQvI7jMPhVKrVNqOVodg-dg@www.vdorst.com>
 <CAHmME9p17p2Hq6c1rw4QB=PztStywoR-r1r-L6bGiNZ2WU=62g@mail.gmail.com>
 <20170919183438.Horde.O_l7lFVqHiv6-cvQ2uGXuyk@www.vdorst.com>
 <CAHmME9qS6p6nhkV-3_kNiyGU3Mi56tgwcgKa+ng2P+tQ14h3pA@mail.gmail.com>
 <20170920170055.Horde.VMh86cFTXHMnql4s7ycIl7z@www.vdorst.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 20 Sep 2017 23:15:23 +0200
Message-ID: <CAHmME9osiU+rgWyep6=Zku1+amB7-9bqfG0PZbeUXDf69oWvXg@mail.gmail.com>
Subject: Re: Last pingtest always fails with netns.sh script on ARM device
 with F25.
To: =?UTF-8?Q?Ren=C3=A9_van_Dorst?= <opensource@vdorst.com>
Content-Type: text/plain; charset="UTF-8"
Cc: WireGuard list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hey Ren=C3=A9,

I figured it out; it was a bug in the test suite, relying on default
Linux values, instead of explicitly setting them. It was introduced
here:

https://git.zx2c4.com/WireGuard/diff/src/tests/netns.sh?id=3Daf2435d180ebb5=
a3d89b21eb9118d1c643f03f95

And I've fixed it here:

https://git.zx2c4.com/WireGuard/commit/?id=3D9bd0558427d7eb7dc36b7f720d83ef=
835056fae6

Thanks for sending all the info!

Regards,
Jason
