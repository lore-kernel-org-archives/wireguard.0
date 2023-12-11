Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D31FAC4167B
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 11 Dec 2023 10:52:14 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9d561545;
	Mon, 11 Dec 2023 10:52:12 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.74])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id f5fa8e25
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 11 Dec 2023 10:52:10 +0000 (UTC)
Received: from [192.168.151.34] ([79.229.44.197]) by mrelayeu.kundenserver.de
 (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MsZ3N-1rVx3q3iwd-00tyNw for <wireguard@lists.zx2c4.com>; Mon, 11 Dec 2023
 11:52:09 +0100
Message-ID: <b0022d92-ce31-4858-aa5d-9b5a6222b733@online.de>
Date: Mon, 11 Dec 2023 11:52:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: wireguard@lists.zx2c4.com
Content-Language: en-US
From: Max Schulze <max.schulze@online.de>
Subject: wireguard.exe /ui using lots of RAM (>5GB)
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:jNbW7cBX2kdspFgHnrewyYPRNnxDkPiIXPGbVZFvMUyJwsA/b1C
 1gI1wwj5rQKpNgVJwLVheK49rDIgMVni+1VVy3V1j3XFn5migom/GjW8dX9xb699M73trrZ
 xd3+c9mgDV2KZ7vehHNJib9iUVBw2EIhY24MNjgS1a6S/EHQooWUMk0qSVBkES77UputTSD
 WaInz8dIhbgBb3WpNmmmQ==
UI-OutboundReport: notjunk:1;M01:P0:UhvHJ/ka0fY=;p7YL9oYA2uvb8cG4G545C84vW2d
 nfOasU46MAjGZurOSOVp6Qc4cnidjkA66bq09NHsDrrK/Z8Rc5V0aMvPX09Wy/X1i7fsbFs5K
 +ozFHnnIX+xFogMsbC/4Q9mK+iGzyUEf1uKRiO3+xQMnZ2Mm1Y1ndl2WFOergrlpcNBHb/4w3
 AXhILS9e+SjgP0A3iSxdgYDjATm88NDph+JcZ//XN9sOFhArUhL4gAeAXrWdDrnM9XQoAf9Yh
 7esiA+JZuMUSdcHfN9rYJX4Ee2R1juPiDDdy/mcbL/VsobmPl5aPvNlVWOSyQUmHWZYBwNgKP
 pEALOz7M0wGuXwbi7d70Ng7/rZfdoROr6DkTnXoPWSotW2IN8NR71xYMLpKSjsonJnRO/LxZN
 A6i/a0dcb0VSqC0gMWexwLucKL8+MH6kZulfdN6/xkxCE0cC2p4WO02brNqu89dz5JKuJyfc8
 /UMYQyRlQYs6eD8hqAb/uSy15vKTiph1uOYc0ZfsgRddDZZFy9vVHMIlSumAVMe1DiN58JB2i
 neNPQNCtRsNsEnXzal1Cz+JSJ4fduZuSIYf6qg63b8ZbMOQMgJ9WtXzJ5fl9TsptGoJdkg834
 NKxaM26ZnSe/MJNJ0tvq1Wq6laOO4jwNDWPhvu2FoVtdzpV6OLc2BrSm2i0RbGfS5EZa/kTQC
 mVIjD8oTzpGRqEMiMEvGU7Bep8gNNPrwdhvUtDuJlMgJwREI37re8JZawMO+COVMKesj/jmVj
 WweISqLRPUWEtQTbR3RggjzOhLi/exfun+ETGUdcC5XxMpg4ofu7bqDPPA694+zxeHA0zZ9M3
 HgdmxbudqdrGn2VMCQDrt7yDsw+5hu5o3ihW9lRX4PY8TsH22FXnaiZ/LuATsBg9R3+KkAR4t
 aDZlxJrPTqNAvIw==
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

Hello,


today, I saw a long-running (possibly 90+ days) "wireguard.exe /ui" process using 5Gb of RAM (nearly the limit of the machine). Normal operation is around 14 Mb.

WireGuard/0.5.3 (Windows 10.0.17763; amd64) Using WireGuardNT/0.10



I did a wireguard.exe /dumplog, but it only shows "handshake/keepalive" every two minutes like clockwork.


The wireguard tray Icon was possibly there (empty box) and did not react.

Starting wireguard.exe /ui from the command line did nothing.


I killed the process in windows explorer and restarted.


What can I do next time to gather more useful info?


Best,

M

