Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ea93febf
 for <wireguard@lists.zx2c4.com>;
 Wed, 20 Sep 2017 12:57:25 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 13b0cf04
 for <wireguard@lists.zx2c4.com>;
 Wed, 20 Sep 2017 12:57:25 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f3b9229d
 for <wireguard@lists.zx2c4.com>;
 Wed, 20 Sep 2017 13:16:28 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 93cb2d42
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 20 Sep 2017 13:16:28 +0000 (UTC)
Received: by mail-oi0-f50.google.com with SMTP id b1so2556100oih.4
 for <wireguard@lists.zx2c4.com>; Wed, 20 Sep 2017 06:24:40 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170919183438.Horde.O_l7lFVqHiv6-cvQ2uGXuyk@www.vdorst.com>
References: <20170919151533.Horde.MQvI7jMPhVKrVNqOVodg-dg@www.vdorst.com>
 <CAHmME9p17p2Hq6c1rw4QB=PztStywoR-r1r-L6bGiNZ2WU=62g@mail.gmail.com>
 <20170919183438.Horde.O_l7lFVqHiv6-cvQ2uGXuyk@www.vdorst.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 20 Sep 2017 15:24:39 +0200
Message-ID: <CAHmME9qS6p6nhkV-3_kNiyGU3Mi56tgwcgKa+ng2P+tQ14h3pA@mail.gmail.com>
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

Hi Ren=C3=A9,

I'm unfortunately not at all able to reproduce this issue over here.
Could you send me your .config and the special netns.sh you're using?

Jason
