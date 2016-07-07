Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c49f6c3c
 for <wireguard@lists.zx2c4.com>; Thu, 7 Jul 2016 16:37:34 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3474dfc6
 for <wireguard@lists.zx2c4.com>; Thu, 7 Jul 2016 16:37:34 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id d68feebe
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 7 Jul 2016 16:37:34 +0000 (UTC)
Received: by mail-lf0-f51.google.com with SMTP id q132so15040192lfe.3
 for <wireguard@lists.zx2c4.com>; Thu, 07 Jul 2016 09:37:47 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20160707152524.GE18014@lud.polynome.dn42>
References: <CAA5ikozfeQAFGx8Yi9d=1r5gkHNnq6e0yHFVLXHdVYD_V_Wwfg@mail.gmail.com>
 <CAHmME9oN9NU8fHTjfW6ougLf4u9ZfUHJ11MxDf3RhbC5n64g3g@mail.gmail.com>
 <CAA5ikozn+uj+FPG1eLAR9uS+Lxqiab4+dMUhmBmyg9oBiWFQEg@mail.gmail.com>
 <20160707131324.GA18014@lud.polynome.dn42>
 <CAA5ikoypGoMip+DS=Ud-dNRZOf-8m+MDtV5JobLr1MBmAdRS=A@mail.gmail.com>
 <20160707150621.GC18014@lud.polynome.dn42>
 <20160707152524.GE18014@lud.polynome.dn42>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 7 Jul 2016 18:37:45 +0200
Message-ID: <CAHmME9o2rdqJWdfmjd_KqSAv69cpHDyto3JXRQZ0dpy5Luw=qw@mail.gmail.com>
To: Baptiste Jonglez <baptiste@bitsofnetworks.org>
Content-Type: text/plain; charset=UTF-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] Wireguard behind NAT (Was: Client changes endpoint
 port, why?)
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

It might be possible to use existing hole punching tricks like STUN
with WireGuard, but there's no way I'm baking something like that into
the kernel protocol itself. This is something neat that might
piggyback on an upper layer.

However, check out the other thread for another more pressing NAT
traversal issue.

Regards,
Jason
