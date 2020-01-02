Return-Path: <SRS0=qbNG=2Y=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,
	NORMAL_HTTP_TO_IP,NUMERIC_HTTP_ADDR,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 804B2C2D0CE
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  3 Jan 2020 15:40:06 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 25CF221734
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  3 Jan 2020 15:40:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h9554U5w"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 25CF221734
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 00547df9;
	Fri, 3 Jan 2020 15:39:13 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bb0c0231
 for <wireguard@lists.zx2c4.com>; Thu, 2 Jan 2020 06:23:22 +0000 (UTC)
Received: from mail-vs1-xe2e.google.com (mail-vs1-xe2e.google.com
 [IPv6:2607:f8b0:4864:20::e2e])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ce9afd4b
 for <wireguard@lists.zx2c4.com>; Thu, 2 Jan 2020 06:23:22 +0000 (UTC)
Received: by mail-vs1-xe2e.google.com with SMTP id x123so24832086vsc.2
 for <wireguard@lists.zx2c4.com>; Wed, 01 Jan 2020 22:23:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YsIFeZ+rq5pOxteQXckHTHux0qeStH/OgRuko4GPiXc=;
 b=h9554U5wD3mvi+ERQQnWoSFJ5n8j7BZkJZZTD8lU8UR5vM2yBEer7S55r4xuULwMny
 5mqglQqVtsKnrKH5ZKzksWtc4BnPbUIDL1h5U0AhB5ZJvxKY+6BspGBcCf9qe8XVM8ug
 WONgbR0yeK72Y7oFKra6I5kPvV2rHoPzD23mmz7jD3b7C8YcUjGiGN6ySDc5VInraTKO
 4qvo1eoTdJrd0rC3IurlztCiUSs2BDuajzDJZEJIthTKu3aRX0Za+FbpP0OMM9aGjVx9
 Jui7W4e4YzdeaMuhKTdnMfatKlStm7v67he1fxb6ncFtPQyBa/K97cydqJER+dDlQMwF
 7QGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YsIFeZ+rq5pOxteQXckHTHux0qeStH/OgRuko4GPiXc=;
 b=jw6J6ilOQHKHvS1SpcBqZsKy07Ze759TDwhIJsW+lf90Bdvp7KFVvgZPTSeJm/MUlB
 ZMs15FzjogvfLJazDCYaPA4Z8lfUtAX7J6cn3yIu7JT/XrV1kaLqVj7/nt66BESkzObn
 Ca3OQQ/+cMRNHUV3fOL27LT+XyL8t8wEbeyxoZ8KUDnAKla2fLbkCAKczlWAub83I+ZL
 VX0qtBLHBuD8/rdBbJpcQaqg6O2JpwmnZCaYxnYIrzj0jjYTxcWT4ie0kNzjceoCrodA
 EXyn7NFqu7Lmt+ui49/GPuueKedRT2d3uJeb5WDlRli1liVTlvGotd14mVtegiDNWb4l
 o8ZA==
X-Gm-Message-State: APjAAAU2l1KbGkVdMrWoJ8CgQ3aRIk1VXmZcCRnpPwVwBCZIcsE7kN4f
 b26yHGLWXO3MGt0Wh8C0w+NqqDh4LIF55y2zyXw=
X-Google-Smtp-Source: APXvYqxkrXY7Z+cYf4gDLqoTdL8adv3vcc3PLTP0S6O1iRmAihbGh79wTpaVWWRvWpWngNcc1OHU8nINpyvNWtDDBJ8=
X-Received: by 2002:a67:c185:: with SMTP id h5mr45166664vsj.211.1577946200996; 
 Wed, 01 Jan 2020 22:23:20 -0800 (PST)
MIME-Version: 1.0
References: <b3fb12ff-969a-9037-ee6f-f8e4b6d91895@attglobal.net>
In-Reply-To: <b3fb12ff-969a-9037-ee6f-f8e4b6d91895@attglobal.net>
From: Edward Vielmetti <edward.vielmetti@gmail.com>
Date: Thu, 2 Jan 2020 01:22:43 -0500
Message-ID: <CAPRZce10tz0KgBUMFcHj09WDvUF_ygpMBQckB-Nebnjk52479g@mail.gmail.com>
Subject: Re: wg-quick: syntax error, unexpected saddr
To: stunnel@attglobal.net
X-Mailman-Approved-At: Fri, 03 Jan 2020 16:39:10 +0100
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
Content-Type: multipart/mixed; boundary="===============3275918265557927658=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============3275918265557927658==
Content-Type: multipart/alternative; boundary="000000000000c8ffe1059b223ace"

--000000000000c8ffe1059b223ace
Content-Type: text/plain; charset="UTF-8"

Eddie - what version of nftables does Slackware come with? The output of
`nft -v` should be helpful.

There is a report from stackexchange that nftables at 0.7 gives this error,
but at 0.8.1 or better it's OK. I was not easily able to verify that from
the source code, but it would be where I'd start to look. There was

The nftables 0.8.1 release notes (from 2018) are here:
https://lwn.net/Articles/744480/ and it points to new syntax in this
release.

good luck!

Ed

On Thu, Jan 2, 2020 at 12:27 AM Eddie <stunnel@attglobal.net> wrote:

