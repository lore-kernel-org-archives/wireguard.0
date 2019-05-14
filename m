Return-Path: <SRS0=gQ6O=UF=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FFA5C04AB5
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  6 Jun 2019 09:28:32 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BB6FE20684
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  6 Jun 2019 09:28:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=secureideas-com.20150623.gappssmtp.com header.i=@secureideas-com.20150623.gappssmtp.com header.b="TxlsfpsQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BB6FE20684
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=secureideas.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 68aa0705;
	Thu, 6 Jun 2019 09:28:30 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9469f5fc
 for <wireguard@lists.zx2c4.com>;
 Tue, 14 May 2019 05:36:42 +0000 (UTC)
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [IPv6:2607:f8b0:4864:20::335])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fe1d5d57
 for <wireguard@lists.zx2c4.com>;
 Tue, 14 May 2019 05:36:42 +0000 (UTC)
Received: by mail-ot1-x335.google.com with SMTP id u11so3652263otq.7
 for <wireguard@lists.zx2c4.com>; Mon, 13 May 2019 22:36:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=secureideas-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:from:date:message-id:subject:to;
 bh=DlSgVGpouOLjh6CJVBAheCUhkd1y9CCnHu0MIl/EVfc=;
 b=TxlsfpsQHGbOkCx7/xxIi68DC1PQV/XTcdwhwD6EB/i/Adgx9kCgYkLxWPrwVWzAC0
 sqbcUJvOCpSp0OFKE7PPfD4ioMLszQWF1rLQxoe06uHwbPmDl05DP+EhNMSrrsotCZjf
 2dycspYFxUhLdXhcDbAy0BWi92nY3VKTCCxOWXe3VVHcP3JkopHhEdwApC0lQiHqlT3H
 lG3mocVVJc0idsEKaAkTg/TpFs+kj6OCjIWms5C3eDFD3EOs7s78o8JUm98LEDXUL9qR
 rMQHNKBdOP4ylmGjFw1J6mEsc2T1VDTnESduUdGjKnMp0VsHHYgzKadEzMnwQrok3MB5
 kQEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=DlSgVGpouOLjh6CJVBAheCUhkd1y9CCnHu0MIl/EVfc=;
 b=e70tkdNpuGZQRXkPNItTfcqnSvoR/MWR2AJm6ccoj20SVDapLyqzJbr82K4yr3yzIe
 P9Y8PB9XYzrk0/wi/Ef+s5qAeEfn/furibWDW6gG3rysyfuEryGA16HunDcUljG50171
 BNtspAtNavWxjVtEVD9bAWSh+hYngaemShKheaVDZiPiZ77EOtNA/kFsy5+Aq5p92G0A
 serwEg+g3I5/HcQjBTD/HHxF1q7H48RRnE8rrE8q1gC1oCHXEbV+WoMHD5DxJ3v0wr9R
 P+bE/B01tm9CWoVXwtWddi0tnPMc9fJBx4YkyNlPSbVbyuUBKOsbN3om5+754fn5kIl+
 eeLw==
X-Gm-Message-State: APjAAAX+RBa1IgERSBQKjHAFxyFTXXMZK4XnxR4JgMpG/HbydRZQJv6D
 ZcCGuESQcOKz4u9znNccc3OdMaCAgt6apl85k1zQlYNBjXX0BQ==
X-Google-Smtp-Source: APXvYqzP/5M0q/8Lbj1h3QQXbS1PfqZo/R3ToIdS+ugXe25jMKPs/5PjzP+DqJ3ge1sv9H85ppdu0uFXFPr1htjrquM=
X-Received: by 2002:a9d:7f8b:: with SMTP id t11mr19123030otp.110.1557812200566; 
 Mon, 13 May 2019 22:36:40 -0700 (PDT)
MIME-Version: 1.0
From: Alex Rodriguez <alex@secureideas.com>
Date: Tue, 14 May 2019 01:36:04 -0400
Message-ID: <CAJ83ptm7XpZrYCk=iasJdyPBFuNWdOR8FL-TOzQaNVZJdjv0EA@mail.gmail.com>
Subject: Weird connected but not established wireguard connection
To: wireguard@lists.zx2c4.com
X-Mailman-Approved-At: Thu, 06 Jun 2019 11:28:28 +0200
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
Content-Type: multipart/mixed; boundary="===============3915473699689062032=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============3915473699689062032==
Content-Type: multipart/alternative; boundary="000000000000d784ef0588d26aa2"

