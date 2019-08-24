Return-Path: <SRS0=ALJF=WU=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E322C3A59E
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 24 Aug 2019 12:41:51 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 42C6E21670
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 24 Aug 2019 12:41:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="qKoXF804"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 42C6E21670
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 61904587;
	Sat, 24 Aug 2019 12:41:48 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 86e6fe52
 for <wireguard@lists.zx2c4.com>;
 Sat, 24 Aug 2019 12:41:46 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fe8da778
 for <wireguard@lists.zx2c4.com>;
 Sat, 24 Aug 2019 12:41:46 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3ffea77f
 for <wireguard@lists.zx2c4.com>;
 Sat, 24 Aug 2019 12:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=aXJTzxlOEw7W0uTOyl+auUUvctM=; b=qKoXF8
 04J7IbcGK4b6urBeAvsTb79zDRHhgP/z5Hyj/AXblbH1nIeuxYjHKZcZJUd+pTe8
 H95Jhm6gTy20nBi69y0KDBUh/QICO95iA0pPCNLkBmAIVUBfBkLWKJG+qa3uDwQP
 HFp/1U5LgKEsWT10IUluWO19GTdM7oaOn/9Ft/2NMmse3/RusF+2nLkRtPJT/o2O
 d9eYOGs4D7nAJ+hOaB912K/3RUrG8yDO711D9HLEqBFKGVutkmhpvmJxS6wIZ7yw
 vOP/5ecSlZHq6nL33HXBWU69RIMU2hgCE8FQet0uTxmCSIuoXJaUqQ+2nxnEckgf
 d2VyvsCM13uyTMpA==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 0cde0e96
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 24 Aug 2019 12:00:07 +0000 (UTC)
Received: by mail-ot1-f54.google.com with SMTP id o101so11186913ota.8
 for <wireguard@lists.zx2c4.com>; Sat, 24 Aug 2019 05:41:46 -0700 (PDT)
X-Gm-Message-State: APjAAAWp2wYRY1zAe3iHu/4Gved/emwdZrIzzZUenz5VisC8PRcXNV60
 H2h4kjhz+6P9m7pLyarIod02wqdpfIEdc9uj2f0=
X-Google-Smtp-Source: APXvYqwN+guHZhvVEfyuiYh+FEC3aWMK09VUOV/xEqjyMGFl1hvRtJ75WoOaRv0NpoPFw3q4/3SjJzcbIqJ6qVbHgmk=
X-Received: by 2002:a9d:6854:: with SMTP id c20mr8245254oto.120.1566650505832; 
 Sat, 24 Aug 2019 05:41:45 -0700 (PDT)
MIME-Version: 1.0
References: <CAGyAFMWzGbheVD6iOm=UZxbkmHOWCPHq7QzCi3_BpGbZT4f2kA@mail.gmail.com>
 <CAHmME9pOPkhYnE2D7-RhSVyECosL8NcrhsAL05C9SPSYiqVG5g@mail.gmail.com>
 <CAGyAFMUYDP3fXx4tvaCW+SLvPYSWeRV-+gUNc=9HBsWweCOOTQ@mail.gmail.com>
In-Reply-To: <CAGyAFMUYDP3fXx4tvaCW+SLvPYSWeRV-+gUNc=9HBsWweCOOTQ@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sat, 24 Aug 2019 14:41:33 +0200
X-Gmail-Original-Message-ID: <CAHmME9qfSPiWusZMddv8zwUSLQ5UvUqHSyr32FUo0-C=PYhTiQ@mail.gmail.com>
Message-ID: <CAHmME9qfSPiWusZMddv8zwUSLQ5UvUqHSyr32FUo0-C=PYhTiQ@mail.gmail.com>
Subject: Re: Volatile in Wintun
To: Lev Stipakov <lstipakov@gmail.com>
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

Hi Lev,

I spent a while squinting at assembly diffs and reviewing how the
linux kernel does things. Voila:
https://git.zx2c4.com/wintun/commit/?id=c072f4f3c4b540c7cfebec563b0fb5d7ba932b6f

> Does it mean that hardware reordering

I'm mostly concerned here with the compiler reordering accesses,
actually. With regards to hardware memory barriers, I haven't seen
places yet where we'd need an explicit smp_mb() or similar that's not
already provided by the various locks. But let me know if your
analysis concludes differently.

Jason
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
