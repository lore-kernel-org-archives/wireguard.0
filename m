Return-Path: <SRS0=9kqO=ON=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24B1CC433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 23 Sep 2021 17:27:06 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 501E460F70
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 23 Sep 2021 17:27:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 501E460F70
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 52c4b554;
	Thu, 23 Sep 2021 17:27:03 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 667610ce
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 23 Sep 2021 17:26:59 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8CDE860F70
 for <wireguard@lists.zx2c4.com>; Thu, 23 Sep 2021 17:26:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="Iv3OLHx0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1632418015;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dxCTgNAnJyAVUPeh7QH5fJp2ukcZ3cR53v04ocvUUus=;
 b=Iv3OLHx0XW5WHaRWda91IHuTbwt1xvLXGapuyca7xHk6mBWBoUjiBVU5KLuHPuDGrzKzur
 1G1L5iAQtG0nRG8K8y67yJeoxSSgc3jl5vqMw8Dws6mrgzvd0mUEufmxKLO33fDsJqufJs
 kPSL7kPUBxsdxmTTmT5TixuccJeU5zk=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id d1b82868
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 23 Sep 2021 17:26:55 +0000 (UTC)
Received: by mail-qk1-f169.google.com with SMTP id c7so24858503qka.2
 for <wireguard@lists.zx2c4.com>; Thu, 23 Sep 2021 10:26:55 -0700 (PDT)
X-Gm-Message-State: AOAM531PJmbmAoHx2KBEyDmCrtygZv1Id0gIVPOSQ6Cyit9uFQljmumv
 4WA2QX42su65VGFaN4iqQPANSfO6gWeiUS8Khvk=
X-Google-Smtp-Source: ABdhPJzGOGQYMVhKoklmEPxCFIkP9S5+jQfFbTWVhNHGfmUSX6ccpdwk7KrjTk+inJt/cAR0b8W+89S0Um2IZdKuDAY=
X-Received: by 2002:a25:3214:: with SMTP id y20mr7175594yby.416.1632418014892; 
 Thu, 23 Sep 2021 10:26:54 -0700 (PDT)
MIME-Version: 1.0
References: <CAHmME9oKfJJfnrKeXcaHeb-oa+JZ+OgnxLVny==uSgwa5c5sKA@mail.gmail.com>
 <F238DB7D-1876-4821-ABC2-4FCF029FBB2B@anatoli.ws>
In-Reply-To: <F238DB7D-1876-4821-ABC2-4FCF029FBB2B@anatoli.ws>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 23 Sep 2021 11:26:43 -0600
X-Gmail-Original-Message-ID: <CAHmME9orYEOFa-33XvYs==XHjsUrxTn2BtOaVySwFuxS+oj+MQ@mail.gmail.com>
Message-ID: <CAHmME9orYEOFa-33XvYs==XHjsUrxTn2BtOaVySwFuxS+oj+MQ@mail.gmail.com>
Subject: Re: WireGuard Configurations Gone After iOS 15 Upgrade
To: Anatoli <me@anatoli.ws>
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

On Thu, Sep 23, 2021 at 8:42 AM Anatoli <me@anatoli.ws> wrote:
> Please let us know in this thread when the update is in the AppStore.

Indeed I will. It's been in the "waiting for review" state for about
13 hours. So hopefully that'll change somewhat soonish.

Jason
