Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4620AD10F57
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 18 Nov 2024 04:14:26 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ed38b923;
	Mon, 18 Nov 2024 01:39:48 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 71598604
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 18 Nov 2024 01:35:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D423E5C4D44
 for <wireguard@lists.zx2c4.com>; Mon, 18 Nov 2024 01:34:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E4FBC4CECD
 for <wireguard@lists.zx2c4.com>; Mon, 18 Nov 2024 01:35:23 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="a03Dkdfl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1731893721;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type;
 bh=h450FS+N4JQKnGl6Cjq5GAKaXyzhyQUvhLoUGtWhzaA=;
 b=a03DkdflbmPZWuEwvO18XrKnATy+LlD7itvHB17nH4cSRJBwaGhKeENUIszf8TIOUfii57
 twQ7JtvfsC6fI6njc1Ysr8EyzAbbFfCFg0jT18DMUGai7R/NqiQLWDWFGaPcc9F+gIiAOb
 mp8sOiy1RimWDF3C+nl0oY6cu5xVPSs=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 5c6bcbb2
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 18 Nov 2024 01:35:21 +0000 (UTC)
Received: by mail-oa1-f46.google.com with SMTP id
 586e51a60fabf-2969ae2c99fso8514fac.3
 for <wireguard@lists.zx2c4.com>; Sun, 17 Nov 2024 17:35:21 -0800 (PST)
X-Gm-Message-State: AOJu0YxtKIQjcpgTdTqzTZwtMi8pMDU4CFTg5TDA8eNPCXuOvsBTpvIp
 B6+rBphFRFyqzz+aO4bNeDfpUvTx2rjljwbs37+WJRV4o0DxLmMArBxSaDX1YwuXA+6bbdMCq26
 szPwFMEUNoHnidyVHBBjzGM7PyNA=
X-Google-Smtp-Source: AGHT+IHve+FfLk0qGd3A+fSIrQMtA+DGCD0QPeBGZ5t0GxkKmEBP1pNmF4QCtUQzBVHsIV31XTsMwLw8+B8F8/wH7CQ=
X-Received: by 2002:a05:6870:1e8b:b0:288:57fa:961d with SMTP id
 586e51a60fabf-2962e2a2d1emr7370424fac.38.1731893720457; Sun, 17 Nov 2024
 17:35:20 -0800 (PST)
MIME-Version: 1.0
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 18 Nov 2024 02:35:09 +0100
X-Gmail-Original-Message-ID: <CAHmME9oMT7+VnYrrj7JSdmPCOn6WOdHWMnbPV6tUJicT8i4dKA@mail.gmail.com>
Message-ID: <CAHmME9oMT7+VnYrrj7JSdmPCOn6WOdHWMnbPV6tUJicT8i4dKA@mail.gmail.com>
Subject: WireGuard & Linux kernel RNG @ FOSDEM 2025
To: WireGuard mailing list <wireguard@lists.zx2c4.com>, 
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 Netdev <netdev@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
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

Hey folks,

On February 1 & 2, 2025 in Brussels, the FOSDEM [0] conference will
take place. This year, there's going to be a stand during those two
days dedicated to answering questions and interacting with the
community regarding WireGuard and the Linux kernel RNG [1], and
perhaps other cryptography or networking adjacent topics, in addition
to the bonanza of stickers and such of course. I'll be running the
stand and will be hanging out there most of the two days.

If anybody would like to help run the stand with me or organize
anything around it, please don't hesitate to drop me an email. I think
this presents a nice moment for the community, both to pull together
developers and other interested parties into a common place to talk
and discuss, and moreover to help with education and awareness in ways
that "read the docs" or "ask on IRC" don't.

Looking forward to seeing some of you there.

Regards,
Jason

[0] https://fosdem.org/2025/
[1] https://fosdem.org/2025/news/2024-11-16-stands-announced/
