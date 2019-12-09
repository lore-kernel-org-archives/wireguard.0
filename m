Return-Path: <SRS0=uCSF=Z7=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18968C43603
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  9 Dec 2019 16:03:33 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B1F152077B
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  9 Dec 2019 16:03:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=permerror (0-bit key) header.d=fifthhorseman.net header.i=@fifthhorseman.net header.b="QuVyM32g";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=fifthhorseman.net header.i=@fifthhorseman.net header.b="xZYL4RS+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B1F152077B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=fifthhorseman.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4924471f;
	Mon, 9 Dec 2019 16:02:10 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4889e7ba
 for <wireguard@lists.zx2c4.com>; Mon, 9 Dec 2019 16:02:09 +0000 (UTC)
Received: from che.mayfirst.org (che.mayfirst.org [162.247.75.118])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 42bfbe66
 for <wireguard@lists.zx2c4.com>; Mon, 9 Dec 2019 16:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/simple; 
 d=fifthhorseman.net; i=@fifthhorseman.net; q=dns/txt; 
 s=2019; t=1575907323; h=from : to : subject : in-reply-to 
 : references : date : message-id : mime-version : 
 content-type : from; 
 bh=lY3W/UUxjOQ24Wq/mbGva0SMUdbbiMLUA2/EaxhQtxk=; 
 b=QuVyM32geWZ18uGqrXXFQMyFKq972S4dE2DO4En4QVp7dc6WUyCaB+29
 no+NVnGZTjMXchLAgDYt/kUTtA0sCg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fifthhorseman.net; 
 i=@fifthhorseman.net; q=dns/txt; s=2019rsa; t=1575907323; 
 h=from : to : subject : in-reply-to : references : date : 
 message-id : mime-version : content-type : from; 
 bh=lY3W/UUxjOQ24Wq/mbGva0SMUdbbiMLUA2/EaxhQtxk=; 
 b=xZYL4RS+7nYbJPgqqXv0CU4Totw4TLYAQBunmb/nDLsvTBqfMJShcAmc
 W/svfdSk+BDrQBQau1E5MNvAvHZicOoTfPhXOPjTsCVT0LXj/ypDf1IIXi
 7024gxYuCIDCvi9hoisHSPmhgwco7FWEaCNcFBCcHHrFskm3GB22eGo7bc
 6cyIr2a1Vtxmrz6QjoOWhM/kfeLwYWUd65K2QuScg2yg/HGf39tHqr1Flv
 9MDxysBQAa5bztSs4aBgOjg0if41FOp+3/5LQzmttSKLQadfPVapdLBeub
 PO1w0LncoE5FbORRW0YsAPWtWWM51Rw8+JLZ5ggkObBV9xp0sCB1Ag==
Received: from fifthhorseman.net (unknown [38.109.115.130])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by che.mayfirst.org (Postfix) with ESMTPSA id 4E470F9A5;
 Mon,  9 Dec 2019 11:02:03 -0500 (EST)
Received: by fifthhorseman.net (Postfix, from userid 1000)
 id D61872046E; Mon,  9 Dec 2019 10:51:08 -0500 (EST)
From: Daniel Kahn Gillmor <dkg@fifthhorseman.net>
To: =?utf-8?Q?J=C3=B6rg?= Thalheim <joerg@thalheim.io>,
 wireguard@lists.zx2c4.com
Subject: Re: wg-quick nft instead of iptables
In-Reply-To: <87zhg3ymwi.fsf@thalheim.io>
References: <20191203165130.52f438ba@schienar> <87zhg3ymwi.fsf@thalheim.io>
Autocrypt: addr=dkg@fifthhorseman.net; prefer-encrypt=mutual; keydata=
 mDMEXEK/AhYJKwYBBAHaRw8BAQdAr/gSROcn+6m8ijTN0DV9AahoHGafy52RRkhCZVwxhEe0K0Rh
 bmllbCBLYWhuIEdpbGxtb3IgPGRrZ0BmaWZ0aGhvcnNlbWFuLm5ldD6ImQQTFggAQQIbAQUJA8Jn
 AAULCQgHAgYVCgkICwIEFgIDAQIeAQIXgBYhBMS8Lds4zOlkhevpwvIGkReQOOXGBQJcQsbzAhkB
 AAoJEPIGkReQOOXG4fkBAO1joRxqAZY57PjdzGieXLpluk9RkWa3ufkt3YUVEpH/AP9c+pgIxtyW
 +FwMQRjlqljuj8amdN4zuEqaCy4hhz/1DbgzBFxCv4sWCSsGAQQB2kcPAQEHQERSZxSPmgtdw6nN
 u7uxY7bzb9TnPrGAOp9kClBLRwGfiPUEGBYIACYWIQTEvC3bOMzpZIXr6cLyBpEXkDjlxgUCXEK/
 iwIbAgUJAeEzgACBCRDyBpEXkDjlxnYgBBkWCAAdFiEEyQ5tNiAKG5IqFQnndhgZZSmuX/gFAlxC
 v4sACgkQdhgZZSmuX/iVWgD/fCU4ONzgy8w8UCHGmrmIZfDvdhg512NIBfx+Mz9ls5kA/Rq97vz4
 z48MFuBdCuu0W/fVqVjnY7LN5n+CQJwGC0MIA7QA/RyY7Sz2gFIOcrns0RpoHr+3WI+won3xCD8+
 sVXSHZvCAP98HCjDnw/b0lGuCR7coTXKLIM44/LFWgXAdZjm1wjODbg4BFxCv50SCisGAQQBl1UB
 BQEBB0BG4iXnHX/fs35NWKMWQTQoRI7oiAUt0wJHFFJbomxXbAMBCAeIfgQYFggAJhYhBMS8Lds4
 zOlkhevpwvIGkReQOOXGBQJcQr+dAhsMBQkB4TOAAAoJEPIGkReQOOXGe/cBAPlek5d9xzcXUn/D
 kY6jKmxe26CTws3ZkbK6Aa5Ey/qKAP0VuPQSCRxA7RKfcB/XrEphfUFkraL06Xn/xGwJ+D0hCw==
Date: Mon, 09 Dec 2019 10:51:08 -0500
Message-ID: <87immpzedv.fsf@fifthhorseman.net>
MIME-Version: 1.0
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
Content-Type: multipart/mixed; boundary="===============7607459673025668657=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============7607459673025668657==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha256; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Sun 2019-12-08 13:20:13 +0000, J=C3=B6rg Thalheim wrote:
> Have you tried if iptables-nftables-compat (might have different names,
> depending distribution) works for the rules used in wg-quick?
> Its a wrapper that translate iptables rules to nft transparently
> by providing a iptables executable.

fwiw, i'd rather see wg-quick be capable of working with whichever
executable is installed, rather than expecting someone who uses wg-quick
to also have the iptables translation layer installed.

   --dkg

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYIAB0WIQTJDm02IAobkioVCed2GBllKa5f+AUCXe5tbAAKCRB2GBllKa5f
+FZ2AQDm+M1hRnjFydkL5aAdF4cRZM1+vt+r1uYXOApqmfYGcwEAkMfKDI4GgVcY
KaFVSILSoWjyk9Hx8th9OW0CJV9T8wg=
=4tOc
-----END PGP SIGNATURE-----
--=-=-=--

--===============7607459673025668657==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============7607459673025668657==--
