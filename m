Return-Path: <SRS0=QHSY=WV=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: *
X-Spam-Status: No, score=2.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,TVD_SUBJ_WIPE_DEBT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08838C3A5A3
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 25 Aug 2019 15:51:08 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9F3EB2080C
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 25 Aug 2019 15:51:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YznNm1aG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9F3EB2080C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 48ac8cd8;
	Sun, 25 Aug 2019 15:40:24 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c956af6b
 for <wireguard@lists.zx2c4.com>; Tue, 6 Aug 2019 13:59:18 +0000 (UTC)
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com
 [IPv6:2607:f8b0:4864:20::72e])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id dfae72cb
 for <wireguard@lists.zx2c4.com>; Tue, 6 Aug 2019 13:59:18 +0000 (UTC)
Received: by mail-qk1-x72e.google.com with SMTP id d15so62892426qkl.4
 for <wireguard@lists.zx2c4.com>; Tue, 06 Aug 2019 06:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6yuZjyxQnF9YHz6C5zTE8D9+MCIsN6qWVKydS4SfdDM=;
 b=YznNm1aGdLULJy0wL5JFQdK9LKmh9pPnm0ojvjluJyzXYpXclr1A8gzAEBwGZ+m5ar
 zWQGINAQRjU1mFjgSOMjRvebUOH2o7sCJHpYgqeMharJo6l5d+jZsVekBSx30u4B8SZV
 rILikfkA4znuZGe8v/P0kz/drIlt5zV3TQi4ieaav3qG8mbm46epGBWv+Kzu3R8AJ38B
 TVGFihcXTEQlaeUPYVouRM4V4F51lEsYqpViXH+4csDK5tAZH1GPkc7wbt3ZNp6mGnnR
 HpYRRTLlGN5eb4vMzksfoUYXFZya1sxDqwyvGXHFT0OS8uP/WHMhqgDusA4cvUtgGq3i
 7trQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6yuZjyxQnF9YHz6C5zTE8D9+MCIsN6qWVKydS4SfdDM=;
 b=fVu/R8/zl8FXNIre34vQCfwbz0TUEopbw4sgGS13tECKzlx0UCmk33GedITKlCu50Q
 nIh7e+VNNRxjWrwO6JJ2Q4nOkbQdH+ThdABlIM3bnSw33XWGXiceG5ZpVFWXUYWJ3K/O
 YYlW8g7XlXCGf/X494Ch/G7DjQwZ0bbCVfMDv4sHeLr2j0jnk4N1i0W0S9YwHDaDldA+
 KV5CBIre7WxoeQDhsX7r4F/Kg0Ed4X9Im0W35apmnu4GyG9r8VwFAMn5ioD+Y0JQ0SZO
 XyivUGtV3QyLikMCaETjHEoQTSb2OmdOIWTZaVjlR4XNWc5FL5wUK+dKR8s+M8nTsdur
 pZPQ==
X-Gm-Message-State: APjAAAUT7Vu5fcWvbOZdvXzgt7OsoL9diWggg/W7gR7tsjHSxdsIblh8
 lJL+kvvXQDQsQ/8kiqGLtx99oM2A5O1LXc5/eb8=
X-Google-Smtp-Source: APXvYqwrdihZsbYMt1k69O71IcI12w1L++EGsM6i/XFTp/DPJ3qa8pXFILfXrYlsptwKe+ISUoWcbEvRZyZhdnxlCLI=
X-Received: by 2002:ae9:eb4e:: with SMTP id b75mr3281825qkg.478.1565099957711; 
 Tue, 06 Aug 2019 06:59:17 -0700 (PDT)
MIME-Version: 1.0
References: <CADdae-jgnotykgx+XghZm39zmHcpB6Qvtw1EP9+L_DGurMUatA@mail.gmail.com>
In-Reply-To: <CADdae-jgnotykgx+XghZm39zmHcpB6Qvtw1EP9+L_DGurMUatA@mail.gmail.com>
From: Lateagain <lists.lateagain@gmail.com>
Date: Tue, 6 Aug 2019 14:59:06 +0100
Message-ID: <CAOoGP2Qr9J3DCyrz8kpQJPuHgAiGNY7rQ6FKh9SR2F_P185OmA@mail.gmail.com>
Subject: Re: Usage Add/Remove Allowed-ip
To: nicolas prochazka <prochazka.nicolas@gmail.com>
X-Mailman-Approved-At: Sun, 25 Aug 2019 17:40:17 +0200
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
Content-Type: multipart/mixed; boundary="===============8646811961892740528=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============8646811961892740528==
Content-Type: multipart/alternative; boundary="0000000000000476f6058f733bf9"

--0000000000000476f6058f733bf9
Content-Type: text/plain; charset="UTF-8"

Surely "wg set <interface> peer <peer public key> allowed-ips <ip/cidr>" is
all you nead. It will replace current setting.

On Thu, 25 Jul 2019 at 15:23, nicolas prochazka <prochazka.nicolas@gmail.com>
wrote:

> Hello,
> Is it possible to add/remove Allowed-ip in peer description without
> modify configuration file or using wg set command,
> I think about wg peer add|remove allowed-ip
>
> Regards,
> Nicolas Prochazka
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
>

--0000000000000476f6058f733bf9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Surely &quot;wg set &lt;interface&gt; peer &lt;peer public=
 key&gt; allowed-ips &lt;ip/cidr&gt;&quot; is all you nead. It will replace=
 current setting.<br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Thu, 25 Jul 2019 at 15:23, nicolas prochazka &lt;<a=
 href=3D"mailto:prochazka.nicolas@gmail.com">prochazka.nicolas@gmail.com</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hel=
lo,<br>
Is it possible to add/remove Allowed-ip in peer description without<br>
modify configuration file or using wg set command,<br>
I think about wg peer add|remove allowed-ip<br>
<br>
Regards,<br>
Nicolas Prochazka<br>
_______________________________________________<br>
WireGuard mailing list<br>
<a href=3D"mailto:WireGuard@lists.zx2c4.com" target=3D"_blank">WireGuard@li=
sts.zx2c4.com</a><br>
<a href=3D"https://lists.zx2c4.com/mailman/listinfo/wireguard" rel=3D"noref=
errer" target=3D"_blank">https://lists.zx2c4.com/mailman/listinfo/wireguard=
</a><br>
</blockquote></div>

--0000000000000476f6058f733bf9--

--===============8646811961892740528==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============8646811961892740528==--
