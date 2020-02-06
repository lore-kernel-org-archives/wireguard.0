Return-Path: <SRS0=RHSj=33=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38661C352A2
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  7 Feb 2020 11:23:40 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 49AFC20726
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  7 Feb 2020 11:23:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 49AFC20726
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=libassi.se
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 12f314cb;
	Fri, 7 Feb 2020 11:20:45 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3778642d
 for <wireguard@lists.zx2c4.com>; Thu, 6 Feb 2020 17:09:32 +0000 (UTC)
Received: from smtp2.outgoing.loopia.se (smtp2.outgoing.loopia.se
 [93.188.3.37])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f20dc7fc
 for <wireguard@lists.zx2c4.com>; Thu, 6 Feb 2020 17:09:32 +0000 (UTC)
Received: from s807.loopia.se (localhost [127.0.0.1])
 by s807.loopia.se (Postfix) with ESMTP id D0A4A2E60237
 for <wireguard@lists.zx2c4.com>; Thu,  6 Feb 2020 18:10:35 +0100 (CET)
Received: from s499.loopia.se (unknown [172.22.191.5])
 by s807.loopia.se (Postfix) with ESMTP id B28D02E6D44D
 for <wireguard@lists.zx2c4.com>; Thu,  6 Feb 2020 18:10:35 +0100 (CET)
Received: from s471.loopia.se (unknown [172.22.191.5])
 by s499.loopia.se (Postfix) with ESMTP id AF6E51CDAED6
 for <wireguard@lists.zx2c4.com>; Thu,  6 Feb 2020 18:10:35 +0100 (CET)
X-Virus-Scanned: amavisd-new at amavis.loopia.se
Received: from s499.loopia.se ([172.22.191.6])
 by s471.loopia.se (s471.loopia.se [172.22.190.11]) (amavisd-new, port 10024)
 with UTF8LMTP id qivjGoVKO4CD for <wireguard@lists.zx2c4.com>;
 Thu,  6 Feb 2020 18:10:35 +0100 (CET)
X-Loopia-Auth: user
X-Loopia-User: peter@libassi.se
X-Loopia-Originating-IP: 78.82.164.216
Received: from [10.79.0.17] (c-d8a4524e.03-77-73746f30.bbcust.telenor.se
 [78.82.164.216]) (Authenticated sender: peter@libassi.se)
 by s499.loopia.se (Postfix) with ESMTPSA id 2957A1CDAEE0
 for <wireguard@lists.zx2c4.com>; Thu,  6 Feb 2020 18:10:35 +0100 (CET)
From: Peter Libassi <peter@libassi.se>
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3608.40.2.2.4\))
Subject: Freebsd Wireguard-go behavior
Message-Id: <6EC74D71-3B37-4D1C-8B54-DCBC1DEACC17@libassi.se>
Date: Thu, 6 Feb 2020 18:10:34 +0100
To: wireguard@lists.zx2c4.com
X-Mailer: Apple Mail (2.3608.40.2.2.4)
X-Mailman-Approved-At: Fri, 07 Feb 2020 12:20:37 +0100
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
Content-Type: multipart/mixed; boundary="===============5541933780800977992=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>


--===============5541933780800977992==
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_058A0AA1-2DCC-4638-8A88-9135FDC05D32"


--Apple-Mail=_058A0AA1-2DCC-4638-8A88-9135FDC05D32
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

Hi,

I=E2=80=99ve been using wireguard as a peer-to-peer VPN on linux for =
many years now (thanks Jason!)=20
Recently I=E2=80=99ve been using wireguard-go on Freebsd. I noticed that =
there are a difference.

I used to add an IP address to the wg interface on both sides, which is =
a good starting point to verify that I got the VPN up and running. Ping =
responses on both local and remote IP address tells me everything is ok.

However on Freebsd ( wireguard version 1.0.20200121 ) with same config, =
local ping does not respond?!, remote works from either side but not =
local ping on the wg interface IP address.

I verified Freebsd behavior by creating a tun interface with ifconfig, =
added an IP address and that local IP address responds to ping...

I actually get two different scenarios, either no ping response or a =
response that the ping packet where sent trough the tunnel and bounced =
back:

root@bsd1:~ # ping 192.168.9.1
PING 192.168.9.1 (192.168.9.1): 56 data bytes
92 bytes from 192.168.9.2: Redirect Host(New addr: 192.168.9.1)
Vr HL TOS  Len   ID Flg  off TTL Pro  cks      Src      Dst
 4  5  00 0054 cdcd   0 0000  40  01 1989 192.168.9.1  192.168.9.1=20

64 bytes from 192.168.9.1: icmp_seq=3D0 ttl=3D63 time=3D4.401 ms
92 bytes from 192.168.9.2: Redirect Host(New addr: 192.168.9.1)
Vr HL TOS  Len   ID Flg  off TTL Pro  cks      Src      Dst
 4  5  00 0054 21c7   0 0000  40  01 c58f 192.168.9.1  192.168.9.1=20

I=E2=80=99m confused.  Is this expected behavior? Can someone please =
explain.

Thanks
Peter



