Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64364606A31A
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 26 Oct 2026 06:54:20 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 24c48ff0;
	Mon, 26 Oct 2026 05:29:12 +0000 (UTC)
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11021079.outbound.protection.outlook.com [40.107.208.79])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 7edc64ae
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 23 Oct 2026 20:54:29 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=SL9Az+pB+1IjiTJUFUoHuPcAhFNoX6xN3f4Glz12UPx6assbRzG24EMZ6bmJGs1eHntLD+olspF/5vQNqs3Ow8Hog37hBYckLrdzWbJPnBcs0qb8ML/nH+DUXb4IDpVoJ9u4/p8MOcUxliCylLu+ZThAxucLs34BaPLWR2/yamimFpIB2i+JTLdtBnBtcHBhp9r6AAtCBBmbCXEuetiNL169vzqStl/k+JXjOj0dDr38+xaNgK7Xedq5+5H9s5jtr8kTJAASmVLOmxv355Y24OTYCfKgQ/jOH64omC4z9Dx/DKtNU3i3fiYpytX8/6/jTynGtfmbhS22OHmJwuxyIQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oFwL0yXIlzrNjnHp7BWXq7+8m5OjwbI/1CrnOkq1O8s=;
 b=Spt1trithsfmmlUUjO+llvCaWPjjV3GR+Ml1Ex9T3QOvyh2b1la6gJHw4xtQXMh4Mh3P1sm475HREG0MqHyt+qpZQnZ5qEqu8d/Gj5OBWmsTvck7wHjAL6cUvHLIrh6s3FXNIFShGjCZG/PAIVNLSF7fIlcMNU/D4Ht5T6AHhop4bIMfuUMuKMkNe+4T1KoXYTunR6vx9g0GjM3s0q7bYLcCLffP0W1gs22I1bngl+ddVjqbAp7V8jI4NUhlILgr4VRIZITCPaO/MBXtDVMCa/fAyA973h6X+3QQXzjw2VqiwJwx7YqCVm8xHQIFpM5sqQJqNFTdA4+Ma4cv7gqdRA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=softfail (sender ip
 is 198.154.181.226) smtp.rcpttodomain=lists.zx2c4.com
 smtp.mailfrom=nsyncdata.net; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=nsyncdata.net; dkim=fail (no key for signature)
 header.d=nsyncdatanet.onmicrosoft.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=nsyncdata.net] dkim=[1,1,header.d=nsyncdata.net]
 dmarc=[1,1,header.from=nsyncdata.net])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nsyncdatanet.onmicrosoft.com; s=selector1-nsyncdatanet-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oFwL0yXIlzrNjnHp7BWXq7+8m5OjwbI/1CrnOkq1O8s=;
 b=Fb1W0Ei0PTENQDdj/uizm1HI6EVEUsU05kkNjUw/RfE8XHWVBcwwTOy4rwXTnzBkyFcVI5K3vrUtFeovoCA3zic96Hu+xp7DS+2/XztEMPsgc87ZggZkq9QUQVfaygNbeQlMRFMsTwI84FuE7ChrEk5e/CpfQWfddkwLpaBt5mw=
Received: from SJ0PR05CA0033.namprd05.prod.outlook.com (2603:10b6:a03:33f::8)
 by SA1PR22MB4334.namprd22.prod.outlook.com (2603:10b6:806:375::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Fri, 23 Oct
 2026 20:54:23 +0000
Received: from CO1PEPF00012E82.namprd03.prod.outlook.com
 (2603:10b6:a03:33f:cafe::13) by SJ0PR05CA0033.outlook.office365.com
 (2603:10b6:a03:33f::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.4 via Frontend Transport; Fri, 23
 Oct 2026 20:54:23 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 198.154.181.226)
 smtp.mailfrom=nsyncdata.net; dkim=fail (no key for
 signature) header.d=nsyncdatanet.onmicrosoft.com;dmarc=fail action=none
 header.from=nsyncdata.net;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 nsyncdata.net discourages use of 198.154.181.226 as permitted sender)
