Return-Path: <SRS0=ZPcD=WX=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BED1C3A5A3
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 27 Aug 2019 05:42:07 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 91B27217F5
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 27 Aug 2019 05:42:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bI/HM/+4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 91B27217F5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 00292dd0;
	Tue, 27 Aug 2019 05:41:49 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 649cf31d
 for <wireguard@lists.zx2c4.com>;
 Tue, 27 Aug 2019 05:41:47 +0000 (UTC)
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bb7660b3
 for <wireguard@lists.zx2c4.com>;
 Tue, 27 Aug 2019 05:41:47 +0000 (UTC)
Received: by mail-oi1-x229.google.com with SMTP id k22so14011801oiw.11
 for <wireguard@lists.zx2c4.com>; Mon, 26 Aug 2019 22:41:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CHkpxBoKZcDKjnWJGinp3WXkL16MdHRigKKdiiVZSQY=;
 b=bI/HM/+4cKfunFDwVSHAlIIbh+75Ywjs0KUAXx2yIR9sNKYH9eHuLmeRye4hK4vAn4
 576CeYegcUZVClHAfKjuveqgEp17mbZH1AOkY58c/gePfioIRWdLFnQtD/g8OA2/5Wr3
 cY/4xXAtZQC1ev8Owe2W3xe7KloGl89NyWYP0W36R1rwvqaNv9W2eUjiLn6SZpmb8lUa
 fRLvw0wufgOcIyl2yDsMAKDn2wPPS9RvXyep3wZoGaFC37qbG9b69tWd4T5bEpV2GcLx
 EHvNJQvqF78Ev9d5Lh4fN6AvIUtBJprjTS7kmpSLWQlHLhpZ5PbnsQM6B4G6ER70+wfA
 NO5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CHkpxBoKZcDKjnWJGinp3WXkL16MdHRigKKdiiVZSQY=;
 b=SqdAp417+s4A5bZ4M2OD3jmwU8CCAerw0ZI+cgrrxtKWL6fprvwcBHdiuhpEPYdo3t
 bCrv5SGo7gBGQZtprfxzIiIk8/ZRKua9FFbUMiVeOqEqwi0H7fH/TUkCoUzFFl1OR6AY
 GeiAfqHL4xBjm+tP9uBi1QCCLoDPWovOLoqLNaOK6c/UpCs1TBPCldP3uOrevfYEF48n
 rv6d4MspMobv193uC5hq0IDeGN9o1hG/r1LhPW3sb4Obw8lxBappv0E46x90nwbBlsYh
 q0YJs4sRltBhfrkot2QDs09M8qgtYo/+K3f/V1U40PGkRde+xsPh2SRt/u9ywhryfOjp
 CP2w==
X-Gm-Message-State: APjAAAU72pE05Sb00FTWM1S+41gbILvgbAjxNix5ickRK+oi2GeL06hu
 wpc9L+x2flnhpoHJemitOQ0uf3yFrXRvZdUJX+rdg5hcnrg=
X-Google-Smtp-Source: APXvYqzzpPVaJj2nKQiFgPiajbRMOwQFNATRCp4/IYcsLaXElavObfr7dtx15QPp0n8jSjyaouubTx/E4il7RDNkldo=
X-Received: by 2002:aca:57ce:: with SMTP id
 l197mr15081624oib.121.1566884506518; 
 Mon, 26 Aug 2019 22:41:46 -0700 (PDT)
MIME-Version: 1.0
References: <CANNc_DSMxv5NhrNnKkVp+yYGEmDm48Db=8VsB_S0N4RVai1jUQ@mail.gmail.com>
 <CAHmME9rGNPRtoAhi2Y94sMk8B-Q9f++v0S8rprTpwakV+a1Jig@mail.gmail.com>
In-Reply-To: <CAHmME9rGNPRtoAhi2Y94sMk8B-Q9f++v0S8rprTpwakV+a1Jig@mail.gmail.com>
From: trulyliu <trulyliu@gmail.com>
Date: Tue, 27 Aug 2019 13:41:27 +0800
Message-ID: <CANNc_DQL+xMLT+2-W5UGUCq41hpCZHSCnuKU49s0E3WP3EQ9BQ@mail.gmail.com>
Subject: Re: Ryzen 3000 CPU soft lockup
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
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
Content-Type: multipart/mixed; boundary="===============8013755188905447818=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============8013755188905447818==
Content-Type: multipart/alternative; boundary="0000000000006a48b0059112ba80"

--0000000000006a48b0059112ba80
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

ASUS  does not follow AMD microcode release in time, the latest motherboard
bios are using two month ago AMD
microcode.
Tried CPU's microcode with kernel, didn't work either.
fortunately, found a solution from arch linux comunity.  Appending nordrand
kernel parameter in grub resolved the issue.
Hope this can be documented some where to help others.


Jason A. Donenfeld <Jason@zx2c4.com> =E4=BA=8E 2019=E5=B9=B48=E6=9C=8825=E6=
=97=A5=E5=91=A8=E6=97=A5 23:51=E5=86=99=E9=81=93=EF=BC=9A

> WireGuard uses get_random_u32 which uses rdrand. AMD shipped with a
> broken rdrand. Update your CPU's microcode or your motherboard's BIOS
> and all should be good.
>

--0000000000006a48b0059112ba80
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>ASUS=C2=A0 does not follow AMD microcode release in =
time, the latest motherboard bios are using two month ago AMD=C2=A0</div><d=
iv dir=3D"auto">microcode.</div><div dir=3D"auto">Tried CPU&#39;s microcode=
 with kernel, didn&#39;t work either.</div><div dir=3D"auto">fortunately, f=
ound a solution from arch linux comunity.=C2=A0 Appending nordrand kernel p=
arameter in grub resolved the issue.</div><div dir=3D"auto">Hope this can b=
e documented some where to help others.</div><div dir=3D"auto"><br></div><d=
iv dir=3D"auto"><br><div class=3D"gmail_quote" dir=3D"auto"><div dir=3D"ltr=
" class=3D"gmail_attr">Jason A. Donenfeld &lt;<a href=3D"mailto:Jason@zx2c4=
.com">Jason@zx2c4.com</a>&gt; =E4=BA=8E 2019=E5=B9=B48=E6=9C=8825=E6=97=A5=
=E5=91=A8=E6=97=A5 23:51=E5=86=99=E9=81=93=EF=BC=9A<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;p=
adding-left:1ex">WireGuard uses get_random_u32 which uses rdrand. AMD shipp=
ed with a<br>
broken rdrand. Update your CPU&#39;s microcode or your motherboard&#39;s BI=
OS<br>
and all should be good.<br>
</blockquote></div></div></div>

--0000000000006a48b0059112ba80--

--===============8013755188905447818==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============8013755188905447818==--
