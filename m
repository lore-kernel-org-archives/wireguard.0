Return-Path: <SRS0=uCSF=Z7=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F6FAC43603
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  9 Dec 2019 15:41:42 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8E7352073D
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  9 Dec 2019 15:41:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=permerror (0-bit key) header.d=fifthhorseman.net header.i=@fifthhorseman.net header.b="MTdZHY8c";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=fifthhorseman.net header.i=@fifthhorseman.net header.b="oDE6do84"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8E7352073D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=fifthhorseman.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 43fed6c0;
	Mon, 9 Dec 2019 15:41:40 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 01414cd5
 for <wireguard@lists.zx2c4.com>; Mon, 9 Dec 2019 15:41:38 +0000 (UTC)
Received: from che.mayfirst.org (che.mayfirst.org [162.247.75.118])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b76ec76a
 for <wireguard@lists.zx2c4.com>; Mon, 9 Dec 2019 15:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/simple; 
 d=fifthhorseman.net; i=@fifthhorseman.net; q=dns/txt; 
 s=2019; t=1575906096; h=from : to : subject : in-reply-to 
 : references : date : message-id : mime-version : 
 content-type : from; 
 bh=uVTWOPRRib8tzEm1sDpeKOF6ft0HmdCjJEMQTkwg9KE=; 
 b=MTdZHY8cIwUrRbNU0rwYZKYY34FwhLDqX8KC7j3WuXIAvKblDkkVM+Ch
 5v1a4CjSWQue2H7i6hqCokp5MfKZBQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fifthhorseman.net; 
 i=@fifthhorseman.net; q=dns/txt; s=2019rsa; t=1575906096; 
 h=from : to : subject : in-reply-to : references : date : 
 message-id : mime-version : content-type : from; 
 bh=uVTWOPRRib8tzEm1sDpeKOF6ft0HmdCjJEMQTkwg9KE=; 
 b=oDE6do84St3oxxuJei9jOyHskAmns+BGpQTGugSUdxHQm7pURRTkqwgO
 D4q4ITBd3f5txFN9+gUeVdwqO5MTKsyo5L20wtkq5WmJASh4SruVmDljO0
 FC0sa2D9hAUMJ/SBE0ISL9DZKr1eItkvs6bAx58zfNNA/fWz98DiKawLJ8
 /YL7pkOBaHkaVtz776UlFO/PuPEc+XvSGMTFZ+qOOfjRpE2ym5fCNB8jfY
 h8xCyfE6/8eAGXjm2z6Yz+NaKVBtppgtcD6Uroz5lMqRMd2wWjPAlRneyu
 4+1cbfsd56ngdIn4FUXamxLkfdCakG0RAZlItK2kpGT7xRQKfo2Usw==
Received: from fifthhorseman.net (unknown [38.109.115.130])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 by che.mayfirst.org (Postfix) with ESMTPSA id CC80AF9A6;
 Mon,  9 Dec 2019 10:41:36 -0500 (EST)
Received: by fifthhorseman.net (Postfix, from userid 1000)
 id 4F026204E3; Mon,  9 Dec 2019 10:34:47 -0500 (EST)
From: Daniel Kahn Gillmor <dkg@fifthhorseman.net>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [ANNOUNCE] WireGuard merged to net-next, on its way to Linux 5.6
In-Reply-To: <CAHmME9oRJqvMWF9rnSZejWe9J6ONUMbk108VkH1Qfy513Vp=dg@mail.gmail.com>
References: <CAHmME9oRJqvMWF9rnSZejWe9J6ONUMbk108VkH1Qfy513Vp=dg@mail.gmail.com>
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
Date: Mon, 09 Dec 2019 10:34:46 -0500
Message-ID: <87lfrlzf55.fsf@fifthhorseman.net>
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
Content-Type: multipart/mixed; boundary="===============2939716727066743590=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============2939716727066743590==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha256; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain

On Mon 2019-12-09 11:12:23 +0100, Jason A. Donenfeld wrote:
> I'm happy to announce that WireGuard has been merged into Dave
> Miller's net-next tree. That means when Linus Torvalds opens up his
> tree for Linux 5.6, Dave will send a pull request to Linus, and
> WireGuard will wind up in Linux 5.6.

Congratulations!  This is excellent news.

I know the path to this process is a long and winding one, and involves
lots of changes and compromises.  but i am really glad that this project
has stuck through it all.  The additional reach for the project (both in
terms of users and in terms of developer eyeballs) is huge.

Looking forward to thinking through what possibilities open up next
here...

    --dkg

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYIAB0WIQTJDm02IAobkioVCed2GBllKa5f+AUCXe5plwAKCRB2GBllKa5f
+CotAQDlsV8Un5Bk1sbK+g9OLwnPIQ9xEgSTIxj9+GMwATOAtAD+KKhCsVI2f6EG
RErnreMv84lBwMkqRq+Ufw0gcXiXmAY=
=00b4
-----END PGP SIGNATURE-----
--=-=-=--

--===============2939716727066743590==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============2939716727066743590==--
