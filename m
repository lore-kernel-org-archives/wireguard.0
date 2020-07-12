Return-Path: <SRS0=8LYU=AY=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FORGED_HOTMAIL_RCVD2,FORGED_MUA_MOZILLA,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1425EC433E6
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 13 Jul 2020 23:55:16 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B4EE320825
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 13 Jul 2020 23:55:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b="A9214v1c"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B4EE320825
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=hotmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id be08f974;
	Mon, 13 Jul 2020 23:33:31 +0000 (UTC)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11olkn2060.outbound.protection.outlook.com [40.92.18.60])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 597d3a86
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 12 Jul 2020 18:21:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VVThCtQY+4iwPmavkNL0Ho0FCWM8J8S9sEtGgCHuEx7R+IeMmxvcOomH0C0Xu2o6ReYt/Tcf8BSUfZwmloZdUqKtQL4UgFs3rarHBaa7xZCcmmjKAOMO7M+jnMc8MaHRM1a293CL8NxDd+rzD9LKlAlQAs1zdwR8SkoVy/czWTQPhpJ7PWTNg29RoPB797wLWybV7Pc6cxDWGCD4xkj0azIALmG8jyUUJjXHGdAVIedAlLCJINX4f8PbYDrXaZzWWhhmpwFm5r4+LkpJ6L9jOHj1XP5/Pclbp0IEcLHauJSFV+KpIArOV/FIsqRspWwD5SWd1DNyiY6zQLce7Zv3Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kiEOdIWDOXUISoz/OcSNXl7/zeatwXJ2u2LAyMC2Ut8=;
 b=jmEZXZKBmsmI6UDv+BpVdNxjopcvtA6I0VGinx20nhCGZxRvv/oYUO3NYNfSTLLp8t3r0fGxNnL/L3IcNLMXfE0C7O2kSFgDPKxa2Eb53QvoIropBS7L5U5IfuSzM1BTjrNWSZDZ9ihn3d3x/HEhDTxmhhH6CgslD9y6RNHBCgMv4D/WJHaWSz061EtLruXLUCjku/9sUVPubACz5jMKY6tyGQ0c38HsWCGThdVj594xYEEqdcwRzWi4wBAZE/Ll9tlHAAPKWXeyRztSyabUMsRU11Cz34TQlX6s/wJZxnzUVvRgGQVv2BvJbM071XNWyZMujKwfDLFiLmnJkTdUsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kiEOdIWDOXUISoz/OcSNXl7/zeatwXJ2u2LAyMC2Ut8=;
 b=A9214v1c5tfR/mzufF++4NDafdPDB+DcBpFss1z34QcZm6VC6sEuc9CD30EpHl1dM2lB86KrSE0bXJTIgZZUDnDMo3ttudN1Oq7djOKbbmuFCbAN6XhnBhyc2MR0hbOs+g1CqSwceubUsCOQFAE1qQGXGe+1hXFxLVTbSlnltxBNux1Wyh0OtbQycDank+xxGZ9wUzUwRlD1vMRHbi5W95Jpp3GJinbTUNMySoJuO7z6hPxGdHdDuqU7wvay2Tcb7krmK9Le+Bjz0v8pCGaymSPMkTu9D8hjA4XWZkF3kLjkG6xzoAK8kRxwcMukluSHmY0E1xZ08NUi26bTYW32gw==
Received: from DM6NAM11FT059.eop-nam11.prod.protection.outlook.com
 (2a01:111:e400:fc4d::52) by
 DM6NAM11HT030.eop-nam11.prod.protection.outlook.com (2a01:111:e400:fc4d::423)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.21; Sun, 12 Jul
 2020 18:43:19 +0000
