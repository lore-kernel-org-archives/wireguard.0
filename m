Return-Path: <SRS0=tdjr=OT=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A2A6C5CFFE
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 10 Dec 2018 22:22:38 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5F4F92082F
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 10 Dec 2018 22:22:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=archlinux-us.20150623.gappssmtp.com header.i=@archlinux-us.20150623.gappssmtp.com header.b="LXkouGlc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5F4F92082F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=archlinux.us
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 91e7ae3f;
	Mon, 10 Dec 2018 22:13:52 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7d5ec48f
 for <wireguard@lists.zx2c4.com>;
 Mon, 10 Dec 2018 22:13:50 +0000 (UTC)
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9e693f9c
 for <wireguard@lists.zx2c4.com>;
 Mon, 10 Dec 2018 22:13:50 +0000 (UTC)
Received: by mail-oi1-x22f.google.com with SMTP id h25so10425625oig.1
 for <wireguard@lists.zx2c4.com>; Mon, 10 Dec 2018 14:22:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=archlinux-us.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=468k1YxO83YJd8s2+1/RqAJEFyTMeyCneJRyWjoU0zQ=;
 b=LXkouGlcu+BvU/KRfr3CxJxecUx79q+4wvyVrAm/TAjdDySoGPAuxsIfI+mn/zwAn5
 WkYxR2sgo7GikZ4c4AkmuEHzfDjgE1I3/S9do6vvuIrKst8bISHonALfCcBO+vPV64ym
 UJjG5tdsnhZ3pMYSBKnsyJ4s+8agy3qrOMiI91wDO/KouEXD7C8UYmV+f04pmfZajOiK
 eFIyMOvcz1jz4NjaVvUUdnc+Kb/BswDdPi/NMaxvAd/vkoGaQknpZqYEc4Lw//uh5Fkm
 ynZ+hKvQj9sePZqQaj5Qg8nWP/EWOmRwRdD6ZZ7K8aKTrnIrN5y8ioxYcYvCEvGTFjdt
 j0ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=468k1YxO83YJd8s2+1/RqAJEFyTMeyCneJRyWjoU0zQ=;
 b=n/J2a+wilD09ZZXQIo7dsdqFv+13XhxdjzKoiNhTyuvNx4MSy2SADjMydDDbENazna
 jXm+rK1wBn/3LGQR3LOi6J5F2jjUbiGCXpVtd/ibW3MKPk0mwRCnG3erl+llNNGRStip
 a7yHwhfMrvi+1rtgy2Ek6zRzCj2q0stX65CBrw9RYnV7VPEP35pvNJ7+1TU0hDwuOtKC
 5wzzaheZZqmGUTH7U9gXPuz7wFNNtRjJ9Gzp+K+Sa/XHlr5hJFskL4HKZxb1N4eccNT+
 5Fwc7KVonhEgI+Nf1QPrtFqZXbXm1QSuESMIWhD0cltRSRVYq4F0WPygLJdDrZM+fi15
 Kf8g==
X-Gm-Message-State: AA+aEWZdsdEHetXPQ9by2dyduW+obD31cMXkOl1mFB7aO3K3O0fTh+Zb
 7d2UEgCadru55tuh401ceBf351UgQepydIIXicQiwg==
X-Google-Smtp-Source: AFSGD/UxHxtG+VRy+oOfjKlBfNwS20Z+z9HXkpFdp/Piz06LlCeqP2PN1CuLNtgylwLSbg7xQC0rA23SeZMdq5UxogI=
X-Received: by 2002:aca:4ed8:: with SMTP id c207mr8902392oib.276.1544480552761; 
 Mon, 10 Dec 2018 14:22:32 -0800 (PST)
MIME-Version: 1.0
References: <CAO_nJAYGman8=av2iLjnxaEMVLaH=H+392iZ6YrcxLNxTK+hkg@mail.gmail.com>
 <CAHmME9qXh9nmcscVwpiPD7+_yYMGdb-DE7W8Z1DGRHzxA--o5Q@mail.gmail.com>
In-Reply-To: <CAHmME9qXh9nmcscVwpiPD7+_yYMGdb-DE7W8Z1DGRHzxA--o5Q@mail.gmail.com>
From: John <graysky@archlinux.us>
Date: Mon, 10 Dec 2018 17:22:21 -0500
Message-ID: <CAO_nJAYdiLtqq4D3tK62JWO=JAfvzLxmyXtsecRcZ1u-X_GPnQ@mail.gmail.com>
Subject: Re: [BUG] iOS client (0.0.20181104) sometimes kills WiFi
 connections/switches to LTE
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: wireguard@lists.zx2c4.com
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

I have been banging away on the iOS app v20181104 (5) and it seems to
have corrected the two issues I reported:

1) Wifi dropping
2) Ability to select WG from settings>vpn

Great job and thank you for the attention and quick response.

Merry Christmas to you and your loved ones!
On Thu, Dec 6, 2018 at 11:22 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> Should be fixed for the next version.
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
