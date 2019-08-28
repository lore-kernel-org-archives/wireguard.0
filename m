Return-Path: <SRS0=H7Gu=WY=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E37EFC3A5A1
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 28 Aug 2019 06:18:15 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8716820856
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 28 Aug 2019 06:18:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nHH5Oq25"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8716820856
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 33c6945f;
	Wed, 28 Aug 2019 06:17:48 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9a9f035c
 for <wireguard@lists.zx2c4.com>;
 Wed, 28 Aug 2019 06:17:45 +0000 (UTC)
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bd9f547c
 for <wireguard@lists.zx2c4.com>;
 Wed, 28 Aug 2019 06:17:45 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id w18so1474829qki.0
 for <wireguard@lists.zx2c4.com>; Tue, 27 Aug 2019 23:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=K0/0I9L7t9RooaNoMz62TRZZy+FH4CKsPfsJ/OfS4Wk=;
 b=nHH5Oq25XQAvNbYXEV+E8AgZdxKBl5K/R8gToOXVjnbxm9z/MzcUPX83bI+mvZEe0w
 0P3fXTVTsH9iVuIPFzH4nmsNdGilRKGdYZANeiq72zdp10xZ3ke6SyKnJp/zYqUmoXBQ
 F42kNnZZjBomvqQgcW0X1Pl2zQ30PNkEMNHIRfzlyb4QUAZTzyBYqYIbizP4MAhSLf15
 lD/9Rbg2bKPcefnCggXpZbkiGL5dgJpyQQtrTCGLpSgnQymZ4YUKPYWYNTCxXkZgtCfr
 b/qc5Q+1skZk7TvYhcCjCJjiahyCT56cNczJ9D9nKmqthCe6jGjbx8pWL5OSYjf46ClM
 LXrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=K0/0I9L7t9RooaNoMz62TRZZy+FH4CKsPfsJ/OfS4Wk=;
 b=OAPXOrmSwacAxpZ8yOeZqA3NADpkNCC9Bm94uTR46s7LPsZ6Mb+ka8zxDkw+HIByHt
 aoHF2heMi2tafxNch0YC0ieWDq59Po4lJ7ul92fzWgHeZOED34V+Ggq9yVm0HOjah7ki
 7m7PB8DG4gvM1dlyptyiANZvFyG/yw9FGeDi/rrxFGYsjmOctWv+kXl9eYh83M1USOkU
 SVb2GK0LRE5dS5YUjbxk/yo/AudsJz5HcOD9gsJIPiImciq9aVPJYWMANsTzQ5zjSPEZ
 OAEpbZqOzdcHXLTyy2XVX6SorzuZieiSmcO7OePp059i2B9fpNidjQD8SisRJmtubqzy
 PvSQ==
X-Gm-Message-State: APjAAAXMl3/A8AEWxrbkZ/vNmQ+XqF61uRCsPFJGRUHDdT1nTvNKJv4l
 5SR3BzrLHfkdK2Rvvz9xNEvwWqL5HONy4UD1Ru+M7A==
X-Google-Smtp-Source: APXvYqwAbFvJYcVZVO9WCnKv+tNWga5tqz2GiigBjuXA/SwHvwKnl8E+8wcQrMf2YjMtmY9YwgMY7RoftUSBWMUYPDQ=
X-Received: by 2002:a05:620a:16dc:: with SMTP id
 a28mr2167919qkn.200.1566973065001; 
 Tue, 27 Aug 2019 23:17:45 -0700 (PDT)
MIME-Version: 1.0
References: <em08a1734c-6242-4687-b8d8-cf84e0b95ec3@ryzen>
 <CANH_QeYQ7hyBG1qK9PJB9E77gggW0NYe70vv8m6Dn=fU5zHQbg@mail.gmail.com>
 <em7afc7e4a-39a3-472d-ba45-79c6ad20b842@ryzen>
 <20190826180244.GB5022@matrix-dream.net>
