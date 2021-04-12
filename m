Return-Path: <SRS0=b8ma=JJ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07F93C433B4
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 12 Apr 2021 17:52:49 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CBB6761241
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 12 Apr 2021 17:52:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CBB6761241
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 82a1e6b1;
	Mon, 12 Apr 2021 17:50:45 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [104.131.123.232])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 2c8e78e3
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 12 Apr 2021 17:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1618249839;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JFGrhkVaZBwYap/fKB2ciYIcRd2L8lZiUGKaa/mVkAM=;
 b=Jx4G1TZl+kInSngZX2PsByxktRauj5rS/iVWrfwrOeYr14Vuvy/kHbvZXVOiSE9VH8BsV/
 Oc5h8T3Fwp1koU0ed0+g6tc4rH7qBuIV61E6V4XmQbjla00umrYzP6/zs5KbyL/Rh7us63
 f6jAhCFacha4qtFtqyxvMFh7mrwq5Qs=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 7b7d97aa
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 12 Apr 2021 17:50:39 +0000 (UTC)
Received: by mail-yb1-f176.google.com with SMTP id l9so15161356ybm.0
 for <wireguard@lists.zx2c4.com>; Mon, 12 Apr 2021 10:50:39 -0700 (PDT)
X-Gm-Message-State: AOAM532Ra7EEEQvqzYnO80J1izY5XczspvMi3H+khWfM/51O0mdp/vlK
 sxp5QDvljLxna4r/a0SLf50/OsPVrdXqn4RcvcA=
X-Google-Smtp-Source: ABdhPJzjLwqlgq1ceFTtdPLvrBkeHTcfRrA4bkvzthJoMVzZBnm/NzeJ+15R4uv8sLtJbTwcFWO0oE+wyQWfxNF2rIE=
X-Received: by 2002:a25:cc3:: with SMTP id 186mr38817450ybm.178.1618249839037; 
 Mon, 12 Apr 2021 10:50:39 -0700 (PDT)
MIME-Version: 1.0
References: <e166447dac58ecaa73bf3f6a2b9bece6a01bf5cd.camel@infradead.org>
 <CAHmME9q-qw=sCxz6Fije+ENQTY2-GdS4bZLSakuh+6Eze4LR3w@mail.gmail.com>
 <e8f0a880ccdca6b252a5b45ebdc54f83ee3fae57.camel@infradead.org>
 <CAOw_LSFfwppgyEN12ttuFMoBpsjCzoUcr5hH5ABxzEs1FhaMpQ@mail.gmail.com>
In-Reply-To: <CAOw_LSFfwppgyEN12ttuFMoBpsjCzoUcr5hH5ABxzEs1FhaMpQ@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 12 Apr 2021 11:50:28 -0600
X-Gmail-Original-Message-ID: <CAHmME9qyfHYOjrmXeV-QKpGtF5z+ChA_Xdo8g4ufP0-OqnE0Gg@mail.gmail.com>
Message-ID: <CAHmME9qyfHYOjrmXeV-QKpGtF5z+ChA_Xdo8g4ufP0-OqnE0Gg@mail.gmail.com>
Subject: Re: Duplicate IP address, and permissions problems on Windows
To: Daniel Lenski <dlenski@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Wed, Apr 7, 2021 at 5:05 PM Daniel Lenski <dlenski@gmail.com> wrote:
>
> On Wed, Apr 7, 2021 at 1:18 AM David Woodhouse <dwmw2@infradead.org> wrot=
e:
> >
> > On Tue, 2021-04-06 at 18:17 -0600, Jason A. Donenfeld wrote:
> > > With regards to permissions, you must be Local System, which is
> > > already the case if you're running inside a service. If you'd like to
> > > run as a mere Administrator process, you can steal a token with a
> > > technique like https://git.zx2c4.com/wireguard-tools/tree/src/ipc-uap=
i-windows.h#n14
> > > or https://git.zx2c4.com/wireguard-windows/tree/elevate/doas.go#n30
> >
> > Great, thanks!
> >
> > Is there a list of precisely which operations require such privileges?
> > Is it only *creating* an adapter? Or only if doing so requires the
> > kernel driver to be loaded for the first time?
> >
>
> I'm a little confused by this. In my testing of our recent builds of
> OpenConnect on Windows 2012 R2 with wintun-0.10.2=E2=80=A6
>
> Running as Administrator *has been* sufficient to allow OpenConnect to
> open the Wintun adapters, as well as to configure them with "netsh",
> etc.
>
> Is there some additional environment we should be testing in, where
> Administrator may *not* be sufficient?

Oh, sorry, you're right. Administrator _is_ sufficient for this,
because the code I mentioned above to do automatic elevation is part
of wintun.dll. Sorry for the confusion.

Jason
