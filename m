Return-Path: <SRS0=H7Gu=WY=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB8F0C3A5A1
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 28 Aug 2019 10:57:32 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5205620828
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 28 Aug 2019 10:57:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qcWpGJwt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5205620828
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d403e1ff;
	Wed, 28 Aug 2019 10:57:03 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id baf50507
 for <wireguard@lists.zx2c4.com>;
 Wed, 28 Aug 2019 10:57:01 +0000 (UTC)
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2bc33eb6
 for <wireguard@lists.zx2c4.com>;
 Wed, 28 Aug 2019 10:57:01 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id v16so1741429lfg.11
 for <wireguard@lists.zx2c4.com>; Wed, 28 Aug 2019 03:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IXhnhzPwlQY0ovpGmlbijX9LsbFQsAbiKgKUbL9N+0U=;
 b=qcWpGJwt+KTT14SfNs1qa6eWNoYm7V394TnteWpiBlVGDgNkvQvkycHU7Klo3J+ffd
 DK3yvU9GOuGaUR8OUrekzRRrRbQ/eZtD6lCkgxxlyWZ8kWoHpyMl5xCG00q45onkpoKm
 ZINBB06YQT1BIruQwTuGYFByQqKYMZpLRIXAVwDxTxoKYM8CkVPt9Cmpc8PHtBKguDeu
 9aZZsWAaIEJKGBna2yR2p+h81jG9Urzx3oL2qYWMUGcMVJlVPeywf3SaxOXcFH4pLR65
 9IAvO5lgW9JyTJZVtIcxzdirN+HAfJO7IOkPNh3ZKakgFJblXHgay1dMZ+yjvPchphNT
 JTYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IXhnhzPwlQY0ovpGmlbijX9LsbFQsAbiKgKUbL9N+0U=;
 b=bE9IK8f87fxJr4iWPMq5CbcMqS11n6uJrx+dozL+Dwlt83NqSZKvqRJLAd8K0BcNEn
 PzOo8rJT4YWBs5hxCIJWr1gPUcDt6PqpIpbWPWeaQtguRrNCjzErv+CGv/4qU1zQwJPR
 GU8aYRNc0IpfZ9LJ8H1kawCHGdf2YLp3X1GO2z3zTBiu4+8itPcumMuthiVsAH7kZUpJ
 vJYMOEmm2KieGhwUu2IetpagSs/BFOPYnKFsPezHGwGeI9ZIGTnpEtASYiunurQBV/kw
 4pTRce45pQDapqHtASqoPX+he3TMISgv6azJ8Cir6htxjNA6scGX2JL8faHy5ec8p/AA
 Jnyw==
X-Gm-Message-State: APjAAAVA/pSEXwuN/M1fYiDf2dNmtCh/xFj9t0zw5YLo6rjaB0BbHgxe
 aINDKl585zwkrw7xdzZi4WQ0AFA4sRrpKaYpf3s=
X-Google-Smtp-Source: APXvYqwvGDaMkAttMqevbnTuId3Uj5CUChhLjmk562eRybzIPgwfvX10x3sYaHQcyW5y9FTOPaYWgctjfj/1q+vOsVg=
X-Received: by 2002:a05:6512:28d:: with SMTP id
 j13mr2219748lfp.12.1566989819365; 
 Wed, 28 Aug 2019 03:56:59 -0700 (PDT)
MIME-Version: 1.0
References: <CAF+AZZVktGm19scLjT4Ku-JyQGyxQGfsLFSf=wybyuuiuoULQw@mail.gmail.com>
 <CAKXLc7eTLhy0B_=8qOZRgKbgDYknMPkiMOHuaBj+208iNsAZcQ@mail.gmail.com>
In-Reply-To: <CAKXLc7eTLhy0B_=8qOZRgKbgDYknMPkiMOHuaBj+208iNsAZcQ@mail.gmail.com>
From: Dimitar Vassilev <dimitar.vassilev@gmail.com>
Date: Wed, 28 Aug 2019 13:56:47 +0300
Message-ID: <CAF+AZZXafHP4yd0gxMFE9ne72i=WVT-HABkeBcV=T8FXNCYVSA@mail.gmail.com>
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
Content-Type: multipart/mixed; boundary="===============3811818258636535224=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============3811818258636535224==
Content-Type: multipart/alternative; boundary="0000000000008cd4ba05912b3fcb"

