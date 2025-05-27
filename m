Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22E1DC54F30
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 27 May 2025 12:12:22 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e2f34a00;
	Tue, 27 May 2025 12:12:21 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2130.outbound.protection.outlook.com [40.107.21.130])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id c7735b99
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 27 May 2025 09:08:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NDwvlGgBFvyywkuY+v5RxacHat4a0TJgMLQVFiqBY8CTD4FJDU6xhD/el2Axrxde9jL9JbgA8CuwAyWHj3p9siEAOZ2H04JqESR6IQX2d/HLZIsdPw38BfBxZndJFHPptevSmbJsKwoxfzYQUANYvIyU1iJSaRSlDhBmmf99rqQ0Ijh3gPFlhmYAkk7/lBCzIdczbynLIfvFckux0lrndAFr96X9X9g6crzWfK0XccHo3UNSOmOWptnHRDf1g4TMnyFkL9dJZFM0IzszqGckwy/8wMPTJH7r9GH6X6mp5cSBAYSBJ4FucTFWclFD7SR/P9+SlnbaIq58kZEAo6DkDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vJhoBLdQ+9rCdF+okD7qLi1RWqUebL5Mfu12isGyY34=;
 b=N+Aw8+osbc/nEYgK1XxOrQTBv/ur+/vnvjKVkCb07H4ndBfqrlodiemKiXo1ZxSjBWFUxzWlNyTtp0OAZL2n4MtkrVxNOC+Bfk7CH2xAshwEQdYZs+3ZDomm0Ur3+KV5095bas54p+xc8BlgkKFhVYceHnsp4Ke2Wep9k9vrYlgoGARxP+H8t4b0H4gqwn8kViBo0eSNQkJsL0VXtdsFoLGxMScxN8coACYwoL/+hsX0iv7tWEDUsITb6EV3NYOSK9EPgdsEEDv4BVJVnCuk2NzUHkzQHpl5Kdp0MswmzqdLtjsEthMtsfbPg5X7rmN0eDnvJy8LzNjVJflKLep7KQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=polito.it; dmarc=pass action=none header.from=polito.it;
 dkim=pass header.d=polito.it; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=polito.it; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vJhoBLdQ+9rCdF+okD7qLi1RWqUebL5Mfu12isGyY34=;
 b=T9oLoOzXL+rUg3lj00mibpuqb0ms3KUfP1oXWtgHiiYibs5/1dZw2aqnHXu6+TugqyaQ3WmR3MuQzWzrZbTBma8cBebM9oMUj6Ag4HjtLNL7uUfEV/3GQRi0JjE5P1NcCKzsYIDdwIS/lq8L96YdQeufDAYFSXZfsnIKAkWhWk8=
