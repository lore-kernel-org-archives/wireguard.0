Return-Path: <SRS0=F0uL=3T=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5658C33C9E
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 30 Jan 2020 09:05:49 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 577E5206F0
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 30 Jan 2020 09:05:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="UdyafQ3n"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 577E5206F0
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5b664d01;
	Thu, 30 Jan 2020 09:05:29 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4f2056b6
 for <wireguard@lists.zx2c4.com>;
 Thu, 30 Jan 2020 09:05:26 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 215893b9
 for <wireguard@lists.zx2c4.com>;
 Thu, 30 Jan 2020 09:05:26 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 79a3f904
 for <wireguard@lists.zx2c4.com>;
 Thu, 30 Jan 2020 09:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=5XeZMsMqe6phWJpNRVOg9CJcQf0=; b=UdyafQ
 3nOzRBpXm4g3ayU9TbaKJqxzxrnzWj6Gcrm91UDmXnKNx+jBstnXrU45RsAnzxts
 ExqBaLvc/8MzOkWkj3TN8nIQOzMsdb/Ge2yqWFeH+h8TvHx6Y7/xA5jJGrJWkKsA
 mNGaOx2GAu2CS63+6dr87uL+vEHVW6jgU6z8hW1snzwhcNROMjJKJmDEplrwZSlh
 e4XTI81evNXLtBOsG2kllOaIyNT0X/AcDjbbQ207cRq42507o+3m9whe4XUHNLxr
 cUbFZI8nLPhOkVszkwaM/fhSTEZY1xmNF50qeLBopbpbN97+OIp0hdrRxdq9twGX
 SlbZqF5IIcqT0QLg==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 05708d4c
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 30 Jan 2020 09:05:25 +0000 (UTC)
Received: by mail-ot1-f48.google.com with SMTP id d3so2443036otp.4
 for <wireguard@lists.zx2c4.com>; Thu, 30 Jan 2020 01:05:33 -0800 (PST)
X-Gm-Message-State: APjAAAUYmmJAsN7tS13zKgV0a3TAEaFoPZmrPGODQr9Kdo8RaakjSSZy
 qPmCwmMUNkq+/skBMR+KHsFMT5K8aqZQJlOevE4=
X-Google-Smtp-Source: APXvYqyevSGpuj3lPJXM764/h+sBBuwjmDm1Fawb14KXx6lyyqvTpdI3aYHGg44K0i1ZDtFi1scq2G521Fy1EjwSfxE=
X-Received: by 2002:a9d:674f:: with SMTP id w15mr2721721otm.243.1580375132722; 
 Thu, 30 Jan 2020 01:05:32 -0800 (PST)
MIME-Version: 1.0
References: <6cd7ccf2c193ee3bd1db3d5870f6982084d0d0d6.camel@dreamofjapan.de>
 <FC906C5B-26A4-4FED-BB79-49E03704298E@deutsche-cyberberatung.de>
In-Reply-To: <FC906C5B-26A4-4FED-BB79-49E03704298E@deutsche-cyberberatung.de>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 30 Jan 2020 10:05:22 +0100
X-Gmail-Original-Message-ID: <CAHmME9r_GVwOMbuWs9Mxi_5EHw0Gns2MM6kyWESxtO0J0kxebg@mail.gmail.com>
Message-ID: <CAHmME9r_GVwOMbuWs9Mxi_5EHw0Gns2MM6kyWESxtO0J0kxebg@mail.gmail.com>
Subject: Re: ArchLinux wireguard install
To: "Dr. Benjamin Flesch" <bf@deutsche-cyberberatung.de>
Cc: planung@dreamofjapan.de, WireGuard mailing list <wireguard@lists.zx2c4.com>
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
Content-Type: multipart/mixed; boundary="===============5792874073251021803=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============5792874073251021803==
Content-Type: multipart/alternative; boundary="00000000000065df0a059d57c219"

--00000000000065df0a059d57c219
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 30, 2020, 10:02 Dr. Benjamin Flesch <
bf@deutsche-cyberberatung.de> wrote:

> Hi Frank,
>
> I am also running WireGuard on arch. I think there are two relevant
> packages in AUR right now, one of them is wireguard-dams.
>

The relevant packages are in the actual arch linux package repo. You don't
need anything from AUR to use wireguard on arch linux.



