Return-Path: <SRS0=UgTS=M7=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96ABBC4338F
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  8 Aug 2021 23:13:30 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A9A6F60E78
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  8 Aug 2021 23:13:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A9A6F60E78
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=voleatech.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5002307f;
	Sun, 8 Aug 2021 23:01:19 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70111.outbound.protection.outlook.com [40.107.7.111])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 543df057
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 17 Jul 2021 10:09:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IruveYVA8Yze1Y0g5yNBdn9FPOWgKxrXZ+WK3k0A+gFBkHGzGhxJ6evbK8AqpVX7QB+fpfer0UF4bpm6LhfgivNVpYc0pwiF5EC2NRb9okhdCsFZcHA/JDrpwJ52hpO633tSgU5Csj84VTkuz/ut/4hI+5lEJZSIXKDSe6PehxwB5+suDQqRRg9x5njOA1pYeYI+ikI8KG1QViOtBVQ+vM9SrJwInbXjE6QgpjWTMTV6oMG42mJ2o2TICaJA+ss/dUVXZRWUS9wGvIwIMy6tixYRe3wRhzH2o15MLxbV+ETbIMMkFNY0fqyK8ZQRHITZIHoXmaJYStKUyDIBJuJeBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hW7pc1Xf3x1gXi764j2IIhCndaK2S5VlKkmIRARo2fg=;
 b=OXl9po7RfRmQSbV+zmHgdC5um3RX2knW15/J0+mqlY9FB9La4t849p5RMdjU2vaE8d3BEv58rcfvCQRDJr3mAXVCC/cJAR/yqKzieGOeL4UcrgdT3puC1l3suIoFXsRQ7LPnS6Fba7b+u5zEi/ZLgQaMbvZBFS/rk/ptyDSdvOXE8QupB4y9jr74JJWy33yETldfTRpJI91VImyzCRfQLjJ3B4QCT+FtUeWUCmaNL/lL298tP1I5lSlvzS5cT4NgXXM/8hw+Hl0gvEjg/82+KY81GFYETWBL5H+mV2A5m4fHwPG+/vRxwRCNtm0wzQwYZwfof6f0fNSNXrf8nve2YA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=voleatech.de; dmarc=pass action=none header.from=voleatech.de;
 dkim=pass header.d=voleatech.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=voleatech.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hW7pc1Xf3x1gXi764j2IIhCndaK2S5VlKkmIRARo2fg=;
 b=G0Udk5EM2ZptZjKmq/ixSBlU5BbDX3lr8G/CwbafUuOsh8psw+6iSK9eQS4pq9sZTqxeRe/TaxZ2rRJsyFUXUQeraeokZvtae0eb8P59gDDQBkobsx41ByNpitqmAZZv8zztB0IBWfJim7aLUwfeZ0ZUgqmF06j04QqieYpb0/g=
Authentication-Results: lists.zx2c4.com; dkim=none (message not signed)
 header.d=none;lists.zx2c4.com; dmarc=none action=none
 header.from=voleatech.de;
