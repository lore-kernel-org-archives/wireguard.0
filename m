Return-Path: <SRS0=u9qp=37=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B197C47409
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 11 Feb 2020 14:30:03 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 21C1A20870
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 11 Feb 2020 14:30:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=inuits.eu header.i=@inuits.eu header.b="VAL5w088"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 21C1A20870
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=inuits.eu
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7060a9d7;
	Tue, 11 Feb 2020 14:28:02 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 17e52370
 for <wireguard@lists.zx2c4.com>;
 Tue, 11 Feb 2020 14:27:59 +0000 (UTC)
Received: from zimbra88.inuits.eu (zimbra88.inuits.eu [176.31.37.175])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 571cf3ba
 for <wireguard@lists.zx2c4.com>;
 Tue, 11 Feb 2020 14:27:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by zimbra88.inuits.eu (Postfix) with ESMTP id A99C47C0746;
 Tue, 11 Feb 2020 15:29:42 +0100 (CET)
Received: from zimbra88.inuits.eu ([127.0.0.1])
 by localhost (zimbra88.inuits.eu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id IIvbnj4-gmCh; Tue, 11 Feb 2020 15:29:41 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zimbra88.inuits.eu (Postfix) with ESMTP id 0B9827C0770;
 Tue, 11 Feb 2020 15:29:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra88.inuits.eu 0B9827C0770
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inuits.eu;
 s=E845565C-8838-11E9-A43F-52B5C8A0861E; t=1581431381;
 bh=1zGVH+v0wGiEMXZnFfoTMv4DlHtEmnER2ZDIaFqUIzk=;
 h=Date:From:To:Message-ID:MIME-Version;
 b=VAL5w088sUCyHmi3qgL6vLjFBVlRnlPRnsoF1SlgG85Cvm2BJ3q6eUKIYr1GSZV4N
 lh13n/jJpBKvKdqbXbGT48VcM2OQdbKa9HbatZfbhKpYPNZNI7wgYO1/9wVM3Fichz
 ExQJxsShyRyTzLOHDs/PUhI7jrBciRGwhF8YMV9scy2BVXE9lNPNzA2sQXlTTWikO6
 b1DdTuw7SdYTb0nF0bMYev62RiZBo/HYT0nkUYZIVusF4UnnkgdeUdE0vSf8nGAZBM
 cap5+Li2VK3MWjNsNtldqJSzl8aTTLRPgFrjNHMudsDptQHDxjTQwtybh/LhjBC59t
 Zyd8uXCpSo9Ug==
X-Virus-Scanned: amavisd-new at zimbra88.inuits.eu
Received: from zimbra88.inuits.eu ([127.0.0.1])
 by localhost (zimbra88.inuits.eu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id yxXaEJEMniOs; Tue, 11 Feb 2020 15:29:40 +0100 (CET)
Received: from zimbra88.inuits.eu (zimbra88.inuits.eu [10.0.228.250])
 by zimbra88.inuits.eu (Postfix) with ESMTP id DF6EF7C0746;
 Tue, 11 Feb 2020 15:29:40 +0100 (CET)
Date: Tue, 11 Feb 2020 15:29:40 +0100 (CET)
From: Christophe Vanlancker <carroarmato0@inuits.eu>
To: Fierascu Vlad <mythnick@gmail.com>
Message-ID: <1374975524.57662.1581431380684.JavaMail.zimbra@inuits.eu>
In-Reply-To: <CAHyK+75Q7fOvnKjDNvJOZBjDWD+MzrBWGxM-a6L51c4LMbPf-g@mail.gmail.com>
References: <000a01d5aff2$a17d7d80$e4787880$@istream.today>
 <CAHyK+75Q7fOvnKjDNvJOZBjDWD+MzrBWGxM-a6L51c4LMbPf-g@mail.gmail.com>
Subject: Re: Limited speed 100Mbps Down 200Mbps UP
MIME-Version: 1.0
X-Originating-IP: [10.0.228.250]
X-Mailer: Zimbra 8.8.12_GA_3794 (ZimbraWebClient - FF72 (Linux)/8.8.12_GA_3794)
Thread-Topic: Limited speed 100Mbps Down 200Mbps UP
Thread-Index: mKnm7clOznF1Gi0lC+NdKzm5A3BPdw==
Cc: wireguard <wireguard@lists.zx2c4.com>
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
Content-Type: multipart/mixed; boundary="===============3975018613331027515=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============3975018613331027515==
Content-Type: multipart/alternative; 
	boundary="=_fdf558e2-75b6-4c51-a108-1f6e6a0403cd"

--=_fdf558e2-75b6-4c51-a108-1f6e6a0403cd
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

I have been running benchmarks on DigitalOcean with different droplets in d=
ifferent locations=20
When using encryption it's expected to generally have a reduction in throug=
hput.=20

image=3D"centos-7-x64" size=3D"s-1vcpu-1gb" region=3D"ams3"=20
image=3D"centos-7-x64" size=3D"s-1vcpu-1gb" region=3D"fra1"=20

iperf direct-test:=20
[ ID] Interval Transfer Bandwidth Retr=20
[ 4] 0.00-10.00 sec 959 MBytes 805 Mbits/sec 637 sender=20
[ 4] 0.00-10.00 sec 957 MBytes 803 Mbits/sec receiver=20

iperf IPSec-test:=20
[ ID] Interval Transfer Bandwidth Retr=20
[ 4] 0.00-10.00 sec 206 MBytes 173 Mbits/sec 15 sender=20
[ 4] 0.00-10.00 sec 206 MBytes 172 Mbits/sec receiver=20

iperf WireGuard-test:=20
[ ID] Interval Transfer Bandwidth Retr=20
[ 4] 0.00-10.00 sec 481 MBytes 404 Mbits/sec 46 sender=20
[ 4] 0.00-10.00 sec 478 MBytes 401 Mbits/sec receiver=20


Many things can come into play, optimizations, maybe crypto acceleration et=
c, but that's beyond my expertise.=20


From: "Fierascu Vlad" <mythnick@gmail.com>=20
To: "cristian c" <cristian.c@istream.today>=20
Cc: "wireguard" <wireguard@lists.zx2c4.com>=20
Sent: Wednesday, 11 December, 2019 11:09:07=20
Subject: Re: Limited speed 100Mbps Down 200Mbps UP=20

more info about the server location, client location....=20

Peering might be the answer !=20

regards,=20
************************************************=20
Fierascu Vlad=20
[ mailto:mythnick@gmail.com | mythnick@gmail.com ]=20
[ http://www.mythnick.com/ | www.mythnick.com ]=20


=C3=8En mie., 11 dec. 2019 la 09:15, <cristian.c@istream.today> a scris:=20





Hello,=20



I have installed Wireguard on multiple location, servers, on each of this s=
erver I have 1Gbps link, my problem is that I=E2=80=99m not able to get mor=
e that ~100-120Mbps for download and ~200Mbps Upload, any idea why?=20



As a server I use CentOS 7 as for =E2=80=9Cclient=E2=80=9D I use Windows 10=
 with latest Wireguard client..=20



Thank you in advance,=20

Cristian=20


_______________________________________________=20
WireGuard mailing list=20
[ mailto:WireGuard@lists.zx2c4.com | WireGuard@lists.zx2c4.com ]=20
[ https://lists.zx2c4.com/mailman/listinfo/wireguard | https://lists.zx2c4.=
com/mailman/listinfo/wireguard ]=20




_______________________________________________=20
WireGuard mailing list=20
WireGuard@lists.zx2c4.com=20
https://lists.zx2c4.com/mailman/listinfo/wireguard=20

--=_fdf558e2-75b6-4c51-a108-1f6e6a0403cd
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><body><div style=3D"font-family: arial, helvetica, sans-serif; font-s=
ize: 12pt; color: #000000">I have been running benchmarks on DigitalOcean w=
ith different droplets in different locations<br>When using encryption it's=
 expected to generally have a reduction in throughput.<br><br>image=3D"cent=
os-7-x64" &nbsp;size=3D"s-1vcpu-1gb" &nbsp;region=3D"ams3"<br>image=3D"cent=
os-7-x64" &nbsp;size=3D"s-1vcpu-1gb" &nbsp;region=3D"fra1"<br><br>iperf dir=
ect-test:<br>[ ID] Interval &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Transfer &nb=
sp; &nbsp; Bandwidth &nbsp; &nbsp; &nbsp; Retr<br>[ &nbsp;4] &nbsp; 0.00-10=
.00 &nbsp;sec &nbsp; 959 MBytes &nbsp; 805 Mbits/sec &nbsp;637 &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; sender<br>[ &nbsp;4] &nbsp; 0.00-10.00 &nbsp;=
sec &nbsp; 957 MBytes &nbsp; 803 Mbits/sec &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp;receiver<br><br>iperf IPSec-test:<br>[ ID] In=
terval &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Transfer &nbsp; &nbsp; Bandwidth =
&nbsp; &nbsp; &nbsp; Retr<br>[ &nbsp;4] &nbsp; 0.00-10.00 &nbsp;sec &nbsp; =
206 MBytes &nbsp; 173 Mbits/sec &nbsp; 15 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; sender<br>[ &nbsp;4] &nbsp; 0.00-10.00 &nbsp;sec &nbsp; 206 MBytes=
 &nbsp; 172 Mbits/sec &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp;receiver<br><br>iperf WireGuard-test:<br>[ ID] Interval &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; Transfer &nbsp; &nbsp; Bandwidth &nbsp; &nbsp; &nb=
sp; Retr<br>[ &nbsp;4] &nbsp; 0.00-10.00 &nbsp;sec &nbsp; 481 MBytes &nbsp;=
 404 Mbits/sec &nbsp; 46 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; sender<b=
r>[ &nbsp;4] &nbsp; 0.00-10.00 &nbsp;sec &nbsp; 478 MBytes &nbsp; 401 Mbits=
/sec &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;receiver=
<br><br><br>Many things can come into play, optimizations, maybe crypto acc=
eleration etc, but that's beyond my expertise.<br><br><hr id=3D"zwchr" data=
-marker=3D""><div data-marker=3D""><b>From: </b>"Fierascu Vlad" &lt;mythnic=
k@gmail.com&gt;<br><b>To: </b>"cristian c" &lt;cristian.c@istream.today&gt;=
<br><b>Cc: </b>"wireguard" &lt;wireguard@lists.zx2c4.com&gt;<br><b>Sent: </=
b>Wednesday, 11 December, 2019 11:09:07<br><b>Subject: </b>Re: Limited spee=
d 100Mbps Down 200Mbps UP<br></div><br><div data-marker=3D""><div dir=3D"lt=
r">more info about the server location, client location....<br><br>Peering =
might be the answer !<div><br clear=3D"all"><div><div dir=3D"ltr" class=3D"=
gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"lt=
r"><div><div>regards,</div></div><div><span style=3D"color:rgb(34,34,34);fo=
nt-size:small">************************************************</span><br s=
tyle=3D"color:rgb(34,34,34);font-size:small"><span style=3D"color:rgb(34,34=
,34);font-size:small">Fierascu Vlad</span><div style=3D"color:rgb(34,34,34)=
;font-size:small"><a href=3D"mailto:mythnick@gmail.com" target=3D"_blank">m=
ythnick@gmail.com</a><br></div><div style=3D"color:rgb(34,34,34);font-size:=
small"><a href=3D"http://www.mythnick.com" target=3D"_blank">www.mythnick.c=
om</a></div></div></div></div></div></div></div></div></div><br></div></div=
><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">=C3=
=8En mie., 11 dec. 2019 la 09:15, &lt;cristian.c@istream.today&gt; a scris:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div lang=3D"EN=
-US"><div class=3D"gmail-m_6009355575683238049WordSection1"><p class=3D"Mso=
Normal">Hello,<u></u><u></u></p><p class=3D"MsoNormal"><u></u>&nbsp;<u></u>=
</p><p class=3D"MsoNormal">&nbsp;&nbsp; I have installed Wireguard on multi=
ple location, servers, on each of this server I have 1Gbps link, my problem=
 is that I=E2=80=99m not able to get more that ~100-120Mbps for download an=
d ~200Mbps Upload, any idea why?<u></u><u></u></p><p class=3D"MsoNormal"><u=
></u>&nbsp;<u></u></p><p class=3D"MsoNormal">&nbsp; As a server I use CentO=
S 7 as for =E2=80=9Cclient=E2=80=9D I use Windows 10 with latest Wireguard =
client..<u></u><u></u></p><p class=3D"MsoNormal"><u></u>&nbsp;<u></u></p><p=
 class=3D"MsoNormal">Thank you in advance,<u></u><u></u></p><p class=3D"Mso=
Normal">Cristian<u></u><u></u></p><p class=3D"MsoNormal">&nbsp; <u></u><u><=
/u></p></div></div>_______________________________________________<br>
WireGuard mailing list<br>
<a href=3D"mailto:WireGuard@lists.zx2c4.com" target=3D"_blank">WireGuard@li=
sts.zx2c4.com</a><br>
<a href=3D"https://lists.zx2c4.com/mailman/listinfo/wireguard" rel=3D"noref=
errer" target=3D"_blank">https://lists.zx2c4.com/mailman/listinfo/wireguard=
</a><br>
</blockquote></div>
<br>_______________________________________________<br>WireGuard mailing li=
st<br>WireGuard@lists.zx2c4.com<br>https://lists.zx2c4.com/mailman/listinfo=
/wireguard<br></div></div></body></html>
--=_fdf558e2-75b6-4c51-a108-1f6e6a0403cd--

--===============3975018613331027515==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============3975018613331027515==--