--0000000000008cd4ba05912b3fcb
Content-Type: text/plain; charset="UTF-8"

Hi Kalin,

1. Disable the FW and test.
>
Tried - disabling one fw shows wg traffic flowing.


> 2. Try ping from one router to the other using the configured public IP
> address
>
> That works as well with the default fw config on OpenWRT/LEDE/LibreCMC


> 3. Ping the other using the WG IP address
>
> my problem is that ping between the WG IP addresses is not working. I see
some PostUp and Postdown examples in the regular configurations like the
ones below
PostUp = iptables -A FORWARD -i wg0 -j ACCEPT; iptables -t nat -A
POSTROUTING -o enp5s0 -j MASQUERADE; ip6tables -A FORWARD -i wg0 -j ACCEPT;
ip6tables -t nat -A POSTROUTING -o enp5s0 -j MASQUERADE
PostDown = iptables -D FORWARD -i wg0 -j ACCEPT; iptables -t nat -D
POSTROUTING -o enp5s0 -j MASQUERADE; ip6tables -D FORWARD -i wg0 -j ACCEPT;
ip6tables -t nat -D POSTROUTING -o enp5s0 -j MASQUERADE
In the LEDE/OpenWRT derivatives those are marked in the GUI with MASQUERADE
and route allowed ips options, but still I'm getting stuck.  I moved my VPN
network from /25 to another /24 and still was stuck.

> If all runs them it is a routing problem left to solve...
>
> Agree. I'm a bit at loss which routing - the kernel one or the forwarding
of packets. Will tear down and start from scratch with another test.

> Kalin.
>

--0000000000008cd4ba05912b3fcb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"></div>Hi Kalin,=C2=A0<br><div class=3D"gm=
ail_quote"><div dir=3D"ltr" class=3D"gmail_attr"><br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex"><div dir=3D"auto"><div dir=3D"auto">1. Di=
sable the FW and test.</div></div></blockquote><div>Tried - disabling one f=
w shows wg traffic flowing.</div><div>=C2=A0</div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex"><div dir=3D"auto"><div dir=3D"auto">2. Try ping fr=
om one router to the other using the configured public IP address</div><div=
 dir=3D"auto"><br></div></div></blockquote><div>That works as well with the=
 default fw config on OpenWRT/LEDE/LibreCMC</div><div>=C2=A0</div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex"><div dir=3D"auto"><div dir=3D"auto=
"></div><div dir=3D"auto">3. Ping the other using the WG IP address</div><d=
iv dir=3D"auto"><br></div></div></blockquote><div>my problem is that ping b=
etween the WG IP addresses is not working. I see some PostUp and Postdown e=
xamples in the regular configurations like the ones below</div>PostUp =3D i=
ptables -A FORWARD -i wg0 -j ACCEPT; iptables -t nat -A POSTROUTING -o enp5=
s0 -j MASQUERADE; ip6tables -A FORWARD -i wg0 -j ACCEPT; ip6tables -t nat -=
A POSTROUTING -o enp5s0 -j MASQUERADE<br><div>PostDown =3D iptables -D FORW=
ARD -i wg0 -j ACCEPT; iptables -t nat -D POSTROUTING -o enp5s0 -j MASQUERAD=
E; ip6tables -D FORWARD -i wg0 -j ACCEPT; ip6tables -t nat -D POSTROUTING -=
o enp5s0 -j MASQUERADE</div><div>In the LEDE/OpenWRT derivatives those are =
marked in the GUI with MASQUERADE and route allowed ips options, but still =
I&#39;m getting stuck.=C2=A0 I moved my VPN network from /25 to another /24=
 and still was stuck.</div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
"><div dir=3D"auto"><div dir=3D"auto"></div><div dir=3D"auto">If all runs t=
hem it is a routing problem left to solve...</div><div dir=3D"auto"><br></d=
iv></div></blockquote><div>Agree. I&#39;m a bit at loss which routing - the=
 kernel one or the forwarding of packets. Will tear down and start from scr=
atch with another test.=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><div dir=3D"auto"><div dir=3D"auto"></div><div dir=3D"auto">Kali=
n.</div></div>
</blockquote></div></div>

--0000000000008cd4ba05912b3fcb--

--===============3811818258636535224==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============3811818258636535224==--
