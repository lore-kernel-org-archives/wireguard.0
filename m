Return-Path: <SRS0=m2YW=OV=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B3B4C65BAF
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 12 Dec 2018 22:36:45 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8E70B20645
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 12 Dec 2018 22:36:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="fZWYLPFb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8E70B20645
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 50ad4495;
	Wed, 12 Dec 2018 22:27:28 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e4268938
 for <wireguard@lists.zx2c4.com>;
 Wed, 12 Dec 2018 22:27:25 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 67bd4ad0
 for <wireguard@lists.zx2c4.com>;
 Wed, 12 Dec 2018 22:27:25 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b4bb2b34
 for <wireguard@lists.zx2c4.com>;
 Wed, 12 Dec 2018 22:27:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type:content-transfer-encoding; s=mail; bh=wanfm9IZCN7l
 gcWGYNXKLOYoaCk=; b=fZWYLPFbvld6DnMVp8sJAqj6BxWyRXANoqiqBMY3bCtb
 Ub+hV2PG26JxuUez8MT/jLIWcwNU4ANEPOs0qq6hQ6fiNg7QuEllHVtPh/qlrlMa
 kB3dCiemwCTR7jNoe8bHdll3jrSpYUJXFEoCmManKOEvZ1+4THzjoVULvECrX5oa
 wleKm7S3L4Ljk4I/8OMKNutoSFn/aRKiZYbDrKuPgRhp9HxK6dDR64h1aG+WKYSe
 hr4Kv7mTVhfoDDiGTqieyUqM2+750W7kldybE8yVIQuiklLIU9mjS5yEDayt4pPE
 uSQeXn+qMpxeRkRjRhNaDDNlXBE4UZSFHUBQXWsN2g==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id a74f5952
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 12 Dec 2018 22:27:25 +0000 (UTC)
Received: by mail-oi1-f172.google.com with SMTP id u18so25678oie.10
 for <wireguard@lists.zx2c4.com>; Wed, 12 Dec 2018 14:36:23 -0800 (PST)
X-Gm-Message-State: AA+aEWaNbdi8oafns7Pplsi+k8xMzV9k9nqBLlL1KOrfYQNUnSunDoto
 oO06Y0x1kllJdP/iZyFky5Dl7zA5c2KKsYHaEUU=
X-Google-Smtp-Source: AFSGD/Xcnf7PxcjWRz+jcwBft0mkeCIHjOXlgcwoeqFotLHwl+rWk51X3S/1ciRUC4vLd6yV+FM+NWyai6fEhpaBAOY=
X-Received: by 2002:aca:c003:: with SMTP id q3mr1401968oif.119.1544654182966; 
 Wed, 12 Dec 2018 14:36:22 -0800 (PST)
MIME-Version: 1.0
References: <20181211132437.cooi2kwvx2j3llem@vertex.local>
 <d9c01aa2-9dab-44b0-d743-a93ff7936e38@zx2c4.com>
 <F48C44BC-EB3C-4399-A1A4-A7FF6B2691DF@gwynne.id.au>
In-Reply-To: <F48C44BC-EB3C-4399-A1A4-A7FF6B2691DF@gwynne.id.au>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 12 Dec 2018 23:36:11 +0100
X-Gmail-Original-Message-ID: <CAHmME9ph=-bGc=Ag6Cb34D-1=ir_2znwXHHDCBHkoHkF=teVSA@mail.gmail.com>
Message-ID: <CAHmME9ph=-bGc=Ag6Cb34D-1=ir_2znwXHHDCBHkoHkF=teVSA@mail.gmail.com>
Subject: Re: OpenBSD kernel implementation
To: david@gwynne.id.au
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

Hi David,

On Wed, Dec 12, 2018 at 11:35 PM David Gwynne <david@gwynne.id.au> wrote:
> Did you tie the handshake and data state machines together so you would only have to handle packet crypto operations with a single set of keys? If so, what happens to data packets that are in flight while the handshake is happening? Do you keep the old keys around for a bit to allow operation on them?

Yes. There's a rotation on a fixed amount of state.

Jason
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
