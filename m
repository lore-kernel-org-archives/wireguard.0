Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1579BC27C4F
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 21 Jun 2024 09:18:54 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 54596ac5;
	Fri, 21 Jun 2024 09:18:52 +0000 (UTC)
Received: from mail.rekudos.net (mail.rekudos.net [212.227.211.217])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 76122f76
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 21 Jun 2024 09:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rekudos.net; s=20230217;
 t=1718961530;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gzN9EsrieFo7heZG9qEg8JDINrpNN77wWtLKZu/3wyc=;
 b=hEXZ+IScInzBbIMfSrb5nbGhBagaTOdZAwOueOlKTkZSnUWsjWSPLGb//PvVTAHrbv2noS
 oFwkKavk2quA4Xu8P7+u7HboqhPjoWuhfbU/ChdNhmC+3DEzaRWmYVUH6+dxLjBSezkz22
 FD47LAvaNNf81zcXkbS38rZZ1b2Rrik=
Received: from localhost (d.rekudos.net [local])
 by d.rekudos.net (OpenSMTPD) with ESMTPA id ab6ee07f;
 Fri, 21 Jun 2024 09:18:49 +0000 (UTC)
Date: Fri, 21 Jun 2024 09:18:49 +0000
From: Mark Lawrence <mark@rekudos.net>
To: Nohk Two <nohktwo@gmail.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: How to detect the IP CAM on LAN from WG tunnel ?
Message-ID: <ZnVFefPIvg5DFNnl@d.rekudos.net>
References: <384d1fdd-a32f-4839-bb8b-2761be363b50@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <384d1fdd-a32f-4839-bb8b-2761be363b50@gmail.com>
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

>How do you solve this problem ?

Iterative fact checking, from the lowest levels of the network stack 
to the highest.

     - Are the devices actually connected where you think they are?
         - With the tunnel disconnected, does your phone connect to the 
           camera?
     - Is your Wireguard tunnel set up properly?
         - Can your phone ping the wg0 address with the tunnel active?
         - Can your phone ping other .100 devices with the tunnel 
           active?
     - Does your eth0/wg0 machine have IP forwarding enabled?
         - sysctl net.ipv4.ip_forward=1
     - What does packet tracing show?
         - I.e. `ngrep -d wg0 .\* icmp` or the tcpdump equivalent, also 
           against eth0 for the wireguard UDP port.
     - Does the mobile App actually support remote (routed) cameras or 
       just on the local network?

-- 
Mark Lawrence
