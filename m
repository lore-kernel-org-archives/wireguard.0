Return-Path: <SRS0=RmRV=3X=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B050BC3F68F
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  3 Feb 2020 17:35:28 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5BB802087E
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  3 Feb 2020 17:35:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bHaubxYp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5BB802087E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d5e81299;
	Mon, 3 Feb 2020 17:34:05 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5dc9e022
 for <WireGuard@lists.zx2c4.com>;
 Thu, 30 Jan 2020 21:22:59 +0000 (UTC)
Received: from mail-yw1-xc35.google.com (mail-yw1-xc35.google.com
 [IPv6:2607:f8b0:4864:20::c35])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d51434f6
 for <WireGuard@lists.zx2c4.com>;
 Thu, 30 Jan 2020 21:22:59 +0000 (UTC)
Received: by mail-yw1-xc35.google.com with SMTP id 10so2753127ywv.5
 for <WireGuard@lists.zx2c4.com>; Thu, 30 Jan 2020 13:23:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=jZCBNpAfISS2Yx7jfBZ91Svc/bCce47TzweB0c1mDhI=;
 b=bHaubxYparzS9tGH6BMDdBZRkJ/DPlFfLytlD84UqbJLuOoCX4QTtnuVLwAUVVSNIp
 efKcQMKAn9VJG68IauTYGA+c+KasQGdZYBLjVGSHW68PQx2v9UhJwlFwi6I0pIfDl/lB
 +yBdzACnqlTZwVgr/wbYCnopNWJWic00ingBA5yAzclhIFAI0kMBh39p6IjqANS1khTj
 YevhOHz1Wm0mnh9pxSyLUtCZGWElpeQ1/yRT8CpHUmoi1jTU3qEGmqrmFMm3vLlvNnC4
 /A8BniQyOQZBlFSuxZeUqC9rU+zeb/jTidLDKtSQzUhmeg5OM5qSAFTKqD4wxGgYzbno
 Jngw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=jZCBNpAfISS2Yx7jfBZ91Svc/bCce47TzweB0c1mDhI=;
 b=aBedux5FGGbTEyyDAevUu8ZVHoNM1DPziffuKildYcElqB9rt6rnfY8YAyuN30hfzi
 xwFND2gY9T38LY+u9mwhXy/7Uv7qNgXUIn8qIbahnr0abHfiJ0/Lose3r3ZtpvrV3yg1
 4Fcbgo0q84v8up2CL66fA7SyX5KzGMze0nV/TL+zu197YZoJI55FJipf7gGDg0F8tCLh
 NruEVjYDBf0Mg8M/ucjE4X1R8sl8EnGHr/ZRqWKvNiZ9Iq4yJf0VT25WmZ7TkcLWXEqt
 9vH/pqeQQQLchCZV4ty7FbKfvDM7+kp3VYWjK/1gQbpMF/iJBJntrQMqlxWXRSbM3+IF
 8pwg==
X-Gm-Message-State: APjAAAUPbOxCvOfe2snA0BTXmTSS4gHCpwh6wS1t29EFZd1P7VPrGr+t
 +dgm0gXyUhrH45Xmx6U0geOeo3itS/6TxmZeOeUFBQ==
X-Google-Smtp-Source: APXvYqxBpxluE7twLfo9IXZW5RlWRzCDMbRDPCR45gsLqnfruqvlK3fpyaJY1jZt0RfF4AeIdNNwJjjK55LkzqKcfc8=
X-Received: by 2002:a81:47c3:: with SMTP id u186mr4889453ywa.40.1580419390598; 
 Thu, 30 Jan 2020 13:23:10 -0800 (PST)
MIME-Version: 1.0
References: <20200129002159.GA9104@wolff.to>
In-Reply-To: <20200129002159.GA9104@wolff.to>
From: Jakub Juraszek <jakub.juraszek@gmail.com>
Date: Thu, 30 Jan 2020 22:22:58 +0100
Message-ID: <CAGCDWLuOx9DOxRC6njt2z=9NX3-zkW2mkV=VTvLYRhHhu7RWZg@mail.gmail.com>
Subject: Re: Wireguard is now in Linus' tree
To: WireGuard@lists.zx2c4.com
X-Mailman-Approved-At: Mon, 03 Feb 2020 18:34:03 +0100
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
Content-Type: multipart/mixed; boundary="===============8378848017587849744=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============8378848017587849744==
Content-Type: multipart/alternative; boundary="0000000000005f714a059d6210d7"

--0000000000005f714a059d6210d7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This is fantastic news! =F0=9F=A5=82 Great job and a huge thanks for all co=
ntributors.

=C5=9Br., 29 sty 2020, 01:37 u=C5=BCytkownik Bruno Wolff III <bruno@wolff.t=
o> napisa=C5=82:

> Linus pulled in net-next about a half hour ago. So WireGuard is now
> officially upstream. Yeah!
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
>

--0000000000005f714a059d6210d7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div dir=3D"auto"></div>This is fantastic news! =F0=9F=A5=
=82 Great job and a huge thanks for all contributors.<div dir=3D"auto"><br>=
<div class=3D"gmail_quote" dir=3D"auto"><div dir=3D"ltr" class=3D"gmail_att=
r">=C5=9Br., 29 sty 2020, 01:37 u=C5=BCytkownik Bruno Wolff III &lt;<a href=
=3D"mailto:bruno@wolff.to" rel=3D"noreferrer noreferrer noreferrer" target=
=3D"_blank">bruno@wolff.to</a>&gt; napisa=C5=82:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">Linus pulled in net-next about a half hour ago. So WireGuard =
is now <br>
officially upstream. Yeah!<br>
_______________________________________________<br>
WireGuard mailing list<br>
<a href=3D"mailto:WireGuard@lists.zx2c4.com" rel=3D"noreferrer noreferrer n=
oreferrer noreferrer" target=3D"_blank">WireGuard@lists.zx2c4.com</a><br>
<a href=3D"https://lists.zx2c4.com/mailman/listinfo/wireguard" rel=3D"noref=
errer noreferrer noreferrer noreferrer noreferrer" target=3D"_blank">https:=
//lists.zx2c4.com/mailman/listinfo/wireguard</a><br>
</blockquote></div></div></div>

--0000000000005f714a059d6210d7--

--===============8378848017587849744==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============8378848017587849744==--
