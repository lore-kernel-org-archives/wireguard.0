Return-Path: <SRS0=3Rrq=4D=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C149C2BA83
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 15 Feb 2020 10:24:09 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 63DFE2083B
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 15 Feb 2020 10:24:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F3Gzr574"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 63DFE2083B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1de6ac39;
	Sat, 15 Feb 2020 10:21:27 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8f98447c
 for <wireguard@lists.zx2c4.com>;
 Sat, 15 Feb 2020 10:21:25 +0000 (UTC)
Received: from mail-ua1-x933.google.com (mail-ua1-x933.google.com
 [IPv6:2607:f8b0:4864:20::933])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fc9eebf9
 for <wireguard@lists.zx2c4.com>;
 Sat, 15 Feb 2020 10:21:25 +0000 (UTC)
Received: by mail-ua1-x933.google.com with SMTP id 59so4486562uap.12
 for <wireguard@lists.zx2c4.com>; Sat, 15 Feb 2020 02:23:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PMkOcLTc/5cl4i3SxFG6hwKsA3ZyQW5I550Qe/yNQZI=;
 b=F3Gzr5745nQO/9tXGbuR9bSnp/Yz5PZUkut1kJiEV2xI7jXkX2u54Reh/tHkcRecq8
 61pen7IlEn9hmWPdlpdw6RXqt29JPkDAa+V97Xsw99JmwnmNuyJwWvx4NE57HoUJlaOa
 Xsa5xVWCluQhT2CY/U5GkcP/eSu02Uckr0CzP3ZVLaR3wdImLGJ3FKcf5NAwuqvlQGV1
 rFybcEZKAHlw2HDQoGRg/rGr4IOcwsvjCcTkkijhHogud/HdMMt7G/jT/byBpqRKCqq7
 tJDk2cY2w1stOqkA408OtyzHZgjlziAuICo0uVnDLP0v1pL8wpnA35L7jptCqFnY/cfq
 JAtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PMkOcLTc/5cl4i3SxFG6hwKsA3ZyQW5I550Qe/yNQZI=;
 b=taNIpgrDjRY0u7H8I3TwWOspWfQeGnGLbGXWc5nV3OG7AZOVO2Tj34qF7pMdRTI9JT
 1eLBSBqcxZzcin60Ijc5yWOmipNm8yoR2FuKXCna/LgGZW0PajCSY3mJ+0kjJjK+qCNe
 bEHxPmta6DlsLDX/RTZ03XBChz4xhRYWGin/w9Y2VUTmBPKxzvW0tSsXQObh6pOILzxa
 cosCI+tADD2pLjVpiHrtTzkQhd7sX26ijNV2Wu0nCKauI2B6KeYhg7wLyTu9spGqezO0
 fTIOFV5cWM6aCQ3wR9rmpRK0bjpV9gcUHnSb1TUgTbM8r8IhG0bqhAMuaI3cZlsZ5LNh
 ezNA==
X-Gm-Message-State: APjAAAU36TQucic5dNnJEjGTfP70EH0JYZo/wSoqfsDT7wpyYAPz5RW9
 lJKeuVZ+8wuIlxoKWEHStLyqwrta5yA7gmB8zQAsXS1Z/EM=
X-Google-Smtp-Source: APXvYqzuumVMGIYszv/lqdMTCfXdLYQi8VFZCR6moLsQP0euxRyIL0UaMF7psXhGvLLXMfv5AQQNAj3fdvgreC4Qh/M=
X-Received: by 2002:ab0:248a:: with SMTP id i10mr3634484uan.108.1581762218161; 
 Sat, 15 Feb 2020 02:23:38 -0800 (PST)
MIME-Version: 1.0
References: <20200213103117.68943-1-tanioka404@gmail.com>
 <120ad97e-0dcb-6502-f097-e1368d9987cf@sholland.org>
 <CAA2ss9EDZ4qip3Rh-z_zseLr2u0+A8ePEUUBd7dnJq2RTdPmwA@mail.gmail.com>
 <851381cd-3fc0-94f9-63a1-7b69deb9a640@sholland.org>
In-Reply-To: <851381cd-3fc0-94f9-63a1-7b69deb9a640@sholland.org>
From: Eiji Tanioka <tanioka404@gmail.com>
Date: Sat, 15 Feb 2020 19:23:27 +0900
Message-ID: <CAA2ss9E2jnvA_TLhBPJTSuqBz+YoU-wUTPnYghYw+bMPpeSoWQ@mail.gmail.com>
Subject: Re: [PATCH] Add japanese translation.
To: Samuel Holland <samuel@sholland.org>
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
Content-Type: multipart/mixed; boundary="===============5138234295617555678=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============5138234295617555678==
Content-Type: multipart/alternative; boundary="00000000000021f931059e9ab7bf"

--00000000000021f931059e9ab7bf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you for applying my patch!

I'm now translating wireguard-apple into Japanese. When finished, I will
send patch.
Next time, I will not forget your advice.

Thanks,

2020=E5=B9=B42=E6=9C=8815=E6=97=A5(=E5=9C=9F) 15:14 Samuel Holland <samuel@=
sholland.org>:

> On 2/14/20 11:27 PM, Eiji Tanioka wrote:
> > Hi, Samuel.
> >
> > Thank you for your reply!
> > I re-created patch.
>
> Thanks, applied:
>
> https://git.zx2c4.com/wireguard-android/commit/?id=3D822f72df956ecd3aaa6a=
2b254e059e38ba5122e4
>

--00000000000021f931059e9ab7bf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thank you for applying my patch!<div><br></div><div>I&#39;=
m now translating wireguard-apple into Japanese. When finished, I will send=
 patch.</div><div>Next time, I will not forget your advice.</div><div><br><=
/div><div>Thanks,</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr=
" class=3D"gmail_attr">2020=E5=B9=B42=E6=9C=8815=E6=97=A5(=E5=9C=9F) 15:14 =
Samuel Holland &lt;<a href=3D"mailto:samuel@sholland.org">samuel@sholland.o=
rg</a>&gt;:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 2=
/14/20 11:27 PM, Eiji Tanioka wrote:<br>
&gt; Hi, Samuel.<br>
&gt; <br>
&gt; Thank you for your reply!<br>
&gt; I re-created patch.<br>
<br>
Thanks, applied:<br>
<a href=3D"https://git.zx2c4.com/wireguard-android/commit/?id=3D822f72df956=
ecd3aaa6a2b254e059e38ba5122e4" rel=3D"noreferrer" target=3D"_blank">https:/=
/git.zx2c4.com/wireguard-android/commit/?id=3D822f72df956ecd3aaa6a2b254e059=
e38ba5122e4</a><br>
</blockquote></div>

--00000000000021f931059e9ab7bf--

--===============5138234295617555678==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============5138234295617555678==--
