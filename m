Return-Path: <SRS0=vJ13=EZ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06BD4C56201
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 19 Nov 2020 17:00:20 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 07082221FB
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 19 Nov 2020 17:00:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="Ms8rUa6Q"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 07082221FB
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e36a8481;
	Thu, 19 Nov 2020 16:54:56 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 01daef94
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 19 Nov 2020 16:54:53 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6ebc3ec1
 for <wireguard@lists.zx2c4.com>;
 Thu, 19 Nov 2020 16:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=54hnj8J1WVzbbfomFGGqJGvTjCs=; b=Ms8rUa
 6QJIsfVsK5KXb1JVtX4N7o5Dwt8aK0F313uH6AShmRsdBpmvZQJ7L81PfF9TIriN
 tzOwcjrxnq/PR5RxFDZEnMU97bGXqW8HTYtyJZI0c8Bd+Tc7mxLsaCTUQ0OQu2HT
 BCVczUWBjkELVVfEDTmTqSkG7z+A0UABZsHEIAqPXLGfIy0WNSFxlBgPqC7WQjl6
 oIcqpn25PXhfRviftnBsZIInfNrOaT+m27lxlVRSF1+m/DeVGcDe922mmwV6XSi5
 MVuezmqdhoQwcybC9yx1YplaplwhFN4wupqZltTc75LWfQ24vv9TZXYHfPY8vSrg
 bTFoIcoCTUHtZg/w==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 5579e6e7
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 19 Nov 2020 16:55:39 +0000 (UTC)
Received: by mail-yb1-f171.google.com with SMTP id v92so5838413ybi.4
 for <wireguard@lists.zx2c4.com>; Thu, 19 Nov 2020 08:59:46 -0800 (PST)
X-Gm-Message-State: AOAM530inkYopQlMOh/7a795iahy7C3sLnKxBsrat19YtulrxS9M/rz2
 hzkeNkNz4vTLtfXXkvD3wLG7OFewDTGacp6il0I=
X-Google-Smtp-Source: ABdhPJyWm20QI4zg/X/YQLYY6SZ2iwpkjIWR3yI8dTdhS4Hl0NYdu1g9Swbymodufjg+gizp0KbHW8ICMI1Mt9bLh7I=
X-Received: by 2002:a25:481:: with SMTP id 123mr16260844ybe.123.1605805185644; 
 Thu, 19 Nov 2020 08:59:45 -0800 (PST)
MIME-Version: 1.0
References: <CAHmME9rW1e+rRc8q+-_eLR=U9OTn+Sn84ECJtGFY=Hjg8kzfEQ@mail.gmail.com>
 <K17360-33.1605029899@spamhaus.org>
 <CAHmME9pmKxGYmxxs0pLt=zt2igy6aR-g5xsB=2Zew6oWVY0Z3w@mail.gmail.com>
 <CABtXGiCs1fS3FHAwHL1zohuL1BfDhY7GhZhtLFfiqS2aJstr3g@mail.gmail.com>
 <20201112090313.GB3500@trivini.no>
 <CAH8yC8=azrpN=EOP9XsTDe2NwmqQquSpEuqidtS2rVFw8x+5Ew@mail.gmail.com>
In-Reply-To: <CAH8yC8=azrpN=EOP9XsTDe2NwmqQquSpEuqidtS2rVFw8x+5Ew@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 19 Nov 2020 17:59:34 +0100
X-Gmail-Original-Message-ID: <CAHmME9rZHaDRRk2-c9kzhUapTRiVxybkwS2Ung_HgSCAVyOw4Q@mail.gmail.com>
Message-ID: <CAHmME9rZHaDRRk2-c9kzhUapTRiVxybkwS2Ung_HgSCAVyOw4Q@mail.gmail.com>
Subject: Re: Should we sunset Windows 7 support?
To: Jeffrey Walton <noloader@gmail.com>
Cc: =?UTF-8?Q?Berge_Schwebs_Bj=C3=B8rlo?= <berge@trivini.no>, 
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

So, the emphatic takeaway here seems to be that we're not going to
suddenly ditch 25% of people. So, the recent v0.2.y series released
has amped up support for Windows 7, including automatic detection of
KB2921916.

We'll revisit the discussion in some amount of time if the market
share seems to be decreasing.

I did notice, in the course of using Windows 7 to develop for it, that
every once in a while, the whole screen will fill up with a notice
saying WARNING, WINDOWS 7 IS EOL'D or something to that extent. We'll
see what effect that has.

Jason
