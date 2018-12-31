Return-Path: <SRS0=38ps=PI=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8B7EC43387
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 31 Dec 2018 01:49:35 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4CB8F2081B
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 31 Dec 2018 01:49:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=depau.eu header.i=@depau.eu header.b="lOW0tFjH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4CB8F2081B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=depau.eu
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9c268c39;
	Mon, 31 Dec 2018 01:46:49 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b6ad4f37
 for <wireguard@lists.zx2c4.com>;
 Mon, 31 Dec 2018 01:46:47 +0000 (UTC)
Received: from mail30.static.mailgun.info (mail30.static.mailgun.info
 [104.130.122.30])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0084f49b
 for <wireguard@lists.zx2c4.com>;
 Mon, 31 Dec 2018 01:46:47 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=depau.eu; q=dns/txt;
 s=krs; 
 t=1546220930; h=Content-Type: Cc: To: Subject: Message-ID: Date: From:
 In-Reply-To: References: MIME-Version: Sender;
 bh=JACLTjN9YCUhXh6o0qYU2Pohn+BFIzdeoqSQaNUhdLY=;
 b=lOW0tFjHsSk1G7cPSYonzBkPDRzoYR5qdNpz5tQVgEM1ikPBSYBlKusTR6Cwjih9ymhzlMRV
 75373ryy2zon/j69fdma3m4nt56rYlevvgGISBgG7E0CPOgwwQ3UTg1PggRjRetnIIHtDE0X
 ubnTxxH9NatUIGgfPAPkTt24Iwk=
X-Mailgun-Sending-Ip: 104.130.122.30
X-Mailgun-Sid: WyI1MjViMCIsICJ3aXJlZ3VhcmRAbGlzdHMuengyYzQuY29tIiwgImIwZWQyIl0=
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com
 [209.85.167.173])
 by mxa.mailgun.org with ESMTP id 5c297582.7f41bbf3e670-smtp-out-n01;
 Mon, 31 Dec 2018 01:48:50 -0000 (UTC)
Received: by mail-oi1-f173.google.com with SMTP id u18so21097590oie.10
 for <wireguard@lists.zx2c4.com>; Sun, 30 Dec 2018 17:48:50 -0800 (PST)
X-Gm-Message-State: AA+aEWY//jEcguF5+n9HlKQBdGj+/fZjnKq54EPqruebl4qcQ9YGhVfo
 CP/ayhbT5c6AgmhHFqt4EaGzfsdRhi2HSqWib1s=
X-Google-Smtp-Source: AFSGD/WVCZk57bh/p8amY4MlhDBRHcnzZK7LRQ2BTWBuCjOPU2FOPSHdM1OBA9Ip/o/72DODhhy8Sf+MinjWLcndz9U=
X-Received: by 2002:a05:6808:34e:: with SMTP id
 j14mr22579554oie.32.1546220929954; 
 Sun, 30 Dec 2018 17:48:49 -0800 (PST)
MIME-Version: 1.0
References: <CAHmME9pvcrTnbzSvAS3Q1CbPRdZMctuyBmuCyxX0wa_k+A-0tw@mail.gmail.com>
In-Reply-To: <CAHmME9pvcrTnbzSvAS3Q1CbPRdZMctuyBmuCyxX0wa_k+A-0tw@mail.gmail.com>
From: Davide Depau <davide@depau.eu>
Date: Mon, 31 Dec 2018 02:48:38 +0100
X-Gmail-Original-Message-ID: <CAMp63jVKAeieefottP=EwYMeo0daD5GDxwpT1PiPPOZQkQ6gSA@mail.gmail.com>
Message-ID: <CAMp63jVKAeieefottP=EwYMeo0daD5GDxwpT1PiPPOZQkQ6gSA@mail.gmail.com>
Subject: Re: binary module for arch?
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Christian Hesse <mail@eworm.de>,
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
Content-Type: multipart/mixed; boundary="===============3098670517303898686=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============3098670517303898686==
Content-Type: multipart/alternative; boundary="000000000000463ae3057e479dc2"

--000000000000463ae3057e479dc2
Content-Type: text/plain; charset="UTF-8"

Hi Jason,
sorry for sneaking into the conversation but I'm currently using
wireguard-dkms. I think deprecating it would be a bad idea: anyone who uses
a custom kernel cannot use the binary modules.
I'm currently using linux-hardened on my server (yeah, I run Arch Linux on
my personal server lol) and rely on the dkms package for the wireguard
module.
Binary packages should probably be preferred for those who use the default
kernels, however not everyone does.
That being said I really hope WireGuard makes it to mainline soon ;)

Regards,
Davide

On Mon, Dec 31, 2018, 1:59 AM Jason A. Donenfeld <Jason@zx2c4.com> wrote:

> Hey Christian,
>
> I noticed there are now two distro-built packages for wireguard for
> arch -- wireguard-lts and wireguard-arch. These seem probably more
> convenient for most people than the dkms one. What would you recommend
> in terms of updating wireguard.com/install/ ? And do you plan on
> depreciating the dkms one at some point, or do you think it will
> remain useful for certain users?
>
> Regards,
> Jason
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
>

--000000000000463ae3057e479dc2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jason,<div>sorry for sneaking into the conversation but I&#39;m currentl=
y using wireguard-dkms. I think deprecating it would be a bad idea: anyone =
who uses a custom kernel cannot use the binary modules.</div><div>I&#39;m c=
urrently using linux-hardened on my server (yeah, I run Arch Linux on my pe=
rsonal server lol) and rely on the dkms package for the wireguard module.</=
div><div>Binary packages should probably be preferred for those who use the=
 default kernels, however not everyone does.</div><div>That being said I re=
ally hope WireGuard makes it to mainline soon ;)</div><div><br></div><div>R=
egards,</div><div>Davide<br><br><div class=3D"gmail_quote"><div dir=3D"ltr"=
>On Mon, Dec 31, 2018, 1:59 AM Jason A. Donenfeld &lt;<a href=3D"mailto:Jas=
on@zx2c4.com">Jason@zx2c4.com</a>&gt; wrote:<br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-=
left:1ex">Hey Christian,<br>
<br>
I noticed there are now two distro-built packages for wireguard for<br>
arch -- wireguard-lts and wireguard-arch. These seem probably more<br>
convenient for most people than the dkms one. What would you recommend<br>
in terms of updating <a href=3D"http://wireguard.com/install/" rel=3D"noref=
errer" target=3D"_blank">wireguard.com/install/</a> ? And do you plan on<br=
>
depreciating the dkms one at some point, or do you think it will<br>
remain useful for certain users?<br>
<br>
Regards,<br>
Jason<br>
_______________________________________________<br>
WireGuard mailing list<br>
<a href=3D"mailto:WireGuard@lists.zx2c4.com" target=3D"_blank">WireGuard@li=
sts.zx2c4.com</a><br>
<a href=3D"https://lists.zx2c4.com/mailman/listinfo/wireguard" rel=3D"noref=
errer" target=3D"_blank">https://lists.zx2c4.com/mailman/listinfo/wireguard=
</a><br>
</blockquote></div></div>

--000000000000463ae3057e479dc2--

--===============3098670517303898686==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============3098670517303898686==--
