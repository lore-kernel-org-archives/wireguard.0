Return-Path: <SRS0=ZlE4=N7=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_05,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC121C433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  9 Sep 2021 08:09:33 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EB39E61139
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  9 Sep 2021 08:09:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EB39E61139
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c1264f5c;
	Thu, 9 Sep 2021 08:09:31 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id fefd5a40
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 9 Sep 2021 08:05:31 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E43F961131
 for <wireguard@lists.zx2c4.com>; Thu,  9 Sep 2021 08:05:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="R7WxdPVm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1631174728;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wG89qhLs2J+g9VFmVLebtBBJ1WMfYdUm1DXP+lG0vKk=;
 b=R7WxdPVmDYZrAu/UkTOGlPXdmZBAIVW2Sw1rzGS6Mv4+YPHA/XxCmnQpIBbCq6xX/8A62s
 0LbMWUqmf/SZJctfGcVS0nbGAik6sO9XSTcbq7KQAPh97pwRZasvUsZKOGxeTdOT6a3Fj4
 3DAoz9jy0ASP/S6D2e5fd36NP4xPpRQ=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 941a24b3
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 9 Sep 2021 08:05:28 +0000 (UTC)
Received: by mail-yb1-f176.google.com with SMTP id s16so2261311ybe.0
 for <wireguard@lists.zx2c4.com>; Thu, 09 Sep 2021 01:05:28 -0700 (PDT)
X-Gm-Message-State: AOAM533QheTo692E1L3maLg2pjVwjuU0v2ohCASt6Ue0mETBg9/6Rcyo
 Ypz440V6CbXRy6nBGLka1QymgDPEfmTfVrPT3GA=
X-Google-Smtp-Source: ABdhPJwkd1O3QxwG3g2t4aPFrf+UuEXi5evIXJPasnRS2LCIQVR4L9sj6YFjUWLpvPUtats91knJx7f9bZz6z5167Hc=
X-Received: by 2002:a5b:783:: with SMTP id b3mr2186076ybq.328.1631174727693;
 Thu, 09 Sep 2021 01:05:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210806044315.169657-1-someguy@effective-light.com>
 <OD24ZQ.IQOQXX8U0YST@effective-light.com>
 <CAHmME9oSo=4BtfO+=327n=gsor5gWcvhzAMS_BpqQ-6=6yxVRA@mail.gmail.com>
 <OD95ZQ.FW5WHNPSV04F@effective-light.com>
 <5daec7ab-a97d-819e-56cd-c45176d355ee@gmail.com>
In-Reply-To: <5daec7ab-a97d-819e-56cd-c45176d355ee@gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 9 Sep 2021 10:05:16 +0200
X-Gmail-Original-Message-ID: <CAHmME9qEAUXtZSd70sO8OzBk6Rmnib07VEbPm6GWhugE_ghdyA@mail.gmail.com>
Message-ID: <CAHmME9qEAUXtZSd70sO8OzBk6Rmnib07VEbPm6GWhugE_ghdyA@mail.gmail.com>
Subject: Re: Issues with latest Windows build
To: Peter Whisker <peter.whisker@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Thu, 09 Sep 2021 08:09:29 +0000
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

Hi Peter,

Can you describe more about your configuration, and perhaps share some
configs? As well, could you send your log and mention your operating
system version? For this to be fixed, I'll need details. I'm also
BCCing WGML to take this private.

Thanks,
Jason
