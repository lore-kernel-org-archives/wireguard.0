Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C1AF606A31A
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 26 Oct 2026 05:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arconsult.hu header.i=@arconsult.hu header.a=rsa-sha256 header.s=selector1 header.b=UWBPohjt
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 86ad5517;
	Mon, 26 Oct 2026 05:28:44 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazon11023124.outbound.protection.outlook.com [52.101.72.124])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 08e2f6b2
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 11 Oct 2026 19:48:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=asdq5LMmd7JkBIYKCUTBcQBvYRmJbRzwwP/NfOiW06zwur1dFbMr9LBk+/arzLF7d2vGFF8Fm02BXWqydxtz3bvkQT7tMVLg52jNoKknitWMjZaLhdwuGcH++LN77ndG/QoM8jCWEYIqKJiXqLCrkt3fY9+FE4BHh4b0psVubemth4VL3awakdBqp951Uzh/yO+jp40bkhEBvJ39Dm+cCfhYmlg21mELRVbgloRYyv4pOvdHK83TRRsj30mcM4gniINiirF2nf4vakgKQz4VCD48300jl/RjUKSZThqZI2WOtDxv3ANf4qBe+2nO8Ol2W2N8XSOghotHVeUoxN403Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lBg3wG4H1+H+U0/Kng50ghtUsp3R+VMIiwr1fdu4ASU=;
 b=svBE/lZ9UeNld3F1E6pVmmqbtc9Quxr/yG1AA3cnYAKPmlHxB51jUIqmK1pr5dO8tvfaO5W2aXc56uydNgt5Lg3bSrWlfDKfQ0dQDWA62DT2MW6FhtVuXvJnF1HozF07yjiWIo8I5+WWCmeMpHxdZzn8sX7gQ45OCFI8117tnqLU8Pcn5UybvDp3mKkTzxfujfO6uf1hEQpI5Qkp3Sq1LKnA7noFCqkAHmvpFKlIZVgFZL66aNkZUxfh4AIE9avcevKHfBbIbmk9JkFtXuTYPXwLs2r7jCIP7Lpxhsoin6pwnb/mUKeyM39eJtViCtqclMnoff9bjNrRRCKNyBKq2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arconsult.hu; dmarc=pass action=none header.from=arconsult.hu;
 dkim=pass header.d=arconsult.hu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arconsult.hu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lBg3wG4H1+H+U0/Kng50ghtUsp3R+VMIiwr1fdu4ASU=;
 b=UWBPohjt74GMdIHy5wLtTEaU21k97CkJ0MwRd/688C5V1TQfmAP2R95RqJ/0yE9Gfvc2aUKmh47NJbfN4tbAkRJzWGQ6Y6iwcGVtzASU/WizJC3UFl3gruOLbFK7XRA1z0kI5wdKLx+AuOMC/prvInwCqBmI327p7vgfJt+Lw5M=
