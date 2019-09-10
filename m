Return-Path: <SRS0=xahJ=XF=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7D35C49ED7
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 10 Sep 2019 18:51:13 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 09D7B2084D
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 10 Sep 2019 18:51:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=permerror (0-bit key) header.d=fifthhorseman.net header.i=@fifthhorseman.net header.b="kzEmD38w";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=fifthhorseman.net header.i=@fifthhorseman.net header.b="koaljniE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 09D7B2084D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=fifthhorseman.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 16ae7480;
	Tue, 10 Sep 2019 18:50:55 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3ea69560
 for <wireguard@lists.zx2c4.com>;
 Tue, 10 Sep 2019 18:50:53 +0000 (UTC)
Received: from che.mayfirst.org (che.mayfirst.org [IPv6:2001:470:1:116::7])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 01705ab4
 for <wireguard@lists.zx2c4.com>;
 Tue, 10 Sep 2019 18:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/simple; 
 d=fifthhorseman.net; i=@fifthhorseman.net; q=dns/txt; 
 s=2019; t=1568141452; h=from : to : cc : subject : date : 
 message-id : mime-version : content-type : from; 
 bh=I17pNm0PQYMnvxc7jv2tNS1P3+XyTD9/976KrYAvpyo=; 
 b=kzEmD38wKt/zYm0+HmXfyk+vaiOoRMs8Ap4SJo87Zn3IxDz5QMWi2rnr
 PPEvDqp2CnhCRLbX4r+ndcvlPVWtAA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fifthhorseman.net; 
 i=@fifthhorseman.net; q=dns/txt; s=2019rsa; t=1568141452; 
 h=from : to : cc : subject : date : message-id : 
 mime-version : content-type : from; 
 bh=I17pNm0PQYMnvxc7jv2tNS1P3+XyTD9/976KrYAvpyo=; 
 b=koaljniEmP38sMhNMUSDZ/b9qHZPFh43WuefXbtfd25Ok9we0k+CnK69
 oCuxBlKGZaZglFQGz4ov0Iutz3kUr1re24s7oILP4XMdbsnjTM6vBWkYkw
 GQztjVMJNxwn/D7dD7kHqcuCO5cE9qdmtSroDfcsVhFPTWfcGSeT55Y7YO
 KopuxXof45icInOctX0yQm5bY3Okl8Z9PUsDXe9fANeC0vzZvrWRnDo2jJ
 hBr/O+UwXU7EFQF+dnOSx4flrK2I93VSA1GbtI3BuG38Ndj9rSsg0QtIrV
 aXY/4OQnXQFSmHjoqrJEwj3WMWCIOCeCiIc9m1YEzXIZQXbzHcXhKQ==
Received: from fifthhorseman.net (unknown [38.109.115.130])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 by che.mayfirst.org (Postfix) with ESMTPSA id 9CF1BF9A5;
 Tue, 10 Sep 2019 14:50:52 -0400 (EDT)
Received: by fifthhorseman.net (Postfix, from userid 1000)
 id 4BEC1203AF; Tue, 10 Sep 2019 14:50:49 -0400 (EDT)
From: Daniel Kahn Gillmor <dkg@fifthhorseman.net>
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: wg-quick invoking resolvectl instead of resolvconf on systems where
 that is appropriate?
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
Date: Tue, 10 Sep 2019 14:50:48 -0400
Message-ID: <87zhjc3rzr.fsf@fifthhorseman.net>
MIME-Version: 1.0
Cc: Willem van den Akker <wvdakker@wilsoft.nl>,
 Michael Biebl <biebl@debian.org>
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
Content-Type: multipart/mixed; boundary="===============0573139304316168653=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============0573139304316168653==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain

Hi Wireguard folks--

over in https://bugs.debian.org/939904, Michael Biebl (in cc) pointed
out that on GNU/Linux systems supervised by systemd, if systemd-resolved
is running, it might make more sense for wg-quick to invoke resolvectl
directly with the DNS parameter instead of depending on resolvectl's
resolvconf-like symlink shim.

Jason, is that something that you'd be ok with, or is wg-quick wedded to
resolvconf, even if resolvectl is available and there is no resolvconf?
(and if you're ok with it, but if both exist, do you have a preference
for which one should be used?)

Is anyone interested in hacking on src/tools/wg-quick/linux.bash to
enable this?  I think the command should be pretty simple -- the main
things to get right are detection of subsystem availability and conflict
resolution.

I guess my preference would be something like:

 * if resolvectl exists, try to use it.  if it succeeds, done.  (it
   might fail if systemd-resolved is not running, for example)

 * otherwise, try using resolvconf.

but of course this is Jason's call to make.

       --dkg

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQTJDm02IAobkioVCed2GBllKa5f+AUCXXfwiAAKCRB2GBllKa5f
+H/qAQCr7fH3CJeqtVk9iY0cV7vAPt0I452+pHrMxExcfqSXGwD/bGrbv6pI0uh5
ATzquqCcigMQMMfCCgRUZ1TUpup9vgI=
=8O6A
-----END PGP SIGNATURE-----
--=-=-=--

--===============0573139304316168653==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============0573139304316168653==--
