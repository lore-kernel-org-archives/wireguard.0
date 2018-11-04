Return-Path: <SRS0=JcDs=NP=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83D2BC32789
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  4 Nov 2018 18:07:27 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DCF082082A
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  4 Nov 2018 18:07:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aaDotx3n"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DCF082082A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e6b52567;
	Sun, 4 Nov 2018 18:03:17 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2433daa9
 for <wireguard@lists.zx2c4.com>; Sun, 4 Nov 2018 18:03:15 +0000 (UTC)
Received: from mail-vs1-xe32.google.com (mail-vs1-xe32.google.com
 [IPv6:2607:f8b0:4864:20::e32])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3bfec97a
 for <wireguard@lists.zx2c4.com>; Sun, 4 Nov 2018 18:03:15 +0000 (UTC)
Received: by mail-vs1-xe32.google.com with SMTP id y27so2001816vsi.1
 for <wireguard@lists.zx2c4.com>; Sun, 04 Nov 2018 10:07:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KC12YjRM81xNJalyXKsEgbe6YsGzT+Pu6C9J+TwOwCw=;
 b=aaDotx3nXErcf3LDVgRyltfPtL6ay2jT2EHy3I/OO7qaByyl6u2WJtf5T7gNC5cWon
 7ApEBN3r6eqqwR400CoyK86h7d45X13AhkpHzONpSEyRG2nkpQ0gqVkmiSDNtcvTWCHP
 jDmQyri5xpmHU35MRknMENE+er48Y13g+aSWWSM5epef7i8lBhJ7FAIAJznpfmnu+IRj
 nsN3cXZ9cioDK1es8O/UGDTJgZDWMZZmfg8waKEH+PwbujUkO7PaUi4mYCYfdfOHb2iU
 k2Kfi/PzKaR1wqdD0Gf2qFXLd4fFsP9y6WxMu9rxBUGgepGx3H4tK+XqTysXDvaVNHaz
 DDgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KC12YjRM81xNJalyXKsEgbe6YsGzT+Pu6C9J+TwOwCw=;
 b=Wej/WeAe+mQBDF7NWjm4FITryvEVSBXlzVNBxJQfss3DF0VeKwO4LFvH8vuHut5T8N
 nSySSMiIxarPV9/KleeOSmcOP1vizIldi+LPd7VYHf0xJPIgKPNV4WrY+EvULgTYnKX0
 nOo7GkXDKzMiAs3/FB21/AlJvB5QtohqLh369prYWFLB9EsSh7ot13O6goaDIblvrBsS
 tBQPsf29Sihsf53MHOSeFehon9QQi209WUjEoSGfWsHgCAuhio6nfcJhrpciJcBOICVC
 DSXX/4aOp4ZId6qzx4bk+SmPp5YhEb20YBYCN4V7HU6sUIdZgXmb2lzpPrOeGcgPsB7J
 vF3A==
X-Gm-Message-State: AGRZ1gIvL8qobrtYrYl/7zVaBJGDHX63yWOLNnMtL2B4gHLAblSeZcVC
 e0zsePf9nXJYr96yzgZM+l0w39Axw0s3s6vbu5s=
X-Google-Smtp-Source: AJdET5cntzunrMw3GFeN2nf4TicZdmwxIDEW/72IgmbtLQz3jQm8Sifil3RGvNwn26R/j2zzw+urALD5u2j/eAmBIwA=
X-Received: by 2002:a67:db06:: with SMTP id z6mr8122866vsj.73.1541354842633;
 Sun, 04 Nov 2018 10:07:22 -0800 (PST)
MIME-Version: 1.0
References: <CAD6UttB+_G4RY-TwyJ7w6rX-wKqqRqds0B9hMVvFPfjNHvwtgg@mail.gmail.com>
 <CANO=1yKaU=8wkaSZffR7qb3EQwHUcUWbPb6-2zLQ0YZoAkpjFQ@mail.gmail.com>
 <CAHmME9r9DGqNB=VjVxWok-n1s8vx7h70aBR1eTqYRsc1chgiOA@mail.gmail.com>
In-Reply-To: <CAHmME9r9DGqNB=VjVxWok-n1s8vx7h70aBR1eTqYRsc1chgiOA@mail.gmail.com>
From: Tushar Pankaj <tushar.s.pankaj@gmail.com>
Date: Sun, 4 Nov 2018 12:07:11 -0600
Message-ID: <CANO=1y+=QipxicjaGFefhqW0ptWS-Xtka-ZM5-g445j5NuEBUQ@mail.gmail.com>
Subject: Re: Google Play can't Download through Kernel module backend
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: love4taylor.me@gmail.com,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
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
Content-Type: multipart/mixed; boundary="===============7909531983323254631=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============7909531983323254631==
Content-Type: multipart/alternative; boundary="000000000000de3cce0579daa314"

--000000000000de3cce0579daa314
Content-Type: text/plain; charset="UTF-8"

I have experienced the issue with other HTTPS sites as well (Reddit, the
weather app, etc), not just Google Play.

Thanks,
Tushar Pankaj

On Sun, Nov 4, 2018, 11:44 Jason A. Donenfeld <Jason@zx2c4.com wrote:

> On Sun, Nov 4, 2018 at 6:21 PM Tushar Pankaj <tushar.s.pankaj@gmail.com>
> wrote:
> >
> >  when I'm connected via the kernel module, HTTPS has issues (but nothing
> else).
>
> HTTPS _in general_ or just HTTPS as used by the Play Store?
>

--000000000000de3cce0579daa314
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">I have experienced the issue with other HTTPS sites as we=
ll (Reddit, the weather app, etc), not just Google Play.<br><br><div data-s=
martmail=3D"gmail_signature">Thanks,<br>Tushar Pankaj</div></div><br><div c=
lass=3D"gmail_quote"><div dir=3D"ltr">On Sun, Nov 4, 2018, 11:44 Jason A. D=
onenfeld &lt;<a href=3D"mailto:Jason@zx2c4.com">Jason@zx2c4.com</a> wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex">On Sun, Nov 4, 2018 at 6:21 PM Tush=
ar Pankaj &lt;<a href=3D"mailto:tushar.s.pankaj@gmail.com" target=3D"_blank=
" rel=3D"noreferrer">tushar.s.pankaj@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt;=C2=A0 when I&#39;m connected via the kernel module, HTTPS has issues (=
but nothing else).<br>
<br>
HTTPS _in general_ or just HTTPS as used by the Play Store?<br>
</blockquote></div>

--000000000000de3cce0579daa314--

--===============7909531983323254631==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============7909531983323254631==--
