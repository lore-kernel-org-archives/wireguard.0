Return-Path: <SRS0=KrVi=4C=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36432C35242
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 14 Feb 2020 23:38:59 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8D2822187F
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 14 Feb 2020 23:38:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (4096-bit key) header.d=venev.name header.i=@venev.name header.b="mKwph4MH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8D2822187F
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=venev.name
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 56796657;
	Fri, 14 Feb 2020 23:36:47 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id aab1f93e
 for <wireguard@lists.zx2c4.com>;
 Fri, 14 Feb 2020 23:36:46 +0000 (UTC)
Received: from mtel-bg02.venev.name (mtel-bg02.venev.name [77.70.28.44])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3d62584f
 for <wireguard@lists.zx2c4.com>;
 Fri, 14 Feb 2020 23:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=venev.name; 
 s=default;
 h=MIME-Version:Content-Type:References:In-Reply-To:Date:Cc:To:
 From:Subject:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bFJeZcbIdy2y76DyZ3CO/roGy6B6wj+T0mfjpwFJdOU=; b=mKwph4MH57QUZdr+A4Pje2fPuI
 1KVF0MbZ1qpETB/FDXun+XB8QoSVbyb6IXsWq8ubRnGVlWSpEsWs0Qt0CtemNduL54ypWOOEpWQq7
 2uGyGLOIf5qZexPyhAU96csrkIKoTtCoDR0xhAzaRVNYZ9kZ76na3q8M39bTyO2W6VxpWb5ZhZ0ZM
 l6h11LVTZfqG9bDEd6Pnz602EwvefQjyJGoavLpIkY9WLfQcrH0TyXEW7tHCkmkGaeurG5MgwQrNd
 PtxK6VhMOrj+wzWKOwiGh+XlS7FPxZzYt8bZmCwXi5t94TWjnMwdeoc8jKU10Wn4tpZgptDC0BPC6
 mN/pZMoPUVHO7VhvTjqGyenMMby0wK6BEAe3iQkvKK6alB86t9kBcZOSHNY13tmj/eqgKDPquEubS
 OB9msgCjomVQKbPcqC6KkL+9VQb0nHrs7TAy6OnjVkAlNuRVUjvv3nlA8HSdygTx1rlaM7o0/VwJj
 HX0gnLTiGx57Ea+3vlVXiEdXRsIEDs1KO+iPrYHcdwdWNo4tS9Ss34GN99SgU46QBebyZHoE6Hzxh
 Vh0dIQrauuM4QRMOKiXDxdmEVJGJqXm20S84QDrXBzEA5zZubRlBajX/wlIfe4O7kstrhD/u+mi74
 yyttEyvCc/31TTzJRxVm5ACSO7aPCTCF0BWW7ddhk=;
Received: from mtel-bg02.venev.name by mtel-bg02.venev.name with esmtpsa
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (envelope-from <hristo@venev.name>)
 id 1j2kXu-001tuh-6B; Fri, 14 Feb 2020 23:38:54 +0000
Message-ID: <a7607bbade0e788d6476717caa5806c233131e2f.camel@venev.name>
Subject: Re: [PATCH] Implement reading keys from stdin.
From: Hristo Venev <hristo@venev.name>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 14 Feb 2020 23:38:48 +0000
In-Reply-To: <CAHmME9prE9oe4DX7dH6=UpnbBSE8yk6WN5epWxw7UuD_w7a+pQ@mail.gmail.com>
References: <20200207200035.69579-1-hristo@venev.name>
 <CAHmME9owUFjKsW=oGWeziQk8rjPm4cMrArJQ=nDP8+793w5PsA@mail.gmail.com>
 <410e641d5f7398078e8b1ea47652f34618ac26ef.camel@venev.name>
 <CAHmME9prE9oe4DX7dH6=UpnbBSE8yk6WN5epWxw7UuD_w7a+pQ@mail.gmail.com>
User-Agent: Evolution 3.34.3 (3.34.3-1.fc31) 
MIME-Version: 1.0
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============5589028118665472587=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>


--===============5589028118665472587==
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-vR8zQpiHWUdzvBz5igF7"


--=-vR8zQpiHWUdzvBz5igF7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2020-02-14 at 12:17 +0100, Jason A. Donenfeld wrote:
> Except the command line arguments have length limits you'll hit
> anyway. Wouldn't the better way to do this be passing a config file
> to
> `wg setconf wg0 /dev/stdin`?

Yes, they would be better. However each command has slight
inefficiencies for my usecase:
 - `wg setconf` removes the endpoints of peers that don't have a static
endpoint address
 - `wg addconf` cannot remove peers
 - `wg syncconf` needs to be given the exact allowed IPs of all peers
it has to keep, not just the ones that have changed. It will also
remove all peers that were added manually by the user (and not by my
daemon).

For now I will either use `wg syncconf`, or maybe `wg addconf` +
multiple `wg set peer remove`.

I've been thinking, how stable is the IPC protocol? It might be nice to
have a tool/daemon/something that makes it possible to use the protocol
to configure devices that natively use netlink or OpenBSD ioctls.

--=-vR8zQpiHWUdzvBz5igF7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEWGQszEdDPeR3PQQhxqlBR4WW3HoFAl5HL4gACgkQxqlBR4WW
3HocOQ//bOXd5qtzoYcnpAuBkG2l1y+sNrPu2V6dZ6ydFQiN6m8XxmlxLrjHOLvC
3D1UGCgnBIjsdfgu0Yhb37MxxLzaDeWfMOJPs2KMGsXyAVSVnO+h9ZqTkbktA9dH
SsFR6ZQ3H6bMzPnyRilJFZ0FGqiuSIvcojYW1lOAOuWs6RTX0qzd5EOXJfoYqG+7
8LafAIYKrbokAgO2n2Yj45V6FkiO5+dz3q7UBhN9JkTr/IelvpWNj0dur9OYQs9B
3D1MAgYSWg4U8rvQJnThc7DTOPkK2vn6zIGQKdwhr4MPygodceWdG7MfGNSOUDdW
xMfcj24/k/KCAVIfyhU8V5OT3JhWCX3Po3nrcdPpDoS6Czd9+ylb2pPOpzQr6Rog
fzy/0fbgvv66QB7bUyHLt3Tb05+Ty6PzTF0RsZwW2dW9aVNaIR3r6Q6YKVTrxkm+
jzpXdGaV5C3D0uZqIDWxi9pNtHsMVSKQhyLyUsTBK3IFuEkxlkkDc/e8DXtZgc5b
TxzphSB4YrTCNILukclaYAaTg9hdQf7vKpha6azDx0eygYgdZ5AtwSutjI8a+VX4
Hoa8WcQgHIAZusAOBl2q8UqVNMnZ25xiuPiROajIeszMJzIqZdZpkuKo658GJ6G9
xEHdAsTtXVg9KF0tMXsU8ZaoRrkS6hGTGq7tKpXGzm0oDVTQftI=
=NwyX
-----END PGP SIGNATURE-----

--=-vR8zQpiHWUdzvBz5igF7--


--===============5589028118665472587==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============5589028118665472587==--

