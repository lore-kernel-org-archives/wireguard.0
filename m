Return-Path: <SRS0=8BwB=4N=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,
	NUMERIC_HTTP_ADDR,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F624C35DEE
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 25 Feb 2020 00:47:19 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A3D182072D
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 25 Feb 2020 00:47:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=panagiotou.net header.i=@panagiotou.net header.b="Z0HGc+KG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A3D182072D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=panagiotou.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c59aca29;
	Tue, 25 Feb 2020 00:43:48 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5beb617b
 for <wireguard@lists.zx2c4.com>;
 Sun, 23 Feb 2020 16:46:22 +0000 (UTC)
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0cae0c3f
 for <wireguard@lists.zx2c4.com>;
 Sun, 23 Feb 2020 16:46:21 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id o15so7393844ljg.6
 for <wireguard@lists.zx2c4.com>; Sun, 23 Feb 2020 08:49:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=panagiotou.net; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7zXu98uAszyshVoLHPpl4UVLbidpbbSKtIKvE36eNUc=;
 b=Z0HGc+KG124HtJUMxBH9HeejQZ9PnKtlST6HcEZBvD10WZ6T1BCq/lkwbe5NDl3TFB
 naI5p2gJUz+GTIyR41JB/cRsYT0YclB6b94v7cAk/xHsJVJJE2d9md6oonn/0OMRmawR
 BEcQMKRlSj7SAhv9h7OXk0GuoVVgezw5mBpgprnyQZEYbH3Zm/FG6XMFMDKF4BTYtFiF
 ZBSgoo8gqAL59WnKy9qM1f+seuKQSKhyVa+JPJn/4dcsX6ynWoyRdalRzRizcP8FGwQH
 +oVjh0PEQ8/dE0TDqsbd+tUET6pd65npNtKBFKd/wCqmA7Ex87zsLfuuQLpOsoyOZDUw
 dg6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7zXu98uAszyshVoLHPpl4UVLbidpbbSKtIKvE36eNUc=;
 b=KfAmxKU6hLHCalfwE4R5tg3ufI36gK/XVJtTED8Fxg+rrlgD31iFTlO0ZZlh3WKlfZ
 QgKlqo8EfzxwwBYtx31rX6E4TdbgxqU2Ph8GLfwUnXoQs3UcvIVVipgnjh1xZfwHf9HW
 ptrweV9zfh7cDjX3PrbkbDC/a2FNyV7qlB/xlSuZniNzVLDO6wBmZ+Skx5jAqFWLgNKB
 xvz0CS4W3KDBzFlkNNki+YRN9f1Od1wYbm/5/pKCP57XaLsxEbJxX06kmUT/PtPK7aOg
 vZUn63TaF5a+3dgcxh30Q/VxUNFdaVCzxV5suDA+ThgFgSTxx2uofoJnh0WtzeOe96TJ
 0m1Q==
X-Gm-Message-State: APjAAAVY3SeUGuO04vXtOb3WpvztgFyUpk+WiDh9A5IQH1IRUc5vq0L9
 Q1wZyDZqrlCunVP8vweG+KSMQaVADtk0RHV5THXfBPftr4g=
X-Google-Smtp-Source: APXvYqy/Q7ZaijUXWi9GTXycSiZYuBhShouhGqZc3+1HP/J68stvY1TmJIulLNPK/GkvuQOi3zXdEC9/03NBs4APsEU=
X-Received: by 2002:a2e:98ca:: with SMTP id s10mr5125992ljj.160.1582476577066; 
 Sun, 23 Feb 2020 08:49:37 -0800 (PST)
MIME-Version: 1.0
References: <CAPMuNSoJaLGxTErezypvgh4j6iD9Kj2eh2UtEaGLANqjgwJ6YQ@mail.gmail.com>
 <CAHmME9oOq0iVAZZ63N-3yF52pn+D9XEa=dz8hOepq6N8d-e_oQ@mail.gmail.com>
In-Reply-To: <CAHmME9oOq0iVAZZ63N-3yF52pn+D9XEa=dz8hOepq6N8d-e_oQ@mail.gmail.com>
From: "Dimitri J. Panagiotou" <dimitri@panagiotou.net>
Date: Sun, 23 Feb 2020 08:49:25 -0800
Message-ID: <CAPMuNSr9d2MZQOXJ3xT9uoXj+nOawJxJGDxr4Bf4oSXe6GaFjw@mail.gmail.com>
Subject: Re: xtables lock at startup?
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
X-Mailman-Approved-At: Tue, 25 Feb 2020 01:43:43 +0100
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
Content-Type: multipart/mixed; boundary="===============7386313506830649731=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============7386313506830649731==
Content-Type: multipart/alternative; boundary="0000000000003de459059f410ae2"

--0000000000003de459059f410ae2
Content-Type: text/plain; charset="UTF-8"

OK, thanks.



