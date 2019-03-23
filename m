Return-Path: <SRS0=gmne=R2=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06070C43381
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 23 Mar 2019 21:11:03 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 54BA521841
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 23 Mar 2019 21:11:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wc6C+Hun"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 54BA521841
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 32cec110;
	Sat, 23 Mar 2019 21:10:01 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bfa32e38
 for <wireguard@lists.zx2c4.com>;
 Sat, 23 Mar 2019 21:09:59 +0000 (UTC)
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5406bcb3
 for <wireguard@lists.zx2c4.com>;
 Sat, 23 Mar 2019 21:09:59 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id h18so5312317wml.1
 for <wireguard@lists.zx2c4.com>; Sat, 23 Mar 2019 14:10:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8g1EaxeEG6paaT9qrKsi8ShF7+YKchLk7TWtVd9WTdY=;
 b=Wc6C+Hunt5U/3l8huOL+sMcFht1JRKT60PJwvyQX+4tOtiXjkTUv5n6B7EfB6a/5WT
 N83coAc9uQsD3/kmyUMJLTuCkTH7PQj7PXPCHl/OJF6vwOqPBHPNT3ZGx3bXzhrtiZsO
 s+Em0YyBW7rPDcDSMhk7QE7vinpw+O3VbWhbIRLb/mzuf+zgJD5KWwjkTvWXIYxULADf
 RrvHAfGq24M2VT1xSYhSW7sfaDdVM8A+mp6tKaM+LY2I6IpgXjF+3yggotbuK8Zkt2g5
 FtCKJ7jva+wkXOudfk7ac+poUb+CPX1VPgLN0N/ZKlLlwHWvfAz4Ng0iBUWArpWe5Eiw
 rmKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8g1EaxeEG6paaT9qrKsi8ShF7+YKchLk7TWtVd9WTdY=;
 b=KiEXCtoDOfqT3mnC15UYUYISTznxFTAWxE4eusIykJzEWG92tMo5yhtnFl2IS/lXEx
 nvyYIyEeJ385tfQWS7JMNoCS/f4WzXMyfe5oBtNH7QEjsCIfDKU03+V7KA2kYe53WjPb
 QjWiF6my9gG0bWT5j+DgTmbajrg6NijeNEqTagE18rHMbDSsIwEcfsmCaZei3Ae4PRQ2
 dEvWh1sVI16u3Z/XoM7Py/6nZnllGGwyNnuM6dgD5Dk82wNXWbZA8hhxBCQSAMqSUWi1
 lbqacgG0JAf0rO/y5mC8d+GUQ6unS6C/sEqfmI9fGtj9Ryo41ssrQIkzFwtMJQLKZ0n/
 PciQ==
X-Gm-Message-State: APjAAAWNBrVYs4WXG3NWz1iI+vaCzRKO9QAm78wVl6Z4cn3DCib5WTtA
 eisTiYGPGA5nUFIsF755VDkQLuszoRj2EoLEg+E=
X-Google-Smtp-Source: APXvYqxmh7ToF06KGbckqqakLQ54hve7Ufsl7LlAaLE9tsxcnxPoPqcaGBTeBrLNCK6v28jCTcQrK/kon0iUQy/mv9Y=
X-Received: by 2002:a1c:d106:: with SMTP id i6mr5681498wmg.134.1553375441166; 
 Sat, 23 Mar 2019 14:10:41 -0700 (PDT)
MIME-Version: 1.0
References: <CAHmME9r1VmJLSqrb8vQN3HOqeVX2QLs1-9wPYQL-UwNU6EJNLA@mail.gmail.com>
In-Reply-To: <CAHmME9r1VmJLSqrb8vQN3HOqeVX2QLs1-9wPYQL-UwNU6EJNLA@mail.gmail.com>
From: Alen Opacic <subixonfire@gmail.com>
Date: Sat, 23 Mar 2019 22:10:31 +0100
Message-ID: <CAByA2P1GjEb00TjNSmLfUL-A1xRFuhKBsZjxNd9aTqeDoQqWzw@mail.gmail.com>
Subject: Re: [ANNOUNCE] Wintun: Layer 3 TUN Driver for Windows
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: dev@nmap.org, openvpn-devel@lists.sourceforge.net,
 wireguard@lists.zx2c4.com
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
Content-Type: multipart/mixed; boundary="===============7390929978930988740=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============7390929978930988740==
Content-Type: multipart/alternative; boundary="0000000000005fa82d0584c96714"