In-Reply-To: <20190826180244.GB5022@matrix-dream.net>
From: Laszlo KERTESZ <laszlo.kertesz@gmail.com>
Date: Wed, 28 Aug 2019 09:17:32 +0300
Message-ID: <CANcuY=oE9L_sm1b_JJV4_fv+ABLx9ZbTeXXzijkiLw-b=CxkMQ@mail.gmail.com>
Subject: Re: Keep-alive does not keep the connection alive
To: =?UTF-8?B?SXZhbiBMYWLDoXRo?= <labawi-wg@matrix-dream.net>
Cc: wireguard@lists.zx2c4.com
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
Content-Type: multipart/mixed; boundary="===============3614317445209637059=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============3614317445209637059==
Content-Type: multipart/alternative; boundary="000000000000e97fd20591275820"

--000000000000e97fd20591275820
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I too use a server with dynamic ip. And the clients (Android, Linux) tend
to lose connectivity permanently if the server's ip changes. With or
without keepalive.

The dynamic ip's dns entries are updated almost instantly when the ip
changes so this is not dns related. Wireguard does not try to re establish
connection, it keeps using the server ip acquired at the tunnel's start.
Only way around this is restarting the interface.

On Mon, Aug 26, 2019, 21:08 Ivan Lab=C3=A1th <labawi-wg@matrix-dream.net> w=
rote:

> Hello,
>
> I notice you are using dynamic ips for server.
> On the client, is the server peer ip correct?
>
> Regards,
> Ivan
>
> On Sun, Aug 25, 2019 at 06:44:53PM +0000, Hendrik Friedel wrote:
> > Hello,
> >
> > thanks for your reply.
> > It is linux (Kernel 5.x) in both cases.
> >
> > Regards,
> > Hendrik
> >
> > ------ Originalnachricht ------
> > Von: "Vasili Pupkin" <diggest@gmail.com>
> > An: "Hendrik Friedel" <hendrik@friedels.name>
> > Cc: wireguard@lists.zx2c4.com
> > Gesendet: 25.08.2019 17:59:59
> > Betreff: Re: Keep-alive does not keep the connection alive
> >
> > >What OS is running on client side? I have this issue on Win7 client,
> > >can explain it further, it has nothing to do with keepalives though,
> > >it is a bug in tun adapter implementation
> > >
> > >On Sun, Aug 25, 2019 at 6:38 PM Hendrik Friedel <hendrik@friedels.name=
>
> wrote:
> > >>  I have a setup in which the Server IP is known, whereas the Client
> IP is changing. Thus, I rely on the Client to connect to the Server. I wa=
nt
> the Client to keep the connection alive all the time though, so that the
> Server can also initiate a connection to the Server when needed. Both,
> client and server are behind a NAT/Router.
> > >>  I would think, that the "PersistentKeepalive =3D 25" on the Client
> would ckeep the connection open. The connection works fine while used. Bu=
t
> after a while, I cannot connect from the Server to the client anymore.
> > >>  I would assume that a ping from the Client to the IP of the endpoin=
t
> would help to re-alive the connection - but it does not.
> > >>
> > >>  Only after a wg-quick down and up all is fine again.
> > >>
> > >>  Below some more information.
> > >>
> > >>  Can you help me to find, what I am doing wrong?
> >
> > _______________________________________________
> > WireGuard mailing list
> > WireGuard@lists.zx2c4.com
> > https://lists.zx2c4.com/mailman/listinfo/wireguard
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
>