--000000000000d784ef0588d26aa2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Greetings everyone,

So I am working on establishing a wireguard connection that is acting very
strange, and I am thinking that the problem is that specific machine is
acting weird and not wireguard. I wanted to message in here to figure out
if there was a way I could confirm this though.

I currently have 2 machines that I have hooked up to the vpn server,
through wireguard, no problem. They have established connections and
traffic flows perfectly.

The problem is, with this third machine that is running Kali Linux
(version 0.0.20190227 of wireguard dkms by default), I can see that it is
successfully contacting my server (because it registers the endpoints
external ip address) but it never sends a handshake successfully (that the
server knows of). If you look in the gist below I ran wg show (or just wg
which does a show), and it says that from the client side thinks that it
sent a successful handshake. The server side though doesn't have any latest
handshake field populated, and I can confirm that from the server side it
didn't by looking at the dump (also in the gist).

So it seems like it is trying to connect, but something isn't allowing it
handshake properly. As you can see from me running the wg show the keys
match up properly, so it isn't that I miss-configured the keys. If it was a
firewall in the way then I wouldn't be seeing on the server side that it is
connecting, right? So I don't think that it is a firewall.

I have tried the following:

   - purge the apt installed version completely (i.e. sudo apt remove
   --purge "wireguard*")
   - walked through twice (after doing the purge of the first one)
   confirming that the setup wasn't a mistake the first time
   - upgraded wg version by compiling and installing 0.0.20190406
   - Multiple tcpdumps on both sides, and I see that the traffic is
   attempting to send, but only sends syns (because the connection isn't
   established)


So here is my setup:

*https://gist.github.com/elreydetoda/948dd184402493c5e1d97d826d22a4a5
<https://gist.github.com/elreydetoda/948dd184402493c5e1d97d826d22a4a5>*

The weird thing is that the 80NPQXXXXX peer in the wg0.conf is identical in
os, kernel, etc...  (i.e. kali linux) and it establishes perfectly fine
with that machine. So there is something weird with specifically that
machine but I don't know of anything that would affect the connection when
it already makes the initial connection.

Sincerely,
Alex Rodriguez

P.S. So one of my co-workers and I figured out the weird vulnerability
scanner and wireguard issue kind of...So we assume that the problem with
the vulnerability scanner is implementing their own network driver/stack
thing to handle the scanning that they do. So having wireguard on that
server wasn't acting properly, so we simply moved wireguard to another
server and just route all traffic through that wireguard server into
whatever wireguard pipe we want. I will probably post a blog post about it
soon to let you all know how we implemented it. Just wanted to give a heads
up.

--
Alex Rodriguez
Developer

Secure Ideas, LLC - Professionally Evil =C2=AE

https://www.secureideas.com/

Cell: 980-277-2746 / Office: 866-404-7837 x741

--000000000000d784ef0588d26aa2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div di=
r=3D"ltr"><div dir=3D"ltr">Greetings everyone,<div><br></div><div>So I am w=
orking on establishing a wireguard connection that is acting very strange, =
and I am thinking that the problem is that specific machine is acting weird=
 and not wireguard. I wanted to message in here to figure out if there was =