Received: from PA4PR05MB8995.eurprd05.prod.outlook.com (2603:10a6:102:2a6::12)
 by PAWPR05MB10840.eurprd05.prod.outlook.com (2603:10a6:102:369::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.24; Tue, 27 May
 2025 09:08:30 +0000
Received: from PA4PR05MB8995.eurprd05.prod.outlook.com
 ([fe80::9d7d:b4bb:1d50:70ce]) by PA4PR05MB8995.eurprd05.prod.outlook.com
 ([fe80::9d7d:b4bb:1d50:70ce%5]) with mapi id 15.20.8769.025; Tue, 27 May 2025
 09:08:30 +0000
From: "Mirco  Barone" <mirco.barone@polito.it>
To: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
Subject: [PATCH] Enabling Threaded NAPI by Default
Thread-Topic: [PATCH] Enabling Threaded NAPI by Default
Thread-Index: AQHbzubCWqzF5L/Ns0et8HxS4wFhZA==
Date: Tue, 27 May 2025 09:08:30 +0000
Message-ID: <PA4PR05MB8995153AC212DDED36166CC48964A@PA4PR05MB8995.eurprd05.prod.outlook.com>
Accept-Language: it-IT, en-US
Content-Language: it-IT
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=polito.it;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA4PR05MB8995:EE_|PAWPR05MB10840:EE_
x-ms-office365-filtering-correlation-id: 89b6fde3-0d05-410d-df8b-08dd9cfe0c79
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?dLse47VaZiTh9GhRNqBunV4mYHTIZyw2OPNQsUWP2LueHYqT6vmCs1U95Z?=
 =?iso-8859-1?Q?HTgfNs16nQrmswUO57ZgATmjF2nAFDnT4y2Q0mDXwBCFqhElenKMmPi96E?=
 =?iso-8859-1?Q?xQHg16PiWZ5IZg5/uoDEezH4KhCPMHppGzcW+rXjyD2gtUZcg4wCWTshAU?=
 =?iso-8859-1?Q?7xJ6HfkgOd8fSQt0ubUiGTCM5eVLybJuXOxBPTKJEDYEjZT90N6a+9pCCx?=
 =?iso-8859-1?Q?uquihG+DnnpeGTDSTufA8Zs6IjP3TCETRIV4dO2FD3M7ioXh8ys8VXGkH1?=
 =?iso-8859-1?Q?5aQagdzzsRPuyuS0jucW2FeT9YaLs9nRDXNTRhEIlsDi2jiCc5uT1AcP9q?=
 =?iso-8859-1?Q?usG0GwGzLI5jZzcoS+2stghiDFwj4uZy8Yb447quR57//NOtl6pSWT5hMy?=
 =?iso-8859-1?Q?/g/dK25lvUWUKwtAABvaQyywR/lIY8klMY1+UApM5UacgoL/ByWHkow14x?=
 =?iso-8859-1?Q?svHDdcbBYR3c+W65AX+wdsgiQnCy1qfU1Ozm6eLPI2bZ1K376UJvuCr3kT?=
 =?iso-8859-1?Q?XuwgZA//tvriVqzLf8XbLda0qzl+0dWpbNRmn6BsJQpNTkjqeb1hcVQnEN?=
 =?iso-8859-1?Q?BnO31k1qAHPtTjPqmabe+DYjER/6Um0sms9S95BGe52FXZ+DZUMJRmDoDI?=
 =?iso-8859-1?Q?ucYc1bTZHuTNNenK6l4qzMapeHi1bSOUL58PxtiBy55HNkvTyUivCMxwRY?=
 =?iso-8859-1?Q?5i/UTXSN8mcWRLLHjKHeCaZEx4/LxdL1vJMapxdk7Xl918OnqfRwtOFVv8?=
 =?iso-8859-1?Q?9Dkt3GBGw7OeXWpoehnDInz0lbhRXpXglRx4YLbQTOMmYskqV/6QAPMIrd?=
 =?iso-8859-1?Q?GkacSoj5FDuCg3lIhWpcfZRQzRPUAXHTKTMpr+8NTLN4Xh5xIToUEwV3SO?=
 =?iso-8859-1?Q?sBhpATGZ6IsuigeJyLlmYNx5dBrXuwVA7Dfz7R2Px41ZrbjxmahGKXqLPm?=
 =?iso-8859-1?Q?dw5h9JY8jnQpwWJCa1iSe0H+mNlli6i70nhwDmL34CPlrDbQYsOXv9hH7I?=
 =?iso-8859-1?Q?j/F2HJXR947o7O9j7To9Y4je5/D9zJj6vzGehs/1/ZIa31gG/72KDrcKXy?=
 =?iso-8859-1?Q?XsPD95c9SqZ/jNJIgXwu7pu5QrFNe+LYYB835LPC486sTZL8ZWZfVrUgTC?=
 =?iso-8859-1?Q?Yn8w100p702IQSZyEJUzju8CFonzO1TS39x7rafm84D69ddMADyxZnrj6o?=
 =?iso-8859-1?Q?wzbKc0bb14hAKvVsYl3DsZicT5rPAgWNKjRIywJUfef1AoY9tn8a/4gxNA?=
 =?iso-8859-1?Q?Jq5NhpbjDpHnqfMJVdj0mUENv6Kk2YDpFDSceAoeC+L3KqfG1fyNkfe48z?=
 =?iso-8859-1?Q?aEB1040tq9GwKtHde1CqaVyYLNM1LxsMFIhw4YPFiSgsWxrfeOXzB3En8s?=
 =?iso-8859-1?Q?7VUaK3dPEPtYW0Z+QS2xYzDWaAbp1g8iniGgLhPHwdYPWdI+IeJ9eA5k62?=
 =?iso-8859-1?Q?J2gMfTS206VUGc8RMnB39v0Q/JGOWus+Zys31HuBPuT5S59Hhgynoqoq1Y?=
 =?iso-8859-1?Q?g=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA4PR05MB8995.eurprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?zYl+8J+2Jcgg4F8wJgA//2mhDbYwg14tTqytAkmseH5fVNFxCZLRYgMQEK?=
 =?iso-8859-1?Q?rqMuQZRhdHUUBD9sgUxcNck1eYZDImygG9rzbwOb8iDdzsDijB2+Zq8q0+?=
 =?iso-8859-1?Q?4z+6IjUoNpqmt0LqFCXbR4FTCCTbqgJ1Ax6cjMSfx5NEfVdybutr052+AT?=
 =?iso-8859-1?Q?t0eTFhxTm5Sl+ZIGOJsHWBie9fWRswUQkk3r+02gy8TTy/NQywlkLT/pzu?=
 =?iso-8859-1?Q?CA1/LRzzxccGSwfXFpG0CYk8W2Blg5dJksF903QM8+ozen+JrL2Hv3Z22r?=
 =?iso-8859-1?Q?3srijS+91uGYlIYnBr97A/eVL1M+mISPZdydoUshE06Q71e8GTCx1mIQTr?=
 =?iso-8859-1?Q?GamXojUPTNXepjtVn+gR8gfQz4bRvi+/PeG16HcnM/khOQOkeT623pBRZ1?=
 =?iso-8859-1?Q?PpIOxCEsqj5tN7hMv7Mu3TGfiKvqiCB9ZMOY43s5HjLV5S6P/hSJxUXlMO?=
 =?iso-8859-1?Q?SMh/a+U3bo51gtFDyuZJGyk1qpy1kfVZiamABgUsLAze9updC+WfdFQMGn?=
 =?iso-8859-1?Q?YCNiqO2FzUflkmNqepF7IGNVu0v98e0Ivys9oCS5i/cHDfI+0JZq5YRqrS?=
 =?iso-8859-1?Q?splgjSmWPFoktm+ZiVmM+AvVRH9aSZcPC5pLv/EPUmOj89PCXwEZvEaSjD?=
 =?iso-8859-1?Q?XfRp0kvTrveYiGFZZSnTnrVs17oJ/BvbcUUuCP3fDUN85ZsGgZ40UbZUYx?=
 =?iso-8859-1?Q?xIew2G3/BqGM+zc92GiQrEAut7y0v1ovcJJztdxdD6yKXXOCDRDjtVeTkw?=
 =?iso-8859-1?Q?tJbhJjdKIcu1NQVnx8VHaKA/zuZpAwBb5EiVcoE71cMDlHUy5FtRbufP2j?=
 =?iso-8859-1?Q?Avhmu9RUXXF8fis2klbFbQHaah2TL07NXUWD0J73uKJdK7X1F94DKU9F43?=
 =?iso-8859-1?Q?8ESkO0xHXRbhW1NOkAinb2WS5nfLUNkQhOr+Ra9y2vD0jDIVaOaiyFPSYD?=
 =?iso-8859-1?Q?4F0y5RutBER9T58o36RaOvmHvZGY2Uw0t2XZFPg/bav3O87BBBB53PiKAL?=
 =?iso-8859-1?Q?c68KM5FkrpXW9Mw61ePQYcxV2AAIBvxj6spn0+SLtb0m4HqSKFa3pZnACC?=
 =?iso-8859-1?Q?e5OGljPQCDSFJeRbajRPNS1HUvsAgGdaBBBzn5WFF1a3A16bZPEP+VaOSC?=
 =?iso-8859-1?Q?cusNzRYZhipOeIvEwnjliCrJNj3P6kuOPLWeXVRd4lSm4Nw2gI3GBtIeNh?=
 =?iso-8859-1?Q?yYx7leJ7Nf5SQamMnO0R4WtqJKJCl8eXMgY4vGqEC9t9Zw4s96HDKh9m6y?=
 =?iso-8859-1?Q?Xg0CB9aD4ngdMLz2xPVX3c91ABLIePzHqjy0Q2Y5QCE5b/4+Tj6Xt16HpE?=
 =?iso-8859-1?Q?cHWgOBCYhFeAue6u8FzoJUCxCTlqby2xo8kf6XJTfCS21B6PJd5G4Cwogm?=
 =?iso-8859-1?Q?xVgNvDZX2mHkw9dANefTQshb3pvF897sewdQwEGbBb+lBjJnvMFNcISuIH?=
 =?iso-8859-1?Q?M1flH+aUI4vqYM65vLZd/qo6zJDjfbMTUI9R4miF3OHrzSc8Ie8mqx4psJ?=
 =?iso-8859-1?Q?uKkV+wdVt7+Zb0+yWLoKKJiG4vahhH/LZnhjEzZiWSgdXE0rL6BZdmaoL0?=
 =?iso-8859-1?Q?uKLN3a8k94Buf7dIrbGrw1d82PMeQWaY46MXjcheoVMsG04i0Fl8hisMCg?=
 =?iso-8859-1?Q?oxgmADl6h2hG749vy56yUKCHng2hShKlCt?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: polito.it
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR05MB8995.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89b6fde3-0d05-410d-df8b-08dd9cfe0c79
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 May 2025 09:08:30.0793 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2a05ac92-2049-4a26-9b34-897763efc8e2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8ZRuFJEp0DFNwD4xTtZ5U87NLvb2jLO9m0c3GW2kVWVnzLtbmCcCUhPuec9dNc98ZnG3KSjItr8UFATyUAlMQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR05MB10840
X-Mailman-Approved-At: Tue, 27 May 2025 12:12:20 +0000
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

Hi everyone,=0A=
=0A=
=0A=
While testing WireGuard with a large number of tunnels, we expected through=
put to scale linearly with the number of active tunnels. Instead, we observ=
ed very poor performance due to a bottleneck caused by multiple NAPI functi=
ons stacking on the same CPU core, preventing the system from scaling effec=
tively. =0A=
More details are provided in this paper on page 3:=0A=
https://netdevconf.info/0x18/docs/netdev-0x18-paper23-talk-paper.pdf=0A=
=0A=
=0A=
Since each peer has its own NAPI struct, the problem can potentially occur =
when many peers are created on the same machine. The simple solution we fou=
nd is to enable threaded NAPI, which improves=0A=
considerably the throughput in our testing conditions while, at the same ti=
me, showing no drawbacks in case of traditional deployment scenarios (i.e.,=
 single tunnel). Hence, we feel we could slightly modify the code and move =
to threaded NAPI as the new default.=0A=
=0A=
=0A=
Any comment?=0A=
=0A=
The option to revert to NAPI handled by a softirq is still preserved, by si=
mply changing the `/sys/class/net/<iface>/threaded` flag.=0A=
=0A=
-----------------------------------------------------------------------=0A=
CHANGES=0A=
-----------------------------------------------------------------------=0A=
 drivers/net/wireguard/device.c | 1 +=0A=
 1 file changed, 1 insertion(+)=0A=
diff --git a/drivers/net/wireguard/device.c b/drivers/net/wireguard/device.=
c=0A=
index 45e9b908dbfb..bb77f54d7526 100644=0A=
--- a/drivers/net/wireguard/device.c=0A=
+++ b/drivers/net/wireguard/device.c=0A=
@@ -363,6 +363,7 @@ static int wg_newlink(struct net *src_net, struct net_d=
evice *dev,=0A=
        ret =3D wg_ratelimiter_init();=0A=
        if (ret < 0)=0A=
                goto err_free_handshake_queue;=0A=
+       dev_set_threaded(dev,true);=0A=
=0A=
        ret =3D register_netdevice(dev);=0A=
        if (ret < 0)=0A=
