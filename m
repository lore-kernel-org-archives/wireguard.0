Return-Path: <SRS0=QZLZ=PK=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 026B1C43387
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  2 Jan 2019 22:48:21 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 40EEB20856
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  2 Jan 2019 22:48:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="omaKGnXX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 40EEB20856
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 10d7bccb;
	Wed, 2 Jan 2019 22:45:52 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bdc08e08
 for <wireguard@lists.zx2c4.com>; Wed, 2 Jan 2019 22:45:50 +0000 (UTC)
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com
 [IPv6:2607:f8b0:4864:20::330])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6f8c00e7
 for <wireguard@lists.zx2c4.com>; Wed, 2 Jan 2019 22:45:50 +0000 (UTC)
Received: by mail-ot1-x330.google.com with SMTP id v23so27985395otk.9
 for <wireguard@lists.zx2c4.com>; Wed, 02 Jan 2019 14:48:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pyZSkzHAoUMrZVYAZDKmjKDVBujRKw78UVdsE+cfDiY=;
 b=omaKGnXXo5giP6ackt/7lLp9uL+bh9tN8fpKFBfv0h8EJ6pQ+SubqttEyLhDtUfOQZ
 ktMqhP65xzK+EdtTtDRuG/hOeFkPOeuBYyLM+2F7JJjvcBQlL2kJ8P5OHQhYbPx7uZZK
 YjNMzQge1qb0LwWXOzYyiKKqzW+TKDuZ0mJapvs9wVnHLcKdnMqGPFX4t5U5RGcGg1km
 XsbZevbNMEIvESkqhBBMqhrF1dVKvMsg1HLJmjxr462KoUnA/BF9NVC7wVnpG0/W3QBp
 EIHzkcfKfPK4BFFe0/PWcK4EHTagCwPXkOi+lJpdFSYeHdc/h5HYqsXytiPEKdn39njN
 1R8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pyZSkzHAoUMrZVYAZDKmjKDVBujRKw78UVdsE+cfDiY=;
 b=P0/o7cm1l5t0yhWDoEhWSfiw0KPxtPighK7YzkLeuDFQEmiE8WEu1tpDeOuh/qh64Z
 eZuWUaKUI2+okPJWjyUK7hZMntGXsZY/4tF1C6deQqXlg+B9jMopxfD6zheNYha8SYHa
 qXv9mOZjouourEQ6JlQMLpyhhe7wu1KX71g4p/BfjQ8VhrbMYNFQOvx2XKlAXxJcmYFc
 exazmp25u/lrVVNTAZq5gabRGzjCdkvwP/8+Mfu5Oeqw3QQfXgIT6Ew9LtL7l2kCef9k
 tO1lO8eT3OG0z4ceRfFQ8FOm5N1m4rDOOCpi2UaetFaQ6qs7Moa9BxMciLwgMg9JSJWG
 hNFA==
X-Gm-Message-State: AJcUukd2Iwq5qIPmNbpoTW2F/b+5rt/LATbtKjcjbZZR6fK/QJ8Q3KqH
 gMReAyNDlqF3gHEkaN/fu9DPu+P8Ba+pfxk1nnI=
X-Google-Smtp-Source: ALg8bN6YAtejBzGlqvI9vwPvwhnRwZD8OeCg2kK1vY48YVBtbOZOpt/42j8Yf/TrvSPMCJBym9SK4Sb2dhaKtflsjZo=
X-Received: by 2002:a9d:5c6:: with SMTP id 64mr32094461otd.274.1546469295476; 
 Wed, 02 Jan 2019 14:48:15 -0800 (PST)
MIME-Version: 1.0
References: <CAOAvjy2V3WBFOtKp6dKztFh3gYHwW4=sfnz_ZxtRvDM=9fwQpw@mail.gmail.com>
In-Reply-To: <CAOAvjy2V3WBFOtKp6dKztFh3gYHwW4=sfnz_ZxtRvDM=9fwQpw@mail.gmail.com>
From: Jaseem Abid <jaseemabid@gmail.com>
Date: Wed, 2 Jan 2019 22:47:39 +0000
Message-ID: <CAH-tXsCOdhhNtfW0JR3O2uGen2oLfiostQOc9NBXfuFpMfpzxw@mail.gmail.com>
Subject: Re: Google Chromecast
To: Subin Abid <subinabid@gmail.com>
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
Content-Type: multipart/mixed; boundary="===============2899587419498529150=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============2899587419498529150==
Content-Type: multipart/alternative; boundary="00000000000003546c057e817138"

--00000000000003546c057e817138
Content-Type: text/plain; charset="UTF-8"

Hi Subin,

On Wed, 2 Jan 2019 at 18:47, Subin Abid <subinabid@gmail.com> wrote:

> Hello,
>
> Android device (using Home app) cannot connect to chromecast while the
> device is connected to VPN. Is anyone else facing this problem?
>

The network settings for the peer has a checkbox 'Exclude Private IPs';
You need it enabled so that your phone and Chromecast can talk to
each other on the private network rather than going through the VPN tunnel.

Previous related thread for more info:
https://lists.zx2c4.com/pipermail/wireguard/2018-July/003107.html

-- 
Regards,

Jaseem Abid
https://twitter.com/jaseemabid

--00000000000003546c057e817138
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr">Hi Subin,=C2=A0<br><br><=
/div></div><div class=3D"gmail_quote"><div dir=3D"ltr">On Wed, 2 Jan 2019 a=
t 18:47, Subin Abid &lt;<a href=3D"mailto:subinabid@gmail.com">subinabid@gm=
ail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex"><div dir=3D"ltr"><div style=3D"font-family:arial,helvetica,sans-seri=
f">Hello,</div><div style=3D"font-family:arial,helvetica,sans-serif"><br></=
div><div style=3D"font-family:arial,helvetica,sans-serif">Android device (u=
sing Home app) cannot connect to chromecast while the device is connected t=
o VPN. Is anyone else facing this problem?</div></div></blockquote><div><br=
></div><div><div dir=3D"ltr">The network settings for the peer has a checkb=
ox &#39;Exclude Private IPs&#39;;=C2=A0</div><div dir=3D"ltr">You need it e=
nabled so that your phone and Chromecast can talk to=C2=A0</div><div dir=3D=
"ltr">each other on the private network rather than going through the VPN t=
unnel.=C2=A0</div><div dir=3D"ltr"><br>Previous related thread for more inf=
o:=C2=A0<br><a href=3D"https://lists.zx2c4.com/pipermail/wireguard/2018-Jul=
y/003107.html">https://lists.zx2c4.com/pipermail/wireguard/2018-July/003107=
.html</a></div></div><div>=C2=A0</div></div>-- <br><div dir=3D"ltr" class=
=3D"gmail_signature">Regards, <br><br>Jaseem Abid<br><a href=3D"https://twi=
tter.com/jaseemabid" target=3D"_blank">https://twitter.com/jaseemabid</a><b=
r></div></div>

--00000000000003546c057e817138--

--===============2899587419498529150==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============2899587419498529150==--