--000000000000e97fd20591275820
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">I too use a server with dynamic ip. And the clients (Andr=
oid, Linux) tend to lose connectivity permanently if the server&#39;s ip ch=
anges. With or without keepalive.<div dir=3D"auto"><br></div><div dir=3D"au=
to">The dynamic ip&#39;s dns entries are updated almost instantly when the =
ip changes so this is not dns related. Wireguard does not try to re establi=
sh connection, it keeps using the server ip acquired at the tunnel&#39;s st=
art. Only way around this is restarting the interface.=C2=A0</div></div><br=
><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, A=
ug 26, 2019, 21:08 Ivan Lab=C3=A1th &lt;<a href=3D"mailto:labawi-wg@matrix-=
dream.net">labawi-wg@matrix-dream.net</a>&gt; wrote:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;=
padding-left:1ex">Hello,<br>
<br>
I notice you are using dynamic ips for server.<br>
On the client, is the server peer ip correct?<br>
<br>
Regards,<br>
Ivan<br>
<br>
On Sun, Aug 25, 2019 at 06:44:53PM +0000, Hendrik Friedel wrote:<br>
&gt; Hello,<br>
&gt; <br>
&gt; thanks for your reply.<br>
&gt; It is linux (Kernel 5.x) in both cases.<br>
&gt; <br>
&gt; Regards,<br>
&gt; Hendrik<br>
&gt; <br>
&gt; ------ Originalnachricht ------<br>
&gt; Von: &quot;Vasili Pupkin&quot; &lt;<a href=3D"mailto:diggest@gmail.com=
" target=3D"_blank" rel=3D"noreferrer">diggest@gmail.com</a>&gt;<br>
&gt; An: &quot;Hendrik Friedel&quot; &lt;<a href=3D"mailto:hendrik@friedels=
.name" target=3D"_blank" rel=3D"noreferrer">hendrik@friedels.name</a>&gt;<b=
r>
&gt; Cc: <a href=3D"mailto:wireguard@lists.zx2c4.com" target=3D"_blank" rel=
=3D"noreferrer">wireguard@lists.zx2c4.com</a><br>
&gt; Gesendet: 25.08.2019 17:59:59<br>
&gt; Betreff: Re: Keep-alive does not keep the connection alive<br>
&gt; <br>
&gt; &gt;What OS is running on client side? I have this issue on Win7 clien=
t,<br>
&gt; &gt;can explain it further, it has nothing to do with keepalives thoug=
h,<br>
&gt; &gt;it is a bug in tun adapter implementation<br>
&gt; &gt;<br>
&gt; &gt;On Sun, Aug 25, 2019 at 6:38 PM Hendrik Friedel &lt;<a href=3D"mai=
lto:hendrik@friedels.name" target=3D"_blank" rel=3D"noreferrer">hendrik@fri=
edels.name</a>&gt; wrote:<br>
&gt; &gt;&gt;=C2=A0 I have a setup in which the Server IP is known, whereas=
 the Client IP is changing. Thus, I rely on the Client to connect to the Se=
rver. I want the Client to keep the connection alive all the time though, s=
o that the Server can also initiate a connection to the Server when needed.=
 Both, client and server are behind a NAT/Router.<br>
&gt; &gt;&gt;=C2=A0 I would think, that the &quot;PersistentKeepalive =3D 2=
5&quot; on the Client would ckeep the connection open. The connection works=
 fine while used. But after a while, I cannot connect from the Server to th=
e client anymore.<br>
&gt; &gt;&gt;=C2=A0 I would assume that a ping from the Client to the IP of=
 the endpoint would help to re-alive the connection - but it does not.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;=C2=A0 Only after a wg-quick down and up all is fine again.<br=
>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;=C2=A0 Below some more information.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;=C2=A0 Can you help me to find, what I am doing wrong?<br>
&gt; <br>
&gt; _______________________________________________<br>
&gt; WireGuard mailing list<br>
&gt; <a href=3D"mailto:WireGuard@lists.zx2c4.com" target=3D"_blank" rel=3D"=
noreferrer">WireGuard@lists.zx2c4.com</a><br>
&gt; <a href=3D"https://lists.zx2c4.com/mailman/listinfo/wireguard" rel=3D"=
noreferrer noreferrer" target=3D"_blank">https://lists.zx2c4.com/mailman/li=
stinfo/wireguard</a><br>
_______________________________________________<br>
WireGuard mailing list<br>
<a href=3D"mailto:WireGuard@lists.zx2c4.com" target=3D"_blank" rel=3D"noref=
errer">WireGuard@lists.zx2c4.com</a><br>
<a href=3D"https://lists.zx2c4.com/mailman/listinfo/wireguard" rel=3D"noref=
errer noreferrer" target=3D"_blank">https://lists.zx2c4.com/mailman/listinf=
o/wireguard</a><br>
</blockquote></div>

--000000000000e97fd20591275820--

--===============3614317445209637059==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============3614317445209637059==--
