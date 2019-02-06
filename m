Return-Path: <SRS0=tjuz=QY=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD322C43381
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 17 Feb 2019 01:30:31 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 67DBF21B69
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 17 Feb 2019 01:30:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="esCPFSOs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 67DBF21B69
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=yogotech.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ff28355c;
	Sun, 17 Feb 2019 01:22:17 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7727a3b1
 for <wireguard@lists.zx2c4.com>; Wed, 6 Feb 2019 22:19:14 +0000 (UTC)
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-oln040092006103.outbound.protection.outlook.com [40.92.6.103])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4383e0fc
 for <wireguard@lists.zx2c4.com>; Wed, 6 Feb 2019 22:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PIwFHcSgT66ks/IgQtUpYtdDNd3J1bCmlB0FJMeoOdM=;
 b=esCPFSOsO7YvrGMoMZss2avqN57C72jg5C7QV0rm8I8+0N3FJQ7b+bqKjxD8UlaqpagSUBhh6wELrYLgRYypiUFWC1m3Insy8akokNMUmVGGCbqKy9onCMu84SctijEwcD5A4g6swWzZfQEzESwbUTaBfD8rjbjTDRrrKba14+av51x9RAqbFNBA5p0pYJl5x8vt0/jQqBPt9oCT8RPaWf4/+lvBe8XZDqfyuGpzbsRzlqdqGVWsSPhkx6kxoQ2DtDMDVmqoINznb4syoVUWMvrNF+pWWvKNKCmAEvjiKvRGfOXp17gcheUSeMRMcBEiohGTp9kXtnrKlOfddkMbHA==
Received: from BY2NAM03FT011.eop-NAM03.prod.protection.outlook.com
 (10.152.84.52) by BY2NAM03HT233.eop-NAM03.prod.protection.outlook.com
 (10.152.85.87) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1580.10; Wed, 6 Feb
 2019 22:26:08 +0000
Received: from MWHPR20MB1245.namprd20.prod.outlook.com (10.152.84.56) by
 BY2NAM03FT011.mail.protection.outlook.com (10.152.84.233) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1580.10 via Frontend Transport; Wed, 6 Feb 2019 22:26:08 +0000
Received: from MWHPR20MB1245.namprd20.prod.outlook.com
 ([fe80::14e2:419e:b515:921c]) by MWHPR20MB1245.namprd20.prod.outlook.com
 ([fe80::14e2:419e:b515:921c%10]) with mapi id 15.20.1601.016; Wed, 6 Feb 2019
 22:26:08 +0000
From: Nate Williams <nate@yogotech.com>
To: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
Subject: Wireguard-go on FreeBSD - Not working until the interface (wg0) is
 set into promiscuous mode
Thread-Topic: Wireguard-go on FreeBSD - Not working until the interface (wg0)
 is set into promiscuous mode
Thread-Index: AQHUvmgLm3kSS0yxK0mput6GEXPkaQ==
Date: Wed, 6 Feb 2019 22:26:08 +0000
Message-ID: <MWHPR20MB1245664BA43F11A3368F1D8BE96F0@MWHPR20MB1245.namprd20.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-incomingtopheadermarker: OriginalChecksum:6648A6A66DC2852B6987C2CBCF9B3CDE7AC55A789E9E35256E8941749573D2A1;
 UpperCasedChecksum:8663049ADEA32E80D26D6F3159BAC78C25E5F4945209B3FA473540C9330DFDD3;
 SizeAsReceived:6965; Count:44
