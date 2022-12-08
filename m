Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02F6BC4332F
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 17 Dec 2022 22:08:17 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6956856c;
	Sat, 17 Dec 2022 22:03:00 +0000 (UTC)
Received: from mx1.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 5cd65cde
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 8 Dec 2022 08:27:58 +0000 (UTC)
Received: from [192.168.0.2] (ip5f5aefbf.dynamic.kabel-deutschland.de
 [95.90.239.191])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: pmenzel)
 by mx.molgen.mpg.de (Postfix) with ESMTPSA id 4D5CB60027FC1;
 Thu,  8 Dec 2022 09:27:58 +0100 (CET)
Message-ID: <5bdb73b3-8f1f-2641-206b-a9ca2df7d71f@molgen.mpg.de>
Date: Thu, 8 Dec 2022 09:27:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
From: Paul Menzel <pmenzel@molgen.mpg.de>
Subject: Re: [PATCH] wg-quick: Allow setting iface VRF in PreUp hook
To: =?UTF-8?Q?Daniel_Gr=c3=b6ber?= <dxld@darkboxed.org>
References: <20221207180031.301766-1-dxld@darkboxed.org>
Content-Language: en-US
Cc: "Jason A . Donenfeld" <Jason@zx2c4.com>, wireguard@lists.zx2c4.com
In-Reply-To: <20221207180031.301766-1-dxld@darkboxed.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 17 Dec 2022 22:02:59 +0000
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

Dear Daniel,


Thank you for your patch.


Am 07.12.22 um 19:00 schrieb Daniel Gröber:

[…]

> Test case:
> 
>      $ ip link add vrf-test type vrf table 1234
>      $ ip link add wg-test type wireguard
>      $ ip addr add dev wg-test 192.168.42.42/24
>      $ ip addr add dev wg-test fe80::/64
> 
>      $ ip -br addr show wg-test
>      wg-test          DOWN           192.168.42.42/24 fe80::/64
> 
>      $ ip link set dev wg-test master vrf-test
> 
>      $ ip -br addr show wg-test
>      wg-test          DOWN           192.168.42.42/32

Should this be /24?

[…]


Kind regards,

Paul
