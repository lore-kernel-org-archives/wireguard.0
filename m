Return-Path: <SRS0=XtlP=3O=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFC4CC2D0DB
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 25 Jan 2020 14:11:07 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 16B9B206F0
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 25 Jan 2020 14:11:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=orlandi.com header.i=@orlandi.com header.b="NJ89hH1K"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 16B9B206F0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=orlandi.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e4baf90a;
	Sat, 25 Jan 2020 14:10:49 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ee22f730
 for <wireguard@lists.zx2c4.com>;
 Sat, 25 Jan 2020 14:10:45 +0000 (UTC)
Received: from smtp-out1.orlandi.com (smtp-out1.orlandi.com [45.66.80.70])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f06dd79b
 for <wireguard@lists.zx2c4.com>;
 Sat, 25 Jan 2020 14:10:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by submission.orlandi.com (Postfix) with ESMTP id 6E9BBAB5
 for <wireguard@lists.zx2c4.com>; Sat, 25 Jan 2020 15:10:44 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at submission.orlandi.com
Received: from submission.orlandi.com ([127.0.0.1])
 by localhost (submission.orlandi.com [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id RDJxExIgLWVg for <wireguard@lists.zx2c4.com>;
 Sat, 25 Jan 2020 15:10:43 +0100 (CET)
Received: from [IPv6:2a09:62c0:cafe:cafe::20] (unknown
 [IPv6:2a09:62c0:cafe:cafe::20])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: daniele@orlandi.com)
 by submission.orlandi.com (Postfix) with ESMTPSA id 345E55FC
 for <wireguard@lists.zx2c4.com>; Sat, 25 Jan 2020 15:10:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=orlandi.com;
 s=default; t=1579961443;
 bh=xc8VU4lAlY/vI9/bg4ywcfLnJ8AtlPq4RkuwPWtX+AE=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=NJ89hH1KsKEgm9mRh9f98qpZpEsvCHgVtO8vfPc1GyYNZXHMbSr6I7CAxGn+laITc
 PEXkE7jB0fNvlbNmaXXFFvNL2sySMsHpy6Ls+lvKG6WENKVZGI8iy6nQ/V17EB8wDI
 2lwACcSb94Sl5TWhpNXUrBFQPK4UY1FvVjC+raos=
Subject: Re: Tunnel traffic in VRF
To: wireguard@lists.zx2c4.com
References: <9420fa01-61b9-73cb-21f4-681bf8015b7b@orlandi.com>
 <ea889cc3-9599-4218-a8cc-6daa9d2965e2@www.fastmail.com>
From: Daniele Orlandi <daniele@orlandi.com>
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
Message-ID: <38df62df-2c77-48b1-f020-48a410ff381e@orlandi.com>
Date: Sat, 25 Jan 2020 15:10:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <ea889cc3-9599-4218-a8cc-6daa9d2965e2@www.fastmail.com>
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

On 25/01/2020 07:55, Steven Honson wrote:
> Hi Daniele,
> 
> By VRFs, do you mean Linux network namespaces, or something different?

They are a different feature. In short VRFs are separate routing tables
to provide routing isolation. They are somewhat different with respect
to namespaces as the isolation is visible to userspace.

In the meantime I was able to find a workaround by setting the sysctl
variable:

net.ipv4.udp_l3mdev_accept=1

this way the socket that is created in the default VRF is automatically
visible in all VRFs.

A proper binding to the correct VRF would be a better approach, however.

Regards,

-- 
  Daniele Orlandi
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