> Just install these packages and don=E2=80=99t bother with NetworkManager =
- use the
> wg-quick command line tool to spin up the vpn. I have configured it
> persistently in /etc/wireguard/ folder.
>
> I think after the fresh kernel we can just deinstall the AUR packages and
> there won=E2=80=99t be any problem.
>
> Best
> Benjamin
>
> Sent from a mobile device.
>
> > On 30. Jan 2020, at 03:03, Frank Tornack <planung@dreamofjapan.de>
> wrote:
> >
> > =EF=BB=BFhello all,
> >
> > I apologize in advance for the stupid question, but I am very unsure.
> > I received a voucher for a VPN service at a trade fair and would like
> > to test it. The service Mullvad VPN uses the technology WireGuard. And
> > I use ArchLinux.
> >
> > My question was created by the ArchLinux Wiki. There it already refers
> > to the kernel 5.6, which should support this function without a module.
> > Now my question is, is it better to wait for this kernel or just
> > install the module? Would it be a problem if I forgot to delete the
> > module again? I am using the Network Manager, what do I need to be
> > aware of?
> >
> > Many thanks in advance and thank you for developing this tool.
> >
> >
> > --
> > Mit freundlichen Gr=C3=BC=C3=9Fen
> > Frank Tornack
> >
> >
> > -----------------------------
> >  Why don't you pair `em up in threes? -Yogi Berra
> >
> > _______________________________________________
> > WireGuard mailing list
> > WireGuard@lists.zx2c4.com
> > https://lists.zx2c4.com/mailman/listinfo/wireguard
>
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
>

--00000000000065df0a059d57c219
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><br><div class=3D"gmail_quote"><div dir=3D"l=
tr" class=3D"gmail_attr">On Thu, Jan 30, 2020, 10:02 Dr. Benjamin Flesch &l=
t;<a href=3D"mailto:bf@deutsche-cyberberatung.de">bf@deutsche-cyberberatung=
.de</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hi Frank,<br>
<br>
I am also running WireGuard on arch. I think there are two relevant package=
s in AUR right now, one of them is wireguard-dams.<br></blockquote></div></=
div><div dir=3D"auto"><br></div><div dir=3D"auto">The relevant packages are=
 in the actual arch linux package repo. You don&#39;t need anything from AU=
R to use wireguard on arch linux.</div><div dir=3D"auto"><br></div><div dir=
=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquot=
e class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc sol=
id;padding-left:1ex">
<br>
Just install these packages and don=E2=80=99t bother with NetworkManager - =
use the wg-quick command line tool to spin up the vpn. I have configured it=
 persistently in /etc/wireguard/ folder.<br>
<br>
I think after the fresh kernel we can just deinstall the AUR packages and t=
here won=E2=80=99t be any problem.<br>
<br>
Best<br>
Benjamin <br>
<br>
Sent from a mobile device.<br>
<br>
&gt; On 30. Jan 2020, at 03:03, Frank Tornack &lt;<a href=3D"mailto:planung=
@dreamofjapan.de" target=3D"_blank" rel=3D"noreferrer">planung@dreamofjapan=
.de</a>&gt; wrote:<br>
&gt; <br>
&gt; =EF=BB=BFhello all,<br>
&gt; <br>
&gt; I apologize in advance for the stupid question, but I am very unsure.<=
br>
&gt; I received a voucher for a VPN service at a trade fair and would like<=
br>
&gt; to test it. The service Mullvad VPN uses the technology WireGuard. And=
<br>
&gt; I use ArchLinux.<br>
&gt; <br>
&gt; My question was created by the ArchLinux Wiki. There it already refers=
<br>
&gt; to the kernel 5.6, which should support this function without a module=
.<br>
&gt; Now my question is, is it better to wait for this kernel or just<br>
&gt; install the module? Would it be a problem if I forgot to delete the<br=
>
&gt; module again? I am using the Network Manager, what do I need to be<br>
&gt; aware of?<br>
&gt; <br>
&gt; Many thanks in advance and thank you for developing this tool.<br>
&gt; <br>
&gt; <br>
&gt; -- <br>
&gt; Mit freundlichen Gr=C3=BC=C3=9Fen<br>
&gt; Frank Tornack<br>
&gt; <br>
&gt; <br>
&gt; -----------------------------<br>
&gt;=C2=A0 Why don&#39;t you pair `em up in threes? -Yogi Berra<br>
&gt; <br>
&gt; _______________________________________________<br>
&gt; WireGuard mailing list<br>
&gt; <a href=3D"mailto:WireGuard@lists.zx2c4.com" target=3D"_blank" rel=3D"=
noreferrer">WireGuard@lists.zx2c4.com</a><br>
&gt; <a href=3D"https://lists.zx2c4.com/mailman/listinfo/wireguard" rel=3D"=
noreferrer noreferrer" target=3D"_blank">https://lists.zx2c4.com/mailman/li=
stinfo/wireguard</a><br>
<br>
_______________________________________________<br>
WireGuard mailing list<br>
<a href=3D"mailto:WireGuard@lists.zx2c4.com" target=3D"_blank" rel=3D"noref=
errer">WireGuard@lists.zx2c4.com</a><br>
<a href=3D"https://lists.zx2c4.com/mailman/listinfo/wireguard" rel=3D"noref=
errer noreferrer" target=3D"_blank">https://lists.zx2c4.com/mailman/listinf=
o/wireguard</a><br>
</blockquote></div></div></div>

--00000000000065df0a059d57c219--

--===============5792874073251021803==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============5792874073251021803==--
