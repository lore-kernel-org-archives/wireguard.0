Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7941FC072A2
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 18 Nov 2023 02:19:17 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 92d533f0;
	Sat, 18 Nov 2023 02:19:15 +0000 (UTC)
Received: from janet.servers.dxld.at (mail.servers.dxld.at
 [2001:678:4d8:200::1a57])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 2da2ae9b
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 18 Nov 2023 02:19:14 +0000 (UTC)
Received: janet.servers.dxld.at; Sat, 18 Nov 2023 03:19:06 +0100
Date: Sat, 18 Nov 2023 03:19:01 +0100
From: Daniel =?utf-8?Q?Gr=C3=B6ber?= <dxld@darkboxed.org>
To: Alexander Zubkov <green@qrator.net>
Cc: Maria Matejka <maria.matejka@nic.cz>, Juliusz Chroboczek <jch@irif.fr>,
 Kyle Rose <krose@krose.org>, bird-users@network.cz,
 babel-users@alioth-lists.debian.net, wireguard@lists.zx2c4.com
Subject: Re: [Babel-users] [RFC] Replace WireGuard AllowedIPs with IP route
 attribute
Message-ID: <20231118021901.47kzvwn4pup4vkmg@House.clients.dxld.at>
References: <20230819140218.5algu2nfmfostngh@House.clients.dxld.at>
 <4b-64e11f80-13-5e880900@8744214>
 <20230819212357.lkshcpslkgbeaq4e@House.clients.dxld.at>
 <CAJU8_nVR_ohTetKzHoxFH=dYccQg9HdniqV+JKk4LoJGorx0ZA@mail.gmail.com>
 <20230828160705.a5uxv5l2zknna7yj@House.clients.dxld.at>
 <87v8czqd3w.wl-jch@irif.fr>
 <20230828221312.fw5pvnt4x7p2c52k@House.clients.dxld.at>
 <804a0c0a-78df-7f4c-1d0d-213e8bdb4120@nic.cz>
 <CABr+u0YVm+rCDybpaJQdXW4GuRbOnRgELG33pWPAgOSrwc-YbA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="n75fzm6iqgeniyhs"
Content-Disposition: inline
In-Reply-To: <CABr+u0YVm+rCDybpaJQdXW4GuRbOnRgELG33pWPAgOSrwc-YbA@mail.gmail.com>
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.30rc1
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>


--n75fzm6iqgeniyhs
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Alexander,

On Thu, Nov 09, 2023 at 12:57:26PM +0100, Alexander Zubkov wrote:
> I heard recently about the lightweight tunnel infrastructure in Linux
> kernel (ip route ... encap ...). And I think this might be helpful in
> the context of this thread.

I hadn't seen that yet, thanks for pointing it out.

> Linux kernel allows already to add encapsulation parameters to the route
> entry in its table. So you do not need to create tunnel devices for
> that. And wireguard encapsulation and destination might be added there
> too.

Right, I think ultimately it's going to come down to either technical
constraints or in the absence of that, maintainer preference whether
via-wgpeer or "encap wg" is the way. The idea is very similar anyway.

> But as I understood the technology, it works only in one way (for
> outgoing packets) and the decapsulation should be processed separately,
> for example in case of VXLAN and MPLS they have their own tables.

That would be a problem as I specifically want to tie the source address
filtering to this too. I'll have a look at the internals (if and) when I
get around to starting work on this.

Thanks,
--Daniel

--n75fzm6iqgeniyhs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEV6G/FbT2+ZuJ7bKf05SBrh55rPcFAmVYHw0ACgkQ05SBrh55
rPdhVw//T+AkL0nbYRAOy+j/a9frmOdSjBmI/je5kJtiugRQ7QM3BBnFjn8qNbpS
Dfbe5sknrfGQC65AyChrUWQDh4EfQcQ8jOdj6bKWVLfbcv2KJdf++4Jf8tuQ/muT
xs/aQwQWqslH9q159N9FyvNSOFuynz51GBhYx1K/bm+MgV7ursnSHaarMF7VPt7M
SmiNJ34bU7HN6A8tjzlNFPbe+vj1J+rbFI4NZo3jMWV/rupgXJIA7+0fVz8cs0ek
YH0zJ0VpJsIZKaJapYwT/XzGQBmvOBwugJPklXeIs0cseKcUZkbDWUIlxWyUhY3+
2sPw+fWX9jeg7prPpF7JVzdgdXEGPUf6yXaN7hr5QrkSTttnoEP82SxaoltTLmdW
dA7315aY6+81a9QZ+qGWiDSx+VSHIl33JUDsKlSHlEXB8k+FTTws0nPKAGncqQG9
Ys9bAOQ3n8XiyyleZ1fugLD/TJ+m2e7UtwjIys3M9F14KlwEtkL8HRrfvBOiRh5c
2n9TgfxhhMMuO0pkXZGkUA6aJnl7GW84D0lxk6UiOMr2+X3ztP4WTlZ5rKAvwW0p
TxXo8KFexMSOmLRF5wFBua9Z5qrdlJVK6f7cM6NNd03OkplB16fHFpjUB3UkpW1I
H/3sXqaA6o9gvbsTSmQFE7KOHWG4QGx+a6RPJbx74Pjhj/NnFMw=
=8O+i
-----END PGP SIGNATURE-----

--n75fzm6iqgeniyhs--
