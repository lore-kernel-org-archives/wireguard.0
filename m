Return-Path: <SRS0=H7Gu=WY=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F921C3A5A6
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 28 Aug 2019 02:25:12 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E4A1D214DA
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 28 Aug 2019 02:25:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OWcho7NW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E4A1D214DA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f2bebdf1;
	Wed, 28 Aug 2019 02:25:11 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5fe21fdb
 for <wireguard@lists.zx2c4.com>;
 Wed, 28 Aug 2019 01:21:52 +0000 (UTC)
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a7697057
 for <wireguard@lists.zx2c4.com>;
 Wed, 28 Aug 2019 01:21:51 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id i30so531562pfk.9
 for <wireguard@lists.zx2c4.com>; Tue, 27 Aug 2019 18:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=content-transfer-encoding:in-reply-to:date:cc:subject:from:to
 :message-id; bh=mdX9pDzdGqwUygtzWhj1VjRKf6hGtZ0/zzdCWYic5Ps=;
 b=OWcho7NWvgtyFsk3r1Dh4j3ykOcKqGS5PVv326AxrotqInAEZlc2gbxyR5qvNu7nuk
 y1izOXNteRW6F6WQ/YrH+H8Cl/n9/DhyV+jMXwNmMRUB1Vh3MeGI11fGzBp7HvcztdTe
 FfO1gBgVIcW5uqYwklN0wXxZ1fPSNfYeQp4OaC4k6XT57ZpMDQ5WbbPjVdhzxwphbXeW
 VPD5eE+JTJg3jAtNxuQb1gjM71s3QbafpQFZzlLOCTHxhWzaZE7/Fec8pnS37SGMFjbV
 rAMVd6mprfUTSn2/i8DuBmSNxws5tQbCQgeb0z+59VPP+/GUa3RA5W3kEMd1M2kRYTII
 9v1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:content-transfer-encoding:in-reply-to:date:cc
 :subject:from:to:message-id;
 bh=mdX9pDzdGqwUygtzWhj1VjRKf6hGtZ0/zzdCWYic5Ps=;
 b=QM9oi42h20sQtnkGjWzMBvDpNKDsqb6IYuSh0OWu3zI5tcNwgdPrODU8iHcVKP+PnT
 sOzHkl5mH5zNYe6IaqFxTMjrTUwCKTslhNWMgJEJUEqfsH2x2xsrbxdqUriXTV55HJ2w
 xsFWCqkbk84VhJATrkO84EwyPuaQ00tsAfAF4qzqW8QgI49dLov4SZWqgKy7xmB51SYT
 OZvmTcID2yftmjWIKLAZa0W6Hx6op464grXI5lyFdzmfID6mvRk/IQE0E5kQ84RHcAOl
 W584p+/9ihvJUZra/mkWR4mg4dAMvIbZvmVWm4YN21eBByy5W0AVCEDseVMU/+psKJaU
 DomA==
X-Gm-Message-State: APjAAAU8IEkFYQdB+gbRnvTCK+UskeahV3N0/7z3WeizTyfLcntSRDKJ
 yNnWclrxnCIiYG6Sip+Zdg==
X-Google-Smtp-Source: APXvYqyPSIUAtyQOY4sqe2t90Bx/PFQmyjoxq1xoYufChcadGssX0evXw5RJv+x0K71iYxkBu3Orkg==
X-Received: by 2002:a63:5f09:: with SMTP id t9mr1209752pgb.351.1566955310508; 
 Tue, 27 Aug 2019 18:21:50 -0700 (PDT)
Received: from localhost ([2600:8800:1e00:97d:e051:bc7e:83c5:63ad])
 by smtp.gmail.com with ESMTPSA id f26sm601290pfq.38.2019.08.27.18.21.49
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 27 Aug 2019 18:21:49 -0700 (PDT)
In-Reply-To: <CAHmME9pNVSr4vqXEvpH-K2bK-9OyOurkHrzK7kg0Mmyb0ASrUA@mail.gmail.com>
Date: Tue, 27 Aug 2019 18:21:47 -0700
Subject: Re: [PATCH] wg-quick: linux: Don't fail systemd service when using
 systemd-resolved
From: "Ronan Pigott" <rpigott314@gmail.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Message-Id: <BWKVAQQ0RFKJ.2FBG8FY1MXOR1@rxps>
X-Mailman-Approved-At: Wed, 28 Aug 2019 04:25:08 +0200
Cc: Ronan Pigott <rpigott@berkeley.edu>,
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

On Tue Aug 27, 2019 at 4:51 PM Jason A. Donenfeld wrote:
> Could you resubmit a v2 with your Signed-off-by line?
OK.

> Instead of this hack, why not just reorder unset_dns and del_if? Are
> you worried about a race in between them if they're ordered as such?
Yeah that was my first thought, then I supposed that perhaps it was
ordered that way intentionally to prevent a situation where the dns is
unset and a client would make a dns lookup on the interface before it is
deleted. It would use the sd-resolved 'global' configured dns servers in
that case which is maybe undesired.

I realize it's a hack. I gave the explanation somewhat in the hope
someone had a better solution to the problem I was experiencing.

The real issue here is that there are there are three common
implementations of resolvconf: debian resolvconf, openresolv, and
sd-resolved compat interface. So wg-quick uses resolvconf, but is only
fully compatible with openresolv. wg-quick is (accidentally) compatible
with sd-resolved through the resolvconf compat interface, except for
this minor hiccup. This hack allows wg-quick to work for both methods
with no extra configuration from the user, no alternative code path
for sd-resolved, and no change in behavior for non sd-resolved users.

There is another way that is might be more palatable: openresolv and
sd-resolved resolvconf both support a '-f' flag for ignoring missing
interfaces, which neatly sidesteps this error. However, I don't think
debian's resolvconf supports this flag. Now that I look into it though,
it seems debian's resolvconf does not support '-l' either, which wg-quick
uses, so maybe we don't care to support this anyway. I think v2 will
just use the flag instead, if that's alright.

Users of openvpn use sd-resolved dbus interface in place of resolvconf,
such as seen here: https://github.com/jonathanio/update-systemd-resolved
but I believe this is overkill for wg-quick.
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
