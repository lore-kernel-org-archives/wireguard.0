Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fb1cd5a4
 for <wireguard@lists.zx2c4.com>;
 Mon, 19 Dec 2016 13:02:39 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7c917b2f
 for <wireguard@lists.zx2c4.com>;
 Mon, 19 Dec 2016 13:02:39 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 44ad79ad
 for <wireguard@lists.zx2c4.com>;
 Mon, 19 Dec 2016 13:02:39 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 3d996ef7
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 19 Dec 2016 13:02:39 +0000 (UTC)
Received: by mail-oi0-f53.google.com with SMTP id v84so143768451oie.3
 for <wireguard@lists.zx2c4.com>; Mon, 19 Dec 2016 05:09:35 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20161219130602.GA12378@tuxmachine.polynome.dn42>
References: <CAHmME9q+aZNDDH5Nsnn1O7+4RxFm489f08oOmyGpWsVx1pLxwg@mail.gmail.com>
 <232dbabb-d3f0-6f84-bd21-a6c6abab2441@higgsboson.tk>
 <CAHmME9rqtmYntL046vCOTVHwcdk2ThTwqMFqFj4kBKtKxixo4A@mail.gmail.com>
 <20161219130602.GA12378@tuxmachine.polynome.dn42>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 19 Dec 2016 14:09:33 +0100
Message-ID: <CAHmME9qEg6iBwWpwgT_oPPGymfccuOdAyHv1e4+n5c-O8n9=4g@mail.gmail.com>
Subject: Re: openwrt route_allowed_ips is inprecise
To: Baptiste Jonglez <baptiste@bitsofnetworks.org>
Content-Type: text/plain; charset=UTF-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Mon, Dec 19, 2016 at 2:06 PM, Baptiste Jonglez
<baptiste@bitsofnetworks.org> wrote:
> Please provide numbers.  I would be very surprised if a few redundant
> routes have any performance impact, given that the kernel can handle 600k
> routes without major issues.

I'm thinking about the case in which a server has a 10/8 of clients,
each of which gets a /32. In this case quite a few routes wind up in
the table...

Fortunately the change is pretty easy. Instead of running
`proto_add_ipv4_route ...` you run:

[[ $(ip route get "$i") != *dev\ $INTERFACE\ * ]] && proto_add_ipv4_route ...
