Return-Path: <SRS0=yJRU=6U=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16C35C28CBC
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  6 May 2020 22:01:42 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A85162076D
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  6 May 2020 22:01:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="2S0VczCo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A85162076D
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 682d52ea;
	Wed, 6 May 2020 21:48:31 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id d3abce53
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 6 May 2020 21:48:28 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8b4c94b5
 for <wireguard@lists.zx2c4.com>; Wed, 6 May 2020 21:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=Q2qnHzdi0WzhjDJmrjEMQfypH8w=; b=2S0Vcz
 Co1DqXHANJOGZld2kTkX3R252oO36oioWePFJt+clZMz/nsWrKp5pg2Lg32+3fpc
 fB1W2BbisclI7I3rz/bWW689uASeFbI1bylDxdU5sHAJlRqH1m9IitXyMAe5grd8
 VxGl9qY193YF8Nb0hthiJYzi2ElAlnMGUBEL2S4k4yENoc6sG0eLf35N7laZrX63
 KJxZaUDptAGddj8lX5gdkDOAAW7HXgLxBR0Hcad47Set4Ugiy7uC+6EUHvvqIoF8
 y1UiYrvtH7NTZoN0blnUY0FTUq7ArFIs5WiXXkOLDrTvKOiUMonn4sQmSuJ+xbvG
 bvuikl3O8Sa2Vw6Q==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 14a4f027
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 6 May 2020 21:48:28 +0000 (UTC)
Received: by mail-io1-f41.google.com with SMTP id y26so3989770ioj.2
 for <wireguard@lists.zx2c4.com>; Wed, 06 May 2020 15:01:11 -0700 (PDT)
X-Gm-Message-State: AGi0PuZOYvJJcgG5acW43PNQkQhOvXPeP6ngkjewBqdY28LketVYmMX+
 RO9g+2+5vQnJRdt2wd+daZ2JPQbXMiZoY5HWgow=
X-Google-Smtp-Source: APiQypIouQuzeXrPNTKPdy0VZFdLmyUegIRsx1T2zfTh0KSMij/mKjz68jXYS4ymDngM208+EqIxJlm2U513tCipjvE=
X-Received: by 2002:a02:a68e:: with SMTP id j14mr10699835jam.86.1588802470608; 
 Wed, 06 May 2020 15:01:10 -0700 (PDT)
MIME-Version: 1.0
References: <CAKmhVkoE_fL59VJqqXoGHX_S3E9+h=KwyNchWSBrEfPHrpNyoQ@mail.gmail.com>
 <71c12e22-c7b6-9753-cc44-aac0f51592ff@pallas.us>
 <CAKmhVkrRbb_KncDjhM6gMcJRpCrK6WcB1Ed=WfVhScDHw96Gjw@mail.gmail.com>
In-Reply-To: <CAKmhVkrRbb_KncDjhM6gMcJRpCrK6WcB1Ed=WfVhScDHw96Gjw@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 6 May 2020 16:00:59 -0600
X-Gmail-Original-Message-ID: <CAHmME9qv2R1CBFAQ1xqM3eOtegLaZi=f7cfA26JS=8bGTLpPFg@mail.gmail.com>
Message-ID: <CAHmME9qv2R1CBFAQ1xqM3eOtegLaZi=f7cfA26JS=8bGTLpPFg@mail.gmail.com>
Subject: Re: WireGuard over WireGuard
To: buddybalaa@gmail.com
Cc: Derrick Lyndon Pallas <derrick@pallas.us>,
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

On Wed, May 6, 2020 at 3:37 PM Mo Balaa <buddybalaa@gmail.com> wrote:
>
> Was hoping setting them both to automatic would just work; but after
> some fiddling that appears to be the issue.
>
> What is the optimal MTU for the inner WireGuard tunnel if the outer
> one is set 1420?

1340 or 1360
