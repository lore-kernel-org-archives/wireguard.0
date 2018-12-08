Return-Path: <SRS0=tdjr=OT=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F9BFC07E85
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 10 Dec 2018 01:09:27 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A13722064D
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 10 Dec 2018 01:09:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A13722064D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=xand.uk
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 972047e2;
	Mon, 10 Dec 2018 01:00:48 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ce82dcc7
 for <wireguard@lists.zx2c4.com>; Sat, 8 Dec 2018 13:24:24 +0000 (UTC)
Received: from kronos.xand.uk (kronos.xand.uk [IPv6:2001:8b0:193:1::162])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 47ebfa59
 for <wireguard@lists.zx2c4.com>; Sat, 8 Dec 2018 13:24:23 +0000 (UTC)
Received: from rainbow.xand.uk ([2001:8b0:193:2::10])
 by kronos.xand.uk with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 (Exim 4.91) (envelope-from <xand@xand.uk>) id 1gVcis-00025X-Uj
 for wireguard@lists.zx2c4.com; Sat, 08 Dec 2018 13:32:46 +0000
To: wireguard@lists.zx2c4.com
References: <c430b4be-fc84-40c3-c9d2-5d5833d8ae89@attglobal.net>
Subject: Re: Should wg-quick with SaveConfig accumulate IPv6 link-local
 addresses
From: Xand <xand@xand.uk>
Openpgp: preference=signencrypt
Autocrypt: addr=xand@xand.uk; prefer-encrypt=mutual; keydata=
 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
Message-ID: <6a703cdc-13e4-4881-7bb5-072b0f576a3e@xand.uk>
Date: Sat, 8 Dec 2018 13:32:38 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <c430b4be-fc84-40c3-c9d2-5d5833d8ae89@attglobal.net>
X-Mailman-Approved-At: Mon, 10 Dec 2018 02:00:47 +0100
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
Content-Type: multipart/mixed; boundary="===============6856244228646279551=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============6856244228646279551==
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="gqcLviw7K0l5DIDdBOEQL2J132oBAuRWR"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--gqcLviw7K0l5DIDdBOEQL2J132oBAuRWR
Content-Type: multipart/mixed; boundary="XZJ4BhWgUBPPjJdaeHD2W93L9NBz5X3pV";
 protected-headers="v1"
From: Xand <xand@xand.uk>
To: wireguard@lists.zx2c4.com
Message-ID: <6a703cdc-13e4-4881-7bb5-072b0f576a3e@xand.uk>
Subject: Re: Should wg-quick with SaveConfig accumulate IPv6 link-local
 addresses
References: <c430b4be-fc84-40c3-c9d2-5d5833d8ae89@attglobal.net>
In-Reply-To: <c430b4be-fc84-40c3-c9d2-5d5833d8ae89@attglobal.net>

--XZJ4BhWgUBPPjJdaeHD2W93L9NBz5X3pV
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US

I'm running Wireguard on a number of Debian 9 and CentOS 7.6 VMs. On the
CentOS VMs I experience the same issue as
https://lists.zx2c4.com/pipermail/wireguard/2018-July/003134.html. I'm
using wireguard-dkms and wireguard-tools from
https://copr-be.cloud.fedoraproject.org/results/jdoss/wireguard/ and
using the wg-quick service.

I do *not* have NetworkManager installed.

Each time wg0 comes up, a different IPv6 link-local address is added to
it. With SaveConfig set to true, these accumulate indefinitely.

Using identical configuration on the Debian 9 VMs, I don't ever get any
link-local addresses assigned to wg0.

Xand




--XZJ4BhWgUBPPjJdaeHD2W93L9NBz5X3pV--

--gqcLviw7K0l5DIDdBOEQL2J132oBAuRWR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEVy5ZREGPoYoDU9vApTw/wGTQewcFAlwLx/4ACgkQpTw/wGTQ
ewdtZhAA05yerPBUT6FGl+q7cN/C8a8M17DjBe4s1bQgh+rQhIXS280IfEfPkFaO
EY18Y+HX3SX/adXBDDDb9KzmiuppmSWG/NDE/OVp2ZsPGpazSWHyih6vL4fGxOs8
y/jGSb/WxJmVpqnnUzWU/OVwDOaABxkaILDq7Pt1rP8J1ba+jtFv5PMJ7kgWV/F5
g4pJFwjrrAx8tybrH7/HRlNx5E5+LIARKpsgzBaxu8SkJe/fVd56giBzc6Vgh8un
2RpNmwdIZg7r/lpo5MgqzcVP0E+JWX4axrKVkgmzmuQnf3N4UcTyzh/VdL8dbYiw
hhjFX+mBOEFH9aUhG7jWpuoR/6/V4EyX0ma4cT7lcDML3AfycGmzc86CY3UTD2eZ
4HT0Lg1Lo/qbj2FS4yS4mvfo9YFsmcbxmVga8yGZs+hG3TC+pNPVQafonwgCiB0y
E9KTL73on4Xn72FAHnJYiLlUnKRgmbU0yMgl9THI8sq0Zt9sBfTBURz27VUb9s2i
cS+Vi+KCvBIatnFxWx354Ud5ekZFKG6PU+Kxab4lt4MPfHxGRO3V8zZKGWxGyhNp
olW6YTtOgGX1w1qLo3l3lsBMXU0o3q3QXY6KPr06V+d8sZpA6QDt6ZpMh1nphdvO
1A3NZGJAv2ngswoNyULQdC6CwuJfX6eajHPgxeUujVCTSszOn/w=
=6RCn
-----END PGP SIGNATURE-----

--gqcLviw7K0l5DIDdBOEQL2J132oBAuRWR--

--===============6856244228646279551==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============6856244228646279551==--
