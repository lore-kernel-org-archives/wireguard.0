Return-Path: <SRS0=t67z=GH=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8843BC433E6
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  4 Jan 2021 12:40:56 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 06DB5207B1
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  4 Jan 2021 12:40:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 06DB5207B1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=outlook.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7043e464;
	Mon, 4 Jan 2021 12:28:07 +0000 (UTC)
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10olkn2102.outbound.protection.outlook.com [40.92.40.102])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 75bf1396
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sun, 3 Jan 2021 05:48:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZypHIMcCcSPqkDOEHPFGQbzRtRN2O9ITJWtUsYLTIpgWy4F1fwVMPNrxZKOPiHLPRbu8/vH77FIeV/HhWePn3ePWytqrZlD5GBycQ/zJ/lVpV4h7txsfsnUPtkFKc46jhCZup0aDhBR6hUwpnOKir6TzvAn4wMTPXSjlBOSHQ7rWSf1z8TdsNURLcEtmc2SqLpZobL/m23fqXpgfI4h467Kosd3/L1PJqil2kDLgkli5IzGKgjpuwa8Qeql4XCZFnFYGMHWvYty/LP5/OEU7yk2MuGeOMMZkIZaBwdxZXPNrOhTDwl5/TV4hSrr6gGvnjUYDX74nKBWgx/GFMF1fmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4I0zROGns8wpXQFXc29+jSWDnAAqRWiMJYQetcrjyYs=;
 b=MwneHMZdE2bwks9oCpn2BlGtiacUAIbdEcwkojXrm5FsFD6nOdwEh9PiwrhBr9aSfljc37yR273gDCr5tHPqYqyymdRV/G3PyQosedj8FWPW1SYR0VcD6KPt1OGJceV231hCP/3jH2uad+YAgXDmEt3rmJh6djD9InMbz5ufCblTxfsUkYOrQiTv1gP8E+/FGcoqjUcm6HmpIFqUuKmtl7XY30EoRi67pedwJd0PK14itGi2dRUZzN+WwHKCAv89mHg5vQ94jQwrZE3KLZlFNq6Mzdp+LrhTOJ4pnQ4zCmpGJApH5M64Lqi8/JuavJQthVimLbMLtl1n6v5KMJEgdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4I0zROGns8wpXQFXc29+jSWDnAAqRWiMJYQetcrjyYs=;
 b=CNXUl67RuugGGu1O8faKNW3hLdaT+OwNJqd/aUt0tNjfTr1kEE/Fb/YTvViGgTrbmYD7VG3Vy4wE1zRjtJBJ//coXVpsY9UgHOd0ymccFRmKBFZUH+KLv+njXpjrEYXDDX1dcgsWjW4f6FUkB+zss1xSafWEwPeOV3Bgi3xt6lLgH+nMeK/7ZKHKzKD378vl9vlFhjbnfP/ir5bTG+jHW9Qdf3V5jmiorO/9IwjVBnUKv9sEm8KH8iFGJQzJ9PztYmZOSDcbPHrjv/CiIAITwNemf2SQE4i2yycX5EtEngAV2ZQsuhNV03i7J87bo4ZNDfG73bky4yWfGlpvVPkJJA==
Received: from DM6NAM10FT050.eop-nam10.prod.protection.outlook.com
 (2a01:111:e400:7e86::49) by
 DM6NAM10HT043.eop-nam10.prod.protection.outlook.com (2a01:111:e400:7e86::303)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.20; Sun, 3 Jan
 2021 05:59:19 +0000
