Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32DEAC433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 24 Nov 2021 15:21:56 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id d8039a0b;
	Wed, 24 Nov 2021 15:21:54 +0000 (UTC)
Received: from vidar.ut-capitole.fr (<unknown> [193.49.48.246])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id e091c6e1
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 24 Nov 2021 15:21:49 +0000 (UTC)
Received: from [10.172.1.6] (wg-a19600.ut-capitole.fr [10.172.1.6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: bandry)
 by vidar.ut-capitole.fr (Postfix) with ESMTPSA id 8866540BF7A5
 for <wireguard@lists.zx2c4.com>; Wed, 24 Nov 2021 16:21:28 +0100 (CET)
Message-ID: <1da227e6-5b12-40ca-a6de-3117835a2f16@ut1.org>
Date: Wed, 24 Nov 2021 16:21:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Content-Language: en-US
To: wireguard@lists.zx2c4.com
From: Bruno UT1 <bandry@ut1.org>
Subject: [Windows Client] Out of date Title scare my users
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

Thank you again for your great work.

I have a suggestion for the Windows Client (maybe applicable for others).

I install Wireguard in my university on about 500 computers in 2 phases:

Phase 1 : validation

Phase 2 : production

So my end users have not, most of the time, the last version. They have 
"Out of date" in the Wireguard window title and some of them call the 
helpdesk, thinking they have a problem.

I can't deploy all versions as soon as they are available, I can't 
activate automatic update and my users have no admin rights. So my 
suggestion is to add a new admin registry key to hide update, or not 
check them at all.

Is that possible ?

Regards

