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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 467E4C3B196
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 14 Feb 2020 10:58:43 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E0B162168B
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 14 Feb 2020 10:58:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pRgSBe+/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E0B162168B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 312e60c1;
	Fri, 14 Feb 2020 10:54:45 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 10ec7032
 for <WireGuard@lists.zx2c4.com>; Sun, 9 Feb 2020 06:46:57 +0000 (UTC)
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2561caec
 for <WireGuard@lists.zx2c4.com>; Sun, 9 Feb 2020 06:46:57 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id r21so4804753edq.0
 for <WireGuard@lists.zx2c4.com>; Sat, 08 Feb 2020 22:48:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:reply-to:from:date:message-id
 :subject:to:cc;
 bh=oawjTX1xGZpQ1O92h4r3FJnjezF9upzV9V8kpX4RUxY=;
 b=pRgSBe+/nB9c02QzMRxSkvUQ31JmZBgR5zYUon0XWTHvnOcCL9+od6HVSQ0jOYYE3I
 r6+oncus3v4P4OKFurZNRHqA/pActhkxjip7b3A6tH9kwxR+CJpLVyz8ZYKxKzFmwfqt
 QN/lkgkYH+To+4EGPStU3ixSeSeYVDLeqR3+0gSpvfD5Sthm2iw8ycB6AEdHs2SNXfNl
 gHdTtfz0MC/5LSizKX0trQbi16EI+Z4FZYe9grWx2T/LiTQ9THLoA0EB6gLFBJziYbco
 0x6tj3aAaLaMl0l6ZWwF/eEO+herpEJMk0mfDSvT8ITSdmAQpAPTefj3SdkPzLSXvv3T
 ecCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc;
 bh=oawjTX1xGZpQ1O92h4r3FJnjezF9upzV9V8kpX4RUxY=;
 b=WFzLMErjrak2kNWJBRGyD8vU6TDCM1NLMbNH3K7M8kk8XcmCBYodZ2btKhSPYGaUFA
 eEKj9SAEmYCn6VqvLoEIAEMbzxM9/VguPHqpce8vfuLMjoJeWu0H68Pq3klnPerVs73Z
 ohKfOAc7aFEsW7vFZta/lg6Xotp6B+8M6t4TcycEOuZXUUl4ObEnjYNgj1qLPnq5IrwE
 Kd4G7yR41FUYEP5ta7sUBniUcOdkW8E2JnApzZYXQK3NbZ1n8WjkCWSrQ5eQdZYCh9pV
 I1FZOtJ9DnOo5ShTXPEXYQlwEHLcEEUTwPskGlJKyQX1GbxmR/VCni29+9kOlXek3u+F
 TOqQ==
X-Gm-Message-State: APjAAAVg247MPLWVcF9vVJpN8BndW/g40NpB5jHQ1HaJnCywVlJaWSNA
 7sabwS1WVfXj5ZGfxBlYQVaQ4X4IqOthJ3DoZzBmHd0Ov15o
X-Google-Smtp-Source: APXvYqwQxN9TxFp+iCcXURVdeKDApFYKsZ4O7hHsZ9/2adKi0wPx+FHTovvYbxMsPAbBCWoP0Z6Nf1uPX60ELdLWd9A=
X-Received: by 2002:a05:6402:1659:: with SMTP id
 s25mr5394053edx.219.1581230900824; 
 Sat, 08 Feb 2020 22:48:20 -0800 (PST)
MIME-Version: 1.0
References: <CAMK_KHiuWijzbna+tBpZfZm9MixXXy5iEXoVh0r3oNmrqC-Ccg@mail.gmail.com>
 <CAHmME9ocPawJ4amTG4JjcJga1EYKZUnEMoDvNSoJYvFqJbT3=g@mail.gmail.com>
 <CAMK_KHjEwTP9v=8rB+gNRSsrUNmsUj5QNywv3L85523Vw4DG4A@mail.gmail.com>
In-Reply-To: <CAMK_KHjEwTP9v=8rB+gNRSsrUNmsUj5QNywv3L85523Vw4DG4A@mail.gmail.com>
From: Kunal Shah <kunalv.shah@gmail.com>
Date: Sun, 9 Feb 2020 12:17:44 +0530
Message-ID: <CAMK_KHiOOczxThE63G2fSFQCYfsWvwQ5CLJDofoJNm0dUJdcNw@mail.gmail.com>
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
Content-Type: multipart/mixed; boundary="===============5056959189650746624=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============5056959189650746624==
Content-Type: multipart/alternative; boundary="00000000000026d02f059e1f02c0"

--00000000000026d02f059e1f02c0
Content-Type: text/plain; charset="UTF-8"

