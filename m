Return-Path: <SRS0=YdU4=TN=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12EDCC04AB4
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 13 May 2019 00:15:59 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9F730208C0
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 13 May 2019 00:15:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nUiIQqPu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9F730208C0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 07de3538;
	Mon, 13 May 2019 00:15:45 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id db282047
 for <wireguard@lists.zx2c4.com>;
 Sat, 11 May 2019 15:19:52 +0000 (UTC)
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d8183375
 for <wireguard@lists.zx2c4.com>;
 Sat, 11 May 2019 15:19:52 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id n25so9906966wmk.4
 for <wireguard@lists.zx2c4.com>; Sat, 11 May 2019 08:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bE37mnL1RHRQod+fftwo0ibkyjVwJ2F+gn9BQCdi6Bo=;
 b=nUiIQqPuSYfAK5RdfLk0tq65BL4NQ/4Obd9CsCg04H4KThXc1BvaGSLyPgvUSnwwH/
 rzYNK6OLT4DrDBGpc3hNoeoeWc4iIjT7L4/J4fScArnprzOZJmQ/dKNldwRl98kvYhZz
 FM+OfrPC3miZ0s3MaNVtqdAbWqVNg34KhbhHuvRR00Rm2ymYPPbsTLCgtFW290tXvRJE
 3SgcBr5lLcAqD6KcG79GU4hggduA3sTCYFfGPfjCwt0GtlD2yjQCTySmzwDDV165pRmM
 RBZJqhqGyiCQKDSI3bvcmTedSVQ7myLsxuUu1wUrBkVgvZH5griVpW8J5IMVHAdvfdgW
 SlMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bE37mnL1RHRQod+fftwo0ibkyjVwJ2F+gn9BQCdi6Bo=;
 b=AH33XkmMbrVrzlWprVZAxPnx68PwgjxYDF2bAbOteWxkDZ10ApedykWutPeS2qJvRW
 UC7+r723O24i5Xc+vc1nQpjw+p8xA6iTQS7OGXv1fbYoTL/gdQhGE+91QxX4BOr/d6GC
 7vJLZK+d/2jkv6FSQgYdin7CoOOYWlu6Yws4EpiwACflC+53csy8PmENBrOhu/MU26m/
 5rY3mdjWFmY1CwNpAsx1igDejh+4rSXCGHWcUPwiNqZF6WkrLsTbHAGYt4Btwi4rQe7L
 kxDl208IeF9Louz8OejWAJFhZyz2ZddWnuU3DEY6pQeRMXMtcA3yqIGZWUn7mEJ0lcGb
 mumg==
X-Gm-Message-State: APjAAAU8AqsyvHtHv6TnjEtA6BubM1TKPsBDVuu8ndvMWb4i74qatJnl
 kkMETzTEKzyCZSCazbUq4kXGRaPFqJdWqSGoj9k=
X-Google-Smtp-Source: APXvYqyxRO2xD9lCcfpMMyZyQ5NWwqnJK/qizsY59D3+ley9cUvj1BIUXeXNhgOwASqyjK3ecndFEMWkBDFRwGL+yRw=
X-Received: by 2002:a1c:dc46:: with SMTP id t67mr6872264wmg.140.1557587990234; 
 Sat, 11 May 2019 08:19:50 -0700 (PDT)
MIME-Version: 1.0
References: <20190506210827.2h4nzjxjpmwg7kpa@yavin>
In-Reply-To: <20190506210827.2h4nzjxjpmwg7kpa@yavin>
From: Henning Reich <henningreich@gmail.com>
Date: Sat, 11 May 2019 17:19:42 +0200
Message-ID: <CAOAVeL3Vqr9GvomZFJafmTky-r_QmcymE0CB_ZpZHOiu=U_1aA@mail.gmail.com>
Subject: Re: Overlapping AllowedIPs Configuration
To: Aleksa Sarai <cyphar@cyphar.com>
X-Mailman-Approved-At: Mon, 13 May 2019 02:15:42 +0200
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
Content-Type: multipart/mixed; boundary="===============7202984283235144411=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============7202984283235144411==
Content-Type: multipart/alternative; boundary="000000000000dd4bdd05889e3687"

--000000000000dd4bdd05889e3687
Content-Type: text/plain; charset="UTF-8"

No, I think its correct behaviour.
If you have overlapping networks  the more specific route is preferred.
10.10.10.0/24 overrule 10.10.0.0/16.
If the subnets are the same, the last one is the more specific (because
most recent one) and should be used.

