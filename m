Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 172353e6
 for <wireguard@lists.zx2c4.com>; Fri, 8 Jul 2016 14:30:42 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5ccb2f89
 for <wireguard@lists.zx2c4.com>; Fri, 8 Jul 2016 14:30:42 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id b878acbe
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 8 Jul 2016 14:30:41 +0000 (UTC)
Received: by mail-lf0-f49.google.com with SMTP id q132so29334227lfe.3
 for <wireguard@lists.zx2c4.com>; Fri, 08 Jul 2016 07:31:01 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20160708142809.GB18310@lud.polynome.dn42>
References: <20160708123412.11412-1-Jason@zx2c4.com>
 <20160708142809.GB18310@lud.polynome.dn42>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 8 Jul 2016 16:30:58 +0200
Message-ID: <CAHmME9rgzvUA8bY1rcEFddmi6E255PrUmM-uCOYziVVS_kQ1pg@mail.gmail.com>
To: Baptiste Jonglez <baptiste@bitsofnetworks.org>
Content-Type: text/plain; charset=UTF-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] [PATCH] persistent keepalive: start sending
	immediately
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Fri, Jul 8, 2016 at 4:28 PM, Baptiste Jonglez
<baptiste@bitsofnetworks.org> wrote:
> Yes, this is good to have, for the reasons mentioned by others (immediate
> reachability in the reverse direction).

Will merge this then.

>
> Does the first handshake occurs when the interface is up or when data is
> first sent on the interface?

Only when data is sent. WireGuard is as silent as possible by default.



>
> Just a random thought, though: are keepalive packets in only one direction
> (client to server) enough to maintain a mapping in a NAT or stateful
> firewall?  Aren't there edge cases where you would need keepalives in both
> directions?

If you send an outgoing packet behind nat to a certain IP, that IP is
expected to be able to reply to you right afterward. That's the
characteristic we depend on.
If both sides are behind odd firewalls, then both sides could enable
the feature. But I suspect in most cases only one side will use it.
