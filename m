Return-Path: <SRS0=F0uL=3T=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87E95C35240
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 30 Jan 2020 17:58:31 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EC2A1206F0
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 30 Jan 2020 17:58:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VX8n1SM6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EC2A1206F0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 92cc3b19;
	Thu, 30 Jan 2020 17:57:52 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a4fc6d7e
 for <wireguard@lists.zx2c4.com>;
 Thu, 30 Jan 2020 17:44:05 +0000 (UTC)
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 00023a79
 for <wireguard@lists.zx2c4.com>;
 Thu, 30 Jan 2020 17:44:05 +0000 (UTC)
Received: by mail-io1-xd33.google.com with SMTP id t26so4925450ioi.13
 for <wireguard@lists.zx2c4.com>; Thu, 30 Jan 2020 09:44:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mMGL9WDw34O6VPdf3dV1HVwDrERiz5F5VLhYVUZaPgE=;
 b=VX8n1SM6prOPbjiXtvvciRnTb//eP2p1lG8DeQPyloDpKa9DV/wTefYqOc+IIITT03
 zG68RAbk1pzlSEh3sz8BxHGdK8B+UwjBTcXlbAeAajc5PIlaFRVgP52N4hVC1Oi3qKzy
 lZYdWszgCvWL/n6MFkWKwSNHRxF+97GUbfszwRQbeElcfhDRUBhtS6Y8+/bQt5uhCC/R
 DjOxUg23j1s+kSXx+7wvHI/yTYN/ffGck0YIBsqRqOJYxo9nd1wTVHWNnWwohUEpDNoK
 gicPup0rflqDvXuwW4Ehl9P7G6a44Amm1l2+2YTNP3FtECf0kNuvSowiXdRNNgLC9iah
 IZdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mMGL9WDw34O6VPdf3dV1HVwDrERiz5F5VLhYVUZaPgE=;
 b=UDc7ztwuM1b6937D7zwE7aGAgvD3wB4juOa5RkXHVQyPFSpqHFo60cn0e6nwpVKmYZ
 HB1A54Fpzx7ZXlX4IIhVkH1anH1twHiOCNaViPC7nU/pwk+pkvbrdtOvn57tfVVN8qaT
 Yl38JC5urMCvKFnGJGz/vjE5ALbXXqp1eK+AXkPZU7id+/hSSQ2ADCGQ4b7p4cN9h5Ci
 UF1vlm3B2li+2ifNwqG6wjq6BHseQhv/U12nURBwyCdU8mWvIZsULmI9JF//29mUhyxG
 5k+Bi9kCO98gALCqgwBUnuTYdnBuqVs+6X5We84s9ANx8Rw4xFeCL1swJRX5MCT/t1Kp
 9gZA==
X-Gm-Message-State: APjAAAWYeI6dOJ7HvOS01oJA4PvXInDeBDoK9O8UFz04wEUCI7Pag0CN
 9FXIl60CHACCOaEc0+M5+9a4K1XcU2JFzqFaR0k=
X-Google-Smtp-Source: APXvYqyl/b4H3pnyRY4oo9pnCre3877arHhTIzurNNgi8/mfwml015pAtZpc1h4E394VAbY6q/Z3Aca5yhW0gU2Yemk=
X-Received: by 2002:a6b:e90b:: with SMTP id u11mr4840671iof.14.1580406255562; 
 Thu, 30 Jan 2020 09:44:15 -0800 (PST)
MIME-Version: 1.0
References: <20200129002159.GA9104@wolff.to>
 <b8cf1c3b-e9e6-2141-4b63-3cf11f0adaec@gmail.com>
In-Reply-To: <b8cf1c3b-e9e6-2141-4b63-3cf11f0adaec@gmail.com>
From: Erik Carlin <carlinerik@gmail.com>
Date: Thu, 30 Jan 2020 10:44:03 -0700
Message-ID: <CAHDUAmAJqoBa4UzvkYjNtORw9i3O+p9YjUNUdXJKP6xBoANmBQ@mail.gmail.com>
Subject: Re: Wireguard is now in Linus' tree
To: Germano Massullo <germano.massullo@gmail.com>
X-Mailman-Approved-At: Thu, 30 Jan 2020 18:57:50 +0100
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
Content-Type: multipart/mixed; boundary="===============5637184894173696130=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============5637184894173696130==
Content-Type: multipart/alternative; boundary="00000000000076b8a6059d5f0112"

--00000000000076b8a6059d5f0112
Content-Type: text/plain; charset="UTF-8"

This is amazing -  what a wonderful VPN solution.  Used it for a while now
- just great. Thank you.

On Thu., Jan. 30, 2020, 10:34 a.m. Germano Massullo, <
germano.massullo@gmail.com> wrote:

> Thank you guys for your work, this is an amazing news!
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
>

--00000000000076b8a6059d5f0112
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">This is amazing -=C2=A0 what a wonderful VPN solution.=C2=
=A0 Used it for a while now - just great. Thank you.=C2=A0</div><br><div cl=
ass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu., Jan. 30,=
 2020, 10:34 a.m. Germano Massullo, &lt;<a href=3D"mailto:germano.massullo@=
gmail.com">germano.massullo@gmail.com</a>&gt; wrote:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;=
padding-left:1ex">Thank you guys for your work, this is an amazing news!<br=
>
_______________________________________________<br>
WireGuard mailing list<br>
<a href=3D"mailto:WireGuard@lists.zx2c4.com" target=3D"_blank" rel=3D"noref=
errer">WireGuard@lists.zx2c4.com</a><br>
<a href=3D"https://lists.zx2c4.com/mailman/listinfo/wireguard" rel=3D"noref=
errer noreferrer" target=3D"_blank">https://lists.zx2c4.com/mailman/listinf=
o/wireguard</a><br>
</blockquote></div>

--00000000000076b8a6059d5f0112--

--===============5637184894173696130==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============5637184894173696130==--
