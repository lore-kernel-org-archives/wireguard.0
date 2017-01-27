Return-Path: mail@danrl.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4193c5a2
 for <wireguard@lists.zx2c4.com>;
 Fri, 27 Jan 2017 17:10:36 +0000 (UTC)
Received: from mx.cakelie.net (mx.cakelie.net [45.76.39.236])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8a092bdf
 for <wireguard@lists.zx2c4.com>;
 Fri, 27 Jan 2017 17:10:35 +0000 (UTC)
Received: from p20030086461cb0f5a19a6db176a8911e.dip0.t-ipconnect.de
 (p20030086461CB0F5A19A6DB176A8911E.dip0.t-ipconnect.de
 [IPv6:2003:86:461c:b0f5:a19a:6db1:76a8:911e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mx.cakelie.net (Postfix) with ESMTPSA id 2DEC9BE853
 for <wireguard@lists.zx2c4.com>; Fri, 27 Jan 2017 18:22:31 +0100 (CET)
From: =?utf-8?Q?Dan_L=C3=BCdtke?= <mail@danrl.com>
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 10.2 \(3259\))
Subject: Re: [Low priority feature request] Color output of `wg show`
Date: Fri, 27 Jan 2017 18:22:26 +0100
References: <72A0A3E7-999E-4AAD-8D9B-6B18F6CA8513@danrl.com>
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
In-Reply-To: <72A0A3E7-999E-4AAD-8D9B-6B18F6CA8513@danrl.com>
Message-Id: <D809357E-14DB-4180-A77F-EE219CE18A47@danrl.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

>=20
> On 27 Jan 2017, at 18:07, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>=20
> This is controlled by an env var, which is auto by default. Grep the =
wg man page for COLOR.

For the record, this does the trick:

watch --color WG_COLOR_MODE=3Dalways wg show

Cheers,

Dan=
