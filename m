Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E378EC3ABC9
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 21 May 2025 12:39:05 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 533db5b8;
	Tue, 20 May 2025 19:55:19 +0000 (UTC)
Received: from PR0P264CU014.outbound.protection.outlook.com
 (mail-francecentralazon11012048.outbound.protection.outlook.com
 [40.107.161.48])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 0f32052d
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 14 Mar 2025 09:39:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AKH+81ai+NtFU1/qB0KvDw8HrD+aDMuOEQP/gdlgV1kye0SrnwXilBi4rjlqB1Pn/kifzirgJj+b7tkSZFPrI+XGtjkMXlrVxjYDgy94Sg8/moifDzjEAqgY98Wx8W838s256sR43vhZm9xUIH92kS28np2jQBg1u9HsazELF0//w1nkNNJeKPmX0hY5jYo9lcBhwZiiVoTxt/6xGrtcL8mkMEwFcAUsV1thzafdnFosFlXLVNUP5eVJ1aDdF+iKAPWtD9Pg+Sqmpo9Pg1yt9apLUYfXSoLOJi8gjul42bqWhBZMWnl+muRA45lhE6OY1nE8jpjff2zBgEoXbZI4MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+ApUMvHThFTzn9mvVMJJBqEKEuGiUZ54u0u63SMB6jk=;
 b=VSQlEvd2MTrI3gC5cp49FEOS9+rZvUxonFuWOTxvx79u7lVQbByFpi0XAq6hawOm/nY0pHDV+kZ1qfvRjDuvmpIZP0JpVrDRcO55Q2x6bRDZcH9/Sh+OoAoWKBCcBUAgxJWowPs1w/0fAx5f9tkzCq5Pv1y96j+fmWZX6ZlY6M8ZZwqXxxnT2FVGoIc0hx4Jsc5xAjPxy18ZYGB7gKhkLCv8WjCPqRgNXT9Yv+6eKw9uzYuUDcYbHxG+Ret7uinaeUvOLbJVKuLdKj1OMkiiHePUv58+bfyKnwn/LbnUZDcgb1dNEKHNhRpQFbrO9No5u/mLZkTw+Kmp12kw9CghNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.6.166.170) smtp.rcpttodomain=lists.zx2c4.com
 smtp.mailfrom=softathome.com; dmarc=bestguesspass action=none
 header.from=softathome.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=softathome1.onmicrosoft.com; s=selector1-softathome1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+ApUMvHThFTzn9mvVMJJBqEKEuGiUZ54u0u63SMB6jk=;
 b=CSDqhiUur7Rq4qQzFhJhv5F4+OdkOTahEbuZhqbmr4M3i5hixfTjzfbF43yr2kBiDJHDEjOnecb23Oc+M172SMRU9hGvtSNyy+eETydsHRBrgMFTEjqfLCnAqypiqDPP8INYedymV1rs/FuXBMchLjYq0TU+Jn48GEwKq5XLkut5HKhRdkHYiUwtUyb+AHtp0Dx6N2GiKBzrz5bpyodHFMoEtBS9b7tt5PxGSVb2uKwIJo9ETnVCAxpSNKHtHCiYbL2G9Bqxrkgh3DiUNRWFg3SPHIORNe+8VHmqVOPnZL/kOOntIlLXLhH1Z7u1KAGsXWrWrtBQovfPRgjlIMkXHw==
Received: from GV0P278CA0006.CHEP278.PROD.OUTLOOK.COM (2603:10a6:710:26::16)
 by PA3PPFFD81CCA5C.FRAP264.PROD.OUTLOOK.COM (2603:10a6:108:1::6ae) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.25; Fri, 14 Mar
 2025 09:39:29 +0000
Received: from PA1PEPF000CC3FB.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:710:26:cafe::30) by GV0P278CA0006.outlook.office365.com
 (2603:10a6:710:26::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.26 via Frontend Transport; Fri,
 14 Mar 2025 09:39:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.6.166.170)
 smtp.mailfrom=softathome.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=softathome.com;
Received-SPF: Pass (protection.outlook.com: domain of softathome.com
 designates 149.6.166.170 as permitted sender)
 receiver=protection.outlook.com; client-ip=149.6.166.170;
 helo=proxy.softathome.com; pr=C
