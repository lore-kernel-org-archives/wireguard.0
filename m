Return-Path: <SRS0=ArOK=NX=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D889AC43441
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 12 Nov 2018 08:17:11 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 100E722360
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 12 Nov 2018 08:17:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OZUKGKlp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 100E722360
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9b323711;
	Mon, 12 Nov 2018 08:11:48 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4ceee2b7
 for <wireguard@lists.zx2c4.com>;
 Mon, 12 Nov 2018 08:11:45 +0000 (UTC)
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com
 [IPv6:2607:f8b0:4864:20::736])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 80f38dfe
 for <wireguard@lists.zx2c4.com>;
 Mon, 12 Nov 2018 08:11:45 +0000 (UTC)
Received: by mail-qk1-x736.google.com with SMTP id w204so11853232qka.2
 for <wireguard@lists.zx2c4.com>; Mon, 12 Nov 2018 00:16:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=I+tGTAPU7b+PPeHoryDLWMe0daJTPRW2v7lcT6Wu5pE=;
 b=OZUKGKlpIJmUXkwD4FbObe5a2j1l6JjTP/Ne/yxOkiTaFUvy7F9EnGCzrGIX3zXxIY
 yZRlfeSZ1Pi1P8tzDGi3t5CrJQr3a0K/lp3Mc0x/rOdHCRoGCN5CUIC+HgnHuFEa11Ud
 ZDovKObTRsC8gM0lq5ZZDsjDRN91K84366oRZYGIoNdzc79CJ4iIsQgwA0o3OM4guakx
 LB8JKekRaTi3OEJxZ2ZbNPAJGmuRvUQVm77fKx/kI/5jAfwy6tq86N29qxaaA6vj5/xL
 B2yeW0bDGIEj0Yruw8E1/DUN6kifYuAocTis70jDjsbThdZcovgDcCgYO/+S4mSNe+WI
 sJnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=I+tGTAPU7b+PPeHoryDLWMe0daJTPRW2v7lcT6Wu5pE=;
 b=m+aTtomeiW6NQshFP/4ADWkrySpSE0gCZnIWG9qQ+b69BiG9gsLfJR7Grvnhf1gonX
 sO9Gg6QAyGbktFE/8nJuVOA9x5P6Fqg48MXLr71lStKNJNEzaQ57zBfhuGz/1uIkjVrs
 Fdier2pQO3T45NN1/zd6dzv9dTMnx2BReFo+HigHu6Z2BPPS0n1O4EowvlfrqTlBcct1
 mX09tSwKOH/ASBoE2SWBNBqLD/xCwKjJ8agZ+0YNhj0QxsPh85dEwAQ7+yz7YYbbFeJW
 yLu6nflIBXmYdq162u/Sy6sY8RMl+sCGLfvtR56zFDTDeBsbp1WzjIJnPw7a/sU/4281
 HB7w==
X-Gm-Message-State: AGRZ1gJkKqamR/uE5ahE+T0dogXLW8NU94/G6HVEKaGpK21BJUkyXKal
 V29vtOpAVbGoAVtTUy6iX5X/1gJQJ45Y2wdCRkNdYQ==
X-Google-Smtp-Source: AJdET5eOkXQAdx+iHSkDckcFnRpIy70b2x9DTcLSvGFvxYmZSBewzoBpv627X0JRHYRtTbiV0DPF+yvCmIvjUC3CRog=
X-Received: by 2002:ac8:2ccc:: with SMTP id 12mr10658534qtx.277.1542010609430; 
 Mon, 12 Nov 2018 00:16:49 -0800 (PST)
MIME-Version: 1.0
References: <CANcuY=rLL1mX2FLHgL6z2fDcrRE9pbHT50MnOcEi8TsGGWDo+w@mail.gmail.com>
 <CAHmME9p8eec+gRyh8wy2E8VdFmDenO0JdVXBaQFMNqGKoQ=KZg@mail.gmail.com>
In-Reply-To: <CAHmME9p8eec+gRyh8wy2E8VdFmDenO0JdVXBaQFMNqGKoQ=KZg@mail.gmail.com>
From: Laszlo KERTESZ <laszlo.kertesz@gmail.com>
Date: Mon, 12 Nov 2018 10:16:37 +0200
Message-ID: <CANcuY=q-bPuo7GBZS6DUA2K33YFu3k8_KM4deH2CpN1Dea8Ung@mail.gmail.com>
Subject: Re: Debian unstable Pin-Priority too high in Installation
 documentation
To: Jason@zx2c4.com
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
Content-Type: multipart/mixed; boundary="===============1362306429612565271=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============1362306429612565271==
Content-Type: multipart/alternative; boundary="0000000000009d75da057a73528d"

--0000000000009d75da057a73528d
Content-Type: text/plain; charset="UTF-8"

Hi,
Yes, it is for the webpage's install section.

On Mon, Nov 12, 2018 at 5:55 AM Jason A. Donenfeld <Jason@zx2c4.com> wrote:

> Hi Laszlo,
>
> Thanks for pointing this out. Presumably this is a suggestion for the
> pin priority listed on the install page of the webpage? Or some place
> else? I've CC'd dkg on this email to ack the change.
>
> Jason
>

--0000000000009d75da057a73528d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi,<br></div><div>Yes, it is for the webpage&#39;s in=
stall section.</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr">O=
n Mon, Nov 12, 2018 at 5:55 AM Jason A. Donenfeld &lt;<a href=3D"mailto:Jas=
on@zx2c4.com">Jason@zx2c4.com</a>&gt; wrote:<br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-=
left:1ex">Hi Laszlo,<br>
<br>
Thanks for pointing this out. Presumably this is a suggestion for the<br>
pin priority listed on the install page of the webpage? Or some place<br>
else? I&#39;ve CC&#39;d dkg on this email to ack the change.<br>
<br>
Jason<br>
</blockquote></div>

--0000000000009d75da057a73528d--

--===============1362306429612565271==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============1362306429612565271==--
