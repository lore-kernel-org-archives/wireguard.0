Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09FA7F483DD
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 23 Mar 2026 17:37:35 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id becd8e6b;
	Mon, 23 Mar 2026 17:37:34 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazon11020112.outbound.protection.outlook.com
 [52.101.84.112])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 56ea0ff9
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 25 Feb 2026 18:59:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rt+xqiLw0cGDCEQyG9WqKPHl6VZ/hPKbb/qt5UfpiKPW/G+S5keZ2caBQw7CZYuDQMrbbGI66HwTqz7c1gjcOsapo1lnTwpYnWE0k9RXIVdbvgHfK91dFc7176ieaIUi3844N4aBGCuYvbXjNOY1dI2A5jq2Qxzc5PuxvlkPrtFCMklH4lADeBVrDXqV3WyaEhiyyZcd/XOXwqIyJiv6tS6tnI23Cwb3ODqIojAs6lM+Z8aJIkq1UiHc/rKr55Qg2DIOjvcIvP3/4bPLKTcyg7A+l3sdP+Kxgpru79J08rEkqQgElJ8B72lgeIIujOlRMzEqWwazkSiwstE+LqIB8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CMwZQrHpvTDy3CefWmLtlHPW235cH1tl2/27UBJyEoM=;
 b=WQ+WWddk1xLbMJtXKmP9xApUMRSXhpnvn2gM2grOqFcoIDZ73KB+6NuU3fy6NX5jQN1+VzKSRvqWoqq4OHmCqiF4zoczX8IhSY+H4rDSKN7pziWtScjah0Gw1uTj8+P22cb0Hv5LjihJSwn6zjjvBSl3A71eMZWOk9CvxZ4QrPpiWudx+Ifr8ddr+BPYYD0WY0EOZJCm1cn++eI+k/2QxfLuJpZwP30//ue+30QTLn/VX0XrT5RIPCYZ3/k3mdrF/B/EEnBWET4jFytSrxoeDjji69vZ/XDsj75XoxCx70APQl680sR5FI8p4hwqbwz7fLLk3nyrz8byCNT/y6mHvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=iwl.dev; dmarc=pass action=none header.from=iwl.dev; dkim=pass
 header.d=iwl.dev; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iwl.dev; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CMwZQrHpvTDy3CefWmLtlHPW235cH1tl2/27UBJyEoM=;
 b=KjMxjG4G+z8bk2NH2GZ4Xj49jgXUUXYG8DwNWVNFnaUQUnZg63Zik1wL8djBUdoGv/HHilT7rR1Q+F+mGSpr88YvfX3N7LqlIimfmyxUQcluRNqSPVhJgCC9bZd/PXejeymvGTp0Q98wgDGNvs/tkHfy495xXKwD2hRasdXE0hBTHRQ0QuwNkrTnSyp240lZYz7bNC+SXum9IwWSjtLLlIGnesRqbjt3ZRdoK47fZT+Rdqb24oET7kfF/oMokb5AK3h/fXmO8OXsFmCa7oWYw3K5srkrOwyMJ3mH0kCDd2aSRLir4iisZ9TuNhN3K534W9ESb90KgL2T2RH+ioQ9iA==
Received: from GVXP251MB0790.EURP251.PROD.OUTLOOK.COM (2603:10a6:150:6c::15)
 by AMBP251MB1100.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:6bb::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.23; Wed, 25 Feb
 2026 18:59:53 +0000
Received: from GVXP251MB0790.EURP251.PROD.OUTLOOK.COM
 ([fe80::ffb8:2f46:b2c8:7e7b]) by GVXP251MB0790.EURP251.PROD.OUTLOOK.COM
 ([fe80::ffb8:2f46:b2c8:7e7b%6]) with mapi id 15.20.9632.017; Wed, 25 Feb 2026
 18:59:53 +0000
From: sh0rch <sh0rch@iwl.dev>
To: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
Subject: =?Windows-1252?Q?gutd_=97_WireGuard_traffic_obfuscator_via_TC/XDP_eBPF_(n?=
 =?Windows-1252?Q?o_kernel_patches)?=
Thread-Topic: =?Windows-1252?Q?gutd_=97_WireGuard_traffic_obfuscator_via_TC/XDP_eBPF_(n?=
 =?Windows-1252?Q?o_kernel_patches)?=
