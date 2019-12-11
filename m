Return-Path: <SRS0=Cs4w=2J=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CF51C43603
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 19 Dec 2019 01:20:46 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 98BAE2176D
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 19 Dec 2019 01:20:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=azureaxinom.onmicrosoft.com header.i=@azureaxinom.onmicrosoft.com header.b="n4syK8u4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 98BAE2176D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=axinom.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7ab5b095;
	Thu, 19 Dec 2019 01:20:28 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 94bb2f66
 for <wireguard@lists.zx2c4.com>;
 Wed, 11 Dec 2019 07:27:38 +0000 (UTC)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr30122.outbound.protection.outlook.com [40.107.3.122])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 16d71641
 for <wireguard@lists.zx2c4.com>;
 Wed, 11 Dec 2019 07:27:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AvUWFRqKptDgUm/gACC76TxJcgWtWAU5q2Q3YCkkf2beSwWi6/9/PTVTbw6T9u1ZpeLqRFfaxNKlI3WRsU1QtDiZDVXmx9495krv9iWZzflDyMsKwASdSVpPOc8d8KQrbGl230ST4ElTPSz39LxWgyCNKCjR3ou9uxJqhBIQkzYvFMMBoSZnazMdJ/ZAw+HJrVo/vjUsTIT18VbesFJKK2O6c6uu5aIMRPKdVxNC7+aT/LcBXpVWndcTO+IBnxPTJM0qbzMGyOPZU1udCgsHYo9KzmiwZD25Pcqi5K1zguT0zYXyATBhioQviFAi9a8INe+sd3QyiF2EvK5m3j4WzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ElAbkeQlyFp2W/j0qY8SnJ8I7PpPanfLxImhOGWbEfg=;
 b=HyJOsZh60ljGMGduM1PqZhwsSx68cde53VGFYBwPvsOPl9OA7u7hCKhdAdmA8Y4xaXvWQBdij47oRG39rAnNgXe0ntzBvL5DoS5dyKxA0DqNUz7KcUldXD7CKTZebZ9YgDoTlF4iga0PPmVgegb2y4lkQWxbH9Hr8X29FlKsdXMipccnQA0RT8xEj0+wkWzps4ebW95/Ibk75FlizzrP647x83opXtAv3CIPsi91UNc6PygfBpGiBDJjPNfME6P3KWeTgtcarCUrjhufMD/oPTE3ALdHja2OJ8DIOZ7F4Mm7CgCayY9pP8Hk/G19W++TeqzNZzR7qqdkO3to1v2sJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axinom.com; dmarc=pass action=none header.from=axinom.com;
 dkim=pass header.d=axinom.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureaxinom.onmicrosoft.com; s=selector2-azureaxinom-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ElAbkeQlyFp2W/j0qY8SnJ8I7PpPanfLxImhOGWbEfg=;
 b=n4syK8u4hjVdewFezcq5YnX7pGt7VbWPp3vNTF9nBNxecb3DY3WwXp5BWZabcbmCKnfmmjr+bvNlSx9e4BfK6BfA0LcrMTml+FZhKEquyL0056kaD1wN1vmco/mf8GlNCtTOKqp5Dg1EdiUYF8BcQxBoCmEEuZMvnMLIxO+8mDE=
Received: from AM0PR05MB4769.eurprd05.prod.outlook.com (52.133.58.151) by
 AM0PR05MB5105.eurprd05.prod.outlook.com (20.178.19.89) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2516.14; Wed, 11 Dec 2019 07:27:36 +0000
Received: from AM0PR05MB4769.eurprd05.prod.outlook.com
 ([fe80::b4fa:643a:b4c7:59e1]) by AM0PR05MB4769.eurprd05.prod.outlook.com
 ([fe80::b4fa:643a:b4c7:59e1%5]) with mapi id 15.20.2538.012; Wed, 11 Dec 2019
 07:27:36 +0000
From: Sander Saares <saares@axinom.com>
To: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
Subject: RE: Windows tunnel shows established but traffic sometimes does not
 move after recycling tunnel
Thread-Topic: Windows tunnel shows established but traffic sometimes does not
 move after recycling tunnel
