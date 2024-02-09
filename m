Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7457CD4921C
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 18 Nov 2024 13:24:06 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a788399b;
	Mon, 18 Nov 2024 12:38:15 +0000 (UTC)
Received: from clodo.it (ec2-52-29-208-32.eu-central-1.compute.amazonaws.com
 [52.29.208.32])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 6a814d72
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 9 Feb 2024 18:37:07 +0000 (UTC)
Received: from [10.123.0.244] (ip-85-42.sn2.clouditalia.com [83.211.85.42])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by clodo.it (Postfix) with ESMTPSA id A00C1605A8
 for <wireguard@lists.zx2c4.com>; Fri,  9 Feb 2024 18:37:07 +0000 (UTC)
Message-ID: <140317cd-ba38-4413-9f84-03cb014cd5bf@clodo.it>
Date: Fri, 9 Feb 2024 19:37:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: it
To: wireguard@lists.zx2c4.com
From: Clodo <clodo@clodo.it>
Subject: Apple Vision Pro support (in iOS/iPadOS compatibility mode)
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Mon, 18 Nov 2024 12:38:13 +0000
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

I have an Apple Vision Pro, and WireGuard App is not available yet.

Basically, Vision Pro have native app OR compatible app.
Compatible app are the iOS/iPadOS version.

An application must be opt-in to be listed for Vision Pro as compatibile 
app. Docs:
https://developer.apple.com/documentation/visionos/checking-whether-your-app-is-compatible-with-visionos/

There are a lots of app on Vision Pro related to VPN, all are simply the 
same iOS/iPadOS version.

OpenVPN Connect: (note: report visionOS in compatibility section)
https://apps.apple.com/it/app/openvpn-connect-openvpn-app/id590379981

WireGuard: (note: don't have visionOS in compatibility section)
https://apps.apple.com/it/app/wireguard/id1441195209

I'm currently using NordVPN app on Vision Pro, works perfectly (and i 
think use WireGuard).

I think you can simply enable it,
i will test it when available and report here any issue if exists.

Fabrizio Carimati
