Return-Path: <SRS0=IF4l=W4=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AA35C3A5A4
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  1 Sep 2019 11:03:34 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BD2AD21897
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  1 Sep 2019 11:03:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S0Bz/KhL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BD2AD21897
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9497fcde;
	Sun, 1 Sep 2019 11:03:32 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id afcaf7ad
 for <wireguard@lists.zx2c4.com>; Sun, 1 Sep 2019 11:03:30 +0000 (UTC)
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 79c68cf0
 for <wireguard@lists.zx2c4.com>; Sun, 1 Sep 2019 11:03:30 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id j16so4117471ljg.6
 for <wireguard@lists.zx2c4.com>; Sun, 01 Sep 2019 04:03:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SxqCVQSqBCCx6ZPSpE/wicTaRn/0Zd12oTu4sQeDBGc=;
 b=S0Bz/KhLYhu34VebNjjlw994oZU/4EYPoObeNC6/taJWu7jOgKIc4O+42+ZKe2UQ0R
 OqnisXrmFr53ASpxbd87F5XV7VkGgK9qbNZg5a1FvuGyQOWDoZYPRkk7J30aDIJXl/aD
 n72HfXtWHJ2ptnS7MCC3GyGiffZOMdm6M8joNEUuF1CpPop+JB0sEybf1sqhPeg7MRS6
 WkoctfKIdcZ7jpZm78Uk9m75zWIILAH9s+mWVzSFDyBndmZPsKyG5I1g+wm9Ssf7WZnP
 EO0PwxivcOWmGnqBYRIpipzVDrL6mXyQU04wb2Upa6H1VBCiKbraSbApQ0cA2pAo+DZm
 D8+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SxqCVQSqBCCx6ZPSpE/wicTaRn/0Zd12oTu4sQeDBGc=;
 b=MNxvr+zjM6Mx4F3OAHQY+oreY55+mBFMfWSvuynGVSQjtU8kmODCgNszhqMmZZ1Ik+
 wamzPegk81mXZqVhZXBs/j96QEElM/O7g3+tSVb2Akrx6SxrLb4BArfhEJbt2sBr5Xh8
 rV7axzHbP14wgm5VXTa1dBl/mMyMmOUDpzr4vppD2h8m3vSzEgN6wjPNJB1ZvNTcxF2e
 +xpNQEv79+Rjg9J+q4qzJVP4hKaIp2tUUIFiFny9Usxs0ZeTnMwbDEtic9efLhitchEx
 FoPYnBEMi5xIF3Fhbuas+0ODqTfqyq8Sn/+o1ANwBxU/zHF2O1zj6ociutZGlKnMzOSZ
 hn9g==
X-Gm-Message-State: APjAAAX4Ssx7ThGINMdEwWHgJVuZSI0uyK6mz/4Dw2WoCKH7E+565pub
 Vdz4CHpVyaulw55MNdkajAZ8Bs+OAz3GSJr5Zzo=
X-Google-Smtp-Source: APXvYqw4kbXpWVeFntW9RQUmJRd/uo9CHOq0si1YtlOwPjM9sDKnCZae//fr/+bR1B09ZYb9BEMq4pd96zIV9eYdDHA=
X-Received: by 2002:a2e:85d4:: with SMTP id h20mr13466149ljj.134.1567335809275; 
 Sun, 01 Sep 2019 04:03:29 -0700 (PDT)
MIME-Version: 1.0
References: <CAF+AZZVktGm19scLjT4Ku-JyQGyxQGfsLFSf=wybyuuiuoULQw@mail.gmail.com>
 <CAKXLc7eTLhy0B_=8qOZRgKbgDYknMPkiMOHuaBj+208iNsAZcQ@mail.gmail.com>
 <CAF+AZZXafHP4yd0gxMFE9ne72i=WVT-HABkeBcV=T8FXNCYVSA@mail.gmail.com>
In-Reply-To: <CAF+AZZXafHP4yd0gxMFE9ne72i=WVT-HABkeBcV=T8FXNCYVSA@mail.gmail.com>
From: Dimitar Vassilev <dimitar.vassilev@gmail.com>
Date: Sun, 1 Sep 2019 14:03:18 +0300
Message-ID: <CAF+AZZVKOQFfk53e24KO7kFR3cxEuqnJgpnejhvTP5BuVJDbng@mail.gmail.com>
Subject: Re: need a hand with WG setup
To: Kalin KOZHUHAROV <me.kalin@gmail.com>
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
Content-Type: multipart/mixed; boundary="===============3784104468653967181=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============3784104468653967181==
Content-Type: multipart/alternative; boundary="00000000000027dcd005917bce5d"

--00000000000027dcd005917bce5d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=9D=D0=B0 =D1=81=D1=80, 28.08.2019 =D0=B3. =D0=B2 13:56 =D1=87. Dimitar =
Vassilev <dimitar.vassilev@gmail.com>
=D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0:

