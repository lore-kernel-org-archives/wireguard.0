Return-Path: <SRS0=OnWR=ZT=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A732BC432C0
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 27 Nov 2019 10:37:12 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 47AFF2070A
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 27 Nov 2019 10:37:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="ASkXSsbb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 47AFF2070A
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4ed53d58;
	Wed, 27 Nov 2019 10:36:45 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9f41928c
 for <wireguard@lists.zx2c4.com>;
 Wed, 27 Nov 2019 10:36:44 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 28c4b244
 for <wireguard@lists.zx2c4.com>;
 Wed, 27 Nov 2019 10:36:44 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id acbba101
 for <wireguard@lists.zx2c4.com>;
 Wed, 27 Nov 2019 09:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=WcIyWbE/PMpmEdIRseMGKYnVLCQ=; b=ASkXSs
 bbEUJ2OhNueh6lOq+1b2GAwxBUg1z9KtnsfwcUm5Vp8rJnktNYY6yldEtxTLUi0+
 2ZE+Zi0zeQdQw/dMHt7RK6I8A4gMp4janOEwXI4z9ic3tAYGHF7gsELvtSmA0zIx
 Q/BgIEgAcHM5QgZ6WkFv2UUXnPchs0Y4VsR2HFr0p/cn4yOFgxtLleK1X6TvpHsj
 SRS6tUAg3Il8i4rULRqKNKX5dm1tID+1rhKf58aXiEHIgknA15LiOqns5FRT1Bf1
 roHPfHG/oS6V6gaXkZAnIDfjrhyV1UDUeNmdIRQ6Z7t+y+ouxAayIawgY4MfCsyK
 zd0zZSTzT3t0pGxQ==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 17cd63b2
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 27 Nov 2019 09:42:54 +0000 (UTC)
Received: by mail-ot1-f45.google.com with SMTP id n23so18657006otr.13
 for <wireguard@lists.zx2c4.com>; Wed, 27 Nov 2019 02:36:44 -0800 (PST)
X-Gm-Message-State: APjAAAVtxrgmgbFLR/xiVSS6cmq2MM+BmhUPYwq2cQ1wvU1FdtQv4j6D
 0Am43zwjSdL9t9NWZzDy1O+v6k2tCF0M32qh+S0=
X-Google-Smtp-Source: APXvYqx3VJgWRJQFbV/OxyYhmjOHMDoGBSfTKs3xxtVtAtMADlQ6Fw1CBbatwSuEGCNhJhm7MGYuNGzTowTJjSZt1yU=
X-Received: by 2002:a9d:6a81:: with SMTP id l1mr3114919otq.369.1574851003695; 
 Wed, 27 Nov 2019 02:36:43 -0800 (PST)
MIME-Version: 1.0
References: <CAOtBoV8UbsFzvsXN5k11mG0E37D+y9MRs3wMoWJL1oncq3Y6PA@mail.gmail.com>
In-Reply-To: <CAOtBoV8UbsFzvsXN5k11mG0E37D+y9MRs3wMoWJL1oncq3Y6PA@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 27 Nov 2019 11:36:32 +0100
X-Gmail-Original-Message-ID: <CAHmME9qmRgzzR8efS2whX+R5FBRWDYVaziKUW9cn90mc6e-_+w@mail.gmail.com>
Message-ID: <CAHmME9qmRgzzR8efS2whX+R5FBRWDYVaziKUW9cn90mc6e-_+w@mail.gmail.com>
Subject: Re: Security of Android QuickSettings Tile
To: Simon <simon@laro.se>
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

Nice idea. More simply implemented here:
https://git.zx2c4.com/wireguard-android/commit/?id=cc82f29d296aa51f44d295a855762d7f9543cf93
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