x-ms-exchange-messagesentrepresentingtype: 2
x-tmn: [2qZ5RFzhnLQXfjc/NVFtOLetUygVJ/92]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; BY2NAM03HT233;
 6:FFZ4S/2ONDPo4QBpEhWlavDrTf4+UluGEDQ0pWOk5V3wFsQ2B/kI0wU8N8i7AZJbaxTCYfjWxk8DFcEANlRAIXDCd0atKflM9m0p9RCjKwqcMIdVjY2pJums0ub7Z+meHgJ5YQWTeOvD8FEZfKamwGz5BL/MvUc+/nUn2Uy5QjR/+soKBIGFHr8A0m/p0U/FMfM0Q+OVT567K0YDt3sah23dFeo4Yz7B3jx9bvkmJ92BELWijKeaeqRuUZ3F6EnRom4CfYYjsjlYiKQPIpU4qsUJtJ0tyToO5Q49ZSWcYSTmRCEw6Bfv99ALMUCL9ETMTffKb0KbnUmCppxyZjQ9YK7ZvHHPi7XWXOqOLoY2lkKcN6zbn+krJRaNYkcWKe14+g0+kSCPmr67guB/YPnbqbj7k/2FrlyalDie3YqNp33ryyMcSv4uxivpGhQeedghreNzltAvUSIGarJi6mJaDQ==;
 5:PFRZxsnAbDAhXj7PMd08WaKlMZAhMh+mHdNwpCPsir7WzIcOlvn6eqvFHL0FTolnAj6xEbF+xaHpJqctYal5956humQzTXZKq2eHdTxo6gTgx9dWKfbr8RWS85c0NWwyx8bJuqEbxXgUgg9p0fuAXVxzbilPqUafIy0fW9T48nxTDMsGQGGxbVFtLhHpG2FMXjuiuRVOxXtLwIp9DmgJ9A==;
 7:rAf+arn6kN9YUAD0Xq59TtAac5nihVYB58C5DaE0poCkyKm4kKuvvo6zbBYVNvkET5QqiuLRuYrUEdQAqKU29nesekau5MwhEVQ8CEv/SWKO/fqLdv8BEOP7RvErmcDoyyodJ4XRRJwoe5o6qLEeRg==
x-incomingheadercount: 44
x-eopattributedmessage: 0
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(20181119070)(201702061078)(5061506573)(5061507331)(1603103135)(2017031320274)(2017031323274)(2017031324274)(2017031322404)(1601125500)(1603101475)(1701031045);
 SRVR:BY2NAM03HT233; 
x-ms-traffictypediagnostic: BY2NAM03HT233:
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0; RULEID:(4566010)(82015058);
 SRVR:BY2NAM03HT233; BCL:0; PCL:0; RULEID:; SRVR:BY2NAM03HT233; 
x-microsoft-antispam-message-info: UYioQSogqjEqc9gCmjGgDQtx+q6FQpP+bDYS+5C2DOe9vjINCiSwiNxIqlamRq7s
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 24fd1209-d934-423e-a578-ee886993c07f
X-MS-Exchange-CrossTenant-Network-Message-Id: 876058b0-8985-40af-84c4-08d68c821779
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 24fd1209-d934-423e-a578-ee886993c07f
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Feb 2019 22:26:08.5929 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY2NAM03HT233
X-Mailman-Approved-At: Sun, 17 Feb 2019 02:22:13 +0100
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
Content-Type: multipart/mixed; boundary="===============7883367713366307651=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============7883367713366307651==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_MWHPR20MB1245664BA43F11A3368F1D8BE96F0MWHPR20MB1245namp_"

--_000_MWHPR20MB1245664BA43F11A3368F1D8BE96F0MWHPR20MB1245namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Setup:

Client - Raspberry PI, running Wireguard native
Server - FreeBSD box, running Wireguard-go

Note, all of the computers involved in the test are running inside my local=
 LAN, so there are no (active) firewalls involved at the moment, so any/all=
 traffic is allowed between hosts.