--0000000000005fa82d0584c96714
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Download link for wintun.msi is not working.

sub, 23. o=C5=BEu 2019. 02:05 Jason A. Donenfeld <Jason@zx2c4.com> je napis=
ao:

> Hi everybody,
>
> [Cross-posting to WireGuard, OpenVPN, and Nmap/npcap mailing lists.]
>
> Simon and I are pleased to announce the start of a new project, made
> for WireGuard and for others too: Wintun, a layer 3 TUN driver for
> Windows.
>
> Homepage: https://www.wintun.net/
>
> A TUN driver lets userspace programs act as virtual network cards,
> reading and writing packets directly into the network stack, as though
> they came from a real network adapter. While Linux and the BSDs have
> had /dev/tun for ages, Windows typically hasn't had any native
> facilities.
>
> Recently, Microsoft released a VPN UWP API, but it's lacking in
> features, documentation is under NDA, and after reversing it for a
> bit, it doesn't seem capable of doing many of the more advanced
> routing and roaming things we want. Indeed it turns out that having a
> real network adapter and some basic file handles is much preferable to
> layers of API and abstraction.
>
> On the flipside, OpenVPN's tap-windows6 project and the numerous
> drivers from SoftEther have all provided similar functionality for
> many years, and these efforts have produced something moderately
> stable. We were, in fact, quite inspired by SoftEther's Neo6 driver.
> However, these projects were written in a different age, the era of
> NDIS5, and then ported later to NDIS6. This means they haven't
> benefited from things like Windows 7's NdisMediumIP, which allows for
> native layer 3 tunneling, without having to do layer 2 emulation.
> Drivers like OpenVPN's tap-windows6 also do some somewhat nasty
> things, like emulate DHCP from inside the kernel for network
> configuration. The code is old and complicated. As usual, I wanted
> instead something tiny and dumb that we can reason about, which does
> things in a "right" and "boring" way for a narrower use case: layer 3
> TUN.
>
> Wintun is our attempt at making a dumb layer 3 pipe, that doesn't do
> anything fancy, and just shuffles bundles of packets between userspace
> and the kernel driver. It's being used for WireGuard's Windows port.
> We'd like to make it available and easy to use for other projects too
> that need layer 3 userspace tunneling capabilities, like OpenVPN and
> SoftEther. (Also, it may be just a matter of time before somebody
> takes the tiny base of it, sticks the crypto in the kernel, and makes
> WireGuard super fast on Windows.)
>
> Have we succeeded in accomplishing our goals? Certainly not yet. At
> the present moment [folks reading this in the future: check the date
> of this email], I'd except for Wintun to be slower, buggier, and lower
> quality than anything else out there. But we thought it'd be a good
> idea to release sooner rather than later in order to have some more
> eyeballs on it. It's the kind of codebase that _certainly_ needs some
> cleanup and a thorough security audit. On the plus side, cloc(1) tells
> me that it's only 950 lines. Still, NT programming is hard, and I'm
> pretty certain we've made mistakes and left ugly corners. Consider
> this email a statement of intent rather than an announcement of a
> completed project.
>
> So, if you're interested in NDIS programming and want to lend a hand,
> don't hesitate to get in touch. We're eager for smart NT folks to help
> us out.
>
> Details are over on https://www.wintun.net/ where you may also find
> rabbits bringing windows into tunnels. Enjoy!
>
> Regards,
> Jason
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
>

--0000000000005fa82d0584c96714
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Download link for wintun.msi is not working.<br><br>=
<div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">sub, 23. o=
=C5=BEu 2019. 02:05 Jason A. Donenfeld &lt;<a href=3D"mailto:Jason@zx2c4.co=
m">Jason@zx2c4.com</a>&gt; je napisao:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex">Hi everybody,<br>
<br>
[Cross-posting to WireGuard, OpenVPN, and Nmap/npcap mailing lists.]<br>
<br>
Simon and I are pleased to announce the start of a new project, made<br>
for WireGuard and for others too: Wintun, a layer 3 TUN driver for<br>
Windows.<br>
<br>
Homepage: <a href=3D"https://www.wintun.net/" rel=3D"noreferrer noreferrer"=
 target=3D"_blank">https://www.wintun.net/</a><br>
