Return-Path: <SRS0=UgTS=M7=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2451EC432BE
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  8 Aug 2021 22:59:02 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1964F60F42
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  8 Aug 2021 22:59:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1964F60F42
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ut1.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 63e4494b;
	Sun, 8 Aug 2021 22:56:41 +0000 (UTC)
Received: from vidar.ut-capitole.fr (vidar-alt-1.ut-capitole.fr
 [193.49.48.246])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 73eb631d
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 13 Jul 2021 14:59:35 +0000 (UTC)
Received: from [10.26.2.40] (a19600.ut-capitole.fr [10.26.2.40])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: bandry)
 by vidar.ut-capitole.fr (Postfix) with ESMTPSA id B88B240C0980
 for <wireguard@lists.zx2c4.com>; Tue, 13 Jul 2021 16:59:34 +0200 (CEST)
To: wireguard@lists.zx2c4.com
From: Bruno UT1 <bandry@ut1.org>
Subject: Windows Client - issue with LimitedOperatorUI rights
Message-ID: <fb69332b-a210-179a-4692-995f8dc19b5b@ut1.org>
Date: Tue, 13 Jul 2021 16:59:30 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Mailman-Approved-At: Sun, 08 Aug 2021 22:56:39 +0000
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

Hi !

I install Wireguard Client on Windows 10 systems.

My users are not administrators, so the registry key LimitedOperatorUI 
is set to 1.

My issue is that the client has to run at least once as administrator to 
work for "Network Configuration Operators".

My script adds users to the administrative group, create the registry 
key then installs Wireguard Client:

  - If i don't use the parameter |DO_NOT_LAUNCH, |I have a popup telling 
me I need administrator rights. I don't want that popup, be everything 
works after a reboot.

  - If I use the parameter |DO_NOT_LAUNCH,| ||I don't have the popup but 
Wireguard don't start, even after a reboot. If I run Wireguard as 
administrator, it's unlocked for other users.

  - A third possibility is to install the client after a reboot, so the 
rights are good, |DO_NOT_LAUNCH |is not needed and no popup appears. But 
I don't want to force that reboot (I use SCCM and it don't like reboots 
before install is complete).

So I think there is a first start issue that needs administrator rights 
even with LimitedOperatorUI  active.

Regards,

Bruno

ps: I send another message (06/28) for another issue. I received "Your 
message to WireGuard awaits moderator approval" but message isn't posted 
and i got no notification from the moderator. Am I doing something wrong ?
||

