Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9fccce3a
 for <wireguard@lists.zx2c4.com>; Fri, 4 May 2018 00:13:39 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 40191aba
 for <wireguard@lists.zx2c4.com>; Fri, 4 May 2018 00:13:39 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 66054b21
 for <wireguard@lists.zx2c4.com>; Thu, 3 May 2018 23:49:58 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 017fbec6
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 3 May 2018 23:49:58 +0000 (UTC)
Received: by mail-oi0-f53.google.com with SMTP id y15-v6so17720538oia.13
 for <wireguard@lists.zx2c4.com>; Thu, 03 May 2018 17:15:34 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <8599540b-b761-57a1-a585-b4395f9bed96@ironicdesign.com>
References: <8599540b-b761-57a1-a585-b4395f9bed96@ironicdesign.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 4 May 2018 02:15:32 +0200
Message-ID: <CAHmME9o+yduX0kbM0BV1qqGBbyf83XHi6bmcTSFXqzmVHw=FfQ@mail.gmail.com>
Subject: Re: wg0 packets not being routed?
To: Andy Dorman <adorman@ironicdesign.com>
Content-Type: text/plain; charset="UTF-8"
Cc: Ironic Design Development <devel@lists.ironicdesign.com>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hello Andy,

The mistake you've made is that your NOC servers don't have a route
indicating that 192.168.100.0/24 should go to wg0, and likely your
Linode server doesn't have a route indicating that 192.168.99.0/25
should go to wg0. Instead, packets to these addresses are going out of
your default route, which is to the Internet, which rightfully rejects
RFC1918 addresses.

You can fix this in two ways:

1) Just use 192.168.99.0/24 addresses on both sides, so the route can
be inferred from the IP you're using. Or,

2) If you want to keep your existing structures of subnets, then just
add those routes:

nocbox $ ip route add 192.168.100.0/24 dev wg0
linode $ ip route add 192.168.99.0/24 dev wg0

If you're using wg-quick(8) to configure things, this will be taken
care of automatically, by the way.

Jason
