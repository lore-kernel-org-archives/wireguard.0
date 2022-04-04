Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 190B0C433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  4 Apr 2022 06:56:01 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 82a091e2;
	Mon, 4 Apr 2022 06:55:59 +0000 (UTC)
Received: from tampoco.espindola.nl (tampoco.espindola.nl [149.210.133.191])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 19955088
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 4 Apr 2022 06:55:58 +0000 (UTC)
Received: from [192.168.68.249] (drawbridge.espindola.nl [62.251.122.20])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (Client did not present a certificate)
 (Authenticated sender: frank-deze)
 by tampoco.espindola.nl (Postfix) with ESMTPSA id B1B123C0184;
 Mon,  4 Apr 2022 08:55:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=deze.org; s=default;
 t=1649055357; bh=ZKFrmFd+xyaKrFSfSz1mZWmm16Q0NQqtDkJ0LDvapIc=;
 h=Date:Subject:To:References:From:In-Reply-To;
 b=HY70roX2uNYVr0Rjnl/j3rRtkhJ+38f+DHz2YXQ26a01HoGavJ/TFNHqXXr+Pspmz
 J5iHvv+hed5pqEGsUe/XKIBl9D+fpy8jIeFMzUrwlc2SYrqBxU0Qgz9C3nPqDo9U0P
 7qMTv/qQILCenIjLzacYvvHDCvWLWjN6rsTzt1/Ew0tz21RskvKiaQILobzYX15c88
 bHztvPnxGdgNohg4cG7Jnp28osqldx1o92eef66osnMeRzGxRlxMRM3E74RQHIrij2
 ZT1CUapv5ZyR6LwFEa4EMjNlMf5jE0IGswxlAOa/KjlfjeAsQaA2uGwheZBnhV6Ysj
 PIZJw9+t0yLsA==
Message-ID: <88efb74e-39ec-99e5-98a8-244e0af70724@deze.org>
Date: Mon, 4 Apr 2022 08:55:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: MTUs go strange ways - ?
Content-Language: en-US
To: lejeczek <peljasz@yahoo.co.uk>, wireguard@lists.zx2c4.com
References: <c8f39df3-e207-2dfb-c65d-5c6b4267f159.ref@yahoo.co.uk>
 <c8f39df3-e207-2dfb-c65d-5c6b4267f159@yahoo.co.uk>
From: Frank Volf <frank@deze.org>
In-Reply-To: <c8f39df3-e207-2dfb-c65d-5c6b4267f159@yahoo.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

The "-s" option provides the length of the ICMP data in the packet, not 
the total packet length.
To the data size you need to add 8 bytes for the ICMP header and 20 
bytes for the IP header.
So, you are sending 1328 bytes (which is noted between the brackets in 
your output).

If you change to "-s 1292" then you are actually sending packets with 
total length of 1320.

Kind regards,

Frank


Op 2-4-2022 om 19:41 schreef lejeczek:
> Hi guys
>
> I thought there was no better place to ask but here so - both ends are 
> centOS and end up having different MTUs for 'wg' interfaces and that I 
> thought, was wrong.
> 1370 (server) VS 1320 (client)
> I expected that would be negotiated between nodes without user 
> involved, right?
> Moreover if I from the client do:
>
> -> $ ping server -M do -s 1300
> PING 10.3.3.1 (10.3.3.1) 1300(1328) bytes of data.
> ping: local error: message too long, mtu=1320
>
> Could some expert or two shed more light on what & why is happening?
> many thanks, L.
>