On Sun, Feb 23, 2020 at 2:58 AM Jason A. Donenfeld <Jason@zx2c4.com> wrote:

> Do what it says; pass the -w option to iptables.
>
> On Sun, Feb 23, 2020, 11:36 Dimitri J. Panagiotou <dimitri@panagiotou.net>
> wrote:
>
>> Hi,
>>
>> Since upgrading to Fedora 31 (5.5), wireguard (latest) does not start
>> after rebooting.
>> It does start with no problem at all after rebooting, by manually running
>> wg-quick.
>>
>> This is what I get:
>> -- Reboot --
>> Feb 22 01:19:48 myservername systemd[1]: Starting WireGuard via
>> wg-quick(8) for wg0...
>> Feb 22 01:19:49 myservername wg-quick[1173]: [#] ip link add wg0 type
>> wireguard
>> Feb 22 01:19:49 myservername wg-quick[1173]: [#] wg setconf wg0 /dev/fd/63
>> Feb 22 01:19:50 myservername wg-quick[1173]: [#] ip -4 address add
>> 10.12.182.1/24 dev wg0
>> Feb 22 01:19:50 myservername wg-quick[1173]: [#] ip link set mtu 1420 up
>> dev wg0
>> Feb 22 01:19:50 myservername wg-quick[1173]: [#] mount `10.12.197.1'
>> /etc/resolv.conf
>> Feb 22 01:19:51 myservername wg-quick[1173]: [#] iptables -A FORWARD -i
>> wg0 -j ACCEPT; iptables -t nat -A POSTROUTING -o enp2s0 -j MASQUERADE
>> Feb 22 01:19:51 myservername wg-quick[1173]: Another app is currently
>> holding the xtables lock. Perhaps you want to use the -w option?
>> Feb 22 01:19:51 myservername wg-quick[1173]: [#] umount /etc/resolv.conf
>> Feb 22 01:19:51 myservername wg-quick[1173]: [#] ip link delete dev wg0
>> Feb 22 01:19:51 myservername systemd[1]: wg-quick@wg0.service: Main
>> process exited, code=exited, status=4/NOPERMISSION
>> Feb 22 01:19:51 myservername systemd[1]: wg-quick@wg0.service: Failed
>> with result 'exit-code'.
>> Feb 22 01:19:51 myservername systemd[1]: Failed to start WireGuard via
>> wg-quick(8) for wg0.
>>
>> Running
>> wireguard-dkms.noarch                         1:0.0.20200215-2.fc31
>>            @jdoss-wireguard
>> wireguard-tools.x86_64                        1:1.0.20200102-1.fc31
>>            @jdoss-wireguard
>>
>> Any idea what's causing this?
>>
>> Thanks,
>> -dimitri
>>
>>
>> _______________________________________________
>> WireGuard mailing list
>> WireGuard@lists.zx2c4.com
>> https://lists.zx2c4.com/mailman/listinfo/wireguard
>>
>

--0000000000003de459059f410ae2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:tahoma,s=
ans-serif;color:#330033">OK, thanks.</div><div class=3D"gmail_default" styl=
e=3D"font-family:tahoma,sans-serif;color:#330033"><br></div></div><div><div=
 dir=3D"auto"><br></div></div><div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Sun, Feb 23, 2020 at 2:58 AM Jason A. Done=
nfeld &lt;<a href=3D"mailto:Jason@zx2c4.com" target=3D"_blank">Jason@zx2c4.=
com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x"><div dir=3D"auto">Do what it says; pass the -w option to iptables.</div>=
<br><div class=3D"gmail_quote"></div><div class=3D"gmail_quote"><div dir=3D=
"ltr" class=3D"gmail_attr">On Sun, Feb 23, 2020, 11:36 Dimitri J. Panagioto=
u &lt;<a href=3D"mailto:dimitri@panagiotou.net" target=3D"_blank">dimitri@p=
anagiotou.net</a>&gt; wrote:<br></div></div><div class=3D"gmail_quote"><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex"></blockquote></div><div class=
=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=
=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:tahoma,sans-seri=
f;color:rgb(51,0,51)">Hi,</div><div class=3D"gmail_default" style=3D"font-f=
amily:tahoma,sans-serif;color:rgb(51,0,51)"><br></div><div class=3D"gmail_d=
efault" style=3D"font-family:tahoma,sans-serif;color:rgb(51,0,51)">Since up=
grading to Fedora 31 (5.5), wireguard (latest) does not start after rebooti=
ng.</div><div class=3D"gmail_default" style=3D"font-family:tahoma,sans-seri=
f;color:rgb(51,0,51)">It does start with no problem at all after rebooting,=
 by manually running wg-quick.</div><div class=3D"gmail_default" style=3D"f=
ont-family:tahoma,sans-serif;color:rgb(51,0,51)"><br></div><div class=3D"gm=
ail_default" style=3D"font-family:tahoma,sans-serif;color:rgb(51,0,51)">Thi=
s is what I get:</div><div class=3D"gmail_default" style=3D"font-family:tah=
oma,sans-serif"><font color=3D"#330033">-- Reboot --</font><br><font color=
=3D"#330033">Feb 22 01:19:48 myservername systemd[1]: Starting WireGuard vi=
a wg-quick(8) for wg0...</font><br><font color=3D"#330033">Feb 22 01:19:49 =
myservername wg-quick[1173]: [#] ip link add wg0 type wireguard</font><br><=
font color=3D"#330033">Feb 22 01:19:49 myservername wg-quick[1173]: [#] wg =
setconf wg0 /dev/fd/63</font><br><font color=3D"#330033">Feb 22 01:19:50 my=
servername wg-quick[1173]: [#] ip -4 address add <a href=3D"http://10.12.18=
2.1/24" rel=3D"noreferrer" target=3D"_blank">10.12.182.1/24</a> dev wg0</fo=
nt><br><font color=3D"#330033">Feb 22 01:19:50 myservername wg-quick[1173]:=
 [#] ip link set mtu 1420 up dev wg0</font><br><font color=3D"#330033">Feb =
22 01:19:50 myservername wg-quick[1173]: [#] mount `10.12.197.1&#39; /etc/r=
esolv.conf</font><br><font color=3D"#330033">Feb 22 01:19:51 myservername w=
g-quick[1173]: [#] iptables -A FORWARD -i wg0 -j ACCEPT; iptables -t nat -A=
 POSTROUTING -o enp2s0 -j MASQUERADE</font><br><font color=3D"#ff0000">Feb =
22 01:19:51 myservername wg-quick[1173]: Another app is currently holding t=
he xtables lock. Perhaps you want to use the -w option?</font><br><font col=
or=3D"#330033">Feb 22 01:19:51 myservername wg-quick[1173]: [#] umount /etc=
/resolv.conf</font><br><font color=3D"#330033">Feb 22 01:19:51 myservername=
 wg-quick[1173]: [#] ip link delete dev wg0</font><br><font color=3D"#33003=
3">Feb 22 01:19:51 myservername systemd[1]: wg-quick@wg0.service: Main proc=
ess exited, code=3Dexited, status=3D4/NOPERMISSION</font><br><font color=3D=
"#330033">Feb 22 01:19:51 myservername systemd[1]: wg-quick@wg0.service: Fa=
iled with result &#39;exit-code&#39;.</font><br><font color=3D"#330033">Feb=
 22 01:19:51 myservername systemd[1]: Failed to start WireGuard via wg-quic=
k(8) for wg0.</font><br></div><div class=3D"gmail_default" style=3D"font-fa=
mily:tahoma,sans-serif;color:rgb(51,0,51)"><br></div><div class=3D"gmail_de=
fault" style=3D"font-family:tahoma,sans-serif;color:rgb(51,0,51)">Running=
=C2=A0</div><div class=3D"gmail_default" style=3D"font-family:tahoma,sans-s=
erif;color:rgb(51,0,51)">wireguard-dkms.noarch =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1:0.0.20200215-2.fc=
31 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0@jdoss-wir=
eguard<br>wireguard-tools.x86_64 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A01:1.0.20200102-1.fc31 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0@jdoss-wireguard<br></d=
iv><div class=3D"gmail_default" style=3D"font-family:tahoma,sans-serif;colo=
r:rgb(51,0,51)"><br></div><div class=3D"gmail_default" style=3D"font-family=
:tahoma,sans-serif;color:rgb(51,0,51)">Any idea what&#39;s causing this?=C2=
=A0=C2=A0</div><div class=3D"gmail_default" style=3D"font-family:tahoma,san=
s-serif;color:rgb(51,0,51)"><br></div><div class=3D"gmail_default" style=3D=
"font-family:tahoma,sans-serif;color:rgb(51,0,51)">Thanks,</div><div class=
=3D"gmail_default" style=3D"font-family:tahoma,sans-serif;color:rgb(51,0,51=
)">-dimitri</div><div class=3D"gmail_default" style=3D"font-family:tahoma,s=
ans-serif;color:rgb(51,0,51)"><br></div><div class=3D"gmail_default" style=
=3D"font-family:tahoma,sans-serif;color:rgb(51,0,51)"><br></div></div></blo=
ckquote></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">
_______________________________________________<br>
WireGuard mailing list<br>
<a href=3D"mailto:WireGuard@lists.zx2c4.com" rel=3D"noreferrer" target=3D"_=
blank">WireGuard@lists.zx2c4.com</a><br>
<a href=3D"https://lists.zx2c4.com/mailman/listinfo/wireguard" rel=3D"noref=
errer noreferrer" target=3D"_blank">https://lists.zx2c4.com/mailman/listinf=
o/wireguard</a><br>
</blockquote></div>
</blockquote></div></div>

--0000000000003de459059f410ae2--

--===============7386313506830649731==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============7386313506830649731==--
