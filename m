Return-Path: <SRS0=9XF/=H3=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DECDEC433DB
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 25 Feb 2021 13:11:27 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B7DCC64EC4
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 25 Feb 2021 13:11:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B7DCC64EC4
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f4f58985;
	Thu, 25 Feb 2021 13:11:23 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [104.131.123.232])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 34b32196
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 25 Feb 2021 13:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1614258679;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8nEhUPw0oK0HzyTAsHCeWKz2EZvPCOIzcEN1eRPz5VI=;
 b=l5ddYS3lRD+rA3p6MxNI5gld70XmfMS2WpmyhPRJXvn0nFKrRCqh5WpmoHEp/tPYuSukC9
 DZxB8bdX/s9aubv5AoiweBzANdmnGL267zHaVRCl6rE4cm3/xNOMYV0v1WBhr8k4qva/xQ
 QS+Tg7lFx5BYphXXWgS3Ft5z55clpO0=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 77f11a61
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 25 Feb 2021 13:11:19 +0000 (UTC)
Received: by mail-yb1-f174.google.com with SMTP id b10so5366497ybn.3
 for <wireguard@lists.zx2c4.com>; Thu, 25 Feb 2021 05:11:19 -0800 (PST)
X-Gm-Message-State: AOAM530MKcvQTUH8tHTYSybCuUEn+vb3sgBoqJ99kzd6H+DT5HAHVxfu
 bbQlKNnNHHvO/SyWkBRdIRSFwzMYpR7+FxQzrMQ=
X-Google-Smtp-Source: ABdhPJwkgEdqNegdL0G5f0PRXQH9YIhJuvvJTMjr106nvYkmztvYd/K/dD/tjrF5hxAnQGHZ89EMSoi1a/dEK19XGtQ=
X-Received: by 2002:a25:8c2:: with SMTP id 185mr1125075ybi.20.1614258678837;
 Thu, 25 Feb 2021 05:11:18 -0800 (PST)
MIME-Version: 1.0
References: <etPan.5f91aee8.f1a4b3.1474c@ovpn.com>
In-Reply-To: <etPan.5f91aee8.f1a4b3.1474c@ovpn.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 25 Feb 2021 14:11:08 +0100
X-Gmail-Original-Message-ID: <CAHmME9pLahB7n_O1tHtBAuKhAtk1cn2g=3Ko614F+8U5R6ytpA@mail.gmail.com>
Message-ID: <CAHmME9pLahB7n_O1tHtBAuKhAtk1cn2g=3Ko614F+8U5R6ytpA@mail.gmail.com>
Subject: Re: [Android] couldn't find "libwg-go.so" on Nexus 5X
To: David Wibergh <david@ovpn.com>
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

Hey David,

That's a pretty interesting bug... are you able to reproduce every
time on that device? I'd seen reports like this in the play console
but never with useful verbose error reporting like this. The fact that
it's giving you /lib/x86 on an arm device is madness...

Jason
