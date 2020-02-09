Return-Path: <SRS0=KrVi=4C=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,
	NUMERIC_HTTP_ADDR,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C612BC3F68F
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 14 Feb 2020 10:58:42 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6541B2168B
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 14 Feb 2020 10:58:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LpjHsT/Q"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6541B2168B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0a1c1a15;
	Fri, 14 Feb 2020 10:54:44 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4a21b50d
 for <WireGuard@lists.zx2c4.com>; Sun, 9 Feb 2020 05:24:40 +0000 (UTC)
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3fa207c7
 for <WireGuard@lists.zx2c4.com>; Sun, 9 Feb 2020 05:24:40 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id c26so4581377eds.8
 for <WireGuard@lists.zx2c4.com>; Sat, 08 Feb 2020 21:26:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:reply-to:from:date:message-id
 :subject:to:cc;
 bh=8UH8M6xnaslxFc+b2mgbUBOAIfArjeV1xZQDVerZ0aE=;
 b=LpjHsT/QH1hB5788MBfG/yThl8sdP4GDzUGpFQGzK9p0rXLqbVd7yIukJNVyYaU27s
 4e6imASvAtnZfS6depQ/nibFAhJWXcS4FkgJj9HdkEIzYJTmjBX0JpHjpKvd2iXnBART
 D4tWmkmb3LxY+Vn19ip8YDVwC9n92tJnxy/QMERdML2okNpTEvqx0se32zoaqH+UbDW4
 76jsujeIIeZ8T0XD5MV2LljOu+3DkChIdJLb31INaMVudx11dtmJuqtUN5qwQ7Q0qgEO
 i3ahqejJGCgEantJoCaLv5013odNwvNUf4nKwgDVLUlr0Q/M9LDPWMFxP2KK1Vdsenh+
 gxZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc;
 bh=8UH8M6xnaslxFc+b2mgbUBOAIfArjeV1xZQDVerZ0aE=;
 b=cXAcpCDjxM/3oJUOhs70s8LpiMSoxWQ7o6N7lbejvALxp4IYi0yI/tVa6neQY7QcoI
 jmLT05QYE/N5v0SfiMj7vlKmZVm1fSYNWqyd9x0Sx9qZLkTCG6AZ8nYluic+pJ5UYB1e
 6Rjb5BflYq9+iT3yCMSP/sNW/njPHG25KNCg8Hu+ShDpbiyD0ma8e+8k4KrbWUSotoV6
 zg+w3epAwILAA49JBytQup9/b6ulPKmGm5nZTbggEpVDZNYgU4lnUiHmJBEKtabosFK8
 V++IXyiPlaRT8W+6fpcODq/e6HxdWZ3Oq9/4IQBrx9C1hM8tOBl5Kvv9focYuiuSyAZk
 xQzA==
X-Gm-Message-State: APjAAAUS0iEhbwDR5FhJDWAM2cOOZNvYFhixbf1PcpmtOrbT6+UkDu1J
 zT49jJh5cE8nnzknZ10KyPMFEKnNIJWAYHrgFw==
X-Google-Smtp-Source: APXvYqyVOQWEScGAOTfZmteEHcHVey4jks1vMT/rbwqrIv2H40l1HXWlUfN/MkWJJJJyWzP93MNvTYUFQdJFu/XH9JU=
X-Received: by 2002:a17:906:13d9:: with SMTP id
 g25mr6281830ejc.185.1581225963755; 
 Sat, 08 Feb 2020 21:26:03 -0800 (PST)
MIME-Version: 1.0
References: <CAMK_KHiuWijzbna+tBpZfZm9MixXXy5iEXoVh0r3oNmrqC-Ccg@mail.gmail.com>
 <CAHmME9ocPawJ4amTG4JjcJga1EYKZUnEMoDvNSoJYvFqJbT3=g@mail.gmail.com>
In-Reply-To: <CAHmME9ocPawJ4amTG4JjcJga1EYKZUnEMoDvNSoJYvFqJbT3=g@mail.gmail.com>
From: Kunal Shah <kunalv.shah@gmail.com>
Date: Sun, 9 Feb 2020 10:55:27 +0530
Message-ID: <CAMK_KHjEwTP9v=8rB+gNRSsrUNmsUj5QNywv3L85523Vw4DG4A@mail.gmail.com>
Subject: Re: wireguard looses internet connection intermittently.
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
X-Mailman-Approved-At: Fri, 14 Feb 2020 11:54:43 +0100
Cc: WireGuard mailing list <WireGuard@lists.zx2c4.com>
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
Reply-To: kunalv.shah@gmail.com
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============2560836286708603852=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============2560836286708603852==
Content-Type: multipart/alternative; boundary="000000000000e11c21059e1ddb70"

