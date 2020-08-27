Return-Path: <SRS0=D3OD=CF=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MSGID_RANDY,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2655C433DF
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 27 Aug 2020 08:27:02 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E2C822B47
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 27 Aug 2020 08:27:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="L45WfZmF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1E2C822B47
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 94c190da;
	Thu, 27 Aug 2020 07:59:27 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 736705b9
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 27 Aug 2020 07:59:24 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f2097e4b
 for <wireguard@lists.zx2c4.com>;
 Thu, 27 Aug 2020 07:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=date:to:from
 :subject:mime-version:content-type; s=mail; bh=ycWI/N+khNgq/zWQ/
 uS+P5hDg2A=; b=L45WfZmFE8lb7rep6PizL2yyUj1INT50FtryCi6xCkEeKywRB
 LJhhQxgJyjlsIzpoKDYkhGGx1+OT21sJFdurOnmqjyL9Su5MmBerrtmqya4dwmmJ
 9SDz+aOpsubvTpOe0SIb+xOXeQypNSi2mt6BjB3l+JX8M8rtS7jGnWljpl8HcKUD
 Khj0PhN4AFyAPs1dQe6o4dF+P7NUFtFUySAT1WpHqG9FlzpcBkPvzsEnByOTR37u
 EgKtadi9zuc5VAVPuIMUSkowVixDqrpYzWvsC3JJnY6ULqDeYNN3r9SX+MCdD33e
 4ihv4Yniya/FrU26aabQyy5p7BfbwN8rbir0Q==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 58f74923
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 27 Aug 2020 07:59:23 +0000 (UTC)
Date: Thu, 27 Aug 2020 10:26:37 +0200
To: "WireGuard mailing list" <wireguard@lists.zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [ANNOUNCE] wireguard-tools v1.0.20200827 released 
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Message-ID: <9dfad326d538b8c1@mail.zx2c4.com>
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

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hello,

A new version, v1.0.20200827, of wireguard-tools has been tagged in the git
repository, containing various required userspace utilities, such as the
wg(8) and wg-quick(8) commands and documentation.

== Changes ==

  * wg-quick: android: use iproute2 to bring up interface instead of ndc
  
  Android 11's ndc regresses even more, but it turns out that netd doesn't
  need to track up/down state via direct invocation, so just set the
  interface up by way of normal iproute2.
  
  * Revert "wg-quick: wait on process substitutions"
  
  The real reason for this small release. This reverts a commit from the last
  release, which means the old problem comes back. That's an issue. But waiting
  on process substitutions is not available with commonly used bash versions:
  
    # wg-quick up demo
    [#] ip link add demo type wireguard
    [#] wg setconf demo /dev/fd/63
    /usr/bin/wg-quick: line 251: wait: pid 2955 is not a child of this shell
    [#] ip link delete dev demo
  
  This means we have to wait a few years before fixing this issue. IOW, it's a
  bash limitation that we can't fix right now. But maybe someone on this list
  has some nice ideas of other potential fixes. I'd be interested in hearing
  ideas.
  

This release contains commits from: Jason A. Donenfeld.

As always, the source is available at https://git.zx2c4.com/wireguard-tools/ and
information about the project is available at https://www.wireguard.com/ .

This release is available in compressed tarball form here:
  https://git.zx2c4.com/wireguard-tools/snapshot/wireguard-tools-1.0.20200827.tar.xz
  SHA2-256: 51bc85e33a5b3cf353786ae64b0f1216d7a871447f058b6137f793eb0f53b7fd

A PGP signature of that file decompressed is available here:
  https://git.zx2c4.com/wireguard-tools/snapshot/wireguard-tools-1.0.20200827.tar.asc
  Signing key: AB9942E6D4A4CFC3412620A749FC7012A5DE03AE
  Remember to unxz the tarball before verifying the signature.

If you're a package maintainer, please bump your package version. If you're a
user, the WireGuard team welcomes any and all feedback on this latest version.

Finally, WireGuard development thrives on donations. By popular demand, we
have a webpage for this: https://www.wireguard.com/donations/

Thank you,
Jason Donenfeld


-----BEGIN PGP SIGNATURE-----

iQJDBAEBCAAuFiEEq5lC5tSkz8NBJiCnSfxwEqXeA64FAl9HbjIQHGphc29uQHp4
MmM0LmNvbQAKCRBJ/HASpd4DrqjWD/jKutC3MPQubBWEyOA5nc+e621b+6ziTL0a
jspFfYVUgaPFdQOhvxRzf4EI32lS+GjNwCpfgXexivkFRsPcDezGYz+WHdzm7SyC
Ap5cY7ftb6C2W7b49wVBF2pvBiVTG8thX0VRuYU4j+Hat+uQVw2rqEOZPK6H1qlM
uBx4HB0rCEM+i7cMJ4FGh/oPMSAJxMPhnSBfoDqSbW/ZBCSpAEWMUfQhdhKO+g03
kTNAHNk6SLkQagimFa8thwCQf3mZjtC+FCn+HBucFcYGLhAuKVAIF5tdbnI317tK
nXqSqxn74bar2yNTffMn6cmY3sjKNuH/WHz68M8mEgsxhgMaAmNTCBTAR+TmEL35
Ckr9mZcGUr+5VqUgYtcfZLY5VFHlzjnyZZljzAxeR/5jLWHTFlH7IKSQeQLAefw8
to0osdw9hg0iIx4ErpdxFEzbP9MWtposaSksiMfuIyHhdWM3PEv7yO2YbuHTwEbm
at8oqpDEdCQSWugU8gH7Tu3l9WV9/fEWrwCHnIZcI9QnhwcRlo1HXi1kY9noxD/D
lGIfZW32mOpuEW2NGeJ97zEV9AAnrsaYBOpKMxF4iR2WE7OI8XO6AZwrD25IrREx
wvwFXNUmJSF7Wi6ut9zD9xEBmYuHXZgoLFV3xTC6XhyN2qQDaOdhLnWx0c5PyoFG
Mf/CN6x+
=3+Ka
-----END PGP SIGNATURE-----