Received: from BY5PR19MB3729.namprd19.prod.outlook.com
 (2a01:111:e400:fc4d::4f) by DM6NAM11FT059.mail.protection.outlook.com
 (2a01:111:e400:fc4d::92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.21 via Frontend
 Transport; Sun, 12 Jul 2020 18:43:19 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:BBE961CFF0F6389E0C6F5284FCAF8092753263EAB3DB3096414124A0C1B43517;
 UpperCasedChecksum:9CDF42013883ACECB62D2A639DD2E6B9F2263B5CA05747C56A3484AB9280E86D;
 SizeAsReceived:8631; Count:47
Received: from BY5PR19MB3729.namprd19.prod.outlook.com
 ([fe80::15d3:19ae:6e46:ac31]) by BY5PR19MB3729.namprd19.prod.outlook.com
 ([fe80::15d3:19ae:6e46:ac31%3]) with mapi id 15.20.3174.025; Sun, 12 Jul 2020
 18:43:19 +0000
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
From: Judah Kocher <kocherjj@hotmail.com>
Subject: I'm having trouble building an OpenBSD site-to-site Wireguard tunnel
Message-ID: <BY5PR19MB372968F2696E9C02232EC949D7630@BY5PR19MB3729.namprd19.prod.outlook.com>
Date: Sun, 12 Jul 2020 14:43:17 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: MN2PR06CA0004.namprd06.prod.outlook.com
 (2603:10b6:208:23d::9) To BY5PR19MB3729.namprd19.prod.outlook.com
 (2603:10b6:a03:22d::9)
X-Microsoft-Original-Message-ID: <32ada8e0-19f1-6faa-776a-09b24483f5c2@hotmail.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.212.20.21] (108.16.201.97) by
 MN2PR06CA0004.namprd06.prod.outlook.com (2603:10b6:208:23d::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3174.21 via Frontend Transport; Sun, 12 Jul 2020 18:43:18 +0000
X-Microsoft-Original-Message-ID: <32ada8e0-19f1-6faa-776a-09b24483f5c2@hotmail.com>
X-TMN: [Ahw9H8ME+3YRE2fWCV+Q4EEx/2JyaGIK]
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 47
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 68ac96d0-1c8a-4b98-2e00-08d82693721e
X-MS-TrafficTypeDiagnostic: DM6NAM11HT030:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ONG32dYEggvFkG/49RRDy7H05BLBkGN8AhxJc8Lq37QvQtpMAy2/W6uK+rpT3tWZHs7j7XcmsqkyB/BcP1jUoHh2vF6SRck6gJyE/vqN9oIfV/juDq0S7EmshZ9cvcSJAQfwz76Z4sjpSkDb8KJljlSlo7fiOMi8Lgwoa4bxmx/la6Hd2btLQtl6OErg0xBFf+eJA9aS0N2taRJ3/HCBTg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:0; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR19MB3729.namprd19.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:; SFS:; DIR:OUT; SFP:1901; 
X-MS-Exchange-AntiSpam-MessageData: jpxn/SWroQuxQ4YAGXl1QhK18nJO2mStlHl8ysm9BRauIuJpOFJcQG/Km7D0T0ETv/8393iSEIEQRW2Ub3PDdqFfWgwCYBQMIZanUFi6i0mUxqZA89igisiLx6JdzKaqTg0hcnFTkDIFYYEsEwkX0g==
X-OriginatorOrg: hotmail.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68ac96d0-1c8a-4b98-2e00-08d82693721e
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2020 18:43:19.4053 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT059.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6NAM11HT030
X-Mailman-Approved-At: Tue, 14 Jul 2020 01:33:28 +0200
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.30rc1
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Reply-To: kocherjj@hotmail.com
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Hello,


I am having some trouble trying to use wireguard to setup a site-to-site 
vpn tunnel between two OpenBSD 6.7/current routers. They are both 
updated to the latest snapshot as of 7/11/2020.

I have no trouble at all setting up a client/server type connection to 
either router, where I can either route all traffic through the router 
or split tunnel and only route traffic for networks behind the router. 
Where I am struggling is getting the networks behind the routers to 
communicate with each other over a tunnel. Each router has multiple 
subnets behind it and I intend to control which particular IPs are 
allowed access to devices on the far ends of the wireguard tunnel using 
PF rules but I'm just focused on one entire subnet on each end at this 
time and can't even get that working.

My basic network topology for this first step is this.

Router A private subnet range: 10.212.20.0/24
Router A wireguard interface IP: 10.0.11.1

Router B private subnet range: 192.168.8.0/21
Router B wireguard interface IP: 10.0.11.2

What I am trying to accomplish is to have Router B "phone home" to 
Router A and maintain a persistent tunnel with KeepAlive packets. Any 
device on the 10.212.50.x subnet behind router A should be able to reach 
any device on the 192.168.8.x subnet behind Router B.

Router A wg11.conf contents are:

[Interface] #RouterA
PrivateKey = RouterAprivatekey=
ListenPort = 51811

[Peer] #RouterB
PublicKey = RouterBpublickey=
AllowedIPs = 192.168.8.0/21, 10.0.11.0/24

Router A hostname.wg11 contents are:

inet 10.0.11.1 255.255.255.0
!/usr/local/bin/wg setconf wg11 /etc/wireguard/wg11.conf

In the Router A pf.conf file I have these relevant rules, which will be 
tightened up once I get the tunnel working but are as open as possible 
to try to get something working:

Wireguard wg11 VPN Connection Rules
pass in  quick on egress    inet proto udp    from <RouterBIP> to port 51811

# Wireguard wg11 Traffic Rules
pass quick on wg11



Router B wg11.conf contents are:

[Interface] #RouterB
PrivateKey = RouterBprivatekey=

[Peer] #RouterA
PublicKey = RouterApublicKey=
AllowedIPs = 10.0.11.0/24, 10.212.20.0/24
Endpoint = FQDN_for_RouterA:51811
PersistentKeepalive = 25

Router B hostname.wg11 contents are:

inet 10.0.11.2 255.255.255.0
!/usr/local/bin/wg setconf wg11 /etc/wireguard/wg11.conf

In Router Bs pf.conf file I have these relevant rules, which will be 
tightened up once I get the tunnel working but are as open as possible 
to try to get something working:

# Wireguard VPN Connection Rules
pass out  quick on egress    inet proto udp    to <RouterBIP> port 51811

# Wireguard wg11 Traffic Rules
pass quick on wg11


I brought up each interface with: doas sh /etc/netstart wg11

I can ping 10.0.11.2 from router A. I cannot ping 10.0.11.1 from router 
B. Running tcpdump on router A shows the ping requests coming in on the 
external interface but no reply going back out.

When I 'route show' on either router, I do not see the extra subnet 
specified in "allowed IPs" anywhere in the routing table. I cannot ping 
any other devices on the far subnets or even any other interfaces on the 
far router from either end.

I am seeing the keepalive packet on Router A every 25 seconds, so this 
is working at least.

I've tried generating new all new keys, tried destroying all interfaces 
and config files and starting over, tried changing the "allowed IPs to 
/32 targeting specific hosts that I know will respond to connection 
attempts, and none of this seems to matter. Nothing seems to be getting 
routed across the tunnel other than direct pings of the opposite routers 
wireguard interface, and even in that case it only works correctly one 
way. I feel like I must be missing something really obvious but hours of 
reading google search results and experimenting with other settings 
seems to make any difference. If anyone sees any issues in my setup and 
would be willing to share some advice i would greatly appreciate it!