Received: from proxy.softathome.com (149.6.166.170) by
 PA1PEPF000CC3FB.mail.protection.outlook.com (10.167.242.6) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.20
 via Frontend Transport; Fri, 14 Mar 2025 09:39:29 +0000
Received: from ph-thinkbook.be.softathome.com (unknown [192.168.18.205])
 by proxy.softathome.com (Postfix) with ESMTPSA id 01CF71FD5E;
 Fri, 14 Mar 2025 10:39:28 +0100 (CET)
From: Patrick Havelange <patrick.havelange_ext@softathome.com>
To: wireguard@lists.zx2c4.com
Cc: Patrick Havelange <patrick.havelange_ext@softathome.com>
Subject: [PATCH] wg: syncconf: also handle psk changes
Date: Fri, 14 Mar 2025 10:39:20 +0100
Message-Id: <20250314093920.3448871-1-patrick.havelange_ext@softathome.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA1PEPF000CC3FB:EE_|PA3PPFFD81CCA5C:EE_
Content-Type: text/plain; charset="utf-8"
X-MS-Office365-Filtering-Correlation-Id: 277b22bd-c120-4a3e-010a-08dd62dc1dfd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|1800799024|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?hJpQ8QFMs/1vol1OTqSLH+jxXpUHxN9HfAdTdUof9pHJJfYtmdbIXYJXdpDJ?=
 =?us-ascii?Q?roiqqqWHQfM++7wluiBgCU+cM43kpxfckqU3tMLsJYeMu16cjrohO1j3I6GS?=
 =?us-ascii?Q?Ob1ItIZ2szBlbj0v+hEXYHn7BUtJoNZ+aWeaWI60yIAYtfBWuEOnyCdxhsRV?=
 =?us-ascii?Q?hEEfkeRbP3VEJuioL5zmyzoiiqEx015dB9CweulQqmzqCNVd55cnuephtrVN?=
 =?us-ascii?Q?G73um5EkDV1LU6WqO/fdhxYQQdBc/1ceUbD9svnfA7957vZv0MNWhp6Sa2i5?=
 =?us-ascii?Q?6YW8fKMP+lofh4IKE9ZdHBCOmCEjVQj7UhWTAaFLeB6wMo2H/MD+q843S061?=
 =?us-ascii?Q?CozIUJweJ5btr4pdYUByMXw4EVlzXu8pGl16VJkPnj8Gf3n48c7uGG2Ue+OL?=
 =?us-ascii?Q?dcEg5a6yk3cMXuEx6XD6qe9RAfLLVKtDx/BGDo84xyCPlQVO5U76YYjufmqj?=
 =?us-ascii?Q?CtcgHNBYTUqhT32o5v47PSnFG4rUHeASTiGbaxrZYJzyWVgEu/nBOxp2FuuG?=
 =?us-ascii?Q?540wD1P6Cb+eEZfugT/EVHZUP4HJyqr0f9gcuocShY4uQafzQag0Jmnbket+?=
 =?us-ascii?Q?bP5boRd27o+Nsg5Im7H5md6S5KT61ABM9oc6/S832bbtz+Cx9RPzpJk0tsG3?=
 =?us-ascii?Q?lzorHmzE/HF8seusVhnVW6rPKHVFRauitBXkNpCTSUdOgBcEfX38cILSJiFm?=
 =?us-ascii?Q?RKcNtFizdk/StTpWqyNw2RDEz+evGz4peRvmYtaBwqlDOVjEh+J3iHjZFERy?=
 =?us-ascii?Q?SxhIRxUI1pNAaRQfMWJDF9CwspK/9AV1LzHC5oObUVAHkEszv69yjzsYsujy?=
 =?us-ascii?Q?6oTA+VHEHro7SrAmx+mMuftFo517Yd8ZM1u29ERiz3PV0hxhGCyaWmJO5E2F?=
 =?us-ascii?Q?jGZmft5QXRHXJK6kSBVuNJyVqM31AgtyPSlAUibZxz8KJJL/kNU3Ls5cAc84?=
 =?us-ascii?Q?0Y0Kie1JcKJc6mnGtDUwLWwKp2CpFYN9dkEqdPMWIXAUrDg93oWGVSfa2MGU?=
 =?us-ascii?Q?oEtp4p0G23hJ0f/jQh2GcsyplQhLq1VIh3CevcWWoPnXgoHZu2Gv5XMoHEah?=
 =?us-ascii?Q?/UQClLBk4DpWCGxSYFZdB2Eb3WKPb0aVdTBoxCmifaIPUz0s0SslgcIRwre2?=
 =?us-ascii?Q?DDkG4gil0/3LRoQalPl0kONdZqSIyNI3ouiEyHrxexqZr8U2CKRHW8CVP0tT?=
 =?us-ascii?Q?GoAX5YkVcJpXDYmDmRUksfF0FQcPLWy8Bqjk/NIqR8fxnHXG0kPIPnMIfNwa?=
 =?us-ascii?Q?VGG3CQ7Z02WihjwET7hRmpnlgjAqixQsUkOYuisNR0NHph5d1L1ykWxsJnGv?=
 =?us-ascii?Q?5LV0u0OllCtMvOZtydI2Ra/ODgtGFhnGLD+lCg8qXchA2izzr5N7kui5/bsU?=
 =?us-ascii?Q?YbxSdnCT0pvtJsRNR+RdarhA0tZyUVmPdSY9lxriR8QK0JmxRkn8MS3idNOa?=
 =?us-ascii?Q?gJpAPmnEv+d6BZODAVYSwi81FtVCHktaBHcjHo8OgvwfIXiPgovOo400OW3N?=
 =?us-ascii?Q?zANCfgFNPwDMYPs=3D?=