a way I could confirm this though.=C2=A0</div><div><br></div><div>I current=
ly have 2 machines that I have hooked up to the vpn server, through wiregua=
rd, no problem. They have established connections and traffic flows perfect=
ly.</div><div><br></div><div>The problem is, with this third machine that i=
s running Kali Linux (version=C2=A00.0.20190227 of wireguard dkms by defaul=
t), I can see that it is successfully contacting my server (because it regi=
sters the endpoints external ip address) but it never sends a handshake suc=
cessfully (that the server knows of). If you look in the gist below I ran w=
g show (or just wg which does a show), and it says that from the client=C2=
=A0side thinks that it sent a successful handshake. The server side though =
doesn&#39;t have any latest handshake field populated, and I can confirm th=
at from the server side it didn&#39;t by looking at the dump (also in the g=
ist).=C2=A0</div><div><br></div><div>So it seems like it is trying to conne=
ct, but something isn&#39;t allowing it handshake properly. As you can see =
from me running the wg show the keys match up properly, so it isn&#39;t tha=
t I miss-configured the keys. If it was a firewall in the way then I wouldn=
&#39;t be seeing on the server side that it is connecting, right? So I don&=
#39;t think that it is a firewall.=C2=A0</div><div><br></div><div>I have tr=
ied the following:</div><div><ul><li>purge the apt installed version comple=
tely (i.e.=C2=A0sudo apt remove --purge &quot;wireguard*&quot;)</li><li>wal=
ked through twice (after doing the purge of the first one) confirming that =
the setup wasn&#39;t a mistake the first time</li><li>upgraded wg version b=
y compiling and installing 0.0.20190406</li><li>Multiple tcpdumps on both s=
ides, and I see that the traffic is attempting to send, but only sends syns=
 (because the connection isn&#39;t established)</li></ul></div><div><br></d=
iv><div>So here is my setup:=C2=A0</div><div><br></div><div><font color=3D"=
#5ca7f1" style=3D"--darkreader-inline-color:#5caef1;"><u><a href=3D"https:/=
/gist.github.com/elreydetoda/948dd184402493c5e1d97d826d22a4a5">https://gist=
.github.com/elreydetoda/948dd184402493c5e1d97d826d22a4a5</a></u></font><br>=
</div><div><br></div><div>The weird thing is that the=C2=A080NPQXXXXX peer =
in the wg0.conf is identical in os, kernel, etc...=C2=A0 (i.e. kali linux) =
and it establishes perfectly fine with that machine. So there is something =
weird with specifically that machine but I don&#39;t know of anything that =
would affect the connection when it already makes the initial connection.</=
div><div><div><div dir=3D"ltr" class=3D"gmail-m_-693339639610110678gmail_si=
gnature"><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div>=
<div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=
=3D"ltr"><div><div dir=3D"ltr"><div><div><span style=3D"font-size:small"><f=
ont face=3D"arial, helvetica, sans-serif"><br></font></span></div><div><spa=
n style=3D"font-size:small"><font face=3D"arial, helvetica, sans-serif">Sin=
cerely,</font></span></div><div><span style=3D"font-size:small"><font face=
=3D"arial, helvetica, sans-serif">Alex Rodriguez</font></span></div><div><s=
pan style=3D"font-size:small"><font face=3D"arial, helvetica, sans-serif"><=
br></font></span></div><div>P.S. So one of my co-workers and I figured out =
the weird vulnerability scanner and wireguard issue kind of...So we assume =
that the problem with the vulnerability scanner is implementing their own n=
etwork driver/stack thing to handle the scanning that they do. So having wi=
reguard on that server wasn&#39;t acting properly, so we simply moved wireg=
uard to another server and just route all traffic through that wireguard se=
rver into whatever wireguard pipe we want. I will probably post a blog post=
 about it soon to let you all know how we implemented it. Just wanted to gi=
ve a heads up.<span style=3D"font-size:small"><font face=3D"arial, helvetic=
a, sans-serif"><br></font></span></div><div><span style=3D"font-family:cali=
bri,sans-serif;font-size:small"><br></span></div><div><span style=3D"font-f=
amily:calibri,sans-serif;font-size:small">--</span></div><div><span style=
=3D"font-family:calibri,sans-serif;font-size:small">Alex Rodriguez</span><b=
r></div><div dir=3D"ltr"><font face=3D"calibri, sans-serif" size=3D"2">Deve=
loper<br></font><p style=3D"margin:0in 0in 0.0001pt"><font face=3D"calibri,=
 sans-serif" size=3D"2">Secure Ideas, LLC -=C2=A0Professionally Evil =C2=AE=
</font></p><font style=3D"font-family:sans-serif" size=3D"2"></font><p styl=
e=3D"margin:0in 0in 0.0001pt"><font size=3D"2" style=3D"font-family:calibri=
,sans-serif"><a href=3D"https://www.secureideas.com/" style=3D"font-family:=
calibri,sans-serif" target=3D"_blank">https://www.secureideas.com/</a></fon=
t></p><p style=3D"margin:0in 0in 0.0001pt"><span style=3D"font-family:calib=
ri,sans-serif;font-size:small">Cell: 980-277-2746 / Office: 866-404-7837 x7=
41</span></p></div></div></div></div></div></div></div></div></div></div></=
div></div></div></div></div></div></div></div></div></div></div></div></div=
></div></div></div>

--000000000000d784ef0588d26aa2--

--===============3915473699689062032==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============3915473699689062032==--