Received: from AM8PR06MB7441.eurprd06.prod.outlook.com (2603:10a6:20b:366::19)
 by PA4PR06MB7280.eurprd06.prod.outlook.com (2603:10a6:102:f4::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.20; Sun, 11 Oct
 2026 19:48:46 +0000
Received: from AM8PR06MB7441.eurprd06.prod.outlook.com
 ([fe80::cf48:340e:38cf:ee20]) by AM8PR06MB7441.eurprd06.prod.outlook.com
 ([fe80::cf48:340e:38cf:ee20%4]) with mapi id 15.21.0496.018; Sun, 11 Oct 2026
 19:48:46 +0000
From: =?windows-1250?Q?Ard=F3_P=E9ter?= <peter.ardo@arconsult.hu>
To: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
Subject: Re: [wireguard] Reproducible wireguard-go OOM crash on ARMv7 under
 high UDP receive load
Thread-Topic: [wireguard] Reproducible wireguard-go OOM crash on ARMv7 under
 high UDP receive load
Thread-Index: AQHdWbk9VYCBKN0c3kioMD9QvFM3tA==
Date: Sun, 11 Oct 2026 19:48:46 +0000
Message-ID: <AM8PR06MB74410475135BEF9B182EE0F3E6902@AM8PR06MB7441.eurprd06.prod.outlook.com>
Accept-Language: hu-HU, en-US
Content-Language: hu-HU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arconsult.hu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM8PR06MB7441:EE_|PA4PR06MB7280:EE_
x-ms-office365-filtering-correlation-id: 09ef44d4-61d5-445a-7b07-08df27d0a9f7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|6133799003|18002099003|10067099003|11063799006|261009223027099003|38070700021|56012099006|260925021911599003|260925022911599003|260925021311599003;
x-microsoft-antispam-message-info: pL6v5kzm09hW0s8m7kqL2SeFpmh7QV26UlPHwLsrXz+e6uarQwyKxI4GxI49bUPIgPu6bVxJ9l3ubUmWLFRIO5FBSgKxba8tPMiwwMRoQMB5kxVDUQZ6jMRAN/Td42AeP4OqIum8qWuw3fqmKVdoX2KdaIlSlNN3oYmRY4/6ub5F4LUrkW9tvxChkqDoB7XXPsF9zA2dV/mz1iJB+17nXs0YHC2W/c1RotvnIqtxZ+SGCET1MwaUN21Qr05zK40m5kKCQOs5Y8ZHQKcP3pRm9PkajtiDvZBlo1hlOdEiYupSB+upPreXRhea4EGZEswhrHmZfBBNFjKBNVLd2fOARb5xAud0HLgqTTN4Xqag4r7HobOnBiZkbiP8YiIDTV3P5zki4CCUyXfceSDZ1RBDzVcU+G1tx+5ng7Re/o+BIiAzzeqlbQABNPy60y28Q6eUN3/rNbp/FxJhQFoVJ1zFkWFU8C+7fAyeAz4oaZkcfLkqXGXCurF8sSX2b8KXtDn3QXYHtxe5vZGbpV5AnKct7Dm7GwozBFshLbWHWuGL0UsAvZR3wf6VL8pcwzWjTDWxUhUBuVPq0DcLgH7/kxOx3jQ6YWLznyXpDPlYEhMOlugeiUNmueRcao6U5Xn0FMLR7Qtrhizad/wButWtZhTer7hWCf/pMlVRXLyvYpkpulKAztGpHg92zKv5cbak/rBmd1bCTZG6A5xC5SSef9OPzw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM8PR06MB7441.eurprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(6133799003)(18002099003)(10067099003)(11063799006)(261009223027099003)(38070700021)(56012099006)(260925021911599003)(260925022911599003)(260925021311599003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?windows-1250?Q?1gz5R/zaFtD9TKt3YV+TZnmJJaOO240j1dUbIbVcnP5NgQtyqkUIkVQI?=
 =?windows-1250?Q?Z19m7aOED5TxZtNN9QXJarwwkS9niF7+0JjA/+SZEX25LmvLPbUhm6MS?=
 =?windows-1250?Q?8boO8m47Wtyo0+RL/gEmKq8SBeGX9MFZI2FpuFtxdtF2FewL8+FkHcAY?=
 =?windows-1250?Q?MPaW3mdkqArFmfrjYn9iZNDmEBrkIP69FyluKFGD97tF5MIfrQpwKo1n?=
 =?windows-1250?Q?2TahfIxxg86X70KHD2psgYimXAlI7oXWDTQpcngY6W8QvcDr27hhjCzu?=
 =?windows-1250?Q?Ds9JvHxJPdwjV+3lVi3oMUXwWFt6dsJrMugr3rSDGMjAHO9mv03/S3rB?=
 =?windows-1250?Q?kflKi9f2B05yz2s65vXGhAC2Uf2t5qH3WTZqqbaZACx/w7BARY7zAwSJ?=
 =?windows-1250?Q?W3MS/bOpL4BPDtky88SbhGKLPUCmmVCEGPao6SuGLZg7JmTCiztC8KoA?=
 =?windows-1250?Q?TXQB+IlCvgCbleEKcowGD9ghpj43pDziMw4r2K37zzcuu04UcEAfIcgJ?=
 =?windows-1250?Q?NXXTDOkuJyktVEFd39GloqbkpeOWTSxGIokfnhMwimVmath93IL7Uhy8?=
 =?windows-1250?Q?bY31WNhOyNq14vpAj33JWO9+q5tAAT6e3WX6usyBV94VcETxq3c8UdUf?=
 =?windows-1250?Q?17iummSPgh5On3yNlMca9cMoFlEEdQVJGii+GgDCHA5txjQgoF8oDzgr?=
 =?windows-1250?Q?XMB74XH317ixh9m6pLZBXcN0SKmP4Er5AA0aRMWtG8GrKJ72xh6LzJ9D?=
 =?windows-1250?Q?rqd94JE7dZW5LJB3xyRKv+a70p0K+8vgp9rnagIMq24Vrbz5OnBgLiWW?=
 =?windows-1250?Q?Zk207ehLxhAbYSbbH7XdtoB8jlDJCaQgqMjrECq1wjU8Q520LY15g0MC?=
 =?windows-1250?Q?sgQ5H7oQc+sSc6TbcsL1JF7FUVwCiMLkDl1QlCmo7vZB+cTc6J3QUIzP?=
 =?windows-1250?Q?n1EzdRD+ppE2u8A5+vNWcavkHAw3ghXPvenvdMu7Hvx5U16P1/uA8aDi?=
 =?windows-1250?Q?Gof1Pg5K0Vh2VR0zuWnjvwqrNy8knMij38a9j+fk50oBpBlucj2JKiR6?=
 =?windows-1250?Q?dGTwAc8qVtNKs8s9odEkdQh5t3VrnNx5trHIeGKo0o42uiN4NbCFNnT2?=
 =?windows-1250?Q?32SBsJxt3D62F3t7AVVhJpwZNpEnjuXGMbZquIJzBss1XXgtLCNlmL1N?=
 =?windows-1250?Q?nEkqf8fJrL89dgVMtlCgKqcMyz+wJ8afMkcGRjpTUkcibBSdyrcOL1IH?=
 =?windows-1250?Q?E1bAHpcFWt+igWR+xcwVOwRzWElrLVHbj0pjutWrcmgoRNbFpSQWAgP1?=
 =?windows-1250?Q?OZCSVbNSdW4g1j0R34u+g0b9S8h71NRYR1lxvbK2O2Qw0scs9xYiZC8Z?=
 =?windows-1250?Q?kZ36KED7bpEKtOOj2A8vZh+FDHrnIXUoIEGdSNQ4pABjspLvbq/UNyWG?=
 =?windows-1250?Q?ZjnSDRxDOjcEF6drh8b4q2Crovm9gYoj/32nQ9rlYbH9+MGto87RZeWi?=
 =?windows-1250?Q?4trD6IF3s+9PqqUfj1lz7SMhu6JDYPtVlPEIt3u7La9zvonWxvx1LMIT?=
 =?windows-1250?Q?Fw7EQ+Xb1p8yefasoaLptbSJCD5zZlejtwqvkY3TPgPjoI4j6/93CeUh?=
 =?windows-1250?Q?dtGarc/y5PNEubReX/HXJHan7vpkPerrVpD9YosH4Bhe6kXbX3QIXc/5?=
 =?windows-1250?Q?lL/CzW+YgKfj2Oof+pBY6RN4QbsTyh36++bgzXx8svqWpfbl8IOyrVod?=
 =?windows-1250?Q?mAqhKpFho2zfkbZ28Y6jHT7WhgZyVPRMWrV+J4OrzFW7U+Yix8jkwAN8?=
 =?windows-1250?Q?j4rmJiNclOa88TkWQFKxMFEz3qaN+aFkRq5Qt2cenk54kJOLusbjCv7N?=
 =?windows-1250?Q?KAp5r591Sx1WJQ=3D=3D?=
Content-Type: text/plain; charset="windows-1250"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: arconsult.hu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM8PR06MB7441.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09ef44d4-61d5-445a-7b07-08df27d0a9f7
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Oct 2026 19:48:46.7969 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c4eb2d6c-a4b9-411e-a3b7-54ffbdc5a429
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kQqIvorxHXD02K7no23tSJ5YCZOnYfCINnYVRMqEfDuc4UaIX0IkqyaBGPCtdNnvj0WkDsXVxf9H34fYC/1toA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR06MB7280
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
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Additional findings from systematic UDP receive tests:=0A=
=0A=
All tests were performed on the same Synology DS416j (ARMv7, 32-bit, 512 MB=
 RAM) using iperf3 in reverse UDP mode. The tested WireGuard interface was =
restarted between runs.=0A=
=0A=
Results:=0A=
=0A=
50 Mbps: stable, VmSize ~526 MiB=0A=
75 Mbps: stable, VmSize ~527 MiB=0A=
100 Mbps: stable, VmSize ~713 MiB=0A=
125 Mbps: stable, VmSize ~1806 MiB; repeated test stabilized at ~1777 MiB (=
VmRSS ~250 MiB)=0A=
135 Mbps: first run stable for 15 minutes at VmSize ~816 MiB; second run cr=
ashed after a few seconds=0A=
150 Mbps: crashed after 39 seconds, last observed VmSize ~2025 MiB=0A=
200 Mbps: crashed after approximately 7 seconds=0A=
=0A=
All three crashes produced the same Go runtime error, failing to allocate a=
 4 MiB block:=0A=
=0A=
135 Mbps: 2104492032 bytes in use=0A=
150 Mbps: 2108653568 bytes in use=0A=
200 Mbps: 2100297728 bytes in use=0A=
=0A=
In all cases:=0A=
=0A=
runtime: out of memory: cannot allocate 4194304-byte block=0A=
fatal error: out of memory=0A=
=0A=
The crashes occurred despite relatively low UDP packet loss (approximately =
1=962% in the 150 Mbps test).=0A=
=0A=
The repeated failures near 2 GiB suggest a possible 32-bit virtual address =
space limitation rather than exhaustion of physical RAM.=0A=
=0A=
An interesting observation is that identical UDP receive rates can produce =
dramatically different virtual memory usage and stability. At 135 Mbps, one=
 run remained stable at 816 MiB VmSize for 15 minutes, while another crashe=
d within seconds.=0A=
=0A=
This suggests that the failure is not determined solely by the configured U=
DP bitrate.=0A=
=0A=
________________________________________=0A=
Felad=F3: Ard=F3 P=E9ter <peter.ardo@arconsult.hu>=0A=
Elk=FCldve: 2026. okt=F3ber 11., vas=E1rnap, 12:47=0A=
C=EDmzett: wireguard@lists.zx2c4.com <wireguard@lists.zx2c4.com>=0A=
T=E1rgy: [wireguard] Reproducible wireguard-go OOM crash on ARMv7 under hig=
h UDP receive load=0A=
=0A=
Hello,=0A=
=0A=
I would like to report a reproducible out-of-memory crash in wireguard-go o=
n a 32-bit ARM Synology NAS.=0A=
=0A=
ENVIRONMENT=0A=
=0A=
Device: Synology DS416j NAS=0A=
OS: Synology DSM 7.2.1 (build 69057)=0A=
Kernel: Linux 3.10.108=0A=
Architecture: ARMv7 (32-bit)=0A=
Physical RAM: 512 MB=0A=
Swap: 2 GB=0A=
WireGuard implementation: wireguard-go (userspace, no kernel module)=0A=
Go compiler: 1.25.3=0A=
Remote endpoint: Debian 12 VPS=0A=
=0A=
TESTED WIREGUARD-GO REVISIONS=0A=
=0A=
The problem was reproduced with two independently compiled ARMv7 binaries:=
=0A=
=0A=
1. May 2025 revision:=0A=
=A0=A0 ecfc5a8d54462e18e13c72173e2623d16d8e25a0=0A=
=0A=
2. October 2026 revision:=0A=
=A0=A0 2631ce99a06f27120d581611cf125d68bc6aa565=0A=
=0A=
Both binaries exhibit the same fatal out-of-memory failure under high incom=
ing UDP traffic.=0A=
=0A=
The October 2026 binary was cross-compiled using:=0A=
=0A=
CGO_ENABLED=3D0 GOOS=3Dlinux GOARCH=3Darm GOARM=3D7=0A=
=0A=
An Entware-provided wireguard-go binary is also installed on the NAS, but i=
t was not tested for this specific failure.=0A=
=0A=
STEPS TO REPRODUCE=0A=
=0A=
The Synology NAS establishes a WireGuard tunnel to a Debian 12 VPS.=0A=
=0A=
On the NAS, run:=0A=
=0A=
iperf3 -c 10.0.1.1 -u -b 200M -t 20 -R=0A=
=0A=
This generates UDP traffic from the VPS toward the NAS through the WireGuar=
d tunnel.=0A=
=0A=
The wireguard-go process consistently crashes after approximately 7 seconds=
.=0A=
=0A=
The problem was reproduced multiple times.=0A=
=0A=
OBSERVED MEMORY CONSUMPTION=0A=
=0A=
Before the test:=0A=
=0A=
VmRSS: approximately 4 MB=0A=
VmSize: approximately 523 MB=0A=
Threads: 10=0A=
=0A=
During the test, memory consumption increases rapidly:=0A=
=0A=
VmRSS=A0=A0=A0 VmSize=0A=
13 MB=A0=A0=A0 524 MB=0A=
35 MB=A0=A0=A0 524 MB=0A=
49 MB=A0=A0=A0 613 MB=0A=
71 MB=A0=A0=A0 941 MB=0A=
92 MB=A0=A0=A0 1202 MB=0A=
116 MB=A0=A0 1551 MB=0A=
131 MB=A0=A0 1763 MB=0A=
=0A=
Shortly afterward, wireguard-go terminates.=0A=
=0A=
FATAL ERROR=0A=
=0A=
The Go runtime reports:=0A=
=0A=
runtime: out of memory: cannot allocate 4194304-byte block (2100297728 in u=
se)=0A=
fatal error: out of memory=0A=
=0A=
The process exits with code 2, and its WireGuard network interface disappea=
rs.=0A=
=0A=
The kernel log did not show an OOM-killer event.=0A=
=0A=
The NAS also had available physical memory and swap space. A separate memor=
y check showed approximately 233 MB of available RAM and 1660 MB of free sw=
ap.=0A=
=0A=
The process resource limits (Max address space, Max data size, and Max resi=
dent set) were unlimited.=0A=
=0A=
The Linux memory overcommit settings were:=0A=
=0A=
vm.overcommit_memory =3D 0=0A=
vm.overcommit_ratio =3D 50=0A=
=0A=
ADDITIONAL TESTS=0A=
=0A=
- TCP, VPS to NAS: approximately 173 Mbps, completed without crashing.=0A=
- UDP, NAS to VPS, 80 Mbps: approximately 79.7 Mbps received, with 0.13% pa=
cket loss.=0A=
- UDP, VPS to NAS, 200 Mbps: reproducible wireguard-go crash after approxim=
ately 7 seconds.=0A=
- WG_DISABLE_OFFLOAD=3D1: did not prevent the crash.=0A=
- Other wireguard-go instances running on the same NAS remained operational=
.=0A=
=0A=
The crash occurs specifically during sustained high-rate incoming UDP traff=
ic in our tests.=0A=
=0A=
POSSIBLE CAUSE=0A=
=0A=
The Go runtime reports approximately 2 GB of memory in use when allocation =
fails.=0A=
=0A=
Given the 32-bit ARM architecture, this appears consistent with virtual add=
ress space exhaustion.=0A=
=0A=
However, the underlying reason for the rapid memory growth is unclear. It m=
ay involve packet buffering or memory allocation behavior when incoming tra=
ffic exceeds the processing capacity of the device.=0A=
=0A=
We have not established whether this is a memory leak or temporary memory a=
ccumulation under overload.=0A=
=0A=
QUESTIONS=0A=
=0A=
1. Is this a known limitation of wireguard-go on 32-bit ARM systems?=0A=
2. Could incoming UDP packet buffering cause excessive memory allocation wh=
en the device cannot process packets quickly enough?=0A=
3. Would it be possible to limit memory consumption or drop excess packets =
instead of terminating the WireGuard process?=0A=
4. Is there a recommended workaround for memory-constrained 32-bit ARM devi=
ces?=0A=
=0A=
This is potentially important for production use, since a traffic burst cou=
ld terminate the WireGuard tunnel and leave the NAS disconnected.=0A=
=0A=
Thank you for your work on WireGuard and for looking into this issue.=0A=
=0A=
Best regards,=0A=
=0A=
P=E9ter Ard=F3=0A=
Arconsult Kft.=