Received: from DM5PR0701MB3670.namprd07.prod.outlook.com
 (2a01:111:e400:7e86::44) by DM6NAM10FT050.mail.protection.outlook.com
 (2a01:111:e400:7e86::116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.20 via Frontend
 Transport; Sun, 3 Jan 2021 05:59:19 +0000
Received: from DM5PR0701MB3670.namprd07.prod.outlook.com
 ([fe80::57b:4d1b:f661:1e16]) by DM5PR0701MB3670.namprd07.prod.outlook.com
 ([fe80::57b:4d1b:f661:1e16%6]) with mapi id 15.20.3721.023; Sun, 3 Jan 2021
 05:59:19 +0000
From: Adam Irr <adam.irr@outlook.com>
To: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
Subject: [PATCH] wg-quick: Android: Use ip link to set MTU
Thread-Topic: [PATCH] wg-quick: Android: Use ip link to set MTU
Thread-Index: AQHW4ZUXA4k87LGvtE2Z1Q8akwoQwQ==
Date: Sun, 3 Jan 2021 05:59:19 +0000
Message-ID: <DM5PR0701MB3670A1B8ADEF9BC7C8E06FEE92D30@DM5PR0701MB3670.namprd07.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-incomingtopheadermarker: OriginalChecksum:274F21C3785BE614CE598155BA0D19083BF81B8233E9760848E5E5CE8BFF51D1;
 UpperCasedChecksum:903791FBA77E2A07B0B3C2410696C43281AF9D7777335F0A348D7AEB0EAF81EA;
 SizeAsReceived:6659; Count:41
x-tmn: [2d3fI9/NYMKuLAjBUFSYJIx+g2SvME7J]
x-ms-publictraffictype: Email
x-incomingheadercount: 41
x-eopattributedmessage: 0
x-ms-office365-filtering-correlation-id: 9af15d3a-c977-4588-7b0a-08d8afacb5f0
x-ms-traffictypediagnostic: DM6NAM10HT043:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: j2PNfk2+FkVz7UgahL4GzrrWFmrw5dA7xu63s4p72WiTaniko3Vp5OqWQysDCV3ZRU1PnGOV5nG6vrKOYoNbKJWI18K5ezF53bu1SFF9X2LOFKW6Xo3j1OxN9tGjJxSR85l/dFt89Zz89erKb6VKWj3ZD8nEK+Gear1M6ayoIthBMgAJxc+6Jz4Xv1FiPW2cO0a9kwfEW/i7XodxJTlrgUzfANUqhdrB+Pb9GHjP+XqDBYCs2YTcfil/f8NFeNBX
x-ms-exchange-antispam-messagedata: 82UvYj0sr7mWaw6OiavMJWk9+tJwClDr5TWmYr7Tyljq1Dc4A0L/j3e5uzx6npLZkXFw6+dZHv2CteF2ZnzuX8mCfFl8GFCYnaHhLSzBQSKMh6PkmCohkwneEsbMBYE8tnfKTADAldQevtGkKHgVLg==
x-ms-exchange-transport-forked: True
Content-Type: multipart/mixed;
 boundary="_002_DM5PR0701MB3670A1B8ADEF9BC7C8E06FEE92D30DM5PR0701MB3670_"
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM10FT050.eop-nam10.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 9af15d3a-c977-4588-7b0a-08d8afacb5f0
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jan 2021 05:59:19.4307 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6NAM10HT043
X-Mailman-Approved-At: Mon, 04 Jan 2021 13:28:05 +0100
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

--_002_DM5PR0701MB3670A1B8ADEF9BC7C8E06FEE92D30DM5PR0701MB3670_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

The ndc command used didn't work on my Nvidia Shield (rooted with a custom-=
built kernel). The ip link command does work. I have only tested this on an=
 Nvidia Shield (Android TV - Version 9.0 Pie).=0A=
=0A=
I couldn't find a lot of documentation on ndc so it's possible my device/ke=
rnel is misconfigured. If you suspect this is the case, let me know.=0A=
=0A=
Signed-off-by: Adam Irr <adam.irr@outlook.com>=0A=
---=0A=
 src/wg-quick/android.c | 4 ++--=0A=
 1 file changed, 2 insertions(+), 2 deletions(-)=0A=
=0A=
diff --git a/src/wg-quick/android.c b/src/wg-quick/android.c=0A=
index 326efa9..941c7b8 100644=0A=
--- a/src/wg-quick/android.c=0A=
+++ b/src/wg-quick/android.c=0A=
@@ -995,7 +995,7 @@ static void set_mtu(const char *iface, unsigned int mtu=
)=0A=
        int endpoint_mtu, next_mtu;=0A=
 =0A=
        if (mtu) {=0A=
-               cndc("interface setmtu %s %u", iface, mtu);=0A=
+               cmd("ip link set dev %s mtu %d", iface, mtu);=0A=
                return;=0A=
        }=0A=
 =0A=
@@ -1016,7 +1016,7 @@ static void set_mtu(const char *iface, unsigned int m=
tu)=0A=
                        endpoint_mtu =3D next_mtu;=0A=
        }=0A=
 =0A=
