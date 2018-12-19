Return-Path: <SRS0=G6+c=O4=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F18CC43387
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 19 Dec 2018 18:01:14 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D7D28218AE
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 19 Dec 2018 18:01:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dBL1noxt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D7D28218AE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e2b881e0;
	Wed, 19 Dec 2018 18:00:19 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4bef3b5c
 for <wireguard@lists.zx2c4.com>;
 Wed, 19 Dec 2018 18:00:16 +0000 (UTC)
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [IPv6:2607:f8b0:4864:20::335])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 17be16b2
 for <wireguard@lists.zx2c4.com>;
 Wed, 19 Dec 2018 18:00:16 +0000 (UTC)
Received: by mail-ot1-x335.google.com with SMTP id 40so19931121oth.4
 for <wireguard@lists.zx2c4.com>; Wed, 19 Dec 2018 10:00:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:reply-to:from:date:message-id
 :subject:to:cc;
 bh=fUD/sCetzdrb6Li6BUlTdk130vEhk0BY8fV/9tjMEKE=;
 b=dBL1noxtjfhWGumXANUKRbfNXIR8rvqd0/HHBZP33ljIT2WERXsjm3rXOIzoLOjYrI
 CNhQcOw340Sz9mr1IU7Z20pJ6I8yhzug3s1RwuO3ZCGxcG61CCTabINBDZs3gzihOfwT
 x0vTO37NVSPRLEVmvVzfGhWeaQFS/TsxC6l8DLTuy9z0hvq2qVnnkqauai54Jx9ag+tv
 o2HWkqVcIXaD+KoRzvrPp64L2ISDoEU/QRMO9OOdQ16LNp3HkvVyKNqGbauybcVBKpmb
 U/SxQ0+ttpsp1OkFBgNzFr9LKCFl1iZPbGFr3Bld3q6kFdDsurfcyvD2FV++Xi6qGzvm
 UxXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc;
 bh=fUD/sCetzdrb6Li6BUlTdk130vEhk0BY8fV/9tjMEKE=;
 b=LjjkczjsWq2iHdb5HQxDrbZB1uEsHfzgWPLcPpk5nhcpDWfvCS+zxE5LHetpDxer3R
 9idny8h5qthfZQSl83uzMKXtsK2G6F+x3MF88He54ghE2Re5w/HuQlNp8MMOPt+jVota
 /WTlmRNRkWcGhbzDEljnnYhiPwe3aZpmCTfB5dLV2Xn9Rr2y3ZKt3KKg7kLstJA1Y2IX
 EPYe8iSOxGnLwPfswUBxLB96qpV0z7QLkIEo7W0eDDq2PNbFO/4xSx7XvY7jNeSRZvDP
 q+bNdFzJVg3/1l9BE5r7gmHe1ZS304bPRkGzeyU1fKsalgEADoTbtkD76LYaFlkqCQur
 56rw==
X-Gm-Message-State: AA+aEWZU8W8rihaAOb8LfIAU6JVtFWL04NgbmPpr0TFn8kNChYXoxbyC
 ZjqBdYr6aI/XPOvrzDAFGWWAEoL/OQ0UTYo7A7k=
X-Google-Smtp-Source: AFSGD/XUy/JF9pW+j9DhXHWnvZBcAxLnmttLaYjkWsszHl3ZichBQJOv09qDfkIqKpwRqvc6rjfxF0lpYPfCa6mI8FE=
X-Received: by 2002:a9d:837:: with SMTP id 52mr14950937oty.143.1545242451330; 
 Wed, 19 Dec 2018 10:00:51 -0800 (PST)
MIME-Version: 1.0
References: <CAO_nJAZ_qg30m8bEKwXjrrjKh1Y+zVuB3+5+_PgwZdD6DgAQ5A@mail.gmail.com>
In-Reply-To: <CAO_nJAZ_qg30m8bEKwXjrrjKh1Y+zVuB3+5+_PgwZdD6DgAQ5A@mail.gmail.com>
From: "Jason A. Donenfeld" <jason.donenfeld@gmail.com>
Date: Wed, 19 Dec 2018 19:00:39 +0100
Message-ID: <CAHmME9qT-93Sv+QbaBKTuXFM6hiway99-WqJ6n-7YZrPFDZq6A@mail.gmail.com>
Subject: Re: iOS app available in Test Flight is still 0.0.20181104-6
To: member graysky <graysky@archlinux.us>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
Reply-To: Jason@zx2c4.com
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============5525989089359270294=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============5525989089359270294==
Content-Type: multipart/alternative; boundary="000000000000674d3e057d63cb3e"

--000000000000674d3e057d63cb3e
Content-Type: text/plain; charset="UTF-8"

Apple's review process can take some time. Sit tight.

Jason

On Wed, Dec 19, 2018, 13:35 John <graysky@archlinux.us wrote:

> I see that 0.0.20181104-7 was tagged a few days ago, but the only
> 0.0.20181104-6 is offered by Test Flight.  Is there something that
> needs to be done or is this expected?  Thanks!
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
>

--000000000000674d3e057d63cb3e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Apple&#39;s review process can take some time. Sit tight.=
<div dir=3D"auto"><br></div><div dir=3D"auto">Jason</div></div><br><div cla=
ss=3D"gmail_quote"><div dir=3D"ltr">On Wed, Dec 19, 2018, 13:35 John &lt;<a=
 href=3D"mailto:graysky@archlinux.us">graysky@archlinux.us</a> wrote:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex">I see that 0.0.20181104-7 was tagged a f=
ew days ago, but the only<br>
0.0.20181104-6 is offered by Test Flight.=C2=A0 Is there something that<br>
needs to be done or is this expected?=C2=A0 Thanks!<br>
_______________________________________________<br>
WireGuard mailing list<br>
<a href=3D"mailto:WireGuard@lists.zx2c4.com" target=3D"_blank" rel=3D"noref=
errer">WireGuard@lists.zx2c4.com</a><br>
<a href=3D"https://lists.zx2c4.com/mailman/listinfo/wireguard" rel=3D"noref=
errer noreferrer" target=3D"_blank">https://lists.zx2c4.com/mailman/listinf=
o/wireguard</a><br>
</blockquote></div>

--000000000000674d3e057d63cb3e--

--===============5525989089359270294==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============5525989089359270294==--
