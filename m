Return-Path: <SRS0=/FJx=XG=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B2BCC49ED6
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 11 Sep 2019 16:41:17 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BE326206CD
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 11 Sep 2019 16:41:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=letnaunchyn.com header.i=@letnaunchyn.com header.b="Jz8Qo/6O"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BE326206CD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=letnaunchyn.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 24f3b3a5;
	Wed, 11 Sep 2019 16:40:39 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 999a62bb
 for <wireguard@lists.zx2c4.com>; Sat, 7 Sep 2019 00:11:56 +0000 (UTC)
Received: from mail-vk1-xa36.google.com (mail-vk1-xa36.google.com
 [IPv6:2607:f8b0:4864:20::a36])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ca71821b
 for <wireguard@lists.zx2c4.com>; Sat, 7 Sep 2019 00:11:56 +0000 (UTC)
Received: by mail-vk1-xa36.google.com with SMTP id s72so1657343vkh.5
 for <wireguard@lists.zx2c4.com>; Fri, 06 Sep 2019 17:11:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=letnaunchyn.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=w+CSz4ReXTe7Zv34wEdwaU781rC7xP52nCm0oLIy7vQ=;
 b=Jz8Qo/6OvG6S2wGoqVqkA8TN2d/fZG6m5Fkl4vMlwYsw48LTwp+fez5rOVFdUcryYG
 JL0O9oAfbYYMpuEAk9vLn/Os/ghzCCAKf5cQK31bonerd4TUzQkYTqtf2ZdMYL3ypDCE
 J3bwMzZtJRZkYnBuQkUr2Wyaja0Xg3OF3e+w4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=w+CSz4ReXTe7Zv34wEdwaU781rC7xP52nCm0oLIy7vQ=;
 b=k+Z3mSh0xOl8NKOCFG+ITq/EhvB8j2eo83sI31DOXrLpgj0pwhxkYRFiUB4bgEgW6o
 kv54HiZwFMwsJ76pXs4AY/lzh+opBhnrrRQ2ZRy4DMInXyIyk8hxYRJMfHkP+IoGF0Kf
 STEBJ9HTplwtWEBGprQDkmnF9ILcC3+HeLV9CLmT6BYidFh0PuTPJ7lWwqSJgeSUUKpj
 RzT1CIwlZXCa1Kxeg9C84jyg1cGKIdD+z82eABD2sl9TlKq0u5UBgpzZe3w06Rf8pd2A
 M+K2DwmHMZTdkvh+PB9vW1fi3/B7siqjKu8bTL/emtDqeC9QX4J6X9yhnQAfLb6iJsmA
 COFQ==
X-Gm-Message-State: APjAAAXzZtWKAgg0cV+3F4s2XcY33pXxjwlpFPZIf8RLVh2ErJN7LCU1
 LBme6wRy5pvIZ1FBaOw5Fmk5mxu7ftVQPSMeJzgKPFiKYb0=
X-Google-Smtp-Source: APXvYqyeprKc0/NAcTBRe86SSs5DigCcAs6N/x570w9kiF6ZzGGa11LksEi6daY69/apgizo2OGn+Fp1izhqMgY6wjk=
X-Received: by 2002:a1f:a4c5:: with SMTP id n188mr5927096vke.11.1567815115501; 
 Fri, 06 Sep 2019 17:11:55 -0700 (PDT)
MIME-Version: 1.0
References: <CAApLimgrYEmnRXNuOdnkPW=uihe325z5xzBAGGHZx-YB0L9CCQ@mail.gmail.com>
 <CAPk0gXqPUHS0ufEj7CEDHaf+_KDbzKW8Et8yHO3mtjR9SEUNwQ@mail.gmail.com>
 <CAHmME9pd5j1-NYc4mOz7vbwJ_805fPyO_dK8=+dB7-z0+oebOg@mail.gmail.com>
 <CAPk0gXpes_ALUUug2BJc-x_cRNPtV1kNn3T1b2WnRkv-fn7izw@mail.gmail.com>
In-Reply-To: <CAPk0gXpes_ALUUug2BJc-x_cRNPtV1kNn3T1b2WnRkv-fn7izw@mail.gmail.com>
From: Matthew Letnaunchyn <matt@letnaunchyn.com>
Date: Fri, 6 Sep 2019 19:11:43 -0500
Message-ID: <CAFF9ZB8Afvem6ecbuamwS-hRn=9_MWFMT4GD2sjgLjaM+4Q6Ew@mail.gmail.com>
Subject: Re: wireguard-android broken after update to Android 10
To: wireguard@lists.zx2c4.com
X-Mailman-Approved-At: Wed, 11 Sep 2019 18:40:39 +0200
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
Content-Type: multipart/mixed; boundary="===============7755165638739236662=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============7755165638739236662==
Content-Type: multipart/alternative; boundary="00000000000008890d0591eb6777"

