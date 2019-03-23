Return-Path: <SRS0=gmne=R2=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67906C43381
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 23 Mar 2019 18:13:15 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A5A2E2183E
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 23 Mar 2019 18:13:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=codedev-com-au.20150623.gappssmtp.com header.i=@codedev-com-au.20150623.gappssmtp.com header.b="S1ya5bMJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A5A2E2183E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codedev.com.au
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9354276e;
	Sat, 23 Mar 2019 18:12:30 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1041e998
 for <wireguard@lists.zx2c4.com>;
 Sat, 23 Mar 2019 08:43:51 +0000 (UTC)
Received: from mail-yw1-xc32.google.com (mail-yw1-xc32.google.com
 [IPv6:2607:f8b0:4864:20::c32])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 11781b5b
 for <wireguard@lists.zx2c4.com>;
 Sat, 23 Mar 2019 08:43:51 +0000 (UTC)
Received: by mail-yw1-xc32.google.com with SMTP id j66so3594852ywc.10
 for <wireguard@lists.zx2c4.com>; Sat, 23 Mar 2019 01:44:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=codedev-com-au.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=RDFOgmTSLlt6CucAksWzJtz2ZFdcSUa+YZIsxtRW3js=;
 b=S1ya5bMJrnZ6hKArAuthD+aGwjHhSv8ZcQC+wDFiKuT6Rvhgk4o3Gnzx6E2XVgGlx1
 dPnNeVqi2rgQLVbGW1h/VUiXUn5Wi71MFw3fyf0hjM9dUo8Qp3gF0DMCASRc9jQc9GYz
 H5LOxD3ahdp+qE6znEkvaePjjvqKDcZprP8j3fMyyNo7mICNyJATRcwE/vY49PxZkQ0s
 fDPa0WMeHRRovJt3u453UXaUNw9qfqmt4xEGhzSxLVXFnngYxEMu/XlfCMspN6sfzXHx
 xtiXZy/mko6PlUwOZDEmz6UC5NdiPSTgclr/h6Q0dJcmUJpa42RHNfvJUu5iE74jUnUs
 +4tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=RDFOgmTSLlt6CucAksWzJtz2ZFdcSUa+YZIsxtRW3js=;
 b=AAKWCf5BnLt5TRHs2UiuIP9kWQp4dDfNG7zPQu5k0mvvhDsZMQJcyaxFUHWvEH6bNa
 7g0bkA5qlkhIIJuzOJMLz7NFITHY6Jo6P9LJX/bBefdg8ZJOnnre+NEErIHaViAGPZuE
 GbRTmh/flXSCEm2hEAZQNwxlUSq34TTf84N5NJmWRX7oSIi0kuIW6NfA6wL3FN4XwpBf
 9BSJeqlmdomqkKWErVtFa2gI40iMcDWNog/pvqdTx2aTYTXmf1kHBkb3+Ay0elAxglSm
 vUvAIz8GO/swtOyjR7aPLEidF4wLyLtj3q8pt7M2Dd6nByl2EccFIEObyY0T/9WodKY9
 VBdw==
X-Gm-Message-State: APjAAAVfOXcYuT+4QzW/i4TGxCwjmwVXT5RpDfIj8c6VyTAxUmSnA+eo
 6aKzOwhBRg3Fo1H1ROn6kdhyVcLZBqzHxq3cHig2jnst23DINw==
X-Google-Smtp-Source: APXvYqxxoSU0KQFmPVwtO36lwEYbRHAnyQmSRC6BwXEfOJeRDB9oDWc6GZ+Elqd3pnE2Al2P+U7n+Mf5AKnQVlT5fUw=
X-Received: by 2002:a25:b9cb:: with SMTP id y11mr11466053ybj.340.1553330670323; 
 Sat, 23 Mar 2019 01:44:30 -0700 (PDT)
