Return-Path: <SRS0=EM+o=NB=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20B04C4338F
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 10 Aug 2021 07:42:44 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DBD8A604AC
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 10 Aug 2021 07:42:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DBD8A604AC
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=voleatech.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 751abeb4;
	Tue, 10 Aug 2021 07:42:40 +0000 (UTC)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr30095.outbound.protection.outlook.com [40.107.3.95])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id d5b3cf0a
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 10 Aug 2021 07:42:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WYYfYu47hSGwWfnzI9jAzjQdSsqYIZ1tu8L1IAVjlEOF+41c9rwFVmL1MiFb0c9pJSa4v27foK6mzJ1l5Z6nh23/gn9skPo//bPZHyPKG2D3hboM4BAVs3tDD11MEcYjum2ELOEm0Z1bH23V9o4zM3wJGCxS/aA8KGDZRLMbiuUnhDAOKjdYpXwYYf6fCvqKKn9x8Y+pqLOaCI+9UMh7/Zb3CaDYZM3jNH3PaQtZNDs97RIly5ZbveIviCKrEDvIk/VFOHeyuD59CEIXfFZqpJf3HlkUHanE6b8qHY/0wgF0JaKTVfgrbZXcNjGA5S/f1PMyUcB5n3cfLgarftC4fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LsbzgibvyNEh3oHszComQIh1MNs3iDP+2Sb1//pE+30=;
 b=OStDMOO85tBAqKaNjHO13uiDD35/wG8vLjRAJ/erEeTOq5zksKCPFarTdmAUYTx0Xs9BrzkpcKf+5dTLsr2FSXpHxNhTDlC0X04TYJHCIHHPXMeJLvInFmb597AzYOCjqkkOuNj/BaVL1Dt4z/YePQL3yCyTY6gw74QlKq2Wl2lGpHmesmgfI6qS8peg1aKb7C4LngjuDhXO+xnzb6j7wAxrgsZhAT3/lVCwGfzSafgYY/TGlayYqLQqt/58FBeyqec5qz8biInEwRhwaOR1nd90K2iYXnlF+SI8qVNQFTu5SYvm2apiMQr5ngTLsq2pGBb1JyZKhkVK9zJcHwoSsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=voleatech.de; dmarc=pass action=none header.from=voleatech.de;
 dkim=pass header.d=voleatech.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=voleatech.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LsbzgibvyNEh3oHszComQIh1MNs3iDP+2Sb1//pE+30=;
 b=HTw1YiTKxobxm7kn1tEy5uVwKlhFoMJ5mvSLQ3L70GuzMrrQ14LKYcMkzXbNLikiM4IKzidMUhDwXJn74ZrjvvFrwV/QGFAwou5wQKbTwb8ekXOuOtlkYsxTam/I7Jrj4LQD70N3btjeLmb8OSpo78gjJtc3AyAXdqh0LN9RcZ0=
Authentication-Results: slarew.net; dkim=none (message not signed)
 header.d=none;slarew.net; dmarc=none action=none header.from=voleatech.de;
Received: from PAXPR05MB8559.eurprd05.prod.outlook.com (2603:10a6:102:19b::5)
 by PR3PR05MB7162.eurprd05.prod.outlook.com (2603:10a6:102:85::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.13; Tue, 10 Aug
 2021 07:42:34 +0000
Received: from PAXPR05MB8559.eurprd05.prod.outlook.com
 ([fe80::dc83:2b18:5d15:ea9]) by PAXPR05MB8559.eurprd05.prod.outlook.com
 ([fe80::dc83:2b18:5d15:ea9%3]) with mapi id 15.20.4415.013; Tue, 10 Aug 2021
 07:42:34 +0000
Date: Tue, 10 Aug 2021 08:42:32 +0100
From: Sven Auhagen <sven.auhagen@voleatech.de>
To: Stephen Larew <stephen@slarew.net>
Cc: wireguard@lists.zx2c4.com
Subject: Re: Mac APP DNS Search Domain
Message-ID: <20210810074232.aah5ktq5yzysaaey@SvensMacBookAir-2.local>
References: <20210717100909.lzi5mwsv5hb57w3w@svensmacbookair.sven.lan>
 <B8A851EA-FF19-4ED3-836A-92A054028935@slarew.net>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <B8A851EA-FF19-4ED3-836A-92A054028935@slarew.net>
X-ClientProxiedBy: MR2P264CA0096.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:32::36) To PAXPR05MB8559.eurprd05.prod.outlook.com
 (2603:10a6:102:19b::5)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from SvensMacBookAir-2.local (79.148.46.245) by
 MR2P264CA0096.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:32::36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4394.16 via Frontend Transport; Tue, 10 Aug 2021 07:42:34 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3b981138-1cff-40e6-e2f0-08d95bd26af3
