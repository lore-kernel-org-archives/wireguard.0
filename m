Return-Path: <SRS0=jP9u=M6=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 574C9C5ACCC
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 18 Oct 2018 16:37:04 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 780772145D
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 18 Oct 2018 16:37:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="qEcFUvCd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 780772145D
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 927e8fc2;
	Thu, 18 Oct 2018 16:35:00 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0c17f963
 for <wireguard@lists.zx2c4.com>;
 Thu, 18 Oct 2018 16:34:57 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id df9e3c56
 for <wireguard@lists.zx2c4.com>;
 Thu, 18 Oct 2018 16:34:57 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id eac92afd
 for <wireguard@lists.zx2c4.com>;
 Thu, 18 Oct 2018 16:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=iGQPnXT3yT+6/GFmTiS+X6Q62z0=; b=qEcFUv
 Cd8FPEZDez0oIzap6D3jtYbIrUxJgB4XFX4dGkeQFqKxUvBee31WofHoFa35tIUI
 Y0t6dpJ0o5wlJZm1qtRLaFN2LcOe0VxBaE0ZAr6Lfze8ltVil8Wx8dDEEu4nGpCa
 UdGvJilOTHrO+qXSe/enjstBOWHGfNXVjTVYcECxIbLvORyTGUD9uxRrPDmOZiDH
 zrjcRdf2fdu7ww2KnnCQanlmF6y0WH4ExTDyX7Tywp3k6maFqiZGOm2vAjiKXkYT
 Kv1Ox5Kjddslu11JU6aCq2LNOU21kaiwK/UwMiwGiO0L1e1nWzgdx0/LCH+c4nm5
 GguGutjK5giTHSKA==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 48291b67
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 18 Oct 2018 16:34:57 +0000 (UTC)
Received: by mail-ot1-f42.google.com with SMTP id o21so30361209otb.13
 for <wireguard@lists.zx2c4.com>; Thu, 18 Oct 2018 09:36:58 -0700 (PDT)
X-Gm-Message-State: ABuFfoh6zHtODRUukzuRLQhI0af807yhZNDQ9Qk0KerMNAVx3SrJ4M99
 /LpkTHDWD414hCx+tC/Pt015pPMOTY8KZICEu5U=
X-Google-Smtp-Source: ACcGV604y87Kxa3DpcJiud3q+erEXXVanjOdeoQEuaeVnkGG49YweWsZ0G+izo1tyZLoFGKhDJ9SyuylQHIk8VA69HU=
X-Received: by 2002:a9d:30c2:: with SMTP id r2mr18939918otg.143.1539880618124; 
 Thu, 18 Oct 2018 09:36:58 -0700 (PDT)
MIME-Version: 1.0
References: <20180810080617.20283-1-ahanins@gmail.com>
 <CAHmME9pCdYSc5vLUJt_7xkCG9PLMkQE5qMMbrxQ9uCq0U0KL-Q@mail.gmail.com>
 <fef438a2-f085-b3fd-4d8e-041b5c62c030@gmail.com>
In-Reply-To: <fef438a2-f085-b3fd-4d8e-041b5c62c030@gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 18 Oct 2018 18:36:47 +0200
X-Gmail-Original-Message-ID: <CAHmME9o3uu6ZN7ptuDorWJ5C0B1LMnU7Qf6V2NN0Kdv20WBggg@mail.gmail.com>
Message-ID: <CAHmME9o3uu6ZN7ptuDorWJ5C0B1LMnU7Qf6V2NN0Kdv20WBggg@mail.gmail.com>
Subject: Re: [PATCH 0/1] Fix broken inner checksums for non TCP/UDP protocols
To: ahanins@gmail.com
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
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

Hi Andrey,

Circling back to this now. In light of the questions I raised, do you
think I should proceed with this patch, or are you reworking?

Jason
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
