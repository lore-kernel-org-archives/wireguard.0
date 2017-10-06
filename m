Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bc22f6f0
 for <wireguard@lists.zx2c4.com>; Fri, 6 Oct 2017 00:23:45 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 612682d5
 for <wireguard@lists.zx2c4.com>; Fri, 6 Oct 2017 00:23:45 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 75c85705
 for <wireguard@lists.zx2c4.com>; Fri, 6 Oct 2017 00:42:48 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id f96a8984
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 6 Oct 2017 00:42:48 +0000 (UTC)
Received: by mail-oi0-f53.google.com with SMTP id h200so363360oib.4
 for <wireguard@lists.zx2c4.com>; Thu, 05 Oct 2017 17:52:58 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CANcRkik-gjJqz89FFtAXPC2_ixi8uZv6wDTTOOsjJqNieiDPKg@mail.gmail.com>
References: <CANcRkik-gjJqz89FFtAXPC2_ixi8uZv6wDTTOOsjJqNieiDPKg@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 6 Oct 2017 02:52:57 +0200
Message-ID: <CAHmME9qHxvQc63ubFxv7KvrrJ0J26q6dSJPi4YYjjqs=cDDhxg@mail.gmail.com>
Subject: Re: wireguard bypass question
To: Ryan McGee <rwm.pc.repair@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi Ryan,

You can use the `ipset=` feature of dnsmasq for this (which I wrote a
number of years ago). It will add matched domains to a netfilter ipset
object, which you can then use for policy based routing.

I had a look at the vpnbypass project, and it doesn't actually look
OpenVPN centric at all. It looks to me like it actually uses this
dnsmasq feature along with classic policy routing. It looks like it
automatically discovers your WAN interface too. Give vpnbypass a try
and let me know if there are problems with it.

Jason