MIME-Version: 1.0
References: <CAPmo8Nxysn5r_24xOuV7OrZYURCXp8i_2g9GzEeL0X1tDvE-1A@mail.gmail.com>
In-Reply-To: <CAPmo8Nxysn5r_24xOuV7OrZYURCXp8i_2g9GzEeL0X1tDvE-1A@mail.gmail.com>
From: Joshua Cameron <joshua@codedev.com.au>
Date: Sat, 23 Mar 2019 19:44:19 +1100
Message-ID: <CAPmo8Nxxj_fpLa9yS7onEv8obgYa-EakoFE4sk_yGDJER4hmgA@mail.gmail.com>
Subject: Fwd: WireGuard TODO
To: wireguard@lists.zx2c4.com
X-Mailman-Approved-At: Sat, 23 Mar 2019 19:12:29 +0100
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
Content-Type: multipart/mixed; boundary="===============3815472869537020782=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============3815472869537020782==
Content-Type: multipart/alternative; boundary="000000000000d2eb930584befa3f"

--000000000000d2eb930584befa3f
Content-Type: text/plain; charset="UTF-8"

Hey guys,

Not sure where it would be best to post this?

Cheers!

---------- Forwarded message ---------
From: Joshua Cameron <joshua@codedev.com.au>
Date: Sat, Mar 23, 2019 at 12:41 AM
Subject: WireGuard TODO
To: <jason@zx2c4.com>


Hey Jason,

My name is Joshua and I'm a software developer living/working in Sydney
Australia.
I've come across your WireGuard project this week, read the whitepaper,
watched the Linux Plumbers presentation, and read some of the relevant
Linux mailing list archives.

I've become very interested in your project and I'd love to find a way to
contribute my free time. My own programming interests include high
throughput/low latency processing, so I'd like to suggest myself as someone
to look into two of the TODO's from your site, CPU Auto Scaling and packet
locality.

Was there someone already looking at that? I'd love to have a chat about
your thoughts for it.

Thanks for your consideration, hoping to be a part of the project.

Cheers mate,
Joshua Cameron

--000000000000d2eb930584befa3f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hey guys,<div><br></div><div>Not sure where it would be be=
st to post this?</div><div><br></div><div>Cheers!</div><br><div class=3D"gm=
ail_quote"><div dir=3D"ltr" class=3D"gmail_attr">---------- Forwarded messa=
ge ---------<br>From: <strong class=3D"gmail_sendername" dir=3D"auto">Joshu=
a Cameron</strong> <span dir=3D"ltr">&lt;<a href=3D"mailto:joshua@codedev.c=
om.au">joshua@codedev.com.au</a>&gt;</span><br>Date: Sat, Mar 23, 2019 at 1=
2:41 AM<br>Subject: WireGuard TODO<br>To:  &lt;<a href=3D"mailto:jason@zx2c=
4.com">jason@zx2c4.com</a>&gt;<br></div><br><br><div dir=3D"ltr">Hey Jason,=
<div><br></div><div>My name is Joshua and I&#39;m a software developer livi=
ng/working in Sydney Australia.</div><div>I&#39;ve come across your WireGua=
rd project this week, read the whitepaper, watched the Linux Plumbers prese=
ntation, and read some of the relevant Linux mailing list archives.</div><d=
iv><br></div><div>I&#39;ve become very interested in your project and I&#39=
;d love to find a way to contribute my free time. My own programming intere=
sts include high throughput/low latency processing, so I&#39;d like to sugg=
est myself as someone to look into two of the TODO&#39;s from your site, CP=
U Auto Scaling and packet locality.</div><div><br></div><div>Was there some=
one already looking at that? I&#39;d love to have a chat about your thought=
s for it.</div><div><br></div><div>Thanks for your consideration, hoping to=
 be a part of the project.</div><div><br></div><div>Cheers mate,</div><div>=
Joshua Cameron</div></div>
</div></div>

--000000000000d2eb930584befa3f--

--===============3815472869537020782==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============3815472869537020782==--