Thread-Index: AQHcpoiVDgzClq56akuts+ijuNN0Ow==
Date: Wed, 25 Feb 2026 18:59:53 +0000
Message-ID: <GVXP251MB0790009AEBCBE7855DDCB5B28375A@GVXP251MB0790.EURP251.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iwl.dev;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GVXP251MB0790:EE_|AMBP251MB1100:EE_
x-ms-office365-filtering-correlation-id: c9578e05-9c72-45e6-51ed-08de74a00f85
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|10070799003|1800799024|38070700021; 
x-microsoft-antispam-message-info: iNHh59OHjw0Xq//VVGiXaftbecg1X0MH7pCZ8qf32D71oGRQ12kA9QIqvOuTQpXdcujlAzaMs7ZCaZEKC41v1YO9MV48grrFMV6tX0J7E1VYp5u5SrMK7G8jVx15L8vswL71N0O0i3t3c14YEZI+mZNfxM+4AxbdqsnMnJwJTqWMXPl9GuBQVh/mUfn55wlscvzH3Kxwk+O2Dk8O1xBEh0kYcJUpWPEmcUtCV8Z4NL8wEM5Mb+SutaOJ1W3FeuUTdC+XSoCd1LZh78mNomKZNUANwTcGkWXJpYMvduqf9s4vOfZ74+2v1Kfjv6jpF1ug0FuUMhMhZIwjsrRsHRbjn4M7DE3tUamnTCO0XYEiMOqrQBpM7/iEIJtTWMmk9yE+4CqPNdAHx1AS0gGg3unFj+0slXENtrO+lCzeyVnUlBkjPoELutq60Ut4cfNeI12xwoyqPxnktvE+tkw0pKn2ywfcKMMVSVV8EvIBgtQmBZY7r6PzhECaYCqaA/MUta1sTX5DgShypNLwnEPd+SE4mLAIhyG6vvtHRFWjsavrQfMeP5F0/zh9mfrJM/qxg7zxr38FjUuwwxW52el3ZigRwQowDni9XfE0NV0debGLZjFWo3qSIwjMaqirYxgwpxXY8I4EeYCSDhs6YNB8mP/hozqn1GH3SCiv8XCpUycw71QqWH8iSyzPt7eessTMFkgTNGhWbA/Rh3XWL+Sj50+h0QvGzJDN0a5ii5OQJZS0kX6UkF3uO1Q9PcqWA446qlIJvrIpYtKg9eERZ28Tr+HW2YphB66jtE4h3eHgsN1Un/g=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:GVXP251MB0790.EURP251.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(10070799003)(1800799024)(38070700021); DIR:OUT;
 SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?Windows-1252?Q?z6+Q5zjlFlEuc3dlINGMkhdSor8VtfGqeN1IJaCbymruKKNqpWtjckCJ?=
 =?Windows-1252?Q?ndoaxCAq2z23w6FBYrKXVJ23Q0BolVAzUKtpK7jojEl+nbL2psSp7xrf?=
 =?Windows-1252?Q?qMQWwvPUcBMDfm9EflVNAmQBKpdrjea/i6v5VMLun/BqLlIchGnCbB7o?=
 =?Windows-1252?Q?dhzmst+QWa58lGAwOB4KtB43ZrSyyo4QxBDHvy4k3FDVJQkwWKbyF+yW?=
 =?Windows-1252?Q?WZVFe7tZ2Q0snZM7nNk2armdZozMZpBQN2rGYXmAvKuqANYdj1LJjLfq?=
 =?Windows-1252?Q?GN60NgdFVWpq6zLdNgVfmYkW7Ks6mZENezpjkXNeemeQfoXj+z506MAu?=
 =?Windows-1252?Q?L4RDei7BeMf+lQRc6qbNpBILCcw7xZ3iVeOPfrOMo5+zHlM2N4O5zjs5?=
 =?Windows-1252?Q?bXAQVzfq08nTWduVUVe3HcL9uFwG3SU1u79rcCW2FEWSDCgzoYJbZDjB?=
 =?Windows-1252?Q?WVL8T4dtwOSs/q+dgaBerRj+MANaCorprJg8dEfGuhVBltVkgI0e2B2E?=
 =?Windows-1252?Q?Oc+Qwyh+rLk4ogVMbDydaJUVDlsB3yVJ9xy7ZpO69ZOw07yj2oxur0Es?=
 =?Windows-1252?Q?7nc5ha6D77V3C0xmq1mdE2jZR4fbavXsbu5Rpj1sJs+4WUSeYAhP7loP?=
 =?Windows-1252?Q?WPNGWftk++R5ufQOOlktVYQO6rXvwrC0df+65mfLy8U5xKXu8Q1m3e3D?=
 =?Windows-1252?Q?ge35FtFBJBQEQxKwhqYF+JTKIpz51daR8Ps54gk+G2cIqc3dNNilrPce?=
 =?Windows-1252?Q?+aJPcSMs+SBNpRjLhKIHyqB7K3K2QlNxLD9QQkg2xqI+NUQmXbztVFo4?=
 =?Windows-1252?Q?dz7tH0j9s9hCpMs3fWw8GYXN1zI0rgXXzOUyYOdsKQS/qo0O0U/LUWKP?=
 =?Windows-1252?Q?E+RgM/JdSlW+/Huf6NAGwuLZ73dW4TMovNPcSIDwQIQaUo+Z3BOC3h//?=
 =?Windows-1252?Q?kXds1rN+8HHZTcBDZpUzONVfUY81uPTW/oSKhEagUnqGknHoyh8VTMTN?=
 =?Windows-1252?Q?BOZTgY/d4m7nvwNwBKw1w8Ok6NhEG5/yH9+6EdcSuo1a+IOIqlE4o5qy?=
 =?Windows-1252?Q?72kNbiB0QP0yT5WJTQrfxu2d2vyZujgGfIB18J9besV/dAUZekGOA2pr?=
 =?Windows-1252?Q?0rSsjArTrqSaBzFtDFp293Oba2Bb6iXEVSzscQAeLK2ogXxQxYesKcjy?=
 =?Windows-1252?Q?E/VxDW4jZfkbEDKZHLJIEqLBhZnMJGLvF2NV5e8XgSzg9VZgVuj3otag?=
 =?Windows-1252?Q?hltMmK3u43EUilBdS2qPCI3eelZ1TEkWocketkeF+mFrXciVc7OuXaf8?=
 =?Windows-1252?Q?TqMLQ3L1/sfqU6aqWShrpHV7gmyDRgwPUxVzUd5eSbIIsBxuxBnzFHZ5?=
 =?Windows-1252?Q?Tp7CPwkKd1p2GRQKq4UOQ1kzO1eIFD0AzVA7A82fc6FD4m+CcEmTS+f/?=
 =?Windows-1252?Q?YoXGSIxWVs40/X0mSXSi/w14ODUAOB87E+R6NLTfxXOEZYhjMU1T161P?=
 =?Windows-1252?Q?Usm1u2TAjpQN7nSocAhnQ+QwLi+fwrFH/yRIMfM2FlLePfM/wYomVl3j?=
 =?Windows-1252?Q?DFtxlTTHS0mpdTwbdVwjS52tPsa3yyKQj+tuROkqq5H0xBuDMI//Mp+B?=
 =?Windows-1252?Q?5nJcd2lrXfDraf7SVcWEG7bxNShPwXZFdMUZowaHOhIa53eRz2jnodAn?=
 =?Windows-1252?Q?EYZgkKx6cI25sEeSV7MMU8A1fy6vJbNL4JEnPEa3CF93IXQlCIyhszkf?=
 =?Windows-1252?Q?wt6MkaQjkwwq8rEE/igfC+otrOhO4tk9MMTinGDF5k0u+HTjKcqId7QY?=
 =?Windows-1252?Q?JXbIib1vhGrmtvEs2WPZeA+ik9fVORz0iYeENVx0IvBwgaFohXc1sd/2?=
 =?Windows-1252?Q?k60sOtnj4KBlythbYTBNNue7AeiZcfT1Hho=3D?=
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: iwl.dev
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GVXP251MB0790.EURP251.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: c9578e05-9c72-45e6-51ed-08de74a00f85
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Feb 2026 18:59:53.6707 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 1bc387f5-9185-4d74-bbf3-9f70e48b60b0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bPKQl5zrpc0KESCcu206LWURmpV0GqqGvzXA2u579llLSfrP/QW2vgj84Me7cEpR7UVBy0WfwnoXl0SzffFPIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBP251MB1100
X-Mailman-Approved-At: Mon, 23 Mar 2026 17:37:32 +0000
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