--00000000000008890d0591eb6777
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I'm on a pixel 3a xl with Android 10 and have no issues either. The only
quirk is the notification shade shortcut has occasionally refused to start
the connection but starting the vpn within the app works fine. I run a
freebsd 12 and an Ubuntu 18.04 LTS server. Both work with Android 10 as
expected. I would second the recommendation to double check the private DNS
settings but am happy to help troubleshoot if I can.

Matt

On Fri, Sep 6, 2019, 5:01 PM Frederick Ding <frederick@frederickding.com>
wrote:

> That=E2=80=99s right, works for me. And I was previously on the Q betas a=
nd
> WireGuard from the Play Store continued to work.
>
> On Fri, Sep 6, 2019 at 23:59 Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
>> On Fri, Sep 6, 2019, 16:55 Frederick Ding <frederick@frederickding.com>
>> wrote:
>>
>>> Pixel 3 user here on Android 10. Have you checked
>>>
>>
>> Just to be certain: is the implication here that you have a P3+AndroidQ
>> and don't face any trouble using WireGuard?
>>
> --
> Regards,
> Frederick Ding | frederick@frederickding.com
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
>

--00000000000008890d0591eb6777
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div dir=3D"auto">I&#39;m on a pixel 3a xl with Android 1=
0 and have no issues either. The only quirk is the notification shade short=
cut has occasionally refused to start the connection but starting the vpn w=
ithin the app works fine. I run a freebsd 12 and an Ubuntu 18.04 LTS server=
. Both work with Android 10 as expected. I would second the recommendation =
to double check the private DNS settings but am happy to help troubleshoot =
if I can.=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D"auto">Matt</di=
v></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr=
">On Fri, Sep 6, 2019, 5:01 PM Frederick Ding &lt;<a href=3D"mailto:frederi=
ck@frederickding.com">frederick@frederickding.com</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px=
 #ccc solid;padding-left:1ex"><div><div dir=3D"auto">That=E2=80=99s right, =
works for me. And I was previously on the Q betas and WireGuard from the Pl=
ay Store continued to work.=C2=A0</div></div><div><br><div class=3D"gmail_q=
uote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Sep 6, 2019 at 23:59 Ja=
son A. Donenfeld &lt;<a href=3D"mailto:Jason@zx2c4.com" target=3D"_blank" r=
el=3D"noreferrer">Jason@zx2c4.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex"><div dir=3D"auto"><div class=3D"gmail_quote" dir=3D"auto"><di=
v dir=3D"ltr" class=3D"gmail_attr">On Fri, Sep 6, 2019, 16:55 Frederick Din=
g &lt;<a href=3D"mailto:frederick@frederickding.com" target=3D"_blank" rel=
=3D"noreferrer">frederick@frederickding.com</a>&gt; wrote:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex"><div dir=3D"auto"><div>Pixel 3 user here on Android=
 10. Have you checked</div></div></blockquote></div><div dir=3D"auto"><br><=
/div><div dir=3D"auto">Just to be certain: is the implication here that you=
 have a P3+AndroidQ and don&#39;t face any trouble using WireGuard?</div><d=
iv class=3D"gmail_quote" dir=3D"auto"></div></div>
</blockquote></div></div>-- <br><div dir=3D"ltr" class=3D"m_840004714712746=
3858gmail_signature" data-smartmail=3D"gmail_signature">Regards,<br>Frederi=
ck Ding | <a href=3D"mailto:frederick@frederickding.com" target=3D"_blank" =
rel=3D"noreferrer">frederick@frederickding.com</a><br></div>
_______________________________________________<br>
WireGuard mailing list<br>
<a href=3D"mailto:WireGuard@lists.zx2c4.com" target=3D"_blank" rel=3D"noref=
errer">WireGuard@lists.zx2c4.com</a><br>
<a href=3D"https://lists.zx2c4.com/mailman/listinfo/wireguard" rel=3D"noref=
errer noreferrer" target=3D"_blank">https://lists.zx2c4.com/mailman/listinf=
o/wireguard</a><br>
</blockquote></div>

--00000000000008890d0591eb6777--

--===============7755165638739236662==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============7755165638739236662==--