Thread-Index: AdVLYp7RdCcLtwGDSuSwlzc5aHoFGhkkWe7w
Date: Wed, 11 Dec 2019 07:27:35 +0000
Message-ID: <AM0PR05MB47699A235CD44F5F874C3BDEBE5A0@AM0PR05MB4769.eurprd05.prod.outlook.com>
References: <4844fb6f08514ebaa39511d00e9cf9dd@Shepherd.axinom.de>
In-Reply-To: <4844fb6f08514ebaa39511d00e9cf9dd@Shepherd.axinom.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=saares@axinom.com; 
x-originating-ip: [89.219.153.19]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 62a9f680-d000-4c22-04a7-08d77e0b9842
x-ms-traffictypediagnostic: AM0PR05MB5105:
x-microsoft-antispam-prvs: <AM0PR05MB510501D51ED960D369E40F53BE5A0@AM0PR05MB5105.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 024847EE92
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(376002)(346002)(136003)(396003)(39830400003)(366004)(189003)(199004)(13464003)(15974865002)(66476007)(64756008)(7696005)(66556008)(66946007)(66446008)(76116006)(33656002)(2906002)(71200400001)(8676002)(52536014)(5660300002)(81166006)(86362001)(81156014)(66574012)(508600001)(9686003)(26005)(55016002)(6506007)(53546011)(186003)(316002)(6916009)(8936002)(21314003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM0PR05MB5105;
 H:AM0PR05MB4769.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: axinom.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 15BNvZFdAOYWdb3NNEe/DXwfhJ/D554yrgNSYsIIMaLk13TtLBHsO+z9EOhdCeBMAF6S3D0trGSpHDJcNd1MBoJqujH2Ij6jTS7/4R/+aVI9BgXw5AXzBhiXfh2/ik9Q7w9IYq3vcOCWQsMkn76LEMyIoCY4hJW3+6cRxzl/VTiBxAPIDE2nrJaQkobJkrGudlunTuGhlQUs5l/bU0bHO/iG0QuLUmmUoNppmnsX7z+0BHr8f7xoK1eTh7vkuTBN+6MNkAP0hIMNWsa/zL85XVNhpHRdl7jTEhtf0W5MmdM188hMH2VRx6er9oGrDYrQ5qWT6i8EkyJAD47Oxc30q3b3ciKzEygKL9OlhKEw4EnXeiML5SETAFAkmjRAJuPeQJ2f0pmgSpMRf1vyhK9wm2qV+QtiuQyQcjPpHO7usiBa29MzXceeraC/y9aIeFglEKeLgs/y+bqGiygh1EwzEAaFp2eXTRT+nOO762wsLUJXGkRZIOH6zbh9hoNpKPOBVahcVH2jVa16wmCImH24RdmN8BQ0tO9uONmixKoyYT4=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: axinom.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62a9f680-d000-4c22-04a7-08d77e0b9842
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Dec 2019 07:27:35.9724 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: db0b4725-608f-4d84-b2e3-7fc15b0cb2d4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UX4QjYVRUiMOCyWS6SDJJXUb9NctCasZF93eSgFBxyMLSwWkeDzYDKlz9cEEHAxEGdr70s8ZLMiFISVrNlQYEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR05MB5105
X-Mailman-Approved-At: Thu, 19 Dec 2019 02:20:26 +0100
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Hi!

I tested again with latest Wireguard (.35) and Windows 2019 (.914) and the =
problem remains easy to reproduce.

In short, after restarting a Windows that is doing NAT for a peer behind a =
Wireguard tunnel, the tunnel stops correctly moving packets. I can see the =
Wiregurad "sent" and "received" counts increment to some degree but the end=
 result is that pings do not work after some restarts of the tunnel/server).

I remain ready to assist in further diagnosis if a more informed person can=
 guide me to what data might be useful.


Cheers,

Sander Saares, Advisor, Axinom
phone: +49 911 80109-54 |=A0saares@axinom.com

-----Original Message-----
From: Sander Saares =

Sent: esmasp=E4ev, 5. august 2019 10:55
To: 'wireguard@lists.zx2c4.com' <wireguard@lists.zx2c4.com>
Subject: Windows tunnel shows established but traffic sometimes does not mo=
ve after recycling tunnel

Hi!

I submit a report on a problem encountered attempting to use WireGuard in a=
 Windows-to-Windows "VPN gateway/proxy" deployment. I have a test deploymen=
t available in case I can provide further data for ease of debugging.

Scenario:
* Server A set up as WireGuard server, accepting connections from server B.
* Traffic from WireGuard network is forwarded and NATed by server A using b=
uilt-in Windows networking features.
* Server B connects through WireGuard tunnel to access the internet.