--000000000000e11c21059e1ddb70
Content-Type: text/plain; charset="UTF-8"

Hi Jason,

Thanks for your response. After the changes you suggested, It still gives
me the same problem. Now my GCP server wireguard configuration looks like
this.

[Interface]
Address = 192.168.1.1
SaveConfig = true
PostUp = iptables -A FORWARD -i %i -j ACCEPT; iptables -A FORWARD -o %i -j
ACCEPT; iptables -t nat -A POSTROUTING -o ens4 -j MASQUERADEi;iptables -t
mangle -A POSTROUTING -p tcp --tcp-flags SYN,RST SYN -j TCPMSS
--clamp-mss-to-pmtu
PostDown = iptables -D FORWARD -i %i -j ACCEPT; iptables -D FORWARD -o %i
-j ACCEPT; iptables -t nat -D POSTROUTING -o ens4 -j MASQUERADE
ListenPort = 51840
PrivateKey = <private key>
MTU=1380

[Peer]
PublicKey = <public key>
AllowedIPs = 192.168.1.2/32

On Sun, 9 Feb 2020 at 03:06, Jason A. Donenfeld <Jason@zx2c4.com> wrote:

> GCP uses an MTU of 1460 because Google's network does weird things.
> That means the MTU for WireGuard should be 1380. On the GCP box, try
> adding `MTU=1380` to your config and add this line to PostUp: `
> ; iptables -t mangle -A POSTROUTING -p tcp --tcp-flags SYN,RST SYN -j
> TCPMSS --clamp-mss-to-pmtu`
>

--000000000000e11c21059e1ddb70
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-family:verdana,sans-serif">Hi Jason,</div><div class=3D"gmail_default" st=
yle=3D"font-family:verdana,sans-serif"><br></div><div class=3D"gmail_defaul=
t" style=3D"font-family:verdana,sans-serif">Thanks for your response. After=
 the changes you suggested, It still gives me the same problem. Now my GCP =
server wireguard configuration looks like this.</div><div class=3D"gmail_de=
fault" style=3D"font-family:verdana,sans-serif"><br></div><div class=3D"gma=
il_default" style=3D"font-family:verdana,sans-serif">[Interface]<br>Address=
 =3D 192.168.1.1<br>SaveConfig =3D true<br>PostUp =3D iptables -A FORWARD -=
i %i -j ACCEPT; iptables -A FORWARD -o %i -j ACCEPT; iptables -t nat -A POS=
TROUTING -o ens4 -j MASQUERADEi;iptables -t mangle -A POSTROUTING -p tcp --=
tcp-flags SYN,RST SYN -j TCPMSS --clamp-mss-to-pmtu<br>PostDown =3D iptable=
s -D FORWARD -i %i -j ACCEPT; iptables -D FORWARD -o %i -j ACCEPT; iptables=
 -t nat -D POSTROUTING -o ens4 -j MASQUERADE<br>ListenPort =3D 51840<br>Pri=
vateKey =3D &lt;private key&gt;<br>MTU=3D1380<br><br>[Peer]<br>PublicKey =
=3D &lt;public key&gt;<br>AllowedIPs =3D <a href=3D"http://192.168.1.2/32">=
192.168.1.2/32</a><br></div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Sun, 9 Feb 2020 at 03:06, Jason A. Donenfe=
ld &lt;<a href=3D"mailto:Jason@zx2c4.com">Jason@zx2c4.com</a>&gt; wrote:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex">GCP uses an MTU of=
 1460 because Google&#39;s network does weird things.<br>
That means the MTU for WireGuard should be 1380. On the GCP box, try<br>
adding `MTU=3D1380` to your config and add this line to PostUp: `<br>
; iptables -t mangle -A POSTROUTING -p tcp --tcp-flags SYN,RST SYN -j<br>
TCPMSS --clamp-mss-to-pmtu`<br>
</blockquote></div></div>

--000000000000e11c21059e1ddb70--

--===============2560836286708603852==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============2560836286708603852==--
