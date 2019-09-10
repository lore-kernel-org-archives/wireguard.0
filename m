Return-Path: <SRS0=/FJx=XG=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=3.0 tests=DATE_IN_PAST_12_24,
	DKIM_INVALID,DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B509C49ED6
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 11 Sep 2019 12:57:05 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B67B5206A1
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 11 Sep 2019 12:57:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=permerror (0-bit key) header.d=fifthhorseman.net header.i=@fifthhorseman.net header.b="r1TVa/tS";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=fifthhorseman.net header.i=@fifthhorseman.net header.b="q0D5S2ef"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B67B5206A1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=fifthhorseman.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2d7a68d9;
	Wed, 11 Sep 2019 12:56:47 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fe8c83c3
 for <wireguard@lists.zx2c4.com>;
 Wed, 11 Sep 2019 12:56:45 +0000 (UTC)
Received: from che.mayfirst.org (che.mayfirst.org [162.247.75.118])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f194132c
 for <wireguard@lists.zx2c4.com>;
 Wed, 11 Sep 2019 12:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/simple; 
 d=fifthhorseman.net; i=@fifthhorseman.net; q=dns/txt; 
 s=2019; t=1568206604; h=from : to : cc : subject : 
 in-reply-to : references : date : message-id : 
 mime-version : content-type : from; 
 bh=DaUk4Pz60WSnRZFfv1DioF4nJCFF1806w8GVd7yojTg=; 
 b=r1TVa/tSbyaTngX88JmXUPX6t2tt+kQE48mmKHw0quqI3M9gDagyWi+a
 6xIqXIjkJAccHr7VLVjWrDT+WqtGAw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fifthhorseman.net; 
 i=@fifthhorseman.net; q=dns/txt; s=2019rsa; t=1568206604; 
 h=from : to : cc : subject : in-reply-to : references : 
 date : message-id : mime-version : content-type : from; 
 bh=DaUk4Pz60WSnRZFfv1DioF4nJCFF1806w8GVd7yojTg=; 
 b=q0D5S2efcb2fVwoqOHsA3ig5hThA8thTSki2r9weHi1XYHMXy4eexvzm
 8o7YBaEo3ieDvUHmbbBeyOcV07UdMfAm0KxP/cqRCBIyH+t2yupTFcsVju
 aPWew+55hL/zSl+KaksJK5p+WNcz13xLe/Q6GwAcVxgbZLE6T2EJ3T8yRv
 Zq1qPVjkeMH4zQkJ9tNjsffJdHw6w16UFkpF3SBmlcHVf+hcruA3PwQAXr
 pqakwNHa27LuN6kkMWsMMWfSLxA+2aqUQgdxc0eK56qTcIwrrH+6OFfa/x
 72dwS8o7UGGJbidaDO4nD/JLIp9e/8FLScQXc78Y1aIAUIRjbMdbbQ==
Received: from fifthhorseman.net (unknown [38.109.115.130])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by che.mayfirst.org (Postfix) with ESMTPSA id DE9D9F9A5;
 Wed, 11 Sep 2019 08:56:43 -0400 (EDT)
Received: by fifthhorseman.net (Postfix, from userid 1000)
 id E5036203AF; Tue, 10 Sep 2019 17:12:01 -0400 (EDT)
From: Daniel Kahn Gillmor <dkg@fifthhorseman.net>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: wg-quick invoking resolvectl instead of resolvconf on systems
 where that is appropriate?
In-Reply-To: <CAHmME9rkuwVHo1Egq9r0vtOdR5yJ0xes3_WEWb3ncVnPhXwbmQ@mail.gmail.com>
References: <87zhjc3rzr.fsf@fifthhorseman.net>
 <CAHmME9rkuwVHo1Egq9r0vtOdR5yJ0xes3_WEWb3ncVnPhXwbmQ@mail.gmail.com>
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
Date: Tue, 10 Sep 2019 17:12:01 -0400
Message-ID: <87o8zr500u.fsf@fifthhorseman.net>
MIME-Version: 1.0
Cc: Willem van den Akker <wvdakker@wilsoft.nl>,
 Michael Biebl <biebl@debian.org>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
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
Content-Type: multipart/mixed; boundary="===============5245358445875616406=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============5245358445875616406==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain

On Tue 2019-09-10 14:52:32 -0400, Jason A. Donenfeld wrote:
> The standard interface for modifying DNS on Linux is resolvconf. It is for
> this reason that systemd added the compatibility layer. Debian should
> install the proper symlink. WireGuard upstream will support the standard
> mechanism of resolvconf.

OK, that answers that :)

I suspect there are more GNU/Linux systems in the world right now that
have resolvectl installed than have all versions of resolvconf installed
put together, but if you'd rather that wg-quick depends on the
interpretation of the resolvconf interface on the given system, that
works for me.

I'm sure you understand that debian can't ship the resolvconf symlink
directly in the systemd package because it would conflict with the
resolvconf and openresolv packages; but i'll follow up over in
https://bugs.debian.org/939904 to see if we can figure out a way to ship
a separate binary package from the same source that automatically
enables this support.

thanks for the prompt followup,

           --dkg

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQTJDm02IAobkioVCed2GBllKa5f+AUCXXgRoQAKCRB2GBllKa5f
+PeVAP45oag9uLZ217hX8Wv+/mRVM1iCJZZs/kMS6mtQhVE5WwEA7aodhbn659zp
eZwIAQFw6z10ki9sIjm2J8Qms9hL+QQ=
=crbO
-----END PGP SIGNATURE-----
--=-=-=--

--===============5245358445875616406==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============5245358445875616406==--
