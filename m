Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0113C32771
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 21 Sep 2022 08:56:27 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 86293963;
	Wed, 21 Sep 2022 08:56:25 +0000 (UTC)
Received: from iedub0.y7.hu (iedub0.y7.hu [2a05:d018:563:7900::25])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id f20f46f2
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 21 Sep 2022 08:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=wg-ml-rkaofgr.redir.email; s=may2017; h=Message-ID:Content-Type:
 MIME-Version:Subject:To:From:Date:List-Unsubscribe;
 bh=ELFSAYq9tTZz4VQYsdUTkX3WMYs1JG39REolmI+wr78=; b=SzOfycZaJm1BYYKUOrCKjmolQw
 5OXOSIU7dsCd6d80o6wa2V90YHTm53ZiNtOQU8WYAVbhU25thxmo7hGC/MlBa2RCIo2eumTxbIH3U
 VSGuBECiPGPy/20m5wgmFdS2nY8Ewaz7eiBDOjz2LZy9hYGrigqOSp0KTze5LJLLs0/ByBC2KYWjR
 0VlCPsTp/yoSvSA7IQOHmkAqppx1ki0r7K4yfek/LFMOwkHzkkyTv6dQiDuGrWnpk02iKDtyQc8io
 2390q0H4Bi4vIDXu0N10A/U1hlO+1ez5REQtvA6uCi4J6TWcj5+XcCA2EXZZyq6l28MTj9V9dH/Ni
 JbLzt8/w==;
Received: from localhost ([::1]) helo=localhost by iedub0.y7.hu with ESMTPSA 
 id c0b24e8e56a672859849ebdd1563ba38 for wireguard@lists.zx2c4.com;
 Wed, 21 Sep 2022 08:56:22 +0000
Date: Wed, 21 Sep 2022 08:56:21 +0000
From: Endre Szabo <endre.szabo@wg-ml-rkaofgr.redir.email>
To: wireguard@lists.zx2c4.com
Subject: Re: WireGuard App on Android allows only one connection simultaneously
References: <62cc526e-7b02-3529-d575-87434af15bd3@chil.at>
 <30014af580cd42edba0121c0d6b99add@rozman.si>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <30014af580cd42edba0121c0d6b99add@rozman.si>
Message-ID: <393311a3ac9b1ed9cb909ba6eb1b364b@wg-ml-rkaofgr.redir.email>
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

On Wed, Sep 21, 2022 at 08:29:17+0000, Simon Rozman wrote:
> Unfortunately, this is a limitation of Android OS supporting only 1 (one) VPN connection at a time.
Just a theoretical thought experiment (I don't know Android arch well, I might be wrong at any of these points):
 
- AFAIK, having a VPN (VPN app) on an Android involves creating a tun device for that app
- kernel RPDB mumbo-jumbo (Android has set that up) will route (all or app-specific (based on processid?) selected) traffic to that VPN app
- the VPN app will be left with 'the default routing table' free to establish unlimited outbound unencrypted connections
- WG on android is implemented in userspace, in the WG app (using go implementation?)
- Since this app has unlimited/untunneled access via 'the default routing table' it is free to establish more than 1 WG sessions (of course, in-app cryptokey routing and all the usual limitations still apply)
- Current WG app (and especially its widget) will not allow only one VPN session at a time.
 
Would it be possible to lift this limitation? Or is this limitation of another nature?

--Endre
