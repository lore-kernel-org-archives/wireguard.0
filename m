Return-Path: <SRS0=23NU=3L=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BB6CC33CAF
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 22 Jan 2020 19:48:28 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D674824655
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 22 Jan 2020 19:48:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=archlinux-us.20150623.gappssmtp.com header.i=@archlinux-us.20150623.gappssmtp.com header.b="Oc+il2MJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D674824655
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=archlinux.us
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 25ad77f7;
	Wed, 22 Jan 2020 19:48:12 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 35bf8201
 for <wireguard@lists.zx2c4.com>;
 Wed, 15 Jan 2020 18:47:50 +0000 (UTC)
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id de561eeb
 for <wireguard@lists.zx2c4.com>;
 Wed, 15 Jan 2020 18:47:50 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id q10so16785194wrm.11
 for <wireguard@lists.zx2c4.com>; Wed, 15 Jan 2020 10:47:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=archlinux-us.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=pmkoqpyqS+XYSNL9Z4OCtx1N1Vt3BoBX2cv7Z4fTeEs=;
 b=Oc+il2MJG72sHCaFDvyqbUF78WlKCh0tm00fHs4cXsfCEQffbRQtLcCHsm/NTf9i1O
 B2uCnorv6+1xWVIYCA7L05SZL+WZGk1vyV8EOLMWg+4arBVoDkRswBKOmDM/9sbJt7qM
 QEnhmeYSTvTwWMnK7cakV/kA0u1Plhkp/dJV8u+IKGgfEflnYH5D8v2X3XpsLuy+85p6
 huXbZZoi09AstWqhGEATmVeDTjaOIa2zmv91HDXjmmRla9k1GNtfqcDbmg07hwvejPYK
 tvX35OaZf3eeskTBjdvSgIIcMG1CgvX85ScWjDEwtSQrQuRUji/87egbBJ3IoZQRmca3
 ZpHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=pmkoqpyqS+XYSNL9Z4OCtx1N1Vt3BoBX2cv7Z4fTeEs=;
 b=K/drnL0cscZ6i3bcBxCg5T94IqNbiF8r5LnMdZZjToQeK/pfVmI9wx+jcBFEeZU8kX
 YE5c9IXq+ubW3skbamea9S4X9D5/jILgzj6FyCMTDsBriakSPDnHuAgvMxzm8lx4iZd3
 cgkfPvWUc4EI3o8vMqSNyfh/ScNtIMEAJ+Vxs0Pt8fOBSztFW9flKRMY9mEQKcuTZZDf
 5pKz43VU7MxrohUcmB9RVMAIBBccmpY5M0gQIydOu8hrrtUplB0NabisOxuB3EeeXiYt
 4ZrL3CqBKjaSeXL24HO+iP5WlGKet9u0wj4VlMLG3k/Z6FCO7SJDG253nNueENxwAM82
 LMzA==
X-Gm-Message-State: APjAAAWC9bxpC123vdEmeyN6EftKsNbwpDibj1VgxDc961HCJRNpsZ70
 Vc3Gy63qOS4u5NJpLBT0ekbNH8Fsuv3+ZhFUEwR5Iw==
X-Google-Smtp-Source: APXvYqysCePeWXHOrJfI4v0tecGxcUiKEFJ0V8ySvBlnlGjGspjOgCI1kYsfcjdlItRsDgS6GpQL1RN+jt0hHZdZeYA=
X-Received: by 2002:adf:de84:: with SMTP id w4mr31472365wrl.97.1579114069076; 
 Wed, 15 Jan 2020 10:47:49 -0800 (PST)
MIME-Version: 1.0
References: <CAOmeisV22+6uKgX0ja+i4gnGWo5fUWhk6Je9PiFvf7itcY+3uQ@mail.gmail.com>
In-Reply-To: <CAOmeisV22+6uKgX0ja+i4gnGWo5fUWhk6Je9PiFvf7itcY+3uQ@mail.gmail.com>
From: John <graysky@archlinux.us>
Date: Wed, 15 Jan 2020 13:47:38 -0500
Message-ID: <CAO_nJAa-RFk29B8_qzTJZFA62p3qCPEYXqQHn_-5FXC6YiSM-A@mail.gmail.com>
Subject: Re: Problem with iOS WireGuard client
To: Jeff Squyres <jeff@squyres.com>
X-Mailman-Approved-At: Wed, 22 Jan 2020 20:48:08 +0100
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

Your issue sounds similar to mine linked below.  Do you find this
endless failed handshakes to be when you're connected to any network
or just a specific one?  I routinely connect to 4 networks in my
travels and only 1 of them causes the problem.

Link to my post:
https://lists.zx2c4.com/pipermail/wireguard/2020-January/004858.html

On Wed, Jan 15, 2020 at 1:31 PM Jeff Squyres <jeff@squyres.com> wrote:
>
> Over the past ~2 months, I have been experiencing an intermittent problem with the iOS WireGuard client: sometimes the WireGuard client gets into a loop of endlessly-failing handshakes, which therefore stops all traffic.  If I disconnect/reconnect the WireGuard tunnel, the handshakes succeed, and traffic starts flowing normally again.
>
> This happens multiple times a day.  It has been happening with multiple versions of iOS starting with 12.x, and now with 13.x.  WireGuard for iOS version 0.0.20191015(15), Go Backend 0.0.2019.0909.
>
> I can send more details (logs, screenshots / screencast, etc.), but first: is this the right list to ask questions about the iOS client?  If not, can someone point me in the right direction?
>
> Additionally, another oddity: when my Wireguard tunnel is connected properly and I visit whoer.net or zx2c4.com/ip, sometimes I see my WireGuard endpoint's IPv6 address, and sometimes I see my WireGuard endpoint's IPv4 address.  This happens regardless of what network my iOS device (i.e., my phone) is on.  Sometimes when the IPv6 address is shown and I refresh the page a few times (over the span of a few seconds), it switches to show the endpoint's IPv4 address.
>
> Thanks!
>
> --
> {+} Jeff Squyres
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
