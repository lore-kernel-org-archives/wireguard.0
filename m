Return-Path: <SRS0=a6UP=IR=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F651C433DB
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 19 Mar 2021 18:56:51 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 823176194C
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 19 Mar 2021 18:56:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 823176194C
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1b711260;
	Fri, 19 Mar 2021 18:56:48 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [104.131.123.232])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 677e4bea
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 19 Mar 2021 18:56:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1616180196;
 h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type;
 bh=CQsRichAwOOxZaeBVKwwSIaDkr/TJyBlM/eRyKKwh9k=;
 b=d2QK43sZ5iejjCzT26lTDOn+AKj5L+Ea994wZqhISM2QjjHjtfYryZRNJ3ujrI0kyFu5YQ
 mWQKSfhzrv4PzVbsFfqKZ5fhGqVkQ5rSAXU05+nkWFPTBdFuWdynWIEQBiCuM+oWOgXiLh
 6Bhgi6EZ1hVLRhU5SKlJkpS8fUMC0dU=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 86ede209
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 19 Mar 2021 18:56:35 +0000 (UTC)
Date: Fri, 19 Mar 2021 12:56:34 -0600
To: "WireGuard mailing list" <wireguard@lists.zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [ANNOUNCE] wireguard-freebsd snapshot v0.0.20210319 is available
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Mailman-Approved-At: Fri, 19 Mar 2021 18:56:47 +0000
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
Message-ID: <2012433327a6e21c@lists.zx2c4.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hi,

An experimental snapshot, v0.0.20210319, of WireGuard for FreeBSD has been
been tagged in the git repository.

At this time this code is new, unvetted, possibly buggy, and should be
considered "experimental". It might contain security issues. We gladly
welcome your testing and bug reports, but do keep in mind that this code
is new, so some caution should be exercised at the moment for using it
in mission critical environments.

== Changes ==

  * if_wg: use our own taskqgroup
  
  This removes the dependency on iflib entirely.
  
  * compat: backport to FreeBSD 12.2
  * compat: backport to FreeBSD 12.1
  * compat: backport properly to 13
  * if_wg: cleanup timeout_t usage
  
  This is now running on 13.0 RC3, 12.2, 12.1.
  
  * if_wg: fix malloc overflows
  
  These should have been fixed during our initial pass but somehow
  weren't. Good thing we have more time to work on this.
  
  * if_wg: dispatch packets using netisr
  * if_wg: mark as point to point
  
  These fix up some network particulars that bring the inbound packet flow a bit
  more inline with what other drivers, like GRE or tuntap do. In particular, it
  should now be possible to listen on incoming TCP sockets.

The source repository is available at the usual location:
  git clone https://git.zx2c4.com/wireguard-freebsd

This snapshot is available in compressed tarball form:
  https://git.zx2c4.com/wireguard-freebsd/snapshot/wireguard-freebsd-0.0.20210319.tar.xz
  SHA2-256: 96836d90a8daad863ccd9503e3bad4ca6c4c25df4892fc1e55b7a8f7b03afbcd

Thank you,
Jason Donenfeld


-----BEGIN PGP SIGNATURE-----

iQJEBAEBCAAuFiEEq5lC5tSkz8NBJiCnSfxwEqXeA64FAmBU84AQHGphc29uQHp4
MmM0LmNvbQAKCRBJ/HASpd4Drvt3EAC9ZMmkCeePRV6m4cTxnGYzCsaaqhXBgMKP
qqsB/YMe6d7gWgDSARBW+49Nql1EG+V1mYP8+Cn3hBbCNE76vR+EuDs8d7xA/lqE
2KA44gX8GTbfZJHRCtPsh/la96OARXPPT4OPyc86mY1GlJc3Xg5KxV24PH4QFqEA
AFnEvE91/lc+aZxkhuZ2mLYhz9eHwdEIHUfGm4cK8D6UM1Jvt8q3I8TOYA+WTbTD
30sQz4ymMtfE89gH+ExCRpE5qrRxMm9AFP4N2A5CNf3tGLf3ptXW2prLo2u+UymP
GSugEDHbyGjx7APtYCEv5uqfGBRpiv/lnmC5iv3Z1V8GMKqB4kPcxPJwQEvwOVhr
Of7CefHdpyuMHr3jWH+dMc4ZWNvKhJ42wZbb/A+yojM4t3ZyEBirlYHJ0Ieb/8IY
ZAvXEI16L4pIikcWbOR0u+faE4+YtO1F2H3eTxXEuyPCcMnPN7iatqXvwuPNjx/w
/KaXtPXdi5gNIWLjohNx0nO/guC/hz7JiIs6A9N+0JjmyzElKwzDou4+Us99QNyh
iwGi0OJmuSE1nEOZ4H9lwGx1CJlEB2aflVpqe8VBEFn1XpotQT42e84UpqHAAM7p
L97KJkNFJcQpQIG29C2nu8cGKqvM2MguNwTjSUBYy3Q/eZqWwyxE3GFwbvcMMc1n
Vs6DlYtxWA==
=4RS0
-----END PGP SIGNATURE-----