For purpose of experimentation, the internet is defined as 8.8.8.8/32.

Expected result: tunnel is successfully established, internet traffic of se=
rver B is forwarded through server A.
Actual result: tunnel is successfully established (at least as shown in Wir=
eGuard GUI) but sometimes the expected traffic flows do not occur.
Occasionally, actual result matches expected result.

Method of observation: mutual ping on private IP address; ping from server =
B (WG client) to 8.8.8.8.
In failure case:
* both pings time out (server A and server B cannot ping each other on priv=
ate IP)
* ping to 8.8.8.8 times out, EXCEPT for the first ping after tunnel is re-e=
stablished (server B always seems to get 1 response before connectivity van=
ishes; possibly this is a ping not routed through the VPN, so it just goes =
directly out from server B to the internet?)
In success case, all pings work fine and get expected responses.

I suspect some startup/lifecycle/timing issue disrupting proper operation o=
f the tunnel and/or associated routing configuration. If I can provide more=
 data that may prove useful, I am happy to do so when instructed on how to =
collect it.

Configuration and experiment log follows.

Both systems are Windows 2019 (17763.652) running in clean Azure VMs, fully=
 patched. WireGuard 0.0.19.

WireGuard server (server A)
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[Interface]
PrivateKey =3D =

ListenPort =3D 9000
Address =3D 172.16.16.1/24

[Peer]
PublicKey =3D =

AllowedIPs =3D 172.16.16.0/24

WireGuard client (server B)
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[Interface]
PrivateKey =3D =

Address =3D 172.16.16.2/24

[Peer]
PublicKey =3D =

AllowedIPs =3D 172.16.16.0/24, 8.8.8.8/32
Endpoint =3D xxx:9000

Forward+NAT setup (server A)
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
PS C:\Users\saares> $interfaces =3D Get-NetIPInterface
PS C:\Users\saares> $interfaces[4]

ifIndex InterfaceAlias                  AddressFamily NlMtu(Bytes) Interfac=
eMetric Dhcp     ConnectionState PolicyStore
------- --------------                  ------------- ------------ --------=
------- ----     --------------- -----------
3       wg-test                         IPv4                  1420         =
      5 Disabled Connected       ActiveStore

PS C:\Users\saares> $interfaces[4] | Set-NetIPInterface -Forwarding Enabled
PS C:\Users\saares> New-NetNat -Name NAT -InternalIPInterfaceAddressPrefix =
"172.16.16.0/24"

Name                             : NAT
ExternalIPInterfaceAddressPrefix :
InternalIPInterfaceAddressPrefix : 172.16.16.0/24
IcmpQueryTimeout                 : 30
TcpEstablishedConnectionTimeout  : 1800
TcpTransientConnectionTimeout    : 120
TcpFilteringBehavior             : AddressDependentFiltering
UdpFilteringBehavior             : AddressDependentFiltering
UdpIdleSessionTimeout            : 120
UdpInboundRefresh                : False
Store                            : Local
Active                           : True

Experiment log
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Immediate after setup -> all OK
Recycle tunnel on server -> all OK
Restart server PC -> tunnel reestablished but traffic does not move
Recycle tunnel on server -> all OK
Recycle tunnel on server -> all OK
Recycle tunnel on server -> all OK
Recycle tunnel on server -> all OK
Recycle tunnel on server -> all OK
Recycle tunnel on server -> all OK
Restart server PC -> all OK
Restart server PC -> tunnel reestablished but traffic does not move
Recycle tunnel on server -> tunnel reestablished but traffic does not move
Recycle tunnel on server -> tunnel reestablished but traffic does not move
Recycle tunnel on server -> tunnel reestablished but traffic does not move
Recycle tunnel on server -> tunnel reestablished but traffic does not move
Recycle tunnel on server -> all OK
Recycle tunnel on server -> tunnel reestablished but traffic does not move
Recycle tunnel on server -> tunnel reestablished but traffic does not move
Recycle tunnel on server -> tunnel reestablished but traffic does not move



Cheers,

Sander Saares
Advisor =

=A0
Axinom=A0| Soola 8 | 51004 Tartu | Estonia
phone: +49 911 80109-54
saares@axinom.com |=A0www.axinom.com =

=A0
Managing Directors: Sergei Gussev, Oleg Knut
Tartu Circuit Court, Reg. 11046287

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
