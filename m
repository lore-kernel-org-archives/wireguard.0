Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB77EC6FA86
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 22 Sep 2022 09:38:27 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 91d1416d;
	Thu, 22 Sep 2022 09:38:25 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org
 [2604:1380:4601:e00::1])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 69ab9129
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 22 Sep 2022 09:38:22 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 390AEB83576
 for <wireguard@lists.zx2c4.com>; Thu, 22 Sep 2022 09:38:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 201CBC4314C
 for <wireguard@lists.zx2c4.com>; Thu, 22 Sep 2022 09:38:20 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="Su+2/hZy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1663839498;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=p8LgkG6y5S4fj+XbZj/IRVv1q3mONh8yo9atQ2MYjNs=;
 b=Su+2/hZyFnEvM8ZDXKiL03qavjH6LfVvChosBpqFa74xeKzpAA4yXyWOjVL+XBEddxIh9q
 uq3WwlfVrlGlB9zvaeRmfztunZFoZesqsbBpfyIQSUBetLtZUHwxev8C0AkW6AymSCUaf/
 HZIojSHkukw9sgeRWCLGAHMo6Txcvlw=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 88ff2f34
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 22 Sep 2022 09:38:18 +0000 (UTC)
Received: by mail-ua1-f43.google.com with SMTP id i17so3423836uaq.9
 for <wireguard@lists.zx2c4.com>; Thu, 22 Sep 2022 02:38:18 -0700 (PDT)
X-Gm-Message-State: ACrzQf0AJlagpxmSf4rWXm/LjRCgIHQHmTnbBkWyfiFR6SNXZuSoJ/ls
 2/pGTrs73RD/ko32oAYAxnr8Y7308QZPzzQ5svM=
X-Google-Smtp-Source: AMsMyM6N6dBi5BJpmlodv4jSq5sKKIc9zeOXR8EMNehpM+sfOVPyeQFwl46OFBEfUVOVKIaydurtm6R9ycKQRoWv65Y=
X-Received: by 2002:ab0:2b0d:0:b0:390:ed8c:c78d with SMTP id
 e13-20020ab02b0d000000b00390ed8cc78dmr824035uar.49.1663839497444; Thu, 22 Sep
 2022 02:38:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:2ea6:0:b0:3ae:9878:9be with HTTP; Thu, 22 Sep 2022
 02:38:16 -0700 (PDT)
In-Reply-To: <CABBZOs=9VVSDEGPw1eQWmusJotA5toLCn1-uNQeZ+moPthAOxg@mail.gmail.com>
References: <CABBZOsks3ZnpcURYHSQcaWCe8ETY21zitPY5TvtTaAm38DT5EA@mail.gmail.com>
 <834CB179-958C-4C0E-8B17-9918C8A992FB@mullvad.net>
 <CABBZOs=9VVSDEGPw1eQWmusJotA5toLCn1-uNQeZ+moPthAOxg@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 22 Sep 2022 11:38:16 +0200
X-Gmail-Original-Message-ID: <CAHmME9pZy+EYQbmrBi_5Ei191zJ_X3imSuZ_U766HhXp39MHbA@mail.gmail.com>
Message-ID: <CAHmME9pZy+EYQbmrBi_5Ei191zJ_X3imSuZ_U766HhXp39MHbA@mail.gmail.com>
Subject: Re: Wireguard iOS crashes after upgrading to XCode 14
To: Houman <houmie@gmail.com>
Cc: Andrej Mihajlov <and@mullvad.net>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
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

On 9/22/22, Houman <houmie@gmail.com> wrote:
> Hi Andrej,
>
> It works, well done!
>
> A strange thing though, before your patch I was still able to connect
> to the VPN server, if I changed the schema to Release instead of
> Debug.  Now with your patch it also works under Debug schema, which is
> fantastic.
> What could be the technical reason that it still worked under Release?
>
> And what will happen now, are you able to actually get this patch
> released on the official repo? The repo hasn't been updated for a
> year.  :-)
>

Yeah, I'll circle back Apple development at some point. No worries.

Jason
