Return-Path: <SRS0=ZLx+=WB=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D25EBC433FF
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  5 Aug 2019 18:45:23 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C46B214C6
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  5 Aug 2019 18:45:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7C46B214C6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=axinom.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e7cdfce8;
	Mon, 5 Aug 2019 18:45:23 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1b53b2db
 for <wireguard@lists.zx2c4.com>; Mon, 5 Aug 2019 07:55:56 +0000 (UTC)
Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com
 [195.245.230.130])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8df124fc
 for <wireguard@lists.zx2c4.com>; Mon, 5 Aug 2019 07:55:56 +0000 (UTC)
Received: from [46.226.53.56] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-2.bemta.az-c.eu-west-1.aws.symcld.net id F4/B2-10697-B01E74D5;
 Mon, 05 Aug 2019 07:55:55 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpkleJIrShJLcpLzFFi42K5cqZgkS73Q/d
 Yg9bFyhbn7j9id2D0mP5zEXMAYxRrZl5SfkUCa8bLy68YC+6rViz9PIO5gfGYXBcjF4eQwHxG
 iYaZRxghnC2MEjcf/GPrYuTkYBNQl2hf0c8CYosIWEssX/mLHcQWFkiV+PVqBlQ8S2LuhtvME
 LaexK2edlYQm0VARWLupzVANewcvAKOElcTQKKMArISnQ3vmEBsZgFxiVtP5oPZEgICEkv2nG
 eGsEUlXj7+xwphG0hsXbqPBcKWk1izbQUjRK+exI2pU9ggbG2JZQtfg/XyCghKnJz5hGUCo9A
 sJCtmIWmZhaRlFpKWBYwsqxjNk4oy0zNKchMzc3QNDQx0DQ2NdI1AtLFeYpVusl5qqW55anGJ
 rqFeYnmxXnFlbnJOil5easkmRmAMpBSc4N3B2HHktd4hRkkOJiVR3v+rXWOF+JLyUyozEosz4
 otKc1KLDzHKcHAoSfBeve8eKyRYlJqeWpGWmQOMR5i0BAePkgivP0iat7ggMbc4Mx0idYrRkm
 PCy7mLmDl2Hp0HJA+CSCGWvPy8VClx3pkgDQIgDRmleXDjYCnjEqOslDAvIwMDgxBPQWpRbmY
 JqvwrRnEORiVh3uv3gKbwZOaVwG19BXQQE9BB23+6ghxUkoiQkmpgKsr6n/x3klj7huLPJUeY
 Fn959XddBI9qufkJ9YdTr0i4zPv3o3vzfM/gDYn5Sp3Oto+/Xdsm0NazM7W1vCY85G+e0aSOP
 seW9yuCSq5m3Em88uVM2iWplC9Vqxjl1vw6NfGj759vrEvPGB748NZS6J7wiaadRYEFzPsqZy
 +6oPklzMfn3FS/ReZu8y/5s9udURczbNJLWXOX2WHWj5o3h92jllrtdr/3Jm2T+A3ru/1tBXb
 Vmw41L8oIP+f+sXliVP/q7TYxVhLHP/HuNDpTohfHrrg9xDInhedBn/CRhNVxbTwd9U2VydGa
 d+w1TxicyHxx9J/Hou8Nq36K3Au82fxOoqlhq8oFm7/Xr2osVGIpzkg01GIuKk4EAJyQshOUA
 wAA
X-Env-Sender: saares@axinom.com
X-Msg-Ref: server-14.tower-308.messagelabs.com!1564991754!1632657!1
X-Originating-IP: [212.204.112.162]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.43.9; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 9034 invoked from network); 5 Aug 2019 07:55:55 -0000
Received: from unknown (HELO owa.axinom.de) (212.204.112.162)
 by server-14.tower-308.messagelabs.com with ECDHE-RSA-AES256-SHA384 encrypted
 SMTP; 5 Aug 2019 07:55:55 -0000
Received: from Shepherd.axinom.de (10.0.0.9) by Shepherd.axinom.de (10.0.0.9)
 with Microsoft SMTP Server (TLS) id 15.0.1367.3;
 Mon, 5 Aug 2019 09:55:20 +0200
Received: from Shepherd.axinom.de ([fe80::7cb6:21ee:ab72:d5f6]) by
 Shepherd.axinom.de ([fe80::7cb6:21ee:ab72:d5f6%13]) with mapi id
 15.00.1367.000; Mon, 5 Aug 2019 09:55:20 +0200
From: Sander Saares <saares@axinom.com>
To: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
Subject: Windows tunnel shows established but traffic sometimes does not move
 after recycling tunnel
Thread-Topic: Windows tunnel shows established but traffic sometimes does not
 move after recycling tunnel
Thread-Index: AdVLYp7RdCcLtwGDSuSwlzc5aHoFGg==
Date: Mon, 5 Aug 2019 07:55:20 +0000
Message-ID: <4844fb6f08514ebaa39511d00e9cf9dd@Shepherd.axinom.de>
Accept-Language: en-US, de-DE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.4.235]
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 05 Aug 2019 20:45:15 +0200
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