X-Forefront-Antispam-Report: CIP:149.6.166.170; CTRY:FR; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:proxy.softathome.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: softathome.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2025 09:39:29.1300 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 277b22bd-c120-4a3e-010a-08dd62dc1dfd
X-MS-Exchange-CrossTenant-Id: aa10e044-e405-4c10-8353-36b4d0cce511
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=aa10e044-e405-4c10-8353-36b4d0cce511; Ip=[149.6.166.170];
 Helo=[proxy.softathome.com]
X-MS-Exchange-CrossTenant-AuthSource: PA1PEPF000CC3FB.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA3PPFFD81CCA5C
X-Mailman-Approved-At: Tue, 20 May 2025 19:52:08 +0000
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

This fixes the case where the removal of a psk would not be reflected with =
wg syncconf.

Signed-off-by: Patrick Havelange <patrick.havelange_ext@softathome.com>
---
 src/setconf.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/src/setconf.c b/src/setconf.c
index 1c5b138..8f40124 100644
--- a/src/setconf.c
+++ b/src/setconf.c
@@ -15,6 +15,7 @@

 struct pubkey_origin {
        uint8_t *pubkey;
+       uint8_t *psk;
        bool from_file;
 };

@@ -64,11 +65,13 @@ static bool sync_conf(struct wgdevice *file)

        for_each_wgpeer(file, peer) {
                pubkeys[i].pubkey =3D peer->public_key;
+               pubkeys[i].psk =3D peer->preshared_key;
                pubkeys[i].from_file =3D true;
                ++i;
        }
        for_each_wgpeer(runtime, peer) {
                pubkeys[i].pubkey =3D peer->public_key;
+               pubkeys[i].psk =3D peer->preshared_key;
                pubkeys[i].from_file =3D false;
                ++i;
        }
