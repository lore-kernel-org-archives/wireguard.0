Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0668606A31A
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 26 Oct 2026 05:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arconsult.hu header.i=@arconsult.hu header.a=rsa-sha256 header.s=selector1 header.b=jUAN9ABW
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id c00ea99d;
	Mon, 26 Oct 2026 05:28:43 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazon11020111.outbound.protection.outlook.com
 [52.101.84.111])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 84753315
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 11 Oct 2026 10:47:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rtqLHQJ7tvoXEN78gpgNMR4NkUpZp+8VycFpoOyaFaSUqiJx8PDSPCf6SbQXfiOAtb6FJ+rY5vkbthAW7rDAiDsr0LBQQe/wM3NTyHjTB4HYyl2CXEkW8PVYmb+g88SY4RRVKMQHOu1SS/tMbfPrj90PYZ07ev1BM7bYsobWWlDDK3+Q4BiKE/+wFyG7iQZHQd4KSRVkeFs8OgyyCPX1gPQ4KJ4ylBpd8zRMzNpHvf16CJt8vUN6dl1Bl3iuN1qbtaa8g5nrzqCeS4xW0nmWFPkQP3EzEJOL5Dwlh9MJVK6x1kMaWVBljDL2zTiWzUAafUhbL0TDfOBSIzAFIZajsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F77JZlp3uP+gwC3VsCz4GIaXstZ8DInNuqlslP9rUfM=;
 b=OB2JR4GfEl5dOiribelyDFLjwx8m4ttblukiOwbczf9OW6JlTEET0oh43bPRYgpIGpSfy5qBL3+IeITskFrmxszrOI3r1AtF2fUhTqpnZ3cwNSeIUfkb1Pzk5rWKQoz5noEKLEqCkkkL475n50T3/qZw+C684htymj20XxCUHUH0k7QOgnwKClo5Jxti8nEqV0zX8KpLU7o2cLWJzZig8Oa+DPZvdLp5sQomXe3ur/1sDqigvf/jp9g7P7lfI3ipiAWZMq74gowrVuBD8etkwa/K4hcs2uLpRz8xWdtSYLHBbKYhkvU2pUjyI818J5rZ8wNu94qmnilfuvtBxF5pug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arconsult.hu; dmarc=pass action=none header.from=arconsult.hu;
 dkim=pass header.d=arconsult.hu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arconsult.hu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F77JZlp3uP+gwC3VsCz4GIaXstZ8DInNuqlslP9rUfM=;
 b=jUAN9ABWSce1W8pBgv3GLI36AZVMvPjGi4DWgMzX8wdDlkHVwmMglWAsrijFI/FovZhyZPO0zJXs9akCzoPkBpe/CnhbuV44Hx07C6uIVxeie2hL0d0B54Lspxu+V10IBDHHFU0UgBgLmgLyvNOJcbSraPCuDEYpdwNgHGUikyk=