And in germany, we say (literal translation): You're allowed to shoot
yourself in the knee.
(to be self-defeating) :-)



Aleksa Sarai <cyphar@cyphar.com> schrieb am Sa., 11. Mai 2019, 15:09:

> Hi all,
>
> I just found out that WireGuard apparently allows you to configure an
> interface that has peers with overlapping AllowedIPs ranges -- which
> obviously won't work with cryptokey routing -- but additionally is
> strange since I feel this should cause an error when configuring the
> interface.
>
> In my case, I accidentally used /32 when generating the IPv6 addresses
> of my clients and ended up with a config like:
>
>   [Interface]
>   Address = 10.13.37.1/32,fd00:dead:beef:cafe::1/64
>   ListenPort = 51820
>   PrivateKey = [key]
>
>   # Peer A.
>   [Peer]
>   PublicKey = [pub]
>   PreSharedKey = [psk]
>   AllowedIPs = 10.13.40.1/32,fd00:dead:beef:1000::/32
>
>   # Peer B.
>   [Peer]
>   PublicKey = [pub]
>   PreSharedKey = [psk]
>   AllowedIPs = 10.13.41.1/32,fd00:dead:beef:1001::/32
>
> This config is wrong (because both peers have overlapping addresses
> specified for AllowedIPs), but wireguard will happily accept it:
>
>   % wg-quick up wg-foo
>   [#] ip link add wg-yavin type wireguard
>   [#] wg setconf wg-yavin /dev/fd/63
>   [#] ip address add 10.13.37.1/32 dev wg-yavin
>   [#] ip address add fd00:dead:beef:cafe::1/64 dev wg-yavin
>   [#] ip link set mtu 1420 up dev wg-yavin
>   [#] ip route add fd42:dead::/32 dev wg-yavin
>   [#] ip route add 10.13.41.1/32 dev wg-yavin
>   [#] ip route add 10.13.40.1/32 dev wg-yavin
>
> This configuration results in only one of the peers actually being given
> the IPv6 range, but I feel like "wg setconf" should've rejected this
> configuration.
>
>   % wg
>   interface: wg-foo
>     public key: [pub]
>     private key: (hidden)
>     listening port: 51820
>
>   peer: [peer A]
>     preshared key: (hidden)
>     allowed ips: 10.13.40.1/32
>
>   peer: [peer B]
>     preshared key: (hidden)
>     allowed ips: 10.13.41.1/32, fd42:dead::/32
>
> --
> Aleksa Sarai
> Senior Software Engineer (Containers)
> SUSE Linux GmbH
> <https://www.cyphar.com/>
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
>

--000000000000dd4bdd05889e3687
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">No, I think its correct behaviour.<div dir=3D"auto">If yo=
u have overlapping networks=C2=A0 the more specific route is preferred. <a =
href=3D"http://10.10.10.0/24">10.10.10.0/24</a> overrule <a href=3D"http://=
10.10.0.0/16">10.10.0.0/16</a>.</div><div dir=3D"auto">If the subnets are t=
he same, the last one is the more specific (because most recent one) and sh=
ould be used.</div><div dir=3D"auto"><br></div><div dir=3D"auto">And in ger=
many, we say (literal translation):=C2=A0You&#39;re allowed to shoot yourse=
lf in the knee.</div><div dir=3D"auto">(to be self-defeating) :-)</div><div=
 dir=3D"auto"><br></div><div dir=3D"auto"><br></div></div><br><div class=3D=
"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Aleksa Sarai &lt;<a hre=
f=3D"mailto:cyphar@cyphar.com">cyphar@cyphar.com</a>&gt; schrieb am Sa., 11=
. Mai 2019, 15:09:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hi all,<br>
<br>
I just found out that WireGuard apparently allows you to configure an<br>
interface that has peers with overlapping AllowedIPs ranges -- which<br>
obviously won&#39;t work with cryptokey routing -- but additionally is<br>
strange since I feel this should cause an error when configuring the<br>
interface.<br>
<br>
In my case, I accidentally used /32 when generating the IPv6 addresses<br>
of my clients and ended up with a config like:<br>
<br>
=C2=A0 [Interface]<br>
=C2=A0 Address =3D <a href=3D"http://10.13.37.1/32,fd00:dead:beef:cafe::1/6=
4" rel=3D"noreferrer noreferrer" target=3D"_blank">10.13.37.1/32,fd00:dead:=
beef:cafe::1/64</a><br>
=C2=A0 ListenPort =3D 51820<br>
=C2=A0 PrivateKey =3D [key]<br>
<br>
=C2=A0 # Peer A.<br>
=C2=A0 [Peer]<br>
=C2=A0 PublicKey =3D [pub]<br>
=C2=A0 PreSharedKey =3D [psk]<br>
=C2=A0 AllowedIPs =3D <a href=3D"http://10.13.40.1/32,fd00:dead:beef:1000::=
/32" rel=3D"noreferrer noreferrer" target=3D"_blank">10.13.40.1/32,fd00:dea=
d:beef:1000::/32</a><br>
<br>
=C2=A0 # Peer B.<br>
=C2=A0 [Peer]<br>
=C2=A0 PublicKey =3D [pub]<br>
=C2=A0 PreSharedKey =3D [psk]<br>
=C2=A0 AllowedIPs =3D <a href=3D"http://10.13.41.1/32,fd00:dead:beef:1001::=
/32" rel=3D"noreferrer noreferrer" target=3D"_blank">10.13.41.1/32,fd00:dea=
d:beef:1001::/32</a><br>
<br>
This config is wrong (because both peers have overlapping addresses<br>
specified for AllowedIPs), but wireguard will happily accept it:<br>
<br>
=C2=A0 % wg-quick up wg-foo<br>
=C2=A0 [#] ip link add wg-yavin type wireguard<br>
=C2=A0 [#] wg setconf wg-yavin /dev/fd/63<br>
=C2=A0 [#] ip address add <a href=3D"http://10.13.37.1/32" rel=3D"noreferre=
r noreferrer" target=3D"_blank">10.13.37.1/32</a> dev wg-yavin<br>
=C2=A0 [#] ip address add fd00:dead:beef:cafe::1/64 dev wg-yavin<br>
=C2=A0 [#] ip link set mtu 1420 up dev wg-yavin<br>
=C2=A0 [#] ip route add fd42:dead::/32 dev wg-yavin<br>
=C2=A0 [#] ip route add <a href=3D"http://10.13.41.1/32" rel=3D"noreferrer =
noreferrer" target=3D"_blank">10.13.41.1/32</a> dev wg-yavin<br>
=C2=A0 [#] ip route add <a href=3D"http://10.13.40.1/32" rel=3D"noreferrer =
noreferrer" target=3D"_blank">10.13.40.1/32</a> dev wg-yavin<br>
<br>
This configuration results in only one of the peers actually being given<br=
>
the IPv6 range, but I feel like &quot;wg setconf&quot; should&#39;ve reject=
ed this<br>
configuration.<br>
<br>
=C2=A0 % wg<br>
=C2=A0 interface: wg-foo<br>
=C2=A0 =C2=A0 public key: [pub]<br>
=C2=A0 =C2=A0 private key: (hidden)<br>
=C2=A0 =C2=A0 listening port: 51820<br>
<br>
=C2=A0 peer: [peer A]<br>
=C2=A0 =C2=A0 preshared key: (hidden)<br>
=C2=A0 =C2=A0 allowed ips: <a href=3D"http://10.13.40.1/32" rel=3D"noreferr=
er noreferrer" target=3D"_blank">10.13.40.1/32</a><br>
<br>
=C2=A0 peer: [peer B]<br>
=C2=A0 =C2=A0 preshared key: (hidden)<br>
=C2=A0 =C2=A0 allowed ips: <a href=3D"http://10.13.41.1/32" rel=3D"noreferr=
er noreferrer" target=3D"_blank">10.13.41.1/32</a>, fd42:dead::/32<br>
<br>
-- <br>
Aleksa Sarai<br>
Senior Software Engineer (Containers)<br>
SUSE Linux GmbH<br>
&lt;<a href=3D"https://www.cyphar.com/" rel=3D"noreferrer noreferrer" targe=
t=3D"_blank">https://www.cyphar.com/</a>&gt;<br>
_______________________________________________<br>
WireGuard mailing list<br>
<a href=3D"mailto:WireGuard@lists.zx2c4.com" target=3D"_blank" rel=3D"noref=
errer">WireGuard@lists.zx2c4.com</a><br>
<a href=3D"https://lists.zx2c4.com/mailman/listinfo/wireguard" rel=3D"noref=
errer noreferrer" target=3D"_blank">https://lists.zx2c4.com/mailman/listinf=
o/wireguard</a><br>
</blockquote></div>

--000000000000dd4bdd05889e3687--

--===============7202984283235144411==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============7202984283235144411==--