@@ -77,7 +80,7 @@ static bool sync_conf(struct wgdevice *file)
        for (i =3D 0; i < peer_count; ++i) {
                if (pubkeys[i].from_file)
                        continue;
-               if (i =3D=3D peer_count - 1 || !pubkeys[i + 1].from_file ||=
 memcmp(pubkeys[i].pubkey, pubkeys[i + 1].pubkey, WG_KEY_LEN)) {
+               if (i =3D=3D peer_count - 1 || !pubkeys[i + 1].from_file ||=
 memcmp(pubkeys[i].pubkey, pubkeys[i + 1].pubkey, WG_KEY_LEN) || memcmp(pub=
keys[i].psk, pubkeys[i + 1].psk, WG_KEY_LEN)) {
                        peer =3D calloc(1, sizeof(struct wgpeer));
                        if (!peer) {
                                free_wgdevice(runtime);
--
2.30.2

-- This message and any attachments herein are, unless otherwise stated, co=
nfidential, intended solely for the addressees and are SoftAtHome=E2=80=99s=
 ownership. Any unauthorized use, reproduction or dissemination is prohibit=
ed unless formaly agreed beforehand by the sender. If you are not the inten=
ded addressee of this message, please immediately delete it and all its att=
achments from your computer system and notify the sender. SoftAtHome reserv=
es the right to monitor all email communications through its networks. Any =
views or opinions presented are solely those of its author and do not neces=
sarily represent those of SoftAtHome. The internet cannot guarantee the int=
egrity of this message. SoftAtHome not shall be liable for the message if a=
ltered, changed or falsified. While we take all reasonable precautions to e=
nsure that viruses are not transmitted via emails, we recommend that you ta=
ke your own measures to prevent viruses from entering your computer system.=
 SoftAtHome is a French Soci=C3=A9t=C3=A9 Anonyme with a Board of Directors=
, having a capital of 6 450 699 Euros having its registered office located =
at 9-11 rue du d=C3=A9barcad=C3=A8re =E2=80=93 92700 =E2=80=93 Colombes =E2=
=80=93 France =E2=80=93 Tel + 33 (0)1 57 66 88 88 =E2=80=93 Fax + 33 (0)1 5=
7 66 88 89 - RCS Nanterre B 500 440 813 =E2=80=93 Intra-Community VAT: FR 0=
4500440813 -- Ce message et toutes les pi=C3=A8ces jointes qui y sont inclu=
ses sont, sauf indication contraire, confidentiels, destin=C3=A9s uniquemen=
t aux destinataires et sont la propri=C3=A9t=C3=A9 de SoftAtHome. Toute uti=
lisation non autoris=C3=A9e, reproduction ou diffusion est interdite, sauf =
accord formel pr=C3=A9alable de l'exp=C3=A9diteur. Si vous n'=C3=AAtes pas =
le destinataire pr=C3=A9vu de ce message, veuillez le supprimer imm=C3=A9di=
atement ainsi que toutes ses pi=C3=A8ces jointes de votre syst=C3=A8me info=
rmatique et en informer l'exp=C3=A9diteur. SoftAtHome se r=C3=A9serve le dr=
oit de surveiller toutes les communications par e-mail via ses r=C3=A9seaux=
. Les opinions exprim=C3=A9es dans ce message sont celles de leur auteur et=
 ne repr=C3=A9sentent pas n=C3=A9cessairement celles de SoftAtHome. L=E2=80=
=99Internet ne permettant pas d=E2=80=99assurer l=E2=80=99int=C3=A9grit=C3=
=A9 de ce message, SoftAtHome d=C3=A9cline toute responsabilit=C3=A9 =C3=A0=
 ce titre, dans l=E2=80=99hypoth=C3=A8se o=C3=B9 il aurait =C3=A9t=C3=A9 al=
t=C3=A9r=C3=A9, d=C3=A9form=C3=A9 ou falsifi=C3=A9. Par ailleurs et malgr=
=C3=A9 toutes les pr=C3=A9cautions prises pour =C3=A9viter la pr=C3=A9sence=
 de virus dans nos envois, nous vous recommandons de prendre, de votre c=C3=
=B4t=C3=A9, les mesures permettant d'assurer la non-introduction de virus d=
ans votre syst=C3=A8me informatique. SoftAtHome est une Soci=C3=A9t=C3=A9 A=
nonyme fran=C3=A7aise =C3=A0 Conseil d=E2=80=99Administration ayant un capi=
tal de 6 450 699 euros, dont le si=C3=A8ge social est situ=C3=A9 au 9-11 ru=
e du d=C3=A9barcad=C3=A8re - 92700 - Colombes - France - Tel + 33 (0)1 57 6=
6 88 88 - Fax + 33 (0)1 57 66 88 89 RCS Nanterre B 500 440 813 - TVA intrac=
ommunautaire : FR 04500440813