--Apple-Mail=_058A0AA1-2DCC-4638-8A88-9135FDC05D32
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" =
class=3D"">Hi,<div class=3D""><br class=3D""></div><div class=3D"">I=E2=80=
=99ve been using wireguard as a peer-to-peer VPN on linux for many years =
now (thanks Jason!)&nbsp;</div><div class=3D"">Recently I=E2=80=99ve =
been using wireguard-go on Freebsd. I noticed that there are a =
difference.</div><div class=3D""><br class=3D""></div><div class=3D"">I =
used to add an IP address to the wg interface on both sides, which is a =
good starting point to verify that I got the VPN up and running. Ping =
responses on both local and remote IP address tells me everything is =
ok.</div><div class=3D""><br class=3D""></div><div class=3D"">However on =
Freebsd ( wireguard version&nbsp;<span style=3D"color: rgb(0, 0, 0);" =
class=3D"">1.0.20200121 ) with same config, local ping does not =
respond?!, remote works from either side but not local ping on the wg =
interface IP address.</span></div><div class=3D""><span style=3D"color: =
rgb(0, 0, 0);" class=3D""><br class=3D""></span></div><div =
class=3D""><font color=3D"#000000" class=3D"">I&nbsp;verified =
Freebsd&nbsp;behavior by creating a tun interface with ifconfig, added =
an IP address and that local IP address responds to =
ping...</font></div><div class=3D""><font color=3D"#000000" =
class=3D""><span style=3D"caret-color: rgb(0, 0, 0);" class=3D""><br =
class=3D""></span></font></div><div class=3D""><font color=3D"#000000" =
class=3D"">I actually get two&nbsp;different&nbsp;scenarios, either no =
ping response or a response that the ping packet where sent trough the =
tunnel and bounced back:</font></div><div class=3D""><font =
color=3D"#000000" class=3D""><span style=3D"caret-color: rgb(0, 0, 0);" =
class=3D""><br class=3D""></span></font></div><div class=3D""><div =
style=3D"margin: 0px; font-stretch: normal; line-height: normal; color: =
rgb(0, 0, 0);" class=3D""><span style=3D"font-variant-ligatures: =
no-common-ligatures;" class=3D"">root@bsd1:~ # ping =
192.168.9.1</span></div><div style=3D"margin: 0px; font-stretch: normal; =
line-height: normal; color: rgb(0, 0, 0);" class=3D""><span =
style=3D"font-variant-ligatures: no-common-ligatures" class=3D"">PING =
192.168.9.1 (192.168.9.1): 56 data bytes</span></div><div style=3D"margin:=
 0px; font-stretch: normal; line-height: normal; color: rgb(0, 0, 0);" =
class=3D""><span style=3D"font-variant-ligatures: no-common-ligatures" =
class=3D"">92 bytes from 192.168.9.2: Redirect Host(New addr: =
192.168.9.1)</span></div><div style=3D"margin: 0px; font-stretch: =
normal; line-height: normal; color: rgb(0, 0, 0);" class=3D""><span =
style=3D"font-variant-ligatures: no-common-ligatures" class=3D"">Vr HL =
TOS&nbsp; Len &nbsp; ID Flg&nbsp; off TTL Pro&nbsp; cks&nbsp; &nbsp; =
&nbsp; Src&nbsp; &nbsp; &nbsp; Dst</span></div><div style=3D"margin: =
0px; font-stretch: normal; line-height: normal; color: rgb(0, 0, 0);" =
class=3D""><span style=3D"font-variant-ligatures: no-common-ligatures" =
class=3D"">&nbsp;4&nbsp; 5&nbsp; 00 0054 cdcd &nbsp; 0 0000&nbsp; =
40&nbsp; 01 1989 192.168.9.1&nbsp; 192.168.9.1&nbsp;</span></div><div =
style=3D"margin: 0px; font-stretch: normal; line-height: normal; color: =
rgb(0, 0, 0); min-height: 15px;" class=3D""><span =
style=3D"font-variant-ligatures: no-common-ligatures" =
class=3D""></span><br class=3D""></div><div style=3D"margin: 0px; =
font-stretch: normal; line-height: normal; color: rgb(0, 0, 0);" =
class=3D""><span style=3D"font-variant-ligatures: no-common-ligatures" =
class=3D"">64 bytes from 192.168.9.1: icmp_seq=3D0 ttl=3D63 time=3D4.401 =
ms</span></div><div style=3D"margin: 0px; font-stretch: normal; =
line-height: normal; color: rgb(0, 0, 0);" class=3D""><span =
style=3D"font-variant-ligatures: no-common-ligatures" class=3D"">92 =
bytes from 192.168.9.2: Redirect Host(New addr: =
192.168.9.1)</span></div><div style=3D"margin: 0px; font-stretch: =
normal; line-height: normal; color: rgb(0, 0, 0);" class=3D""><span =
style=3D"font-variant-ligatures: no-common-ligatures" class=3D"">Vr HL =
TOS&nbsp; Len &nbsp; ID Flg&nbsp; off TTL Pro&nbsp; cks&nbsp; &nbsp; =
&nbsp; Src&nbsp; &nbsp; &nbsp; Dst</span></div><div style=3D"margin: =
0px; font-stretch: normal; line-height: normal; color: rgb(0, 0, 0);" =
class=3D""><span style=3D"font-variant-ligatures: no-common-ligatures;" =
class=3D"">&nbsp;4&nbsp; 5&nbsp; 00 0054 21c7 &nbsp; 0 0000&nbsp; =
40&nbsp; 01 c58f 192.168.9.1&nbsp; =
192.168.9.1&nbsp;</span></div></div><div class=3D""><span =
style=3D"font-variant-ligatures: no-common-ligatures" class=3D""><br =
class=3D""></span></div><div class=3D"">I=E2=80=99m confused. &nbsp;Is =
this expected behavior? Can someone please explain.</div><div =
class=3D""><br class=3D""></div><div class=3D"">Thanks</div><div =
class=3D"">Peter</div><div class=3D""><br class=3D""></div><div =
class=3D""><br class=3D""></div></body></html>=

--Apple-Mail=_058A0AA1-2DCC-4638-8A88-9135FDC05D32--

--===============5541933780800977992==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============5541933780800977992==--