I setup a proof of concept using a FreeBSD VM, and monitored the entire pro=
cess, and it worked fine (sort of, but that's a topic for another email).

When I switched to a physical box (same OS version, etc..), things didn't w=
ork so well.  But, occassionally, it would start working for reasons that w=
eren't obvious, when I finally figured out what was going on.

On the FreeBSD box (server), I have the em0 interface which is the local et=
hernet.  It also has the wg0 interface, which was created by wireguard-go.

Server Configuration file:
---- cut here -----
[Interface]
ListenPort =3D 1194
PrivateKey =3D ...

[Peer]
PublicKey =3D ...
PresharedKey =3D ...
AllowedIPs =3D 10.8.0.2/32
PersistentKeepalive =3D 120
---- cut here -----
Pretty straight-foward (no Endpoint since the client provides it)

On the RPI, it uses wireless, so wlan0, and the wg0 interface.
---- cut here -----
[Interface]
PrivateKey =3D ...

[Peer]
Endpoint =3D server.yogotech.com:1194
PublicKey =3D ...
PresharedKey =3D ...
AllowedIPs =3D 10.8.0.1/32
PersistentKeepalive =3D 120
---- cut here -----
Again, no ListenPort since it has to connect to the server and the port doe=
sn't matter.

If I sniff on the physical on the FreeBSD box, I can see packets from the P=
I
# tcpdump -ni em0 port 1194
14:53:41.454233 IP 172.30.77.45.40788 > 172.30.77.1.1194: UDP, length 148
...
Unfortunately, there is no connectivity.  The FreeBSD box doesn't do anythi=
ng with the packets.  It will stay that way all day without actually making=
 a connection.

However, if I do the following
# tcpdump -ni wg0

As soon as this is done, wireguard starts working.
The kernel message that is created when this occurs is:
wg0: promiscuous mode enabled
wg0: promiscuous mode disabled

This is very repeatable.  The link will stay active until the link is refre=
shed (stopped/restarted) at the server end, at which point it will not reco=
nnect UNTIL I put the wg0 interface in promiscous mode (my guess) using tcp=
dump.

Note, if I don't refresh the link on the server, the client can reboot/rest=
art the connection at will without issue.

I'm trying a simple post-configuration script to fix the issue with
#!/bin/sh
/usr/sbin/tcpdump -ni wg0 > /dev/null 2>&1 &
pid=3D$!
sleep 5
kill $pid

As I don't know anything else that sticks the interface into promiscous mod=
e.  However, this is *REALLY* ugly.

Ideas?


Nate



--_000_MWHPR20MB1245664BA43F11A3368F1D8BE96F0MWHPR20MB1245namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
Setup:</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
Client - Raspberry PI, running Wireguard native</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
Server - FreeBSD box, running Wireguard-go</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
<div style=3D"margin: 0px; font-size: 12pt; font-family: Calibri, Helvetica=
, sans-serif">
<br>
</div>
<div style=3D"margin: 0px; font-size: 12pt; font-family: Calibri, Helvetica=
, sans-serif">
Note, all of the computers involved in the test are running inside my local=
 LAN, so there are no (active) firewalls involved at the moment, so any/all=
 traffic is allowed between hosts.</div>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
I setup a proof of concept using a FreeBSD VM, and monitored the entire pro=
cess, and it worked fine (sort of, but that's a topic for another email).</=
div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
When I switched to a physical box (same OS version, etc..), things didn't w=
ork so well.&nbsp; But, occassionally, it would start working for reasons t=
hat weren't obvious, when I finally figured out what was going on.</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
On the FreeBSD box (server), I have the em0 interface which is the local et=
hernet.&nbsp; It also has the wg0 interface, which was created by wireguard=
-go.</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
Server Configuration file:</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
<div style=3D"margin: 0px; font-size: 12pt; font-family: Calibri, Helvetica=
, sans-serif">
<div style=3D"margin: 0px; font-size: 12pt; font-family: Calibri, Helvetica=
, sans-serif; background-color: rgb(255, 255, 255)">
---- cut here -----</div>
<span style=3D"font-family: Calibri, Helvetica, sans-serif; background-colo=
r: rgb(255, 255, 255); display: inline !important"></span>
<div style=3D"margin: 0px; font-size: 12pt; font-family: Calibri, Helvetica=
, sans-serif; background-color: rgb(255, 255, 255)">
<span>[Interface]<br>
</span>
<div>ListenPort =3D 1194<br>
</div>
<div>PrivateKey =3D ...</div>
<div><br>
</div>
<div>[Peer]<br>
</div>
<div>PublicKey =3D ...</div>
<div>PresharedKey =3D ...</div>
<div>AllowedIPs =3D 10.8.0.2/32</div>
<div>PersistentKeepalive =3D 120</div>
</div>
<div style=3D"margin: 0px; font-size: 12pt; font-family: Calibri, Helvetica=
, sans-serif; background-color: rgb(255, 255, 255)">
---- cut here -----</div>
<span style=3D"font-family: Calibri, Helvetica, sans-serif; background-colo=
r: rgb(255, 255, 255); display: inline !important"></span>Pretty straight-f=
oward (no Endpoint since the client provides it)</div>
<div style=3D"margin: 0px; font-size: 12pt; font-family: Calibri, Helvetica=
, sans-serif">
<div style=3D"margin: 0px; font-size: 12pt; font-family: Calibri, Helvetica=
, sans-serif">
<br>
</div>
<div style=3D"margin: 0px; font-size: 12pt; font-family: Calibri, Helvetica=
, sans-serif">
On the RPI, it uses wireless, so wlan0, and the wg0 interface.</div>
</div>
<div style=3D"margin: 0px; font-size: 12pt; font-family: Calibri, Helvetica=
, sans-serif">
---- cut here -----</div>
[Interface]<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
<div>PrivateKey =3D ...</div>
<div><br>
</div>
<div>[Peer]<br>
</div>
<div>Endpoint =3D server.yogotech.com:1194<br>
</div>
<div>PublicKey =3D ...<br>
</div>
<div>PresharedKey =3D ...&nbsp;</div>
<div>AllowedIPs =3D 10.8.0.1/32</div>
<div>PersistentKeepalive =3D 120<br>
</div>
<span></span>
<div style=3D"margin: 0px; font-size: 12pt; font-family: Calibri, Helvetica=
, sans-serif">
---- cut here -----</div>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
Again, no ListenPort since it has to connect to the server and the port doe=
sn't matter.</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
If I sniff on the physical on the FreeBSD box, I can see packets from the P=
I</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
# tcpdump -ni em0 port 1194</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
<span>14:53:41.454233 IP 172.30.77.45.40788 &gt; 172.30.77.1.1194: UDP, len=
gth 148<br>
</span><span></span>...</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
Unfortunately, there is no connectivity.&nbsp; The FreeBSD box doesn't do a=
nything with the packets.&nbsp; It will stay that way all day without actua=
lly making a connection.</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
However, if I do the following</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
# tcpdump -ni wg0</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
As soon as this is done, wireguard starts working.</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
The kernel message that is created when this occurs is:</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
<span>wg0: promiscuous mode enabled<br>
</span>
<div>wg0: promiscuous mode disabled<br>
</div>
<span></span>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
<br>
</div>
This is very repeatable.&nbsp; The link will stay active until the link is =
refreshed (stopped/restarted) at the server end, at which point it will not=
 reconnect UNTIL I put the wg0 interface in promiscous mode (my guess) usin=
g tcpdump.</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
Note, if I don't refresh the link on the server, the client can reboot/rest=
art the connection at will without issue.</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
I'm trying a simple post-configuration script to fix the issue with</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
<span>#!/bin/sh</span></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
<span>/usr/sbin/tcpdump -ni wg0 &gt; /dev/null 2&gt;&amp;1 &amp;<br>
</span>
<div>pid=3D$!<br>
</div>
<div>sleep 5<br>
</div>
<div>kill $pid<br>
</div>
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
As I don't know anything else that sticks the interface into promiscous mod=
e.&nbsp; However, this is *REALLY* ugly.</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
Ideas?</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
Nate</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
<br>
</div>
</body>
</html>

--_000_MWHPR20MB1245664BA43F11A3368F1D8BE96F0MWHPR20MB1245namp_--

--===============7883367713366307651==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============7883367713366307651==--
