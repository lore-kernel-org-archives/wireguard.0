Return-Path: <SRS0=FSGf=3N=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97226C35240
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 24 Jan 2020 00:04:07 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A6086206D3
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 24 Jan 2020 00:04:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=orlandi.com header.i=@orlandi.com header.b="Kr0YUDOf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A6086206D3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=orlandi.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c88d9861;
	Fri, 24 Jan 2020 00:03:39 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c888a1e3
 for <WireGuard@lists.zx2c4.com>;
 Fri, 24 Jan 2020 00:03:36 +0000 (UTC)
Received: from smtp-out1.orlandi.com (smtp-out1.orlandi.com [45.66.80.70])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2f043ff1
 for <WireGuard@lists.zx2c4.com>;
 Fri, 24 Jan 2020 00:03:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by submission.orlandi.com (Postfix) with ESMTP id ADA4E7F1
 for <WireGuard@lists.zx2c4.com>; Fri, 24 Jan 2020 01:03:35 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at submission.orlandi.com
Received: from submission.orlandi.com ([127.0.0.1])
 by localhost (submission.orlandi.com [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id puWHrd0hzowh for <WireGuard@lists.zx2c4.com>;
 Fri, 24 Jan 2020 01:03:34 +0100 (CET)
Received: from [IPv6:2a09:62c0:cafe:cafe::20] (unknown
 [IPv6:2a09:62c0:cafe:cafe::20])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: daniele@orlandi.com)
 by submission.orlandi.com (Postfix) with ESMTPSA id 867D85FC
 for <WireGuard@lists.zx2c4.com>; Fri, 24 Jan 2020 01:03:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=orlandi.com;
 s=default; t=1579824214;
 bh=uM0fQupIPaEzhws1x8XaT9PArjSUbxiVKDJUcZnAwb8=;
 h=To:From:Subject:Date:From;
 b=Kr0YUDOflU0qt14k07U4CxS1bYAzUoKrVJbCjFvx1MerYg0to5Sb/jEnEK8HYgTcs
 hxVNZnJPm6iUWlDhkXw5HLTBAUzoFuUI33DyWTBz/0DiHW7b7qEskfSqQYSRmO+jTK
 /hxFKSU+gfClW7wU+qkFRJzWcNdSNznoY+pjfHwY=
To: WireGuard@lists.zx2c4.com
From: Daniele Orlandi <daniele@orlandi.com>
Subject: Tunnel traffic in VRF
Autocrypt: addr=daniele@orlandi.com; prefer-encrypt=mutual; keydata=
 mQGiBD/EFXYRBADDw/+zgnfV8J3xCDi25MFrQyloPSTv7mul7Pkecf6Nqcs6gubNmXxxzLjE
 eFE9nrGVNqIUGB6P9/zVxbYc0SQ0RufpspbLEncIYq+w3N0PNK0BgekS3j1Gu2J2RugIY1qt
 IMPgkw4kzpGn2GAxRm4z2vaUEXM+phUpgs58IDh6ZwCgvDAwffcSdS6+ZnUERQlmknkBl+0D
 /385ciPfGO0FHzYXq9gW5Axp1nqTZrt37YyDe37p9kTsZK3SCgbTBmvmKae5+VinaGtQIS2A
 93WaDh7Fp/6lI6aU1bw9tCADrngf0K5+AC0UTDrPnDvSK4U2r13D2Cz7PDTbHywaKll0UdjK
 gN1Tj2F/WJC3xsDoSo01JOZOuj/BBACdG6ULqLRNP+jGj3+T6bZBD4Farcj6YREELNX1Ncnc
 xW1Tu/bAW7oFdOSkkHDL565RbYqPXcQ4DJ9+/7oY+R9kl48kvVOZAGBaFGeYu9QwE1ok6O2y
 EUWQXLVMKK2StKu5R5o1DdA/covyAflTOhFNTape1vjXJiVHNOqQpTvOorQtRGFuaWVsZSBP
 cmxhbmRpIChWaWhhaSkgPGRhbmllbGVAb3JsYW5kaS5jb20+iFsEExECABsFAj/EFXYGCwkI
 BwMCAxUCAwMWAgECHgECF4AACgkQYpgigMKc2eQeOQCfcIY87N0Y1Dl9MuYvk7Mio26VXrYA
 oIwa4mWMg0OUpxtBqDD7dY7MN1GzuQENBD/EFXYQBACRsZ5CSnNcqvQeN/Ukov7OiDn0kqmN
 lRzp4Hts00gg4zTBlw12VLDHO5vY1mQzKphYK88GI3gU2sF/bGsKEIEaNKNUMJEj2yg4Rr9N
 eQVajsc3E2wX5fvzNR//FpUXixROmTDMcbROvSVIbqwRYo/I24p/e/TxedsfdGdRsi5iawAD
 BQP/V5o0qKRIC5IUVGEWPITsUYAwjnWNv5NpGo1bTcxhM4gs5sORNegx1yzpQi6WCHXlRO7y
 bFxx2baNnR8ffDdk4NcF0L+hY4XXZqB0S7oz2MpXrdqlvsLDHEYqUgwWGuVt32t2qf+4iFl/
 B82GiYWiYGQPEyijECXDTZDFIH0xOy6IRgQYEQIABgUCP8QVdgAKCRBimCKAwpzZ5HmtAJ9D
 n3lLzgee5fJzyotyes6kL432LwCgtKWgYRt0Oe6JwURnXxhJ+Df0A4A=
Message-ID: <9420fa01-61b9-73cb-21f4-681bf8015b7b@orlandi.com>
Date: Fri, 24 Jan 2020 01:03:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
Content-Language: en-US
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>


Hello,

I'm attempting to route the WG tunnel traffic (not the inside traffic)
on a VRF.

I was able to use an ip rule + fwmark to route outgoing packets to the
proper VRF, however the incoming traffic *seems* to be rejected due to
the UDP socket not being bound to an interface in the VRF.

00:56:35.606766 IP 172.16.16.32.5180 > 45.66.80.144.5180: UDP, length 148
00:56:35.922547 IP 45.66.80.144.5180 > 172.16.16.32.5180: UDP, length 92
00:56:35.922680 IP 172.16.16.32 > 45.66.80.144: ICMP 172.16.16.32 udp
port 5180 unreachable, length 128


Is there any workaround you know of? Would you consider implementing
binding to an interface like other tunnel interfaces do?


(The infrastructure is already present by using the bind_ifindex field
of udp_port_cfg passed to udp_sock_create)

Thank you,
regards,

-- 
  Daniele Orlandi
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
