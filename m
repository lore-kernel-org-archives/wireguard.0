Return-Path: <SRS0=ZSUP=4L=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,
	NUMERIC_HTTP_ADDR,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D22EC35671
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 23 Feb 2020 10:59:01 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0DDBF20637
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 23 Feb 2020 10:59:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="AsoAgRr4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0DDBF20637
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id befb1c11;
	Sun, 23 Feb 2020 10:55:18 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e2be63bd
 for <wireguard@lists.zx2c4.com>;
 Sun, 23 Feb 2020 10:55:16 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ee229dcb
 for <wireguard@lists.zx2c4.com>;
 Sun, 23 Feb 2020 10:55:16 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 85dbd3b2
 for <wireguard@lists.zx2c4.com>;
 Sun, 23 Feb 2020 10:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=sQOhhhuo24k1UwYAkL2qs4A6yhY=; b=AsoAgR
 r4hNlvyr59h+I1g93yRz/MMqz5uX4WGIc7oohmAbK+meJHNYKxqxqi1P4/2Oazro
 wb8X4oC/02HHEXJlJLmI0li0/3BE6wGvxD0wlkX22jTBnTBtouIjzcEBOVbAAUj6
 SC12LSoa7/ZsxYoRb8U+6ctuvLW0gSfuNnjf0OHhFDW3tyUaUXkNRemno6P05V3s
 BM+meVC59O/cN7naQQxcJNbCPcN8ygWNzmjjw+Cva1kpRTtXXMrVAIv0k1C/f6Ap
 fzLhuHubKCdo74dGW6Nfp/92C0/OhRLWllaWYYLd0k6/1l9m8UrTnq+Zc0x33dxZ
 H9Bys/DBhhETyCvA==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id dc3a7718
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 23 Feb 2020 10:55:16 +0000 (UTC)
Received: by mail-ot1-f45.google.com with SMTP id z9so6167325oth.5
 for <wireguard@lists.zx2c4.com>; Sun, 23 Feb 2020 02:58:31 -0800 (PST)
X-Gm-Message-State: APjAAAVn2Fs2ERoZrdJX9rwFYOTU5IU9YrIL3IndYP/KjlOxIiv7xKwq
 4skN/aD2VWgHXSBgR3Fr1EQm/ukmFAFJ8gJeHVM=
X-Google-Smtp-Source: APXvYqz3h5GcJVtvJDpEI7KkW88L8d9M7ubttlmMTvLuAzjHwDG4KYLBSKBhNn9HwLuwOVlXcDvDgMQZmybhKVBjYio=
X-Received: by 2002:a9d:7a47:: with SMTP id z7mr37001664otm.179.1582455510836; 
 Sun, 23 Feb 2020 02:58:30 -0800 (PST)
MIME-Version: 1.0
References: <CAPMuNSoJaLGxTErezypvgh4j6iD9Kj2eh2UtEaGLANqjgwJ6YQ@mail.gmail.com>
In-Reply-To: <CAPMuNSoJaLGxTErezypvgh4j6iD9Kj2eh2UtEaGLANqjgwJ6YQ@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 23 Feb 2020 11:58:18 +0100
X-Gmail-Original-Message-ID: <CAHmME9oOq0iVAZZ63N-3yF52pn+D9XEa=dz8hOepq6N8d-e_oQ@mail.gmail.com>
Message-ID: <CAHmME9oOq0iVAZZ63N-3yF52pn+D9XEa=dz8hOepq6N8d-e_oQ@mail.gmail.com>
Subject: Re: xtables lock at startup?
To: "Dimitri J. Panagiotou" <dimitri@panagiotou.net>
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
Content-Type: multipart/mixed; boundary="===============0300739917471543528=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============0300739917471543528==
Content-Type: multipart/alternative; boundary="00000000000098ae92059f3c2296"

--00000000000098ae92059f3c2296
Content-Type: text/plain; charset="UTF-8"

Do what it says; pass the -w option to iptables.

On Sun, Feb 23, 2020, 11:36 Dimitri J. Panagiotou <dimitri@panagiotou.net>
wrote:

> Hi,
>
> Since upgrading to Fedora 31 (5.5), wireguard (latest) does not start
> after rebooting.
> It does start with no problem at all after rebooting, by manually running
> wg-quick.
>
> This is what I get:
> -- Reboot --
> Feb 22 01:19:48 myservername systemd[1]: Starting WireGuard via
> wg-quick(8) for wg0...
> Feb 22 01:19:49 myservername wg-quick[1173]: [#] ip link add wg0 type
> wireguard
> Feb 22 01:19:49 myservername wg-quick[1173]: [#] wg setconf wg0 /dev/fd/63
> Feb 22 01:19:50 myservername wg-quick[1173]: [#] ip -4 address add
> 10.12.182.1/24 dev wg0
> Feb 22 01:19:50 myservername wg-quick[1173]: [#] ip link set mtu 1420 up
> dev wg0
> Feb 22 01:19:50 myservername wg-quick[1173]: [#] mount `10.12.197.1'
> /etc/resolv.conf
> Feb 22 01:19:51 myservername wg-quick[1173]: [#] iptables -A FORWARD -i
> wg0 -j ACCEPT; iptables -t nat -A POSTROUTING -o enp2s0 -j MASQUERADE
> Feb 22 01:19:51 myservername wg-quick[1173]: Another app is currently
> holding the xtables lock. Perhaps you want to use the -w option?
> Feb 22 01:19:51 myservername wg-quick[1173]: [#] umount /etc/resolv.conf
> Feb 22 01:19:51 myservername wg-quick[1173]: [#] ip link delete dev wg0
> Feb 22 01:19:51 myservername systemd[1]: wg-quick@wg0.service: Main
> process exited, code=exited, status=4/NOPERMISSION
> Feb 22 01:19:51 myservername systemd[1]: wg-quick@wg0.service: Failed
> with result 'exit-code'.
> Feb 22 01:19:51 myservername systemd[1]: Failed to start WireGuard via
> wg-quick(8) for wg0.
>
> Running
> wireguard-dkms.noarch                         1:0.0.20200215-2.fc31
>            @jdoss-wireguard
> wireguard-tools.x86_64                        1:1.0.20200102-1.fc31
>            @jdoss-wireguard
>
> Any idea what's causing this?
>
> Thanks,
> -dimitri
>
>
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
>

--00000000000098ae92059f3c2296
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Do what it says; pass the -w option to iptables.</div><br=
><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, F=
eb 23, 2020, 11:36 Dimitri J. Panagiotou &lt;<a href=3D"mailto:dimitri@pana=
giotou.net">dimitri@panagiotou.net</a>&gt; wrote:<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pad=
ding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-=
family:tahoma,sans-serif;color:#330033">Hi,</div><div class=3D"gmail_defaul=
t" style=3D"font-family:tahoma,sans-serif;color:#330033"><br></div><div cla=
ss=3D"gmail_default" style=3D"font-family:tahoma,sans-serif;color:#330033">=
Since upgrading to Fedora 31 (5.5), wireguard (latest) does not start after=
 rebooting.</div><div class=3D"gmail_default" style=3D"font-family:tahoma,s=
ans-serif;color:#330033">It does start with no problem at all after rebooti=
ng, by manually running wg-quick.</div><div class=3D"gmail_default" style=
=3D"font-family:tahoma,sans-serif;color:#330033"><br></div><div class=3D"gm=
ail_default" style=3D"font-family:tahoma,sans-serif;color:#330033">This is =
what I get:</div><div class=3D"gmail_default" style=3D"font-family:tahoma,s=
ans-serif"><font color=3D"#330033">-- Reboot --</font><br><font color=3D"#3=
30033">Feb 22 01:19:48 myservername systemd[1]: Starting WireGuard via wg-q=
uick(8) for wg0...</font><br><font color=3D"#330033">Feb 22 01:19:49 myserv=
ername wg-quick[1173]: [#] ip link add wg0 type wireguard</font><br><font c=
olor=3D"#330033">Feb 22 01:19:49 myservername wg-quick[1173]: [#] wg setcon=
f wg0 /dev/fd/63</font><br><font color=3D"#330033">Feb 22 01:19:50 myserver=
name wg-quick[1173]: [#] ip -4 address add <a href=3D"http://10.12.182.1/24=
" target=3D"_blank" rel=3D"noreferrer">10.12.182.1/24</a> dev wg0</font><br=
><font color=3D"#330033">Feb 22 01:19:50 myservername wg-quick[1173]: [#] i=
p link set mtu 1420 up dev wg0</font><br><font color=3D"#330033">Feb 22 01:=
19:50 myservername wg-quick[1173]: [#] mount `10.12.197.1&#39; /etc/resolv.=
conf</font><br><font color=3D"#330033">Feb 22 01:19:51 myservername wg-quic=
k[1173]: [#] iptables -A FORWARD -i wg0 -j ACCEPT; iptables -t nat -A POSTR=
OUTING -o enp2s0 -j MASQUERADE</font><br><font color=3D"#ff0000">Feb 22 01:=
19:51 myservername wg-quick[1173]: Another app is currently holding the xta=
bles lock. Perhaps you want to use the -w option?</font><br><font color=3D"=
#330033">Feb 22 01:19:51 myservername wg-quick[1173]: [#] umount /etc/resol=
v.conf</font><br><font color=3D"#330033">Feb 22 01:19:51 myservername wg-qu=
ick[1173]: [#] ip link delete dev wg0</font><br><font color=3D"#330033">Feb=
 22 01:19:51 myservername systemd[1]: wg-quick@wg0.service: Main process ex=
ited, code=3Dexited, status=3D4/NOPERMISSION</font><br><font color=3D"#3300=
33">Feb 22 01:19:51 myservername systemd[1]: wg-quick@wg0.service: Failed w=
ith result &#39;exit-code&#39;.</font><br><font color=3D"#330033">Feb 22 01=
:19:51 myservername systemd[1]: Failed to start WireGuard via wg-quick(8) f=
or wg0.</font><br></div><div class=3D"gmail_default" style=3D"font-family:t=
ahoma,sans-serif;color:#330033"><br></div><div class=3D"gmail_default" styl=
e=3D"font-family:tahoma,sans-serif;color:#330033">Running=C2=A0</div><div c=
lass=3D"gmail_default" style=3D"font-family:tahoma,sans-serif;color:#330033=
">wireguard-dkms.noarch =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1:0.0.20200215-2.fc31 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0@jdoss-wireguard<br>wireguard-=
tools.x86_64 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A01:1.0.20200102-1.fc31 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0@jdoss-wireguard<br></div><div class=3D"gmai=
l_default" style=3D"font-family:tahoma,sans-serif;color:#330033"><br></div>=
<div class=3D"gmail_default" style=3D"font-family:tahoma,sans-serif;color:#=
330033">Any idea what&#39;s causing this?=C2=A0=C2=A0</div><div class=3D"gm=
ail_default" style=3D"font-family:tahoma,sans-serif;color:#330033"><br></di=
v><div class=3D"gmail_default" style=3D"font-family:tahoma,sans-serif;color=
:#330033">Thanks,</div><div class=3D"gmail_default" style=3D"font-family:ta=
homa,sans-serif;color:#330033">-dimitri</div><div class=3D"gmail_default" s=
tyle=3D"font-family:tahoma,sans-serif;color:#330033"><br></div><div class=
=3D"gmail_default" style=3D"font-family:tahoma,sans-serif;color:#330033"><b=
r></div></div>
_______________________________________________<br>
WireGuard mailing list<br>
<a href=3D"mailto:WireGuard@lists.zx2c4.com" target=3D"_blank" rel=3D"noref=
errer">WireGuard@lists.zx2c4.com</a><br>
<a href=3D"https://lists.zx2c4.com/mailman/listinfo/wireguard" rel=3D"noref=
errer noreferrer" target=3D"_blank">https://lists.zx2c4.com/mailman/listinf=
o/wireguard</a><br>
</blockquote></div>

--00000000000098ae92059f3c2296--

--===============0300739917471543528==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============0300739917471543528==--