X-MS-TrafficTypeDiagnostic: PR3PR05MB7162:
X-Microsoft-Antispam-PRVS: <PR3PR05MB71626F8183A6E568C6DAC72AEFF79@PR3PR05MB7162.eurprd05.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MrVBPnGPu1TEQGLOxvF+G+liGOyueE6QZfakQ2BR6M/XbWzPr+BLyhi4pm9m9Lzw9/FcFKxMG5oPnjDNk87WxcQSi8HkxWGZ0xS4l3Bh1/A6aZesqac1ZfZINCKLqADK6sXUncOPGrnahJDot73+cr+guaEl26K/qY6RT6KM2qAFSXaaQohSCzrPwGUvbMrDqC+ZzwmjVTHgNR6Wc9rRCZDbV5d7OQ+lcXpEdQqqmAv2EgJ+EntDQ+pCFoMo3ibtcZ5EtxvrNpZ68mU1F035cXNFFngjXKsJruVTQVgfSTrJeYdcX74fMLB57UWk0jECgC8/rR3WS440+81ORsghgSn5YlUJjcFkdSDCSNuwk/xCq43BDDcCNffBAzqIh6i7PWfKnIocKgCiVKXA7Asacs5AlKJ7YyewVP+6EIPa67J+BriDlYlqAdMfBQDxwge/QxiY3IC8vfTK1gZQeaKFPk9+FD+6LdI3/wWJyoPg6kodYJEFnB9zlR8O8bBnn2v+8pY5bFCa7vQE1vICVjlcUo/TWjvfov6ww1XKimIJrsnZV6l07kxVLK0zGMoy4RNhLp5dtOfNa9jfmqGQT0pxYyC0OUSJFTpvxkqitIYLPa+Hon1725HSDkH+3G2RSTf/Wpf3nFhC/hrrq+gQlTBYxybnlqlAk1AHXo9fDmAl7e3krrtNbu9csRQoCxmKyCDIeYt/iywKjs7uxgzpIpFDTioF6xTXUlXKCuXcfhleAkNP+RISbnrrEslr3+OGw6IAkB0dq51lu6PI1Rbppl9MpUj6d3kQEj+5FjqqfCW0ep6faGd7O7onhoed+qAwy9wt
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR05MB8559.eurprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39830400003)(136003)(366004)(376002)(346002)(396003)(86362001)(83380400001)(956004)(66574015)(966005)(9686003)(45080400002)(478600001)(4326008)(55016002)(316002)(6916009)(44832011)(8676002)(8936002)(26005)(15974865002)(186003)(1076003)(66476007)(38100700002)(66556008)(66946007)(38350700002)(5660300002)(53546011)(52116002)(7696005)(2906002)(6506007)(15398625002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SwhVyOQeHuDrZmsl2VRaARjq6cjocKkrHft4A7Koo6BuWAL6HYIJ6UoPHb8S?=
 =?us-ascii?Q?6cTcHslvCtfmI7kWICDnluHQWvj70MMOo5UpYJ5f/Kjl8+Dz81VFKx6AD7oS?=
 =?us-ascii?Q?K9Sk8yJOV83ZY72a5oT5diF24s60ybGa6WJq89+b8yPTlVUNRdElO5LVo8OU?=
 =?us-ascii?Q?6fEC++srfgxB1gShH4qunzDosUcNMs8Vt++D6Cm0PRrgYk7Z86vPBg3tV0g9?=
 =?us-ascii?Q?rtEG7TNoGpZBv8vI+SwuQiNhjaXO47gVyQSUQz39RZULrmf+ElA70JOFSG6n?=
 =?us-ascii?Q?Hgvz4/gIeqK8pTzRbj5gs3k0PlgtQrQuzpD3wS0BYhYm2/MFLKkI/BQkREnI?=
 =?us-ascii?Q?oB+Z/oj+Au0GDax+SR7OIQ2i1n+332IsNDjbJ9Hv7ppOiiUbNbBk5W98iO6Q?=
 =?us-ascii?Q?f1mDrF5erwNokBDgpHI+fIa+DgYUKJ6V7Wert99D+0fIieOQmK2FSAW72sdK?=
 =?us-ascii?Q?u+xFXb0gfFFJbkK5DqNRPhmaMpm1BW96B2cRHm9T5oYxPNqpLnAH9Hm0SnlP?=
 =?us-ascii?Q?VXj2VeGp82HzuYw9SI7Q/6N0uXEPL9/CEZlRtihcW18hgmWXsZ1eXQg/IEkO?=
 =?us-ascii?Q?p04sFxxgINzQVZ9yeV7h7Gp+O668seSj273tRp8SipvGeWIl65umBuecSbZE?=
 =?us-ascii?Q?UI4cfH6a+u9gFVk/R8stxPSdZ5eQBsdjqU11kRZmYMDmuc1Xf7uooHOTBiFv?=
 =?us-ascii?Q?iQB8OR0VwUh4F/XnPnIHNaObB4Pd4XH4rEfec/AocgFMJmngmTqEQM2Pyjyx?=
 =?us-ascii?Q?WVIt2GefM6jK8y+etHEDvihnFDG2cGlDh0esVJaOnU8Xdejj6qvOdgwC8Wh+?=
 =?us-ascii?Q?URuQzwM/R7AyciPe9qUlnnv+YsVA4SJFzaGHATcX2krLP0J55NGjoNQVbHuh?=
 =?us-ascii?Q?hZJMDLJAxi2pehqGZRYRxPC2H7RWY709GDDIXgUw6afFAV/4u/L0IrMnGNxs?=
 =?us-ascii?Q?i4pS7PX4E9KDZ8JaEFVihIx5yRHhQ2yWBj9LKUa110E2GuoPw8H7vMQddIXi?=
 =?us-ascii?Q?lTyAMtHNDPGo6B1xddoYYrw2E1cEw0Pjt+lH6Yu+0Yy8kvPxGkxzpX04ulfP?=
 =?us-ascii?Q?lxYIAaOQcssUFnqV185HpEHgv4lpR9qsW7s1Q0EqD2xklhXJMBPwMeueyvDK?=
 =?us-ascii?Q?FbuCvo4b+oQqjeSMfzB6yISMsJbV4Y2ZkAkIJf20GttvG9iTI8AZdz1V93x2?=
 =?us-ascii?Q?KTu9gX9Ov7kfmI/+eyYgDQjOYPfNefSjit6I/AAgoPo0scAEefa9F5vuYj8P?=
 =?us-ascii?Q?Fdby5Gky+IfKDic7sCVWtHYqmgIadNVhNr4pDZC+Dd/AT5i+94/YrqFnYbJk?=
 =?us-ascii?Q?gItIZneK9PbTlcemrkJKPFcM?=
X-OriginatorOrg: voleatech.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b981138-1cff-40e6-e2f0-08d95bd26af3
X-MS-Exchange-CrossTenant-AuthSource: PAXPR05MB8559.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2021 07:42:34.7175 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b82a99f6-7981-4a72-9534-4d35298f847b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tL2ZWvC3BNhsn4phBMUmq4eLUsELFBfE+mKASmfy/TbYCOt3aR/JMn3jVQUgI1L6RkdJcijdV0AjSQ6yAB8nv14lzu/DpX2ApO6xXco0Plw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR05MB7162
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
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

On Mon, Aug 09, 2021 at 09:12:05AM -0700, Stephen Larew wrote:
> On Jul 17, 2021, at 03:09, Sven Auhagen <sven.auhagen@voleatech.de> wrote=
:
> >
> > Hi,
> >
> > the DNS search domain in the Wireguard Mac APP does not seem to work pr=
operly.
> > The search domain is added properly and I can see it in the DNS configu=
ration
> > for the scoped query:
> >
> > resolver #2
> > search domain[0] : mytestdomain.com
> > nameserver[0] : 192.168.6.1
> > if_index : 17 (utun4)
> > flags    : Scoped, Request A records
> > reach    : 0x00000002 (Reachable)
> >
> > but the global resolver is using a mix of my LAN and Wireguard DNS reso=
lver:
> >
> > resolver #1
> > search domain[0] : sven.lan
> > nameserver[0] : 192.168.6.1
> > if_index : 17 (utun4)
> > flags    : Supplemental, Request A records
> > reach    : 0x00000002 (Reachable)
> > order    : 102200
> >
> > I found a discussion on Github about the issue here:
> > https://eur03.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgit=
hub.com%2Ftailscale%2Ftailscale%2Fissues%2F101%23issuecomment-639286398&amp=
;data=3D04%7C01%7Csven.auhagen%40voleatech.de%7Cc036b74b5f804c3ae41708d95b5=
0700e%7Cb82a99f679814a7295344d35298f847b%7C0%7C1%7C637641223312894873%7CUnk=
nown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJX=
VCI6Mn0%3D%7C3000&amp;sdata=3Dm59kt6gpqykdVvvyUX4%2BEbF14sCZWfmrZNWEKNzXj3E=
%3D&amp;reserved=3D0
> >
> > suggesting that the following will fix it:
> >
> > --- a/Sources/WireGuardKit/PacketTunnelSettingsGenerator.swift
> > +++ b/Sources/WireGuardKit/PacketTunnelSettingsGenerator.swift
> > @@ -88,7 +88,7 @@ class PacketTunnelSettingsGenerator {
> >             let dnsSettings =3D NEDNSSettings(servers: dnsServerStrings=
)
> >             dnsSettings.searchDomains =3D tunnelConfiguration.interface=
.dnsSearch
> >             if !tunnelConfiguration.interface.dns.isEmpty {
> > -                dnsSettings.matchDomains =3D [""] // All DNS queries m=
ust first go through the tunnel's DNS
> > +                dnsSettings.matchDomains =3D [""] + dnsSettings.search=
Domains // All DNS queries must first go through the tunnel's DNS
> >             }
> >             networkSettings.dnsSettings =3D dnsSettings
> >         }
> >
> > I do not have an Apple Developer Account so I am not able to compile th=
e code and test it.
> > Can anyone take a look as this would be a great help.
> >
> > Best
> > Sven
>
> Sven,
>
> I have a patch for Wireguard Mac app that enables proper split DNS suppor=
t. It works well in my usage.  I should properly submit the patch for revie=
w by Wireguard folks.  Until then, you can get the patch here:
>
> https://eur03.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithu=
b.com%2Fslarew%2Fwireguard-apple%2Fcommit%2F6ebc356d9e11ab91443e06de5e89f1a=
f57fcdff8&amp;data=3D04%7C01%7Csven.auhagen%40voleatech.de%7Cc036b74b5f804c=
3ae41708d95b50700e%7Cb82a99f679814a7295344d35298f847b%7C0%7C1%7C63764122331=
2894873%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI=
6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=3Ddd9MYi3CkgveF%2BcBAU1sk857lDeLmX=
2SpMcRy7tL9nM%3D&amp;reserved=3D0
>
> > Enable "split DNS" configurations for an interface
> >
> > By adding a tilde prefix to a domain name entry in the DNS=3D line, the
> > domain is interpreted as a "matching domain" for DNS routing instead of
> > a "search domain."  This corresponds to setting a non-empty
> > NEDNSSettings.matchDomains property for the network tunnel.  Using tild=
e
> > as a prefix is borrowed from systemd-resolved's equivalent usage.
> >
> > If one or more match domains are specified, then the specified DNS
> > resolvers are only used for those matching domains instead of acting as
> > the first resolver before the system's primary DNS resolvers.

Thanks Stephen.
It would be great if you can upstream the patch.
The current behaviour is a problem for non technical users that rely on the=
 short dns names.

Best
Sven

>
> -Stephen

Beste Gr=C3=BC=C3=9Fe/Best regards

Sven Auhagen
Dipl. Math. oec., M.Sc.
Voleatech GmbH
HRB: B 754643
USTID: DE303643180
Grathwohlstr. 5
72762 Reutlingen
Tel: +49 7121539550
Fax: +49 71215395599
E-Mail: sven.auhagen@voleatech.de
www.voleatech.de<https://www.voleatech.de>
[https://www.voleatech.de/wp-content/uploads/2021/03/vtair-emailbanner-ente=
rprise.jpg] <https://www.voleatech.de/de/vtair/>
Diese Information ist ausschlie=C3=9Flich f=C3=BCr den Adressaten bestimmt =
und kann vertraulich oder gesetzlich gesch=C3=BCtzte Informationen enthalte=
n. Wenn Sie nicht der bestimmungsgem=C3=A4=C3=9Fe Adressat sind, unterricht=
en Sie bitte den Absender und vernichten Sie diese Mail. Anderen als dem be=
stimmungsgem=C3=A4=C3=9Fen Adressaten ist es untersagt, diese E-Mail zu les=
en, zu speichern, weiterzuleiten oder ihren Inhalt auf welche Weise auch im=
mer zu verwenden. F=C3=BCr den Adressaten sind die Informationen in dieser =
Mail nur zum pers=C3=B6nlichen Gebrauch. Eine Weiterleitung darf nur nach R=
=C3=BCcksprache mit dem Absender erfolgen. Wir verwenden aktuelle Virenschu=
tzprogramme. F=C3=BCr Sch=C3=A4den, die dem Empf=C3=A4nger gleichwohl durch=
 von uns zugesandte mit Viren befallene E-Mails entstehen, schlie=C3=9Fen w=
ir jede Haftung aus.
