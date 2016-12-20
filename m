Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e35a0a43
 for <wireguard@lists.zx2c4.com>;
 Tue, 20 Dec 2016 03:07:07 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9afbaee0
 for <wireguard@lists.zx2c4.com>;
 Tue, 20 Dec 2016 03:07:07 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cfef5198
 for <wireguard@lists.zx2c4.com>;
 Tue, 20 Dec 2016 03:07:07 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id c9229d29
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 20 Dec 2016 03:07:07 +0000 (UTC)
Received: by mail-oi0-f53.google.com with SMTP id b126so165714056oia.2
 for <wireguard@lists.zx2c4.com>; Mon, 19 Dec 2016 19:14:07 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20161220011334.GB16814@tuxmachine.polynome.dn42>
References: <CAHmME9q+aZNDDH5Nsnn1O7+4RxFm489f08oOmyGpWsVx1pLxwg@mail.gmail.com>
 <20161220011334.GB16814@tuxmachine.polynome.dn42>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 20 Dec 2016 04:14:06 +0100
Message-ID: <CAHmME9rDK0MEFH2oOVjeTF0n=J6=Hsk9e5Hyj2GDnFk8V3LtwA@mail.gmail.com>
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

Hey Baptiste,

On Tue, Dec 20, 2016 at 2:13 AM, Baptiste Jonglez
<baptiste@bitsofnetworks.org> wrote:

> By the way, besides the issue of magic, this approach seems incorrect
> depending on the order of the routes.  Consider the case where cmd_add()
> handles the following sequence of allowed-ips:
>
>     10.0.0.0/8   dev wg0
>     10.4.7.0/24  dev wg0
>     10.4.0.0/16  dev wg1
>
> Your method would incorrectly drop the second route, and then the third
> route would take over traffic for this /24 through the wrong interface.

Very smart point and astute observation! This should be fixed here:

https://git.zx2c4.com/WireGuard/commit/?id=5838c950859f1b55ad344e81b77a0b71917ffd61

Unless there are objections, that will ship with the next snapshot.

Jason
