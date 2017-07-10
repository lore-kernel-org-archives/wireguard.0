Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 63a0d6fc
 for <wireguard@lists.zx2c4.com>;
 Mon, 10 Jul 2017 02:35:20 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 114ee416
 for <wireguard@lists.zx2c4.com>;
 Mon, 10 Jul 2017 02:35:20 +0000 (UTC)
Date: Mon, 10 Jul 2017 04:53:24 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: jomat+wireguard.io@jmt.gr
Subject: Re: Debian-based configuration for wireguard
Message-ID: <20170710025323.GC31153@zx2c4.com>
References: <20170709213020.GF22784@tuxmachine.polynome.dn42>
 <35cd4d321a82ba05aa4e118979bc5a87@jmt.gr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
In-Reply-To: <35cd4d321a82ba05aa4e118979bc5a87@jmt.gr>
Cc: Egbert Verhage <egbert@eggiecode.org>, wireguard@lists.zx2c4.com
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Sun, Jul 09, 2017 at 11:17:04PM +0000, jomat+wireguard.io@jmt.gr wrote:
> Nice! I also don't like wg-quick too much, but also dislike the
> pre-/post-/-up/-down directives in my /etc/network/interfaces, so
> I put this script to /etc/network/if-pre-up.d/ and if-post-down.d
> which could work for Debian, too:
> 
> https://github.com/jomat/aports/blob/master/testing/wireguard/wireguard.ifupdown

I think Egbert might have also written an ifupdown thing? Adding him to
the CC in case you guys want to standardize on one Debian way of doing
things?

Jason
