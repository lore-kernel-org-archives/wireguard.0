Return-Path: <SRS0=uc8W=KG=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 076D6C433ED
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 11 May 2021 13:29:36 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D5595613CD
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 11 May 2021 13:29:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D5595613CD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d2a38c12;
	Tue, 11 May 2021 13:29:32 +0000 (UTC)
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com
 [2607:f8b0:4864:20::12e])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 5b71e0de
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 11 May 2021 13:29:30 +0000 (UTC)
Received: by mail-il1-x12e.google.com with SMTP id m7so7799797ilg.9
 for <wireguard@lists.zx2c4.com>; Tue, 11 May 2021 06:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:reply-to:from:date:message-id
 :subject:to:cc;
 bh=0F9lHXOxTRqFg2yMO5GEisYfAmVEDLqR1Jdt7vY+Dg8=;
 b=SQaWcUR77DqxojNwpBN0rxJOzpIY4BabSss4MpOW8duqcYtsAyF/3zSnzZ9dxyCxDR
 vFzxPEggk+gP400WTgyg6gUrHR//L2Q6EzZFW3vkswV7CxfysLsv89RBDbWgTXK4r+/2
 zn/0g/d1TBidqtT3wdL9w1BXPZrfFtgzqIuDVARLxh302rlciJw3Xu0+3eTB2kAz6WKe
 AYRLObeShSkvb8VHrLgrRiT+wnULCl8Zl9sMSLtScyN8hzo6MOmN7YDiF3vD9O0h+wbB
 vsrX/c142RmeKeyK6gAX/+ZUV6YqMUIv730W9TqBBag5m2Btkx+00WSUu9FV3Era3UnH
 nfzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc;
 bh=0F9lHXOxTRqFg2yMO5GEisYfAmVEDLqR1Jdt7vY+Dg8=;
 b=sXrZwfh7AHe/kAvkqtlONG3xiD/qMOQbDoReEfL2fIqhgEcNZLZZ9dd3K0TQdt5L95
 HQpDdQK0ARHkkw+pgWZPbuonhnI3HazkwoloxlDKgsbIDog1PRkIntAGD16dmTjaCaB1
 RJCVyWHONDB1Fn/Z7OdMDfTwmHNb4mwuM48x2P0ERXixHT5p6FhyajpFQFrOKXBR0wVG
 E95gKJm3ynt13U/7gp6ZoWd8XAyUT/n+hWaw4pxofrs6WM5490B4XYMe90FeACzn/tMs
 f42y3Zjz9drl1KuC7qvb6s+Wj1UZreKxoWMD9BNTS2Efb0OupW3CxVGl9taz9+iXjNNL
 2unw==
X-Gm-Message-State: AOAM533xMEq00/bJK1tuDi66Cv4tchM7w1uTCt8L78BKlkeOpLCKJRMb
 j6f6Yv1KQWQh20iUHiVmN7phyLIGYfTF+uWtUiJhi8L5xxXB
X-Google-Smtp-Source: ABdhPJzq7nvP3aiWMAWDRXML+NYPKWaMyu6MWVViPOaHJwkn1N3d2rQI0ax5fY8w+fDKyUB92S0RGhDbMIuZiLtknl4=
X-Received: by 2002:a92:de11:: with SMTP id x17mr25425095ilm.42.1620739769017; 
 Tue, 11 May 2021 06:29:29 -0700 (PDT)
MIME-Version: 1.0
References: <CAGYZcps=qdWvwsed+kRY90W-7d9N09tiACRFj9yMy6OMXe9znQ@mail.gmail.com>
 <CAHmME9r6sKA=RCpCxDESVXy5zGQyPQwQJmBiDf+rzzFDHRHsQw@mail.gmail.com>
In-Reply-To: <CAHmME9r6sKA=RCpCxDESVXy5zGQyPQwQJmBiDf+rzzFDHRHsQw@mail.gmail.com>
From: Sascha Dierberg <sascha.dierberg@gmail.com>
Date: Tue, 11 May 2021 15:29:11 +0200
Message-ID: <CAGYZcpuLkrruy7Eh4QoM-mEESXCpe9dcMK3b85Z5BQpEOJdugw@mail.gmail.com>
Subject: Re: [PATCH] Windows Bindings: handler for WSAEMSGSIZE added to avoid
 stop receiving data
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
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
Reply-To: sascha@dierberg.de
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Hello Jason,

your bugfix works fine for jumbo packets but not if the Windows socket
is flooded with  " nc -u <IP-Addr:port>  < /dev/urandom ".

best regards - Sascha

Am Di., 27. Apr. 2021 um 04:10 Uhr schrieb Jason A. Donenfeld <Jason@zx2c4.com>:
>
> Thanks for the patch. That's a nice bug you found.
>
> I fixed things slightly differently, but mentioned you in the commit:
> https://git.zx2c4.com/wireguard-go/commit/?id=8246d251ea9b9cbef07082bd69280a8f988cec0c



-- 
Sascha Dierberg
Karl-Marx-Allee 61
D-10243 Berlin
mailto:sascha@dierberg.de
Phone: +49 178 3727242
Fax: +49 30 42019631