> Hi Kalin,
>
> 1. Disable the FW and test.
>>
> Tried - disabling one fw shows wg traffic flowing.
>
>
>> 2. Try ping from one router to the other using the configured public IP
>> address
>>
>> That works as well with the default fw config on OpenWRT/LEDE/LibreCMC
>
>
>> 3. Ping the other using the WG IP address
>>
>> my problem is that ping between the WG IP addresses is not working. I se=
e
> some PostUp and Postdown examples in the regular configurations like the
> ones below
> PostUp =3D iptables -A FORWARD -i wg0 -j ACCEPT; iptables -t nat -A
> POSTROUTING -o enp5s0 -j MASQUERADE; ip6tables -A FORWARD -i wg0 -j ACCEP=
T;
> ip6tables -t nat -A POSTROUTING -o enp5s0 -j MASQUERADE
> PostDown =3D iptables -D FORWARD -i wg0 -j ACCEPT; iptables -t nat -D
> POSTROUTING -o enp5s0 -j MASQUERADE; ip6tables -D FORWARD -i wg0 -j ACCEP=
T;
> ip6tables -t nat -D POSTROUTING -o enp5s0 -j MASQUERADE
> In the LEDE/OpenWRT derivatives those are marked in the GUI with
> MASQUERADE and route allowed ips options, but still I'm getting stuck.  I
> moved my VPN network from /25 to another /24 and still was stuck.
>
>> If all runs them it is a routing problem left to solve...
>>
>> Agree. I'm a bit at loss which routing - the kernel one or the forwardin=
g
> of packets. Will tear down and start from scratch with another test.
>
>> Kalin.
>>
>
Hello all,

Problem solved via a trivial solution - add my origin VPN endpoint IP into
the list of AllowedIPs for the peer. Used
https://forum.openwrt.org/t/solved-setup-wireguard-connecting-two-networks/=
4215
to
achieve this
At least in this setup I see the packets flowing in both directions - RX
and TX
Ny next questions are:

   -  is this normal since I'm behind NAT or there are some OpenWRT
   /Wireguard specifics I'm missing? In the docs and examples I see example=
s
   with just peer IPs added
   - what should I do to make the flow to a private subnet in DMZ on site B
   from site A ?

Thanks,
Dimitar

--00000000000027dcd005917bce5d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"></div><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">=D0=9D=D0=B0 =D1=81=D1=80, 28.08.2019 =D0=
=B3. =D0=B2 13:56 =D1=87. Dimitar Vassilev &lt;<a href=3D"mailto:dimitar.va=
ssilev@gmail.com" target=3D"_blank">dimitar.vassilev@gmail.com</a>&gt; =D0=
=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"></div>Hi Kalin,=C2=A0<=
br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr"><br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"auto"><div=
 dir=3D"auto">1. Disable the FW and test.</div></div></blockquote><div>Trie=
d - disabling one fw shows wg traffic flowing.</div><div>=C2=A0</div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"auto"><div dir=3D"a=
uto">2. Try ping from one router to the other using the configured public I=
P address</div><div dir=3D"auto"><br></div></div></blockquote><div>That wor=
ks as well with the default fw config on OpenWRT/LEDE/LibreCMC</div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"a=
uto"><div dir=3D"auto"></div><div dir=3D"auto">3. Ping the other using the =
WG IP address</div><div dir=3D"auto"><br></div></div></blockquote><div>my p=
roblem is that ping between the WG IP addresses is not working. I see some =
PostUp and Postdown examples in the regular configurations like the ones be=
low</div>PostUp =3D iptables -A FORWARD -i wg0 -j ACCEPT; iptables -t nat -=
A POSTROUTING -o enp5s0 -j MASQUERADE; ip6tables -A FORWARD -i wg0 -j ACCEP=
T; ip6tables -t nat -A POSTROUTING -o enp5s0 -j MASQUERADE<br><div>PostDown=
 =3D iptables -D FORWARD -i wg0 -j ACCEPT; iptables -t nat -D POSTROUTING -=
o enp5s0 -j MASQUERADE; ip6tables -D FORWARD -i wg0 -j ACCEPT; ip6tables -t=
 nat -D POSTROUTING -o enp5s0 -j MASQUERADE</div><div>In the LEDE/OpenWRT d=
erivatives those are marked in the GUI with MASQUERADE and route allowed ip=
s options, but still I&#39;m getting stuck.=C2=A0 I moved my VPN network fr=
om /25 to another /24 and still was stuck.</div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex"><div dir=3D"auto"><div dir=3D"auto"></div><div dir=
=3D"auto">If all runs them it is a routing problem left to solve...</div><d=
iv dir=3D"auto"><br></div></div></blockquote><div>Agree. I&#39;m a bit at l=
oss which routing - the kernel one or the forwarding of packets. Will tear =
down and start from scratch with another test.=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><div dir=3D"auto"><div dir=3D"auto"></div>=
<div dir=3D"auto">Kalin.</div></div></blockquote></div></div></blockquote><=
div><br></div>Hello all,<div><br></div><div>Problem solved via a trivial so=
lution - add my origin VPN endpoint IP into the list of AllowedIPs for the =
peer. Used=C2=A0<a href=3D"https://forum.openwrt.org/t/solved-setup-wiregua=
rd-connecting-two-networks/4215" target=3D"_blank">https://forum.openwrt.or=
g/t/solved-setup-wireguard-connecting-two-networks/4215</a>=C2=A0to achieve=
 this</div><div>At least in this setup I see the packets flowing in both di=
rections - RX and TX</div><div>Ny next questions are:</div><div><ul><li>=C2=
=A0is this normal since I&#39;m behind NAT or there are some OpenWRT /Wireg=
uard specifics I&#39;m missing? In the docs and examples I see examples wit=
h just peer IPs added</li><li>what should I do to make the flow to a privat=
e subnet in DMZ on site B from site A ?</li></ul>Thanks,<br></div><div>Dimi=
tar=C2=A0</div></div>
</div>

--00000000000027dcd005917bce5d--

--===============3784104468653967181==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============3784104468653967181==--
