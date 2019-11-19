Return-Path: <SRS0=p9ce=ZL=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72D79C432C0
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 19 Nov 2019 15:26:28 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C5110222D1
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 19 Nov 2019 15:26:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="XmWGQjZK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C5110222D1
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 94f4195b;
	Tue, 19 Nov 2019 15:26:11 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a992d044
 for <wireguard@lists.zx2c4.com>;
 Tue, 19 Nov 2019 15:26:09 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 51ead74d
 for <wireguard@lists.zx2c4.com>;
 Tue, 19 Nov 2019 15:26:09 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4cee1b7b
 for <wireguard@lists.zx2c4.com>;
 Tue, 19 Nov 2019 14:33:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to
 :content-type; s=mail; bh=58tOpoWuGOPtrL5dDo0A73bkNVw=; b=XmWGQj
 ZKuwg49MyntardA3u40MgoCd2HbXZkbaXmfOd9Tox8S/6kArm+XIXmwMWO/2zDL9
 h0ia/u3Lx4Lc/xwK3JdaWAMPMwKnPrxaT2G/i5fbn2P4T+OLEqmjtzZLaLIRYt+E
 F5fKcp4vJW0L9LQ8gb1TuYmiZhD0ARvxA8Yy2+20eMVDYB8u8d6A+I9Q24vBlodU
 ddGSLhdQ/rntiwkR5i5cn4xoo8ksDTI1hMS4/qk0ZMB/gwLs4DyXWlAZJszbjQQ4
 /AURjA8Js+pGML41yhTuRkMJJVqgYmDfv/M+a/+/gF4TlFORl5+faa6kYJ0j0NbY
 +4w8bphJxpI/JtDg==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 3a6b784b
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 19 Nov 2019 14:33:20 +0000 (UTC)
Received: by mail-ot1-f46.google.com with SMTP id l14so18166634oti.10
 for <wireguard@lists.zx2c4.com>; Tue, 19 Nov 2019 07:26:09 -0800 (PST)
X-Gm-Message-State: APjAAAX08UrbtV7n1jdH4Z+fYqNurtfUaxsXCQIr/YsAcquN/X1kKgLm
 Ir5ifzbBCb5N/zzUSNMCirvIuXhVjWjSosrnru8=
X-Google-Smtp-Source: APXvYqwl7CLysDPXwOEChVbDSAmHkYa0OdbIfyBXp7E2XNPysMNhzSBfqgSeFbWk9r56RZvRXzZTC68guhjP/Xpgw2Y=
X-Received: by 2002:a9d:6a81:: with SMTP id l1mr4337152otq.369.1574177168923; 
 Tue, 19 Nov 2019 07:26:08 -0800 (PST)
MIME-Version: 1.0
References: <CAHmME9pmfZAp5zd9BDLFc2fWUhtzZcjYZc2atTPTyNFFmEdHLg@mail.gmail.com>
In-Reply-To: <CAHmME9pmfZAp5zd9BDLFc2fWUhtzZcjYZc2atTPTyNFFmEdHLg@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 19 Nov 2019 16:25:57 +0100
X-Gmail-Original-Message-ID: <CAHmME9pPDQxVO5m1gRzWkDn5GfRn7yDdNa3_hy7QC-1RmE0H=A@mail.gmail.com>
Message-ID: <CAHmME9pPDQxVO5m1gRzWkDn5GfRn7yDdNa3_hy7QC-1RmE0H=A@mail.gmail.com>
Subject: Re: WireGuard to port to existing Crypto API
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
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

Hey folks,

Small update on this thread: it turns out that at the same time as I
was stepping toward compromising and using the old crypto API here
with this thread, other kernel developers were interested in
compromising to upstream some aspects of Zinc. The result is that
everybody took constructive steps toward each other, and the first
part of Zinc has been merged:

https://lore.kernel.org/linux-crypto/CAHmME9rxGp439vNYECm85bgibkVyrN7Qc+5v3r8QBmBXPZM=Dg@mail.gmail.com/

It's not called "Zinc" any more, and some of the design decisions I
liked aren't there, but I think the lion's share of what we were after
is there, and a few other pieces should be possible to upstream one at
a time.

These steps forward should unlock WireGuard upstreaming, which I
expect to get rolling again soon. WireGuard is probably mostly okay,
but I still do anticipate review with lots of feedback to incorporate,
since now there's more impetus for people to take the patch submission
seriously. I'll keep this list updated as we move forward.

Regards,
Jason
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