> First time running wireguard as a native client on my Slackware 14.2
> system throws this:
>
> root@The-Tardis:~# wg-quick up wg0
> [#] ip link add wg0 type wireguard
> [#] wg setconf wg0 /dev/fd/63
> [#] ip -4 address add 192.168.150.14/32 dev wg0
> [#] ip link set mtu 1420 up dev wg0
> [#] wg set wg0 fwmark 51820
> [#] ip -4 route add 0.0.0.0/0 dev wg0 table 51820
> [#] ip -4 rule add not fwmark 51820 table 51820
> [#] ip -4 rule add table main suppress_prefixlength 0
> [#] sysctl -q net.ipv4.conf.all.src_valid_mark=1
> [#] nft -f /dev/fd/63
> /dev/fd/63:5:76-80: Error: syntax error, unexpected saddr
>
> Fairly simple config to connect to my VPS:
>
> [Interface]
> Address = 192.168.150.14/32
> PrivateKey = <Not the key you're looking for>
>
> [Peer]
> PublicKey = <Just being overly paranoid>
> Endpoint = www.xxx.yyy.zzz:51820
> AllowedIPs = 0.0.0.0/0
>
> Not sure what additional information you need collected at this point.
>
> I'm able to connect outbound successfully using NordVPN's version of
> wireguard, but that doesn't use wg-quick, which is where the issue is.
>
> Cheers.
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
>


-- 
Edward Vielmetti +1 734 330 2465
edward.vielmetti@gmail.com

--000000000000c8ffe1059b223ace
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Eddie - what version of nftables does Slackware come with?=
 The output of `nft -v` should be helpful.<div><br></div><div>There is a re=
port from stackexchange that nftables at 0.7 gives this error, but at 0.8.1=
 or better it&#39;s OK. I was not easily able to verify that from the sourc=
e code, but it would be where I&#39;d start to look. There was=C2=A0</div><=
div><br></div><div>The nftables 0.8.1 release notes (from 2018) are here:=
=C2=A0<a href=3D"https://lwn.net/Articles/744480/">https://lwn.net/Articles=
/744480/</a>=C2=A0and it points to new syntax in this release.</div><div><b=
r></div><div>good luck!</div><div><br></div><div>Ed</div></div><br><div cla=
ss=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jan 2, 202=
0 at 12:27 AM Eddie &lt;<a href=3D"mailto:stunnel@attglobal.net">stunnel@at=
tglobal.net</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">First time running wireguard as a native client on my Slackware =
14.2 <br>
system throws this:<br>
<br>
root@The-Tardis:~# wg-quick up wg0<br>
[#] ip link add wg0 type wireguard<br>
[#] wg setconf wg0 /dev/fd/63<br>
[#] ip -4 address add <a href=3D"http://192.168.150.14/32" rel=3D"noreferre=
r" target=3D"_blank">192.168.150.14/32</a> dev wg0<br>
[#] ip link set mtu 1420 up dev wg0<br>
[#] wg set wg0 fwmark 51820<br>
[#] ip -4 route add <a href=3D"http://0.0.0.0/0" rel=3D"noreferrer" target=
=3D"_blank">0.0.0.0/0</a> dev wg0 table 51820<br>
[#] ip -4 rule add not fwmark 51820 table 51820<br>
[#] ip -4 rule add table main suppress_prefixlength 0<br>
[#] sysctl -q net.ipv4.conf.all.src_valid_mark=3D1<br>
[#] nft -f /dev/fd/63<br>
/dev/fd/63:5:76-80: Error: syntax error, unexpected saddr<br>
<br>
Fairly simple config to connect to my VPS:<br>
<br>
[Interface]<br>
Address =3D <a href=3D"http://192.168.150.14/32" rel=3D"noreferrer" target=
=3D"_blank">192.168.150.14/32</a><br>
PrivateKey =3D &lt;Not the key you&#39;re looking for&gt;<br>
<br>
[Peer]<br>
PublicKey =3D &lt;Just being overly paranoid&gt;<br>
Endpoint =3D www.xxx.yyy.zzz:51820<br>
AllowedIPs =3D <a href=3D"http://0.0.0.0/0" rel=3D"noreferrer" target=3D"_b=
lank">0.0.0.0/0</a><br>
<br>
Not sure what additional information you need collected at this point.<br>
<br>
I&#39;m able to connect outbound successfully using NordVPN&#39;s version o=
f <br>
wireguard, but that doesn&#39;t use wg-quick, which is where the issue is.<=
br>
<br>
Cheers.<br>
_______________________________________________<br>
WireGuard mailing list<br>
<a href=3D"mailto:WireGuard@lists.zx2c4.com" target=3D"_blank">WireGuard@li=
sts.zx2c4.com</a><br>
<a href=3D"https://lists.zx2c4.com/mailman/listinfo/wireguard" rel=3D"noref=
errer" target=3D"_blank">https://lists.zx2c4.com/mailman/listinfo/wireguard=
</a><br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature">Edward Vielmetti=C2=A0+1 734 330 2465<div><a hre=
f=3D"mailto:edward.vielmetti@gmail.com" target=3D"_blank">edward.vielmetti@=
gmail.com</a></div><div><br></div></div>

--000000000000c8ffe1059b223ace--

--===============3275918265557927658==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============3275918265557927658==--