Hi all,=0A=
=0A=
I've been working on a WireGuard obfuscator and wanted to share it in case =
it's useful or someone wants to try it out and give feedback.=0A=
=0A=
**gutd**=A0obfuscates WireGuard UDP traffic using Linux TC/XDP eBPF program=
s - no kernel patches, no kernel modules, no DKMS. It attaches at the TC eg=
ress hook on a veth pair and the XDP ingress hook on the physical NIC, so p=
acket processing happens in the kernel datapath at near-native speed, but t=
he implementation lives entirely in userspace-loaded BPF programs.=0A=
=0A=
##How it works:=0A=
- Egress (TC): masks each WireGuard UDP payload with a ChaCha keystream bef=
ore it leaves the host=0A=
- Ingress (XDP): unmasks the packet before passing it up the stack WireGuar=
d sees nothing unusual=0A=
- The WireGuard process is completely unaware of gutd=0A=
=0A=
##Key properties:=0A=
- No kernel patches or modules - just `bpf()` syscall=0A=
- Port striping across multiple UDP ports per peer=0A=
- Probabilistic keepalive drop to suppress timing patterns=0A=
- Hot reload via SIGHUP, no tunnel restart=0A=
- Static musl binary available (single file, no dependencies)=0A=
- IPv4 and IPv6 outer transport=0A=
=0A=
Shared symmetric key=A0(not WireGuard keypairs) -`gutd genkey` generates a =
random 256-bit key.=0A=
=0A=
Repo: https://github.com/sh0rch/gutd=0A=
=0A=
Would appreciate any feedback - especially on the BPF approach, the wire fo=
rmat, or anything that seems wrong or could be done better.=0A=
=0A=
Thanks=