<br>
A TUN driver lets userspace programs act as virtual network cards,<br>
reading and writing packets directly into the network stack, as though<br>
they came from a real network adapter. While Linux and the BSDs have<br>
had /dev/tun for ages, Windows typically hasn&#39;t had any native<br>
facilities.<br>
<br>
Recently, Microsoft released a VPN UWP API, but it&#39;s lacking in<br>
features, documentation is under NDA, and after reversing it for a<br>
bit, it doesn&#39;t seem capable of doing many of the more advanced<br>
routing and roaming things we want. Indeed it turns out that having a<br>
real network adapter and some basic file handles is much preferable to<br>
layers of API and abstraction.<br>
<br>
On the flipside, OpenVPN&#39;s tap-windows6 project and the numerous<br>
drivers from SoftEther have all provided similar functionality for<br>
many years, and these efforts have produced something moderately<br>
stable. We were, in fact, quite inspired by SoftEther&#39;s Neo6 driver.<br=
>
However, these projects were written in a different age, the era of<br>
NDIS5, and then ported later to NDIS6. This means they haven&#39;t<br>
benefited from things like Windows 7&#39;s NdisMediumIP, which allows for<b=
r>
native layer 3 tunneling, without having to do layer 2 emulation.<br>
Drivers like OpenVPN&#39;s tap-windows6 also do some somewhat nasty<br>
things, like emulate DHCP from inside the kernel for network<br>
configuration. The code is old and complicated. As usual, I wanted<br>
instead something tiny and dumb that we can reason about, which does<br>
things in a &quot;right&quot; and &quot;boring&quot; way for a narrower use=
 case: layer 3<br>
TUN.<br>
<br>
Wintun is our attempt at making a dumb layer 3 pipe, that doesn&#39;t do<br=
>
anything fancy, and just shuffles bundles of packets between userspace<br>
and the kernel driver. It&#39;s being used for WireGuard&#39;s Windows port=
.<br>
We&#39;d like to make it available and easy to use for other projects too<b=
r>
that need layer 3 userspace tunneling capabilities, like OpenVPN and<br>
SoftEther. (Also, it may be just a matter of time before somebody<br>
takes the tiny base of it, sticks the crypto in the kernel, and makes<br>
WireGuard super fast on Windows.)<br>
<br>
Have we succeeded in accomplishing our goals? Certainly not yet. At<br>
the present moment [folks reading this in the future: check the date<br>
of this email], I&#39;d except for Wintun to be slower, buggier, and lower<=
br>
quality than anything else out there. But we thought it&#39;d be a good<br>
idea to release sooner rather than later in order to have some more<br>
eyeballs on it. It&#39;s the kind of codebase that _certainly_ needs some<b=
r>
cleanup and a thorough security audit. On the plus side, cloc(1) tells<br>
me that it&#39;s only 950 lines. Still, NT programming is hard, and I&#39;m=
<br>
pretty certain we&#39;ve made mistakes and left ugly corners. Consider<br>
this email a statement of intent rather than an announcement of a<br>
completed project.<br>
<br>
So, if you&#39;re interested in NDIS programming and want to lend a hand,<b=
r>
don&#39;t hesitate to get in touch. We&#39;re eager for smart NT folks to h=
elp<br>
us out.<br>
<br>
Details are over on <a href=3D"https://www.wintun.net/" rel=3D"noreferrer n=
oreferrer" target=3D"_blank">https://www.wintun.net/</a> where you may also=
 find<br>
rabbits bringing windows into tunnels. Enjoy!<br>
<br>
Regards,<br>
Jason<br>
_______________________________________________<br>
WireGuard mailing list<br>
<a href=3D"mailto:WireGuard@lists.zx2c4.com" target=3D"_blank" rel=3D"noref=
errer">WireGuard@lists.zx2c4.com</a><br>
<a href=3D"https://lists.zx2c4.com/mailman/listinfo/wireguard" rel=3D"noref=
errer noreferrer" target=3D"_blank">https://lists.zx2c4.com/mailman/listinf=
o/wireguard</a><br>
</blockquote></div></div></div>

--0000000000005fa82d0584c96714--

--===============7390929978930988740==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============7390929978930988740==--
