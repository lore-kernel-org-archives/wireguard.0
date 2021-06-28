Return-Path: <SRS0=UgTS=M7=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE70AC4338F
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  8 Aug 2021 22:59:00 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9840E60F42
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  8 Aug 2021 22:58:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9840E60F42
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ut1.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c5f5dc9e;
	Sun, 8 Aug 2021 22:56:16 +0000 (UTC)
Received: from vidar.ut-capitole.fr (vidar-alt-1.ut-capitole.fr
 [193.49.48.246])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 0c40d071
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 28 Jun 2021 13:44:57 +0000 (UTC)
Received: from [10.26.2.40] (a19600.ut-capitole.fr [10.26.2.40])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: bandry)
 by vidar.ut-capitole.fr (Postfix) with ESMTPSA id F00F640C0981
 for <wireguard@lists.zx2c4.com>; Mon, 28 Jun 2021 15:44:56 +0200 (CEST)
Subject: Windows Client - Issue with Tray Icon
References: <437b77e7-7e63-74c4-4447-713eccd42b59@ut-capitole.fr>
To: wireguard@lists.zx2c4.com
From: Bruno UT1 <bandry@ut1.org>
X-Forwarded-Message-Id: <437b77e7-7e63-74c4-4447-713eccd42b59@ut-capitole.fr>
Message-ID: <7587bd77-a81c-0488-90b5-eac7ed98a3db@ut1.org>
Date: Mon, 28 Jun 2021 15:44:56 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <437b77e7-7e63-74c4-4447-713eccd42b59@ut-capitole.fr>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: fr
X-Mailman-Approved-At: Sun, 08 Aug 2021 22:56:14 +0000
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

Hi Wireguard Community!

I think I found a small bug with Wireguard Windows Client. I made tests 
with version 0.3.14, 0.3.15 and 0.3.16 with the same behavior.

My users are not administrators, so the registry key LimitedOperatorUI 
is set to 1.

I made a script with wireguard.exe /installtunnelservice to 
automatically open the tunnel on some conditions. The script runs as 
administrator.

When the script starts, the tunnel is opened and the status is Active in 
the main Window but the stays off on the tray.

If the computer reboot, everything is back to normal but I can't force a 
reboot.

Without the reboot, if the user try to activate the tunnel from the tray 
in fact the already opened tunnel is closed. After that, the tray has 
the good status again, but it disturbs the users.

It's probably the fact that two distinct users are involved. Is there a 
possibility to synchronize the status?

Thank you for this great VPN,

Regards.

Bruno