I think I found the problem, there is a typo in my iptable command. While
editing with vi, I may have added additional i in the end of MASQUERADE. I
removed it and restarted it. Now I am monitoring for issues.

On Sun, 9 Feb 2020 at 10:55, Kunal Shah <kunalv.shah@gmail.com> wrote:

> Hi Jason,
>
> Thanks for your response. After the changes you suggested, It still gives
> me the same problem. Now my GCP server wireguard configuration looks like
> this.
>
> [Interface]
> Address = 192.168.1.1
> SaveConfig = true
> PostUp = iptables -A FORWARD -i %i -j ACCEPT; iptables -A FORWARD -o %i -j
> ACCEPT; iptables -t nat -A POSTROUTING -o ens4 -j MASQUERADEi;iptables -t
> mangle -A POSTROUTING -p tcp --tcp-flags SYN,RST SYN -j TCPMSS
> --clamp-mss-to-pmtu
> PostDown = iptables -D FORWARD -i %i -j ACCEPT; iptables -D FORWARD -o %i
> -j ACCEPT; iptables -t nat -D POSTROUTING -o ens4 -j MASQUERADE
> ListenPort = 51840
> PrivateKey = <private key>
> MTU=1380
>
> [Peer]
> PublicKey = <public key>
> AllowedIPs = 192.168.1.2/32
>
> On Sun, 9 Feb 2020 at 03:06, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
>> GCP uses an MTU of 1460 because Google's network does weird things.
>> That means the MTU for WireGuard should be 1380. On the GCP box, try
>> adding `MTU=1380` to your config and add this line to PostUp: `
>> ; iptables -t mangle -A POSTROUTING -p tcp --tcp-flags SYN,RST SYN -j
>> TCPMSS --clamp-mss-to-pmtu`
>>
>

--00000000000026d02f059e1f02c0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-family:verdana,sans-serif">I think I found the problem, there is a typo i=
n my iptable command. While editing with vi, I may have added additional=C2=
=A0i in the end of=C2=A0MASQUERADE. I removed it and restarted it. Now I am=
 monitoring for issues.</div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Sun, 9 Feb 2020 at 10:55, Kunal Shah &lt;<=
a href=3D"mailto:kunalv.shah@gmail.com">kunalv.shah@gmail.com</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"lt=
r"><div dir=3D"ltr"><div style=3D"font-family:verdana,sans-serif">Hi Jason,=
</div><div style=3D"font-family:verdana,sans-serif"><br></div><div style=3D=
"font-family:verdana,sans-serif">Thanks for your response. After the change=
s you suggested, It still gives me the same problem. Now my GCP server wire=
guard configuration looks like this.</div><div style=3D"font-family:verdana=
,sans-serif"><br></div><div style=3D"font-family:verdana,sans-serif">[Inter=
face]<br>Address =3D 192.168.1.1<br>SaveConfig =3D true<br>PostUp =3D iptab=
les -A FORWARD -i %i -j ACCEPT; iptables -A FORWARD -o %i -j ACCEPT; iptabl=
es -t nat -A POSTROUTING -o ens4 -j MASQUERADEi;iptables -t mangle -A POSTR=
OUTING -p tcp --tcp-flags SYN,RST SYN -j TCPMSS --clamp-mss-to-pmtu<br>Post=
Down =3D iptables -D FORWARD -i %i -j ACCEPT; iptables -D FORWARD -o %i -j =
ACCEPT; iptables -t nat -D POSTROUTING -o ens4 -j MASQUERADE<br>ListenPort =
=3D 51840<br>PrivateKey =3D &lt;private key&gt;<br>MTU=3D1380<br><br>[Peer]=
<br>PublicKey =3D &lt;public key&gt;<br>AllowedIPs =3D <a href=3D"http://19=
2.168.1.2/32" target=3D"_blank">192.168.1.2/32</a><br></div></div><br><div =
class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, 9 Feb 2=
020 at 03:06, Jason A. Donenfeld &lt;<a href=3D"mailto:Jason@zx2c4.com" tar=
get=3D"_blank">Jason@zx2c4.com</a>&gt; wrote:<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">GCP uses an MTU of 1460 because Google&#39;s =
network does weird things.<br>
That means the MTU for WireGuard should be 1380. On the GCP box, try<br>
adding `MTU=3D1380` to your config and add this line to PostUp: `<br>
; iptables -t mangle -A POSTROUTING -p tcp --tcp-flags SYN,RST SYN -j<br>
TCPMSS --clamp-mss-to-pmtu`<br>
</blockquote></div></div>
</blockquote></div></div>

--00000000000026d02f059e1f02c0--

--===============5056959189650746624==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============5056959189650746624==--
