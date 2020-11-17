Return-Path: <SRS0=xb9C=EX=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_05,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEFB0C2D0E4
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 17 Nov 2020 22:05:29 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C206B2417E
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 17 Nov 2020 22:05:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="ghsMFLNI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C206B2417E
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5c94d8a7;
	Tue, 17 Nov 2020 22:00:48 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id c3cd5820
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 17 Nov 2020 22:00:45 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3e1d0b2a
 for <wireguard@lists.zx2c4.com>;
 Tue, 17 Nov 2020 22:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=yXomo7WnN8ymGMi3LD1uHV3h4HY=; b=ghsMFL
 NIdMGe1e0xpIv8yWtalVLvn1mpkmOcEdDWwk88ypMM61e5ptIEI1JTunh2OqpeKx
 lSjrCTrcggtEWMAt/SFoto+mQmOcJLmp1+feldqUdu1mJU/BLtnQXYze3O/DsuT+
 L9FUPoh1/OtkeVMnt4x8jXGRw/VTOQiiaxr0hct/8jiMv5vCav3IHdlaNODYGWyg
 HAL5fHfdEFm+aU1wYb23jyXF/4gqiyrEAbvUpKEcKxSFavTpmn/8CzB2UKo+DIbE
 TnxS/Lve4chZPrA1bqryD7+AEafbyF70978jj1dPoDWyefRWo8ZxQGJA2EsHzxsF
 92dib3RnJqgtxIhA==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id a35c2a79
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 17 Nov 2020 22:01:31 +0000 (UTC)
Received: by mail-yb1-f178.google.com with SMTP id l14so16305546ybq.3
 for <wireguard@lists.zx2c4.com>; Tue, 17 Nov 2020 14:05:25 -0800 (PST)
X-Gm-Message-State: AOAM530Z4zagM9m9vCT4tsl0C6HRO0SgM+T1EkZOn8dY1Ik2BDhBRANp
 YyfbQzb7qWxq9cQWJILt1cJsmuxCbEroUYhX7ac=
X-Google-Smtp-Source: ABdhPJwRjUkxOJOgmvOoTc810kpxHwU7extbXEPv64vSzwvxRsAsDZk+pQ5NesucZbzFwg6Zd/N+raRlwsBNp2d8sLE=
X-Received: by 2002:a25:df05:: with SMTP id w5mr3372593ybg.20.1605650724583;
 Tue, 17 Nov 2020 14:05:24 -0800 (PST)
MIME-Version: 1.0
References: <CALaUSuvDgxsr99R2qiOrXM20btnvnaiyAx7197jfcTauOt5CTA@mail.gmail.com>
 <CAHmME9oeZc7cruN2fayu+F+8BO0RiwGuA+dqzQRr5spnvhY6GA@mail.gmail.com>
 <CALaUSuuzQhTcDE_b6PPf=fXuOjbmVf7Tgzdz9DbWMxCJ8-2WUQ@mail.gmail.com>
 <CAHmME9oZvNQjCoShdMTQ2n0soTA0wNVVm9rPFcma0fP-6_9tsw@mail.gmail.com>
 <CAHmME9rm6iq+xD+K6b9N1D9VmiKXkOiw+6Wpscnau6Mu+OEevQ@mail.gmail.com>
In-Reply-To: <CAHmME9rm6iq+xD+K6b9N1D9VmiKXkOiw+6Wpscnau6Mu+OEevQ@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 17 Nov 2020 23:05:13 +0100
X-Gmail-Original-Message-ID: <CAHmME9rg3HJweRKRVyz3jXFPi8naj1zcOFTPW46gKVs9vtZ1Wg@mail.gmail.com>
Message-ID: <CAHmME9rg3HJweRKRVyz3jXFPi8naj1zcOFTPW46gKVs9vtZ1Wg@mail.gmail.com>
Subject: Re: WireGuard for Windows failed to start after update to v0.2.1
To: Joshua Sjoding <joshua.sjoding@scjalliance.com>
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

https://git.zx2c4.com/wireguard-windows/commit/?id=e70cabae68bd9f12d64b2b269bd80a8b617c338c

We'll see if this stays, but present solution seems to be this.