Received: from PAXPR05MB8559.eurprd05.prod.outlook.com (2603:10a6:102:19b::5)
 by PR3PR05MB7481.eurprd05.prod.outlook.com (2603:10a6:102:81::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Sat, 17 Jul
 2021 10:09:10 +0000
Received: from PAXPR05MB8559.eurprd05.prod.outlook.com
 ([fe80::a1a4:f355:9da3:9cc5]) by PAXPR05MB8559.eurprd05.prod.outlook.com
 ([fe80::a1a4:f355:9da3:9cc5%3]) with mapi id 15.20.4331.029; Sat, 17 Jul 2021
 10:09:10 +0000
Date: Sat, 17 Jul 2021 12:09:09 +0200
From: Sven Auhagen <sven.auhagen@voleatech.de>
To: wireguard@lists.zx2c4.com
Subject: Mac APP DNS Search Domain
Message-ID: <20210717100909.lzi5mwsv5hb57w3w@svensmacbookair.sven.lan>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
X-ClientProxiedBy: PR3P192CA0025.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:102:56::30) To PAXPR05MB8559.eurprd05.prod.outlook.com
 (2603:10a6:102:19b::5)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from svensmacbookair.sven.lan (91.40.93.141) by
 PR3P192CA0025.EURP192.PROD.OUTLOOK.COM (2603:10a6:102:56::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.26 via Frontend Transport; Sat, 17 Jul 2021 10:09:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 76e7043d-42b0-4eeb-313d-08d9490aebdb
X-MS-TrafficTypeDiagnostic: PR3PR05MB7481:
X-Microsoft-Antispam-PRVS: <PR3PR05MB748169D7EAC90B1B6F76E79FEF109@PR3PR05MB7481.eurprd05.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: m5gsoLl0EVVysj4zyP6i7qTPONkpcbRPv4uX7WRKNNeHzp44geGcTvTooxMSvtYueU7zS90OA+8QOC5iuW1wgeeGeA//P8ggcMNbzTBgD9JS1DWgkmDYGKEJnwQrzhI0p7VPRf65yu+KHHRly6kDvQyOcmBBGJXcGjmY8YbY1qkrxq+rfi7vexpbWUln+kXKx9RfnK/ylin8n1tTvA/LCZCCUGQRXEUodmnHh7VMdtK2TgMSM/F6861wwr9264qEpBs4lIAnPWXcH4NkDBVR4P3ZfSiBhP5VR9kLjE4vFgN2j9owERJAj+LhW6tPTR53XlwVHM8ouDHLgDVW68H7ICZNXw5MGMVAe64h2/tW8jSrq6OGVxHNTqGycA1rPi8pEQOZBAGa31gQmywL9JMX/2J/Q7ygDhUFJy2vKlu85KdGOuSpXAwHwW1knDjr+ozKBTygGzvUvpUNRM0Sk6jrsS7mgynmhPzvYyzPKyyuyZK7bQyLnW+ECrIUvIMK+rEBVHBWIO9bYL6PZsCimYuCE4LbG73BLdWWuvCBOLdGSlS/nFtn221V1hCa/tSzJ2dG83Bp+eEBYBp8bpjnqPVGYyx+AsjK5pB1rDG3qNwJyOYIhozEe1kT/quED9HYFvJbSgMU8HSTEMOpLhh3eqsaRXdfKB2srJ690Il0WT9pDrRN5s1/r844ycJkNm+xEHekZ4fWGt6OaGtGI1Kg35/6bM5keoaIJPVW4LGZ+uSLHbdAI1shrA4HqOdEltdCFjKjVu5CnhAaRvPztolgX5nL/9ncwnbB7eqfHRAOTX+KSSnUOBw8rSCUJI0ZLfB+3DTN
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR05MB8559.eurprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39830400003)(346002)(396003)(136003)(366004)(9686003)(86362001)(8936002)(6916009)(66946007)(83380400001)(7696005)(478600001)(6506007)(966005)(186003)(52116002)(66476007)(5660300002)(55016002)(66556008)(26005)(2906002)(15974865002)(44832011)(1076003)(38350700002)(38100700002)(956004)(8676002)(316002)(66574015)(15398625002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QQ5+jICkN/SfNFbeW6IW8rAsWTUwS3rukoDbfzn99UC6vcIyY86tk3N0c8zA?=
 =?us-ascii?Q?1s/uV8hnbzCjAG6t72ZgoFp7r9ifNk5nsEqfrgB1sxbGmkXBX0DhCRGUXqiP?=
 =?us-ascii?Q?k6eP2W8F7ZFslWL2b/Lp3fHlrkxIbCgCwHk65stwf+EAQP4vTrdK+iwLlaDS?=
 =?us-ascii?Q?dNnrwRLAyXk/wNtMmVPJez6geNLCzkQeTOZ5rhLidZmX8aqYArCLiw9OQf6a?=
 =?us-ascii?Q?8q2bD2XXnC7WYVabBR2dM3OPEohmp8XeTmuGtSUtDgAHGeIS9JC3I/jtmTDN?=
 =?us-ascii?Q?U8cH7eJDXCtOf0VV2VHvGIgmB5KhFiuIVPpZhTXUWdtggGXZB590HUzcqyhC?=
 =?us-ascii?Q?kfl37FDCT5/dd7PqNTlle4qJ/19l75yQ/guZHQCoZEByOMApQbyrz3XTXXFr?=
 =?us-ascii?Q?JGJ4dQrU95CNundxTyEEGrVExwX5UHpiy2r7MQsvVC70BecF2u6ic7p+ADIk?=
 =?us-ascii?Q?VG5tgIBzQQYMeSJd0iqjNvXhnLxjCG3M3LNiublzboDymbsNQO5uAnm7rYuW?=
 =?us-ascii?Q?lz/XQp9C5s8Ue/aO1fwrAmnidccnlP1Yax0XXyFYRkuP3+pAIs8epI+GiZMD?=
 =?us-ascii?Q?j+hEA/aLDUbD2rY5b1QIY/pY1qFV7t0grGM/b24/jd28wWYVR3sjAOZowIB7?=
 =?us-ascii?Q?6Cs15D++L8n1okTMalJOfGpdBQdCPlKkd6Lr118K3l+xU/p/2YsGLLTTxa1D?=
 =?us-ascii?Q?leCHxAk41/rogjh7T6dudajJxrIskY6oCXOHL7GVGncCpssq8N0emgtJJHtX?=
 =?us-ascii?Q?TgJOBxrRnbbsnkaJYUejCVVm4N/A98ubvOIfk32i2EMzYnU+0xOzpfM12mv+?=
 =?us-ascii?Q?o1173ZOYRm8fBJp51I6hbvcZnY7PkmEIQev1CTuiP8JOcrTPCj1GgAbn4BRr?=
 =?us-ascii?Q?US3146zuVbCXYO3HW3T7k8ajzQDPZc18Y17fn69xcRUP4sdvLx85m0lGtCb9?=
 =?us-ascii?Q?zrub4neQyoekx6gyJBsvNoef9Xg3JpCaOnkbONnhDGTGLYFrqcQnM9j4PMOO?=
 =?us-ascii?Q?eCO8guzjz/jPeadXET/lVUadXesNIClQv0QamBhHDEi+YpvCwK9rLQZfi6xd?=
 =?us-ascii?Q?7TcEyNU3hqRkzzGJsrUcbpbGik7dDTF2wKF42dlMitUvbqFJHdp9lKoBrCks?=
 =?us-ascii?Q?AnkW8O451f3BXFNdDNc7JDlF5dl3ZfqN7YzWri3e3OCLKrzg5OV5hnIzlXfz?=
 =?us-ascii?Q?x98zqOHOFmS/RFxXHGXyQk3KIbj3LIvCiNsdfLTtChiWHvK5M7QN8DjgJR8s?=
 =?us-ascii?Q?9cRZyMCOvsb2b2CqnmlbyW+InKowDwsOEhYqTzcE2wZiXmoIm4fI8kclefKP?=
 =?us-ascii?Q?L/vBSPPV0UNXv9XC2lEYiEx3?=
X-OriginatorOrg: voleatech.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 76e7043d-42b0-4eeb-313d-08d9490aebdb
X-MS-Exchange-CrossTenant-AuthSource: PAXPR05MB8559.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2021 10:09:10.6660 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b82a99f6-7981-4a72-9534-4d35298f847b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B3rw5+LDYQ/qYMH6BVvqTMiRHfcwElbCd29Y7ovjjpvBy3LdiD7hXbvsrByCaxTSztaZY5jNlxRFhRiUrMqekAKf9Csmx2nJRgWanXlJKJU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR05MB7481
X-Mailman-Approved-At: Sun, 08 Aug 2021 23:01:17 +0000
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

Hi,

the DNS search domain in the Wireguard Mac APP does not seem to work proper=
ly.
The search domain is added properly and I can see it in the DNS configurati=
on
for the scoped query:

resolver #2
search domain[0] : mytestdomain.com
nameserver[0] : 192.168.6.1
if_index : 17 (utun4)
flags    : Scoped, Request A records
reach    : 0x00000002 (Reachable)

but the global resolver is using a mix of my LAN and Wireguard DNS resolver=
:

resolver #1
search domain[0] : sven.lan
nameserver[0] : 192.168.6.1
if_index : 17 (utun4)
flags    : Supplemental, Request A records
reach    : 0x00000002 (Reachable)
order    : 102200

I found a discussion on Github about the issue here:
https://github.com/tailscale/tailscale/issues/101#issuecomment-639286398

suggesting that the following will fix it:

--- a/Sources/WireGuardKit/PacketTunnelSettingsGenerator.swift
+++ b/Sources/WireGuardKit/PacketTunnelSettingsGenerator.swift
@@ -88,7 +88,7 @@ class PacketTunnelSettingsGenerator {
             let dnsSettings =3D NEDNSSettings(servers: dnsServerStrings)
             dnsSettings.searchDomains =3D tunnelConfiguration.interface.dn=
sSearch
             if !tunnelConfiguration.interface.dns.isEmpty {
-                dnsSettings.matchDomains =3D [""] // All DNS queries must =
first go through the tunnel's DNS
+                dnsSettings.matchDomains =3D [""] + dnsSettings.searchDoma=
ins // All DNS queries must first go through the tunnel's DNS
             }
             networkSettings.dnsSettings =3D dnsSettings
         }

I do not have an Apple Developer Account so I am not able to compile the co=
de and test it.
Can anyone take a look as this would be a great help.

Best
Sven



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
