Return-Path: <SRS0=GTIq=ES=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FF5EC2D0A3
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 12 Nov 2020 08:35:01 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9E9912100A
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 12 Nov 2020 08:34:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="3dwQfhFW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9E9912100A
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 90af29a3;
	Thu, 12 Nov 2020 08:31:01 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id ce0b2a6d
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 12 Nov 2020 08:30:59 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0dbdbbf2
 for <wireguard@lists.zx2c4.com>;
 Thu, 12 Nov 2020 08:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=C2rn59c9qxelMIK2gEihx7kCc/c=; b=3dwQfh
 FWdrKHidAcYrsJ/l/Ct6fpRD8jvLtTjISF7RdEOaE9bPDnnuMcZTaI3J5sRPbN56
 PeB49jG9vd6qDtdxpgSzppP+WKnlxedurd55g61IEnYKmyPGcGtgZ7MI8iEtxbZP
 1rUQX+MMkHr//OFGEQiYFKliUnH9A4jwiohWafNJqQBHks/zf2GsDznkLZNt811w
 /LvpyuhcHGnKN1HJR5n3sIZHTbPy77fRL97p74FNrOhmNhwm0u2G3wqvIZkFQ7gD
 /YA0ykNPOhyb6Qw3Qt01uURmYw6N5a45sodAnMgaqLKt4Rqqe+qdsUHF/nKbK4uL
 YrQXa4OtMIWJ5jbQ==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id ae72c866
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 12 Nov 2020 08:31:44 +0000 (UTC)
Received: by mail-yb1-f180.google.com with SMTP id o71so4261508ybc.2
 for <wireguard@lists.zx2c4.com>; Thu, 12 Nov 2020 00:34:54 -0800 (PST)
X-Gm-Message-State: AOAM532956wJ91nbm5jHXXFtNDZEyFlVdp4tMP0CcYA2560OsrU54uQ3
 e2JYSvr2upsOX6J0p3zYEDCPNR6XiSKXgdZ+tek=
X-Google-Smtp-Source: ABdhPJxc1ZP8KgZ9ZofaaWe4hJ1ovW93lep8vW2Qej8vf1qsz+J5ddcp4e4NXnWsjMd3i3bAsN0rIQm8X0QnHWKwLwI=
X-Received: by 2002:a25:6f83:: with SMTP id k125mr6196366ybc.123.1605170094118; 
 Thu, 12 Nov 2020 00:34:54 -0800 (PST)
MIME-Version: 1.0
References: <CAHmME9rW1e+rRc8q+-_eLR=U9OTn+Sn84ECJtGFY=Hjg8kzfEQ@mail.gmail.com>
 <65ad978d-61d8-59b5-3932-5c6be78ad92f@softart-ge.com>
In-Reply-To: <65ad978d-61d8-59b5-3932-5c6be78ad92f@softart-ge.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 12 Nov 2020 09:34:43 +0100
X-Gmail-Original-Message-ID: <CAHmME9oR=OD1Sib7hhriPOAXdL591BoQ=9v7LBE-hF3zYvVDtQ@mail.gmail.com>
Message-ID: <CAHmME9oR=OD1Sib7hhriPOAXdL591BoQ=9v7LBE-hF3zYvVDtQ@mail.gmail.com>
Subject: Re: Should we sunset Windows 7 support?
To: Reiner Karlsberg <karlsberg@softart-ge.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
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

Hi Reiner,

On Thu, Nov 12, 2020 at 9:29 AM Reiner Karlsberg
<karlsberg@softart-ge.com> wrote:
> I fully understand the intention, to drop support for Win 7. Although I am still a happy user of it.
> I would appreciate a solution, in which further developments of wireguard still remain backward compatible,
> to keep the latest official wireguard for Win 7 still functionable with peers, running newer versions of wireguard.
> At least for "quite some time".

Could you let me know the rationale for your continued use of Windows
7? Is it economic? Is it just UI preference, and security isn't a
priority to you? Something else?

Jason