Received: from mfod-usw2.prod.hydra.sophos.com (198.154.181.226) by
 CO1PEPF00012E82.mail.protection.outlook.com (10.167.249.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Fri, 23 Oct 2026 20:54:22 +0000
Received: from localhost (ip-172-17-2-155.us-west-2.compute.internal
 [127.0.0.1])
 by mfod-usw2.prod.hydra.sophos.com (Postfix) with ESMTP id 4jBFct34YfzWjck
 for <wireguard@lists.zx2c4.com>; Fri, 23 Oct 2026 20:54:22 +0000 (UTC)
X-Sophos-Product-Type: Mailflow
X-Sophos-Email-ID: ee0aa89bf74b4039bf5f0eb29318abb1
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11023077.outbound.protection.outlook.com
 [40.107.201.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mf-outbound-us-west-2.prod.hydra.sophos.com (Postfix) with ESMTPS id
 4jBFcs1V8szvPrk
 for <wireguard@lists.zx2c4.com>; Fri, 23 Oct 2026 20:54:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LCx+zf9HGWmXKfDOxnh9kmln34Q4L84XyP+c9lpGpv/VC95zWruF7fG6fEvbk1QGfLVh8nFbjrHWzTO2Dmd9GN2WZmBN9BTHUl1Lyl+XF5NPf2UNx8QYndQhnObWoJsb1qnMsL//a366u5VCyua8jnjYViZrUmrZslN/r5zvq6WRzgqNRdvYMfTbmqk0WwNRnCwSNZj/fMtrZ8+LDgwNiAO+DHjV4+9akInMbPbbKK6Iw4ujaI8BCg+m4X+dp9tYv+Ns/gfgaAa/eIFYegGa7tUD2CF5kCU/WsOniVl/LuJJExP04NbBOmUcqOgq2l/yTUnpMeZSxQ4ANYKEQpv5jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oFwL0yXIlzrNjnHp7BWXq7+8m5OjwbI/1CrnOkq1O8s=;
 b=QMJ2Bw3ecGR9kZJ8WZJwJCuvqgkiMAuIOWbrr1NraREw2O1ymerAHS/Kuz76+YUegLNuZO0TdC/J75JvmQUUsW4N74YspLjByyUnsUhyVXZhT3WY+Bap/XctsC8R+1xIdE+oa3FmTGdscrsQY8EitHdzJaOuDJ9CH2k0Kc5Z782s3bC3X/HsXSVxfNSVF2QIWcPZissaBRkx7VzsNNxmF7SdKOPy2cf/qmVMN/5OgDktFyyY0qWCpEe0Fkrpr2BfrjCp14wgDoxvZxnuQIC0H4WiJrhbIEu71xXGuyWMUWbHfjyWvanbcSGin2UqvTizKiokSx+4r0GUEoJZfyrR8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nsyncdata.net; dmarc=pass action=none
 header.from=nsyncdata.net; dkim=pass header.d=nsyncdata.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nsyncdatanet.onmicrosoft.com; s=selector1-nsyncdatanet-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oFwL0yXIlzrNjnHp7BWXq7+8m5OjwbI/1CrnOkq1O8s=;
 b=Fb1W0Ei0PTENQDdj/uizm1HI6EVEUsU05kkNjUw/RfE8XHWVBcwwTOy4rwXTnzBkyFcVI5K3vrUtFeovoCA3zic96Hu+xp7DS+2/XztEMPsgc87ZggZkq9QUQVfaygNbeQlMRFMsTwI84FuE7ChrEk5e/CpfQWfddkwLpaBt5mw=
Received: from LV8PR22MB5167.namprd22.prod.outlook.com (2603:10b6:408:1ca::22)
 by SJ2PR22MB5095.namprd22.prod.outlook.com (2603:10b6:a03:594::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.19; Fri, 23 Oct
 2026 20:54:19 +0000
Received: from LV8PR22MB5167.namprd22.prod.outlook.com
 ([fe80::25d7:3900:44e8:7ea3]) by LV8PR22MB5167.namprd22.prod.outlook.com
 ([fe80::25d7:3900:44e8:7ea3%3]) with mapi id 15.21.0546.017; Fri, 23 Oct 2026
 20:54:19 +0000
From: Keith Shook <keith@nsyncdata.net>
To: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
CC: David Stills <dstills@nsyncdata.net>, Keith Shook <keith@nsyncdata.net>
Subject: Feature request: wireguard-windows option to protect tunnel private
 keys from local admins
Thread-Topic: Feature request: wireguard-windows option to protect tunnel
 private keys from local admins
Thread-Index: AQHdYzCsTrWZ9YoRZ0KHY1bHDdQ04A==
Date: Fri, 23 Oct 2026 20:54:19 +0000
Message-ID: <LV8PR22MB516700F87F264EFAAF885D9EA9642@LV8PR22MB5167.namprd22.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: mx.microsoft.com 1; dkim=none (message not
 signed) header.d=none;dmarc=none action=none header.from=nsyncdata.net;
x-ms-traffictypediagnostic: LV8PR22MB5167:EE_|SJ2PR22MB5095:EE_|CO1PEPF00012E82:EE_|SA1PR22MB4334:EE_
X-MS-Office365-Filtering-Correlation-Id: ad6c3383-c80b-449a-a899-08df3147d10d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|38070700021|56012099006|18002099003|6133799003|10067099003|261022113327099003|261022105027099003|261022075727099003|261021121427099003;
X-Microsoft-Antispam-Message-Info-Original: epWd9uPki3hsaZDZNamZTu0tpMqrTOxa0d9VY56AnklFXE156HIGccAxgsForZ5yrKJkd8ofIyGWAJJU6cq2IdYYxHz8yEtHBDDy5r9eaRwFR7YEopGfB3vgS/D3ARU6F/MVZofKuH1xhfHlRczFk+ccUWhZyxpwZphl2WbwoHWKVYVC6cWdfu65QSx8bB44TFleikBNqH/B1AUDYdhOsDp+Jsiv1knq1mjCv8qB+iY74eUtMdiCwTytdgF13IyR1kUFJJRh4jkSuNgnrqUcUIQFaWYnyU9fNgsHKCfZGme7OJjHiDeE3iEYeVPZa3bl43hn6KaECiMf3uWWWZpPQguFO6CcpZLo4ODCZbENnoAb1m0P9vf/6lBLmMq4ZlBx3AnbeUgwsOR/ouysBGDKiO4qXtawhszSeSRZqjSueuYmU0JebmuZZP+wbFKHfUfQWm0mPFCj4in16swMMa5hmZCq6lhPgdp1ZH6GNTuMz/DC7sYbPaIdRxYN68ZITorQ0DBUgjF6Ga/4/T1GCti/d8OnFG3i8CF5CzbzYwy10yRF37JfzG033WXeFlULC3nAcTv7eXnz9KUO72e5BTLQa3nTDVXAfUqlM/M/Sle6EcxfR9rCNpFh7s5zbUDC3YGI76d5KC4a2WtWkA7g1Y8qsXhW3pCyaz7nxfB9VOymDijJZC/YiQSAcrLWdMsZuzDEILvsR4NUw6YfMiEvVS/R+UPsJT2YtLLoKh7UmWQ+c6o=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:LV8PR22MB5167.namprd22.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(38070700021)(56012099006)(18002099003)(6133799003)(10067099003)(261022113327099003)(261022105027099003)(261022075727099003)(261021121427099003);
 DIR:OUT; SFP:1102; 
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: au5zY/dphQrPOROFER+mR6yFrpJWAQinVbNgpBCfsPJGxy4IajEcxD+3m1rNqNJ1ZbhRwT7sReSUo+z2fn1QUA8KJn65MGvfHcxSSXJc7bXHi9smo4BeYa7TvNBDB4RrxsScge7f+Q6q+3fPoA7oNRfXLP+Vw43vOmbwH7trRWkzp0AqT+P5ArsT+2D6pqNdjQlWOL+58TA3hGSrXzbHoTNRC8XGUSi3S/Ohv9jR/AbAFOVV9PggjE8/uQLIt95oka7LvjMdKJ3mV6uPKF2mPxNaMAm6ATRjAw1pd1Oitl2vvHt5M+QvkFb2p6noSyorI5LrS+i1h0q34y9MsjJI6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR22MB5095
X-Sophos-Mailflow-Processing-Id: 262caa6901584d078d7576e2e12b57e9
X-Lased-Hits: ARCAUTH_PASSED 0.000000, BODYTEXTP_SIZE_3000_LESS 0.000000,
 BODY_SIZE_1300_1399 0.000000, BODY_SIZE_2000_LESS 0.000000,
 BODY_SIZE_5000_LESS 0.000000, BODY_SIZE_7000_LESS 0.000000,
 CTE_QUOTED_PRINTABLE 0.000000, DKIM_SIGNATURE 0.000000, HTML_00_01
 0.050000, HTML_00_10 0.050000, LEGITIMATE_SIGNS 0.000000, MULTIPLE_RCPTS
 0.100000, MULTIPLE_REAL_RCPTS 0.000000, NO_CTA_FOUND 0.000000,
 NO_CTA_URI_FOUND 0.000000, NO_FUR_HEADER 0.000000, NO_URI_FOUND 0.000000,
 NO_URI_HTTPS 0.000000, OUTBOUND 0.000000, OUTBOUND_SOPHOS 0.000000,
 SUPERLONG_LINE 0.050000, SUSP_DH_NEG 0.000000, TO_IN_SUBJECT 0.500000,
 TO_NAME_IS_ADDY 0.000000, __ARCAUTH_DKIM_PASSED 0.000000,
 __ARCAUTH_DMARC_PASSED 0.000000, __ARCAUTH_PASSED 0.000000,
 __ARC_SEAL_MICROSOFT 0.000000, __ARC_SIGNATURE_MICROSOFT 0.000000,
 __BEC_SUBJ_KEYWORD 0.000000, __BODY_NO_MAILTO 0.000000, __BULK_NEGATE
 0.000000, __CC_NAME 0.000000, __CC_NAME_DIFF_FROM_ACC 0.000000,
 __CC_REAL_NAMES 0.000000, __CT 0.000000, __CTE 0.000000,
 __CTYPE_CHARSET_QUOTED 0.000000, __CT_TEXT_PLAIN 0.000000, __DQ_NEG_DOMAIN
 0.000000, __DQ_NEG_HEUR 0.000000, __DQ_NEG_IP 0.000000,
 __FROM_DOMAIN_IN_ANY_CC1 0.000000, __FROM_DOMAIN_IN_RCPT 0.000000,
 __FROM_DOMAIN_NOT_IN_BODY 0.000000, __FUR_RDNS_SOPHOS 0.000000,
 __HAS_CC_HDR 0.000000, __HAS_FROM 0.000000, __HAS_MSGID 0.000000,
 __HAS_X_FF_ASR 0.000000, __HAS_X_FF_ASR_CAT 0.000000, __HAS_X_FF_ASR_SFV
 0.000000, __IMP_FROM_MY_ORG 0.000000, __INT_PROD_COMP 0.000000,
 __JSON_HAS_SCHEMA_VERSION 0.000000, __JSON_HAS_TENANT_DOMAINS 0.000000,
 __JSON_HAS_TENANT_ID 0.000000, __JSON_HAS_TENANT_SCHEMA_VERSION 0.000000,
 __JSON_HAS_TRACKING_ID 0.000000, __MIME_BOUND_CHARSET 0.000000,
 __MIME_TEXT_ONLY 0.000000, __MIME_TEXT_P 0.000000, __MIME_TEXT_P1 0.000000,
 __MIME_VERSION 0.000000, __MSGID_32_64_CAPS 0.000000,
 __MULTIPLE_RCPTS_CC_X2 0.000000, __NO_HTML_TAG_RAW 0.000000,
 __OUTBOUND_SOPHOS_FUR 0.000000, __OUTBOUND_SOPHOS_FUR_IP 0.000000,
 __OUTBOUND_SOPHOS_FUR_RDNS 0.000000, __PHISH_SPEAR_SUBJ_TEAM 0.000000,
 __PRODUCT_TYPE_MAILFLOW 0.000000, __SANE_MSGID 0.000000, __SCAN_D_NEG2
 0.000000, __SCAN_D_NEG_HEUR2 0.000000, __SL_HEAVY 0.000000,
 __SUBJ_ALPHA_END 0.000000, __SUBJ_ALPHA_NEGATE 0.000000, __TO_IN_SUBJECT2
 0.000000, __TO_MALFORMED_2 0.000000, __TO_NAME 0.000000, __TO_NO_NAME
 0.000000, __URI_NO_MAILTO 0.000000, __X_FF_ASR_SCL_NSP 0.000000,
 __X_FF_ASR_SFV_NSPM 0.000000
X-Sophos-Email: [us-west-2] Antispam-Engine: 6.0.3, AntispamData:
 2026.10.23.75719
X-Lased-Spam: NonSpam
X-Lased-Spamprobability: 0.106691
X-Lased-Impersonation: False
X-Sophos-MH-Mail-Info-Key: NGpCRmN0MzRZZnpXamNrLTE3Mi4xNy4yLjE1NQ==
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: CO1PEPF00012E82.namprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 11f09471-8c94-4c57-6055-08df3147cefb
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|36860700016|82310400026|35042699022|14060799003|1800799024|56012099006|18002099003|6133799003|10067099003|261021121427099003|261022113327099003|261022105027099003|261022075727099003;
X-Microsoft-Antispam-Message-Info: 0BiJvbnArhyWa73ScNbATl06mfq0GRjeYMOwaz9+Kb3EDETj6wO7ANELTvZphDeccAmsb+UEekqftsFzOrWrOwUtKdHOPxN9rpdVxg/P/37dbzd2FSxZVd9MQOsHLR7Y3f+0pY8aRucghsqvm91yPvI4odPe06BqOpW24SIOvqCONq8eXkleVBPP5sNRjRRbSQBzVSPQ0aXV4/jsJDdYPBwlb1OSTXgGR+6WHUcVVa6hCnE+g3nzxOu+4IBmkvceMv7TotAJ08KEz3mYL8wLLykXxcF0DG1/M/T9F/BnhyP9GFK/V5rs7kIc2ykpg0b3KePBwNiJMAReEuO8TAHu/ZF73Lg1HqPaYROhmzc6T5BQVsHVKsvMw/vWzW+KWPcZ3epaiaZ8uDEmkoXC/9cRF80u8loKSUmlKY5/GFXaxSXr7KIuad09lQXGpyeoiPsREsmZ+k2z6yj3mVPwTZwlqZgPaKu7qCLYopEiT+HkWyqpWRpYjQj/KyCQrV6ISzCsXBz44t5LP5G3Y2O+H8rjW3tDjpPJXTNPTUb2SlSYHEIseJfK/nJ+JvPeEmAfBJljuIK8qYdsFwRMwII3Decaf1vcAlOwREN+k5ZYNb8rqRX9PbCmEMZqmYBxYDGOVzSVx6FAHVp7jI3/BjOJGI7YHh8JIzg9PRANQ6yJSTvJchImDFlYJ/Ont3mL9rHOWXq/xsQidJG8h0bXPeVqZ5Q9kg==
X-Forefront-Antispam-Report: CIP:198.154.181.226; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mfod-usw2.prod.hydra.sophos.com;
 PTR:mfod-usw2.prod.hydra.sophos.com; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(36860700016)(82310400026)(35042699022)(14060799003)(1800799024)(56012099006)(18002099003)(6133799003)(10067099003)(261021121427099003)(261022113327099003)(261022105027099003)(261022075727099003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: PTXEejVfKMTMfLWlR94u29jTenc2KmzPzx6oXkTJEy0o8bVlinCqWun+5dxQgcUiHuk6ghHxU1hYjh1lmtEZs0SNYhYOv++341wKlS9OQPCsY7u5MddJeKfJ1WZCWELZLoPfv+Mb/BC35nvf9bT2QNrPUi/l79lLZzu5XIV2MwX7rFSdrhV/5luvXAe2sQ35kmCV96IYV1XbhIKJqrLBQC/5o0gourA1toqNim7/9dFSjDsEsLZY0QRE0cKjUObWOfwmcPmgH4Y8AScibX7rgdlVSMffPjN0DsrjgPxxoqIXZHO1DRTFgivs8RaGAEe7GGjYK2pSR762gDZyeFaJ6fgz38MnZNFpOufq5m04Pk+/OTFtg9+HZuD9ZFEj3noi03k/wjE3sqRwF+ap4J0xgqvQWyjYbrZ4wuIjHx7sAZSuU90bUmtlVQ6ze2Z8aoG3
X-OriginatorOrg: nsyncdata.net
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2026 20:54:22.8831 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ad6c3383-c80b-449a-a899-08df3147d10d
X-MS-Exchange-CrossTenant-Id: 7d5fd979-777c-49bb-b643-8647af2bd9a8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=7d5fd979-777c-49bb-b643-8647af2bd9a8; Ip=[198.154.181.226];
 Helo=[mfod-usw2.prod.hydra.sophos.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF00012E82.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR22MB4334
X-Mailman-Approved-At: Mon, 26 Oct 2026 05:28:33 +0000
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.30rc1
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_PASS,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi all,=0A=
=0A=
I run a small MSP and deploy WireGuard for Windows to client staff, includi=
ng on home PCs where the user is a local administrator. Today any local adm=
in can open the tunnel editor and see or copy the private key, which then w=
orks from any other machine.=0A=
=0A=
I know LimitedOperatorUI plus Network Configuration Operators hides keys fo=
r standard users, and that an admin can always ultimately get at DPAPI-prot=
ected data. I'm not asking for perfect protection against a determined admi=
n, just something that raises the bar for ordinary users:=0A=
=0A=
1. A policy (registry or MSI property) that hides private keys and disables=
 Edit/Export in the UI even for admins, unless the policy is removed.=0A=
2. Optional support for keys stored in a non-exportable form, e.g. the TPM =
or Windows CNG with non-exportable keys, so the key can't simply be copied =
to another machine.=0A=
3. A simple "regenerate keypair" action for managed deployments (similar to=
 the May 2020 thread "Regenerate keypair option for desktop clients").=0A=
=0A=
I also saw the Sept 2025 report that limited-operator mode misbehaves after=
 sleep; a fix there would help too.=0A=
=0A=
Is any of this on the roadmap, or would patches along these lines be welcom=
e?=0A=
=0A=
Thanks for WireGuard.=0A=
=0A=
Keith Shook=0A=
N-Sync Computer Services=
