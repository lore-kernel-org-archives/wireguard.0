Return-Path: <SRS0=u0A/=QA=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03232C282C3
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 24 Jan 2019 05:14:36 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4BCFC217D7
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 24 Jan 2019 05:14:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W7L22kcS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4BCFC217D7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d906a4b7;
	Thu, 24 Jan 2019 05:09:24 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e91e909c
 for <wireguard@lists.zx2c4.com>;
 Thu, 24 Jan 2019 05:09:21 +0000 (UTC)
Received: from mail-yw1-xc33.google.com (mail-yw1-xc33.google.com
 [IPv6:2607:f8b0:4864:20::c33])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 96e11691
 for <wireguard@lists.zx2c4.com>;
 Thu, 24 Jan 2019 05:09:21 +0000 (UTC)
Received: by mail-yw1-xc33.google.com with SMTP id d190so1908566ywd.12
 for <wireguard@lists.zx2c4.com>; Wed, 23 Jan 2019 21:14:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=n9ZMMvZUvR7IZpaJVzf6bGoZAeBNWUW+ThZFLeuEQ+c=;
 b=W7L22kcSd2Trzp/UECyQf7w3hrI0EqiV6+CWAUE8zJq9rtYef8jsL/O9LBux+SzYFz
 x66IgdCqGe1uNUi9zm/vpt6kCdZkoqEkTzCPoL+bPA1mw0w1WZPE2F3QxJbunqVtqDjJ
 +DoY1z73ijqEubT15blcKawWA7Y6RvddFogBOYYndL2gOCS6x76mqS3/xruIQIACm9It
 xcbrGBDI2+64J5l5fr4oNNRgjPtQzZTI4Clz1rvLzmFsCv4P69Sx9dLGZwqY9qXVXHeU
 gKRuk2ByW69uunX5ET0ICoTcX4+pW1DGQBtVWi4AJ3VtkBoJUjCAiNWM3INzD1kXBD1u
 AiKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=n9ZMMvZUvR7IZpaJVzf6bGoZAeBNWUW+ThZFLeuEQ+c=;
 b=DGhrWPodqDCkKLohmT5TXtGbrnPa069+GLSx/22UXBr2uwvIpBSXGRDcrD/NL/nHNw
 T26TFm9OSDQ+bRs0j/uzUdQ2oupNNpavgY+RSGH5sxAfpCXa4d6uBSZI1CMAD9CAR3UH
 ae26RfHO7o5bjYFOd6g8ASm2i77qoLo9M2t1CoW+bv2UwdX5/89INP5eO/B2imBeRAtm
 l74IBmoyucP+vYlrMG5VHRYyYM421JjB8FMU0A0n7P3cyZ0eiuAun2BKbT7qra/lAgwt
 P7MH4gNr2PHyGwtPq7U09y3o1D/YVuTmvTyDFmVwWrkc7IEc/blMO6TpGZMI3vKHYe3u
 gQUA==
X-Gm-Message-State: AJcUukf38GNx9yqsUORHU5KpAOlwIVrX4X7zMXQq1+2+1JjaxeZm7HOW
 m2e5RDjQ/KO2XrifI/bcmVxdtYlc2DoI5fVKECc=
X-Google-Smtp-Source: ALg8bN4af5Gm2UMHyM8YLhUNG1PeCZQ+5Geg5DZOPccHYBqs5SknozH4aRa5AUYt/rKHPvwNGvHNs21UOQC15rlgTKk=
X-Received: by 2002:a81:728a:: with SMTP id n132mr5038930ywc.182.1548306870345; 
 Wed, 23 Jan 2019 21:14:30 -0800 (PST)
MIME-Version: 1.0
References: <c_FUpjUVAFaFWrfz97DeqRpOcM3uLdpa3ylizfNa3ceIzcB5qpDmKvKXb4VD7jfPsTUt17ji91aVxBqHXDdu0IBC4Y1xCZZXMPCyrj6GneM=@protonmail.com>
In-Reply-To: <c_FUpjUVAFaFWrfz97DeqRpOcM3uLdpa3ylizfNa3ceIzcB5qpDmKvKXb4VD7jfPsTUt17ji91aVxBqHXDdu0IBC4Y1xCZZXMPCyrj6GneM=@protonmail.com>
From: Grant Haywood <mrgranthaywood@gmail.com>
Date: Wed, 23 Jan 2019 22:14:18 -0700
Message-ID: <CAPayrd5bfuDmL+FvVxzONyKBB4UU-h0zzCOpMgdrG=+VVJA26g@mail.gmail.com>
Subject: Re: Using OPENVPN Client (UDP port 1194) on top of wireguard -
 packets corrupt
To: Allen Walker <eawalker@protonmail.com>
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
Content-Type: multipart/mixed; boundary="===============4234882145326226946=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============4234882145326226946==
Content-Type: multipart/alternative; boundary="00000000000002a53c05802d4983"

--00000000000002a53c05802d4983
Content-Type: text/plain; charset="UTF-8"

I do this all the time, not with windows and not on a router, but openvpn
over wg has never really been a problem for me

On Wed, Jan 23, 2019 at 9:01 PM Allen Walker <eawalker@protonmail.com>
wrote:

> My router is set to route everything thru my wireguard vpn. My windows
> machine (a lan client) can run openvpn client but there are issues as
> when I copy large files, specifically mp4s via scp or ftp, the files are
> inevitably corrupted. My guess is that the clients OPENVPN UDP packets
> are getting invariably corrupted when going thru the router and
> wireguard (my router routes are configured via wg-quick). Any ideas on
> how to prevent such packet corruption from the clients openvpn connection?
>
> Thanks
>
>
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
>

--00000000000002a53c05802d4983
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I do this all the time, not with windows and not on a rout=
er, but openvpn over wg has never really been a problem for me<br></div><br=
><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, J=
an 23, 2019 at 9:01 PM Allen Walker &lt;<a href=3D"mailto:eawalker@protonma=
il.com">eawalker@protonmail.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">My router is set to route everything thru =
my wireguard vpn. My windows <br>
machine (a lan client) can run openvpn client but there are issues as <br>
when I copy large files, specifically mp4s via scp or ftp, the files are <b=
r>
inevitably corrupted. My guess is that the clients OPENVPN UDP packets <br>
are getting invariably corrupted when going thru the router and <br>
wireguard (my router routes are configured via wg-quick). Any ideas on <br>
how to prevent such packet corruption from the clients openvpn connection?<=
br>
<br>
Thanks<br>
<br>
<br>
_______________________________________________<br>
WireGuard mailing list<br>
<a href=3D"mailto:WireGuard@lists.zx2c4.com" target=3D"_blank">WireGuard@li=
sts.zx2c4.com</a><br>
<a href=3D"https://lists.zx2c4.com/mailman/listinfo/wireguard" rel=3D"noref=
errer" target=3D"_blank">https://lists.zx2c4.com/mailman/listinfo/wireguard=
</a><br>
</blockquote></div>

--00000000000002a53c05802d4983--

--===============4234882145326226946==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============4234882145326226946==--
