Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D915BC43217
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 21 Apr 2022 23:48:49 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 31550d8b;
	Thu, 21 Apr 2022 23:48:49 +0000 (UTC)
Received: from mail.rail.eu.org (ice.rail.eu.org [176.9.10.153])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 1f53bcaf
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 26 Mar 2022 20:27:18 +0000 (UTC)
Received: from [192.168.1.125] (82-64-145-131.subs.proxad.net [82.64.145.131])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: erwan)
 by mail.rail.eu.org (Postfix) with ESMTPSA id 319F33BCC
 for <wireguard@lists.zx2c4.com>; Sat, 26 Mar 2022 21:27:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=rail.eu.org; s=mail;
 t=1648326438; bh=pJKufqFZnj4GRIADtwpx+VtgF+tyn01noF9qTWWBcog=;
 h=Date:To:From:Subject:From;
 b=uqQOc3KfdKywrbfs4dJ0wZpe39baoZwbmkNPEbTfhjudMvJsXI8Jf+wnpITknZBDf
 5iH0sHf2UUvtHUhCmYOIS67nQaPSSCMTBKEGWGacHiB1HPmZh04Ey5j9Ony2irOexk
 6gdudPjc/yTpdf2SQjwb8TpMY9rwiPF4vegNHyu4=
Message-ID: <91765b65-5daa-c699-4a72-b59b0f6f9ebb@rail.eu.org>
Date: Sat, 26 Mar 2022 21:27:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: fr
To: Wireguard <wireguard@lists.zx2c4.com>
From: Erwan David <erwan@rail.eu.org>
Subject: Choosing local IP address
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Thu, 21 Apr 2022 23:48:42 +0000
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

Hello

I have a wireguard setup between my home router (and the home network 
behind) and a distant FreeBSD servers with several jails.

I use IPv6 fir transport, but I have a routing problem because whan at 
home I need to ssh to the server, and if I use for endpoint address (on 
the home router) the main IPv6 address it ends up with a traffic half 
out of the tunnel (from home to server), and half in the tunnel (from 
server to home).


So I chose to add an IPv6 address to the server, route it outside the 
tunnel and use it only for the tunnel. But I cannot specify to wireguard 
on the server to use this address, thus I get packets from the main 
address, my router changes the endpoint address and tunnel does not work.

How can I say to wireguard which IP address to use when sending ths 
encrypted packets to the endpoint ?


-- 
Erwan