-       cndc("interface setmtu %s %d", iface, endpoint_mtu - 80);=0A=
+       cmd("ip link set dev %s mtu %d", iface, endpoint_mtu - 80);=0A=
 }=0A=
 =0A=
 static void add_route(const char *iface, unsigned int netid, const char *r=
oute)=0A=
-- =0A=
2.25.1=0A=

--_002_DM5PR0701MB3670A1B8ADEF9BC7C8E06FEE92D30DM5PR0701MB3670_
Content-Type: text/x-patch;
	name="0001-wg-quick-Android-Use-ip-link-to-set-MTU.patch"
Content-Description: 0001-wg-quick-Android-Use-ip-link-to-set-MTU.patch
Content-Disposition: attachment;
	filename="0001-wg-quick-Android-Use-ip-link-to-set-MTU.patch"; size=1058;
	creation-date="Sun, 03 Jan 2021 05:58:49 GMT";
	modification-date="Sun, 03 Jan 2021 05:58:49 GMT"
Content-Transfer-Encoding: base64

RnJvbSAxZmZhNmU2MzE4ZGJlZWFhYWY1NmE5MTZiYmFhNDk5NGRmODliNTk5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBBZGFtIElyciA8YWRhbS5pcnJAb3V0bG9vay5jb20+CkRhdGU6
IFNhdCwgMiBKYW4gMjAyMSAyMTozNjoxMiAtMDgwMApTdWJqZWN0OiBbUEFUQ0hdIHdnLXF1aWNr
OiBBbmRyb2lkOiBVc2UgaXAgbGluayB0byBzZXQgTVRVCgpTaWduZWQtb2ZmLWJ5OiBBZGFtIEly
ciA8YWRhbS5pcnJAb3V0bG9vay5jb20+Ci0tLQogc3JjL3dnLXF1aWNrL2FuZHJvaWQuYyB8IDQg
KystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS9zcmMvd2ctcXVpY2svYW5kcm9pZC5jIGIvc3JjL3dnLXF1aWNrL2FuZHJvaWQu
YwppbmRleCAzMjZlZmE5Li45NDFjN2I4IDEwMDY0NAotLS0gYS9zcmMvd2ctcXVpY2svYW5kcm9p
ZC5jCisrKyBiL3NyYy93Zy1xdWljay9hbmRyb2lkLmMKQEAgLTk5NSw3ICs5OTUsNyBAQCBzdGF0
aWMgdm9pZCBzZXRfbXR1KGNvbnN0IGNoYXIgKmlmYWNlLCB1bnNpZ25lZCBpbnQgbXR1KQogCWlu
dCBlbmRwb2ludF9tdHUsIG5leHRfbXR1OwogCiAJaWYgKG10dSkgewotCQljbmRjKCJpbnRlcmZh
Y2Ugc2V0bXR1ICVzICV1IiwgaWZhY2UsIG10dSk7CisJCWNtZCgiaXAgbGluayBzZXQgZGV2ICVz
IG10dSAlZCIsIGlmYWNlLCBtdHUpOwogCQlyZXR1cm47CiAJfQogCkBAIC0xMDE2LDcgKzEwMTYs
NyBAQCBzdGF0aWMgdm9pZCBzZXRfbXR1KGNvbnN0IGNoYXIgKmlmYWNlLCB1bnNpZ25lZCBpbnQg
bXR1KQogCQkJZW5kcG9pbnRfbXR1ID0gbmV4dF9tdHU7CiAJfQogCi0JY25kYygiaW50ZXJmYWNl
IHNldG10dSAlcyAlZCIsIGlmYWNlLCBlbmRwb2ludF9tdHUgLSA4MCk7CisJY21kKCJpcCBsaW5r
IHNldCBkZXYgJXMgbXR1ICVkIiwgaWZhY2UsIGVuZHBvaW50X210dSAtIDgwKTsKIH0KIAogc3Rh
dGljIHZvaWQgYWRkX3JvdXRlKGNvbnN0IGNoYXIgKmlmYWNlLCB1bnNpZ25lZCBpbnQgbmV0aWQs
IGNvbnN0IGNoYXIgKnJvdXRlKQotLSAKMi4yNS4xCgo=

--_002_DM5PR0701MB3670A1B8ADEF9BC7C8E06FEE92D30DM5PR0701MB3670_--
