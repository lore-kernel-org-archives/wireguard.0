Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5D48C6379F
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 20 Feb 2023 11:37:57 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7e3fde26;
	Mon, 20 Feb 2023 11:37:56 +0000 (UTC)
Received: from mail.aes.pm (mail.aes.pm [51.89.244.14])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 332d1998
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 20 Feb 2023 11:29:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 0B5101C0128; Mon, 20 Feb 2023 11:29:21 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fingerlessgloves.me;
 s=mailcow; t=1676892562;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=32fxd3WhLaJQ+0GdbbGnJTplZSGIWNsQrGlNXuJA8Lc=;
 b=JLMnzj6TU0vKwVH+0Tj3ra4+55YCAmjL/G/EaoL84Yzn4XKNiRjyx455HxpOGSaNioKAyI
 L+hGP9wQblY8AYrW81Ejxx/qm1hGnQGQlM5ebnDmTp3NhQOdRcdxUArCrl/ybGoVR7iX5D
 9Tj5kJM5n8HpaJJuG+MqAybO+yOU/hXx8/LjIYVyqRQP64+ppnco1X3wpwaG1ckxy/fGUW
 +aiUlLnF9ioR49uJtMx3Mqzc/OcvyKiApTw49JSqgTtQ51VDptyAV30q3kr2FgcXmz71uK
 mCx4uJlrxEuo9ERWShO9znXChaBS7rMaa9PMQYDOstXIL4PbKGlO9ID/rmZ8ZQ==
MIME-Version: 1.0
Date: Mon, 20 Feb 2023 11:29:21 +0000
From: FingerlessGloves <me@FingerlessGloves.me>
To: Daniel <tech@tootai.net>
Cc: wireguard@lists.zx2c4.com
Subject: Re: Wish - Add PostUp/PostDown per peer section
In-Reply-To: <ce7c0c0c-f1a8-f4f1-bde3-184ad66b48cb@tootai.net>
References: <ce7c0c0c-f1a8-f4f1-bde3-184ad66b48cb@tootai.net>
Message-ID: <538cc161fec50f06cffcc0d0e08b0a10@FingerlessGloves.me>
X-Sender: me@FingerlessGloves.me
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Approved-At: Mon, 20 Feb 2023 11:37:48 +0000
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

This would be very handy.

Currently we have a python script that reads in the peers and 
add/removes ARP entries from the physical interface, which runs as a 
service and checks WireGuard every 10 seconds 😅.

---
FingerlessGloves

On 2023-02-20 09:33 AM, Daniel wrote:
> Hello. Would it be possible to add the PostUp and PostDown commands in 
> peer section ?
> 
> Ex. of use case: dynamically add route when a peer connect
> 
> Have a nice day