Received: from AM8PR06MB7441.eurprd06.prod.outlook.com (2603:10a6:20b:366::19)
 by AM9PR06MB8268.eurprd06.prod.outlook.com (2603:10a6:20b:433::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.20; Sun, 11 Oct
 2026 10:47:38 +0000
Received: from AM8PR06MB7441.eurprd06.prod.outlook.com
 ([fe80::cf48:340e:38cf:ee20]) by AM8PR06MB7441.eurprd06.prod.outlook.com
 ([fe80::cf48:340e:38cf:ee20%4]) with mapi id 15.21.0496.015; Sun, 11 Oct 2026
 10:47:38 +0000
From: =?iso-8859-2?Q?Ard=F3_P=E9ter?= <peter.ardo@arconsult.hu>
To: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
Subject: [wireguard] Reproducible wireguard-go OOM crash on ARMv7 under high
 UDP receive load
Thread-Topic: [wireguard] Reproducible wireguard-go OOM crash on ARMv7 under
 high UDP receive load
Thread-Index: AQHdWWz67cwYaX8SbUeDP6y1c8kYmQ==
Date: Sun, 11 Oct 2026 10:47:38 +0000
Message-ID: <AM8PR06MB7441F518B81827084BA8B810E6902@AM8PR06MB7441.eurprd06.prod.outlook.com>
Accept-Language: hu-HU, en-US
Content-Language: hu-HU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arconsult.hu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM8PR06MB7441:EE_|AM9PR06MB8268:EE_
x-ms-office365-filtering-correlation-id: 1dd96c86-de97-4a3b-d496-08df27851162
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|23010399003|38070700021|56012099006|11063799006|261009223027099003|260925021911599003|260925021311599003|260925022911599003|10067099003|18002099003|6133799003;
x-microsoft-antispam-message-info: LtnScy6uJps3Y8b+OlHGA9vZlPnraFmTp+hK27haTJtF4qfwmC3j2+V9hPYXMvfgFS97Bbfr6xCLOkMeeV+NjqgzSEkNKs6/asPvSbOQDR+OL0/JsHJTdwzMf8AuxgyhB6tOXr0xekmHRq9YUh6as3JqA87PfCQ9A2KOei2MzQv6il0G2C/BJR4m2mfYNxFLmLdY7psMyFZnsk60nZmJGlwbCBmFLgPn1YlKz7tY4rjDLH8Fx/0f413OW+NRptDXPyCvpTSzPZFXJ9BbH1gqRxDGYL641/bykvp+MYY/jf8qHztdxPKrYR1UYai04tCLgCMnZoU6OLlcOr/GUMpcv2qQs4ARHLJ0n14igcruVJwZyTqPh2PbWohNBlJ2GiTUEso0KGQT8b+tgmHkD2+vFTaRo2ag+fwBnMu2aDg+rUF9oCHqLBuO3IWPWjoZGef5Ti4SRjNs3ePHvDx6eH55Sdf+eiWpEB7re0nYZ1oqEzdPHW+L/LLWqdze03VA9yIoEeXq+Lh64YkSgxc+0kzgErGC0JIMZymyAs2uHl/Y3yINSmDjZxcoJCN+ZLNF7BIU1ep72q+gc9xxoR2cNOzgwh4l7DeXXjtGYrbGA4Unh38fHSuC5M8zQT62PVr4ukDzhkEkwS/049+OxRaGXcgp7qAPQ/jqYzkB+goT/54r/a7N4xSkkPHIyqmHnfr48ENTx/GSUNrQkHw30Y6Y4tLzXg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM8PR06MB7441.eurprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(38070700021)(56012099006)(11063799006)(261009223027099003)(260925021911599003)(260925021311599003)(260925022911599003)(10067099003)(18002099003)(6133799003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-2?Q?kKkkZrMvRHlJIfGWtY/r8NllBIeOqOvOsvkGeeX0WP4DEpeWFRN9G1c6YG?=
 =?iso-8859-2?Q?DcCQJQFqv2sboO8sxI5BvHtsyC9RGREQN/ekFHK0ByZ4sChf4I6r2I8zrI?=
 =?iso-8859-2?Q?bI4LtXi3y1ZnaDYKmu3IZFtp/wcZ9zBiegMFAbzOJ8caMVLo7rdLj1l1PP?=
 =?iso-8859-2?Q?GGyi2cOl06S5jpxa0kEaBCHrJBHy7undRDJbkrYEzeDEIXqQ5qIVabImu9?=
 =?iso-8859-2?Q?GLTO9p+eKjCa+sMVfjy6+shNsfUQpvJOhI74FpK1szd5woo2g9mdbg2j6R?=
 =?iso-8859-2?Q?3cjPrA2IcYhj7j92WVvajO2K2zb3Rz5nlt2ZAXOPAK81I6R9KBFgIofVVA?=
 =?iso-8859-2?Q?FfbWQC2mEDLrlm2S83mhShnCK1tsYXaf6LzvizLuaqt3uHNcOkAJE6/neZ?=
 =?iso-8859-2?Q?wREXcRaM4DswxCRJUCCPtnS6GYUcGyBADzCcwbPZX3e20cxs3dcRXFybJV?=
 =?iso-8859-2?Q?3NBVC+qIDhA1XfN6fJvimagn4MluTaGenFlWUAWnKmdB3sGO/W3mve/smx?=
 =?iso-8859-2?Q?oJb7XreXf9ImF+rYJN758nuu7GBWJhgZbWM3wmogDBu7ZQR6eC4IB977RG?=
 =?iso-8859-2?Q?XrA+8lN5ozICFLG9ApGVeWma4YX/99yeTEMxKqlg4MLbifLXIWMsCFF4v0?=
 =?iso-8859-2?Q?jI8043Aa8QCn4AVIMDLWt3RNuiFmM6J4NiuXb2IULN25DevpfQgiNXiS1k?=
 =?iso-8859-2?Q?9SiMUU8w4fdrYxX9955935Nfmt2lJX4mF9EHyrK0UfSy5TIo2rcBsKw0SY?=
 =?iso-8859-2?Q?hUYUWC3Ihh6o2LXx/AXISoa1Q6MOmvhmoCBrr56qcpZD4osEQix0vrBmxz?=
 =?iso-8859-2?Q?Yf8YShsKPZ1m2yLCcunK6E7P7oNhtFtJH2un0KQOs7IKIrOxU4AET3qqQM?=
 =?iso-8859-2?Q?z2EMYL1FLd91pNxUjzbJ7tnEFcALeYzTHr4M2MqagFP0iXVk5CUwGyRot9?=
 =?iso-8859-2?Q?8L6HJtpuLyi494Cp9GSlcNoh6wvnHRiYFDqK4P400TEo8M0PSkrjwi7YiB?=
 =?iso-8859-2?Q?/9X2wvOEp4nklOc6VmF05kPut0U02FS8klX2m7aDTMQ1Qzl2RJ9oZ29Rvr?=
 =?iso-8859-2?Q?dxP5NsX8r+uVDpLb4idV6Vnmzh8LT1iQmD8OfneuQxg52RcLz0D7l7aspb?=
 =?iso-8859-2?Q?qZ6vjxL80mxzyEn2JPR9KFwEY2oNQYNxiSwIHSPfHDV4MNiN+R2z2I99ee?=
 =?iso-8859-2?Q?J7gmOsv0kvpryabMLjARzsHKt2XOt1X848a3mDUtRd76021qz5Jm2bJv2e?=
 =?iso-8859-2?Q?Hcs2V2+DMwLSHJc5jxxHJ/gbBiYUpbJrudRSwHu+/HJj6eh6QQYyCcCYyv?=
 =?iso-8859-2?Q?0q31vD0Uq9ak1cKvqoXtl32NQtkFqUFQ/npW5AHTmCY8SWRtYv6VktKY9M?=
 =?iso-8859-2?Q?RzwPB5of1cBkoY+ckxBwKTXUnViPsrtATpEmJRVEynm7I/gigDW8l0wBLp?=
 =?iso-8859-2?Q?lHqrD7ULHQvfvVQpyjHQeCHL6e/GnWzRyk6V/Nv3fucVg4yBLkSR/D5eIP?=
 =?iso-8859-2?Q?RcdJyvk0JRyRVCOtpI8sg1866XckDBI4W1yY2YCzGQagnRrTYFjTbwHjCw?=
 =?iso-8859-2?Q?+HpmOzX2etdxRhtwyRqKBIysu0hBiun0Fb8ZLJkLnqGka3UPunBZVzHwjp?=
 =?iso-8859-2?Q?66irFKjoYWD3/8E6oF3sva83R3pMdp0R3eZnk7xEGRRWLYel3fOAm40sU4?=
 =?iso-8859-2?Q?rxpFNFkB590ZLVH6kiRLM8gN5y62hRZxJV8Q+YjiOxWFsCQjtRjrVOhegh?=
 =?iso-8859-2?Q?iCYAyiYOvfJRO1sx+0JadicYJx78sct3Ajyl+thpkrw7iojAzbDx3V/Yb0?=
 =?iso-8859-2?Q?837rUNa7/Q=3D=3D?=
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: arconsult.hu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM8PR06MB7441.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1dd96c86-de97-4a3b-d496-08df27851162
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Oct 2026 10:47:38.5288 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c4eb2d6c-a4b9-411e-a3b7-54ffbdc5a429
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wLim6RTBVc3y76/1s1RKsQS6iBMs8/e66z+XeDkmSGCds7gATfAHLjDHgKLEIQKIO/b6GfvpJ+FpNGWK4E2INw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR06MB8268
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

Hello,

I would like to report a reproducible out-of-memory crash in wireguard-go o=
n a 32-bit ARM Synology NAS.

ENVIRONMENT

Device: Synology DS416j NAS
OS: Synology DSM 7.2.1 (build 69057)
Kernel: Linux 3.10.108
Architecture: ARMv7 (32-bit)
Physical RAM: 512 MB
Swap: 2 GB
WireGuard implementation: wireguard-go (userspace, no kernel module)
Go compiler: 1.25.3
Remote endpoint: Debian 12 VPS

TESTED WIREGUARD-GO REVISIONS

The problem was reproduced with two independently compiled ARMv7 binaries:

1. May 2025 revision:
   ecfc5a8d54462e18e13c72173e2623d16d8e25a0

2. October 2026 revision:
   2631ce99a06f27120d581611cf125d68bc6aa565

Both binaries exhibit the same fatal out-of-memory failure under high incom=
ing UDP traffic.

The October 2026 binary was cross-compiled using:

CGO_ENABLED=3D0 GOOS=3Dlinux GOARCH=3Darm GOARM=3D7

An Entware-provided wireguard-go binary is also installed on the NAS, but i=
t was not tested for this specific failure.

STEPS TO REPRODUCE

The Synology NAS establishes a WireGuard tunnel to a Debian 12 VPS.

On the NAS, run:

iperf3 -c 10.0.1.1 -u -b 200M -t 20 -R

This generates UDP traffic from the VPS toward the NAS through the WireGuar=
d tunnel.

The wireguard-go process consistently crashes after approximately 7 seconds=
.

The problem was reproduced multiple times.

OBSERVED MEMORY CONSUMPTION

Before the test:

VmRSS: approximately 4 MB
VmSize: approximately 523 MB
Threads: 10

During the test, memory consumption increases rapidly:

VmRSS    VmSize
13 MB    524 MB
35 MB    524 MB
49 MB    613 MB
71 MB    941 MB
92 MB    1202 MB
116 MB   1551 MB
131 MB   1763 MB

Shortly afterward, wireguard-go terminates.

FATAL ERROR

The Go runtime reports:

runtime: out of memory: cannot allocate 4194304-byte block (2100297728 in u=
se)
fatal error: out of memory

The process exits with code 2, and its WireGuard network interface disappea=
rs.

The kernel log did not show an OOM-killer event.

The NAS also had available physical memory and swap space. A separate memor=
y check showed approximately 233 MB of available RAM and 1660 MB of free sw=
ap.

The process resource limits (Max address space, Max data size, and Max resi=
dent set) were unlimited.

The Linux memory overcommit settings were:

vm.overcommit_memory =3D 0
vm.overcommit_ratio =3D 50

ADDITIONAL TESTS

- TCP, VPS to NAS: approximately 173 Mbps, completed without crashing.
- UDP, NAS to VPS, 80 Mbps: approximately 79.7 Mbps received, with 0.13% pa=
cket loss.
- UDP, VPS to NAS, 200 Mbps: reproducible wireguard-go crash after approxim=
ately 7 seconds.
- WG_DISABLE_OFFLOAD=3D1: did not prevent the crash.
- Other wireguard-go instances running on the same NAS remained operational=
.

The crash occurs specifically during sustained high-rate incoming UDP traff=
ic in our tests.

POSSIBLE CAUSE

The Go runtime reports approximately 2 GB of memory in use when allocation =
fails.

Given the 32-bit ARM architecture, this appears consistent with virtual add=
ress space exhaustion.

However, the underlying reason for the rapid memory growth is unclear. It m=
ay involve packet buffering or memory allocation behavior when incoming tra=
ffic exceeds the processing capacity of the device.

We have not established whether this is a memory leak or temporary memory a=
ccumulation under overload.

QUESTIONS

1. Is this a known limitation of wireguard-go on 32-bit ARM systems?
2. Could incoming UDP packet buffering cause excessive memory allocation wh=
en the device cannot process packets quickly enough?
3. Would it be possible to limit memory consumption or drop excess packets =
instead of terminating the WireGuard process?
4. Is there a recommended workaround for memory-constrained 32-bit ARM devi=
ces?

This is potentially important for production use, since a traffic burst cou=
ld terminate the WireGuard tunnel and leave the NAS disconnected.

Thank you for your work on WireGuard and for looking into this issue.

Best regards,

P=E9ter Ard=F3
Arconsult Kft.
