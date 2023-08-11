Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E90AEE49A0
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 23 Aug 2023 16:07:17 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4ea41955;
	Wed, 23 Aug 2023 16:07:16 +0000 (UTC)
Received: from relay.yourmailgateway.de (relay.yourmailgateway.de
 [185.244.194.184])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id dd7ee820
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 11 Aug 2023 11:37:12 +0000 (UTC)
Received: from relay01-mors.netcup.net (localhost [127.0.0.1])
 by relay01-mors.netcup.net (Postfix) with ESMTPS id 4RMhbW5v5Dz8x1B
 for <wireguard@lists.zx2c4.com>; Fri, 11 Aug 2023 13:37:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rtlblus.de; s=key2;
 t=1691753831; bh=ekz6hRCnM5cSdSI3TvwDqSprcWfPTA45qhSZBy+pcIA=;
 h=Date:From:To:Subject:From;
 b=lqmir6yyweBKX0fXX02p8NIqgoZPZ1JDVJicoqB276PuI3x3tzJv5BgagVjLR1XNY
 w4ZtQ0aPxwJKGbDVSBlvDkG0roMhE03opduce32rMJx6ELJEDfkusiJZpnF6Cp+BE6
 pzmdn9vLJXKPigqESR8yWxQ+NlTqjj2E7smWsgo1DcVHiMyZc5Rr3fkMIi5Ct969y3
 tTummwc5YOM+xsn/mq2CX+WaVrRt31hU/NMoady0W0yDR4MTTowbQ7CdVamEmw6lS0
 U7c/EEyguVaU53ic4ihdmmsClFMKOomzek44LHjEqAvJ/AtK/TU0fd9lxGUrSO2tmV
 ElaagZnChjUdw==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
 by relay01-mors.netcup.net (Postfix) with ESMTPS id 4RMhbW5CBSz7vLh
 for <wireguard@lists.zx2c4.com>; Fri, 11 Aug 2023 13:37:11 +0200 (CEST)
Received: from mx2f44.netcup.net (unknown [10.243.12.53])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by policy02-mors.netcup.net (Postfix) with ESMTPS id 4RMhbW3dzLz8sZR
 for <wireguard@lists.zx2c4.com>; Fri, 11 Aug 2023 13:37:11 +0200 (CEST)
Received: from webmail01.netcup.net (unknown [46.38.249.153])
 by mx2f44.netcup.net (Postfix) with ESMTPA id CE40324067
 for <wireguard@lists.zx2c4.com>; Fri, 11 Aug 2023 13:37:06 +0200 (CEST)
Authentication-Results: mx2f44;
 spf=pass (sender IP is 46.38.249.153) smtp.mailfrom=wireguard@rtlblus.de
 smtp.helo=webmail01.netcup.net
Received-SPF: pass (mx2f44: connection is authenticated)
MIME-Version: 1.0
Date: Fri, 11 Aug 2023 13:37:06 +0200
From: wireguard@rtlblus.de
To: wireguard@lists.zx2c4.com
Subject: Is there a simplified Android User Interfaces on FireTV ?
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <88b63760dfb5fce218eb696d7048663a@rtlblus.de>
X-Sender: wireguard@rtlblus.de
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: <169175382711.11786.11477652511197564544@mx2f44.netcup.net>
X-Rspamd-Queue-Id: CE40324067
X-Rspamd-Server: rspamd-worker-8404
X-NC-CID: gI9SePMjFmfJh3U+PnKaP0P9ZELunEBel1o8Wlu6iGrMcLIN
X-Mailman-Approved-At: Wed, 23 Aug 2023 16:07:07 +0000
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
I'm not quite sure if this is a real bug, but I only get to a simplified 
GUI on the FireTV instead of the one I'm usually used to from Andoird. 
Only when I reinstall the apk and open it right after, I get the usual 
GUI with settings options.

┌──────────────────────────────────────────────────────────────────────────────────────┐
│                     ┌────────────────────────────────────────┐         
               │
│                     │        WireGuard                       │         
               │
│                     │     FAST, MODERN, SECURE VPN TUNNEL    │         
               │
│                     └────────────────────────────────────────┘         
               │
│  ┌──────────────────────┐                                              
               │
│  │  NAME                │                                              
               │
│  │  x MB/ y MB          │                                              
               │
│  │                      │                                              
               │
│  └──────────────────────┘                                              
               │
│                                                                        
               │
│                                                                        
               │
│                                                                        
               │
│                                                                        
               │
│                                                                        
               │
│  ┌───────┐                                                             
      ┌──────┐ │
│  │ Trash │                                                             
      │  +   │ │
│  └───────┘                                                             
      └──────┘ │
└──────────────────────────────────────────────────────────────────────────────────────┘
https://ibb.co/fn17PwD

but i want/need the "normal" GUI (https://ibb.co/qW0BG7B) with the Split 
Option for specific apps (https://ibb.co/chCb7sY)

Thanks in advance
