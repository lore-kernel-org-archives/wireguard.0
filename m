Return-Path: <SRS0=7eHk=2Q=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E464AC2D0DA
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 26 Dec 2019 15:36:47 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 82B8D206A4
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 26 Dec 2019 15:36:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=lost-frequencies.eu header.i=@lost-frequencies.eu header.b="K41WX6KE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 82B8D206A4
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=lost-frequencies.eu
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 51dd71b8;
	Thu, 26 Dec 2019 15:36:46 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fada861e
 for <wireguard@lists.zx2c4.com>;
 Fri, 20 Dec 2019 13:47:56 +0000 (UTC)
Received: from foo.lost-frequencies.eu
 (static.225.93.69.159.clients.your-server.de [159.69.93.225])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 74ff699b
 for <wireguard@lists.zx2c4.com>;
 Fri, 20 Dec 2019 13:47:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPA id B29695F8E1
 for <wireguard@lists.zx2c4.com>; Fri, 20 Dec 2019 14:47:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lost-frequencies.eu;
 s=dkim; t=1576849675;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type;
 bh=gPf12mCtFuK2NLyeHO6uxThbjfAj6jtaQmQLsfXVIqI=;
 b=K41WX6KEXD/NfzisvVadoGMpc+31pMJqiLJUDTbXU6ktSdtNV+T6g/4f3PzGCKOLFACEyM
 p2DsrrLj2RD9uH3dXZHR83lUCv/o8B4R5ZoBoKRj3c+mGmUTbHgeEOLH5AHBUCe9q2oz9P
 9MoSyFnIbk4mXVXEhPz20qLYV2C8Rz0=
From: "google gsuite" <cs@lost-frequencies.eu>
To: wireguard@lists.zx2c4.com
User-Agent: SOGoMail 4.1.1
MIME-Version: 1.0
Date: Fri, 20 Dec 2019 14:47:55 +0100
Subject: bad udp cksum messages in tcpdump for wg0
Message-ID: <49-5dfcd100-9-66d44b80@213097787>
X-Mailman-Approved-At: Thu, 26 Dec 2019 16:36:40 +0100
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
Content-Type: multipart/mixed; boundary="===============7984111784936721140=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============7984111784936721140==
Content-Type: multipart/alternative; boundary="----=_=-_OpenGroupware_org_NGMime-73-1576849675.488619-4------"

------=_=-_OpenGroupware_org_NGMime-73-1576849675.488619-4------
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Length: 978


Hi

My DNS server is available via a wireguard interface. Because of many r=
equests I did a tcpdump on the traffic and found messages like.

14:05:34.881307 IP (tos 0x0, ttl 63, id 33826, offset 0, flags [DF], pr=
oto UDP (17), length 54)
=C2=A0 =C2=A0 10.99.97.15.53628 > 10.99.97.17.domain: [bad udp cksum 0x=
d719 -> 0x6360!] 8446+ A? postgres. (26)

I could turn that messages off with turning off check validation on the=
 interface

ethtool -K wg0 tx off rx off
Actual changes:
rx-checksumming: off
tx-checksumming: off
tx-checksum-ip-generic: off

The tcpdump traffic looks now like this

14:08:36.494987 IP (tos 0x0, ttl 63, id 61627, offset 0, flags [DF], pr=
oto UDP (17), length 54)
=C2=A0 =C2=A0 10.99.97.15.40185 > 10.99.97.17.domain: [udp sum ok] 1324=
+ A? postgres. (26)


I want to know if the behavior described above with the checksum errors=
 is to be expected? Or is it necessary to turn those checks off on all =
the interfaces?

BR
ybaumy
=C2=A0

------=_=-_OpenGroupware_org_NGMime-73-1576849675.488619-4------
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Length: 1145

<html>Hi<br /><br />My DNS server is available via a wireguard interfac=
e. Because of many requests I did a tcpdump on the traffic and found me=
ssages like.<br /><br />14:05:34.881307 IP (tos 0x0, ttl 63, id 33826, =
offset 0, flags [DF], proto UDP (17), length 54)<br />&nbsp; &nbsp; 10.=
99.97.15.53628 &gt; 10.99.97.17.domain: [bad udp cksum 0xd719 -&gt; 0x6=
360!] 8446+ A? postgres. (26)<br /><br />I could turn that messages off=
 with turning off check validation on the interface<br /><br />ethtool =
-K wg0 tx off rx off<br />Actual changes:<br />rx-checksumming: off<br =
/>tx-checksumming: off<br />tx-checksum-ip-generic: off<br /><br />The =
tcpdump traffic looks now like this<br /><br />14:08:36.494987 IP (tos =
0x0, ttl 63, id 61627, offset 0, flags [DF], proto UDP (17), length 54)=
<br />&nbsp; &nbsp; 10.99.97.15.40185 &gt; 10.99.97.17.domain: [udp sum=
 ok] 1324+ A? postgres. (26)<br /><br /><br />I want to know if the beh=
avior described above with the checksum errors is to be expected? Or is=
 it necessary to turn those checks off on all the interfaces?<br /><br =
/>BR<br />ybaumy<br />&nbsp;</html>

------=_=-_OpenGroupware_org_NGMime-73-1576849675.488619-4--------



--===============7984111784936721140==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============7984111784936721140==--


