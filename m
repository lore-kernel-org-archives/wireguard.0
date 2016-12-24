Return-Path: jehan@altheamesh.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id afb05cf9
 for <wireguard@lists.zx2c4.com>;
 Sat, 24 Dec 2016 16:28:17 +0000 (UTC)
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ec08037f
 for <wireguard@lists.zx2c4.com>;
 Sat, 24 Dec 2016 16:28:17 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id A6CD0207B3
 for <wireguard@lists.zx2c4.com>; Sat, 24 Dec 2016 11:35:51 -0500 (EST)
Message-Id: <1482597351.888073.828789001.771C92C9@webmail.messagingengine.com>
From: Jehan Tremback <jehan@altheamesh.com>
To: wireguard@lists.zx2c4.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
In-Reply-To: <b9daea6b-caa1-6778-7236-02efb2288b99@viisauksena.de>
Date: Sat, 24 Dec 2016 08:35:51 -0800
Subject: Re: [fyi] test in the wild (wg + gretap + batman-adv) on tplink842
References: <b9daea6b-caa1-6778-7236-02efb2288b99@viisauksena.de>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Maybe I'm missing something obvious, but why would batman-adv affect the
speed?

-- 
  Jehan Tremback
  jehan@altheamesh.com

On Fri, Dec 23, 2016, at 04:24 PM, jens wrote:
> i have done some testing with nodes configured like the one in the wild
> with a 842v3
> (similar to Tplink-841 but with 8Mb Flash, i have difficulties to build
> lede on the 841 - it is posible but extreme tricky, so for now i needed
> a PoC of wireguard with gretap to use batman-adv routing protocol)
> 
> results are, with nearby all the packages we use in the wild for our 350
> Node Meshnetwork.
> link only      - 32 Mbit
> on top wg0 - 26,7 Mbit
> on top gretap and batman-adv (v14) - 14,8 Mbit.
> 
> lede - gluon with Wireguard 0.0.161223 kernel 4.4.36
> 
> i described it a bit more in detail here (sorry only in german)
> https://forum.freifunk.net/t/erste-ernuechternde-lede-wireguard-gretap-ergebnisse-unter-livebedingungen/14057
> 
> so, just to let you know. thx and have some nice days
> Jens
> 
> -- 
> make the world nicer, please use PGP encryption
> 
> 
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
