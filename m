Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE150C05027
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 19 Feb 2023 17:03:03 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 858f02df;
	Sun, 19 Feb 2023 17:03:00 +0000 (UTC)
Received: from relay.yourmailgateway.de (relay.yourmailgateway.de
 [46.38.247.119])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 74ed9724
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 19 Feb 2023 14:32:16 +0000 (UTC)
Received: from mors-relay-8404.netcup.net (localhost [127.0.0.1])
 by mors-relay-8404.netcup.net (Postfix) with ESMTPS id 4PKSgM6Dvtz7wtQ
 for <wireguard@lists.zx2c4.com>; Sun, 19 Feb 2023 15:32:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fsoj.de; s=key2;
 t=1676817135; bh=peRTXqJFZGlv86j3g5utsBkjlOnM1suDyYDgGHrNF9g=;
 h=Date:From:To:Subject:From;
 b=dMpIMaouh/DfzSa3AQhe3/pN6an24cPkO2oYb/DDGZX1wsrlMK2fgR5JvonqgSxqx
 48F8bJLilvrBIj/NLn9WAbGtOe/Zdj7m5KU8Dm4LHM7yaNfWuWkwKyyje3gHMStIqj
 BVArksdputvdLrUUXjtdnW8w8wZvs62YOhEwUEQzdvxZ3bEI9UrJb5owta31Lqvnzk
 jozApxlmHMkPsg24MyNRFfRudUIVkmo6oWB1mbSqfGnDVoiaIRGnlbXlYIsGTQHXFa
 HnQ0EPOxPOilNi40h0Sa+4hrrwsC399GkxJTcjsrwmNfgWcDQYy17I6hMAVNtIs/ri
 ++jZbzLI1HGHw==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
 by mors-relay-8404.netcup.net (Postfix) with ESMTPS id 4PKSgM5rTrz4xWZ
 for <wireguard@lists.zx2c4.com>; Sun, 19 Feb 2023 15:32:15 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at policy02-mors.netcup.net
Received: from mx2f1d.netcup.net (unknown [10.243.12.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by policy02-mors.netcup.net (Postfix) with ESMTPS id 4PKSgL3TJcz8sv7
 for <wireguard@lists.zx2c4.com>; Sun, 19 Feb 2023 15:32:14 +0100 (CET)
Received: from [IPV6:2a01:c23:7904:c000:5d0f:9806:2ef4:e837]
 (dynamic-2a01-0c23-7904-c000-5d0f-9806-2ef4-e837.c23.pool.telefonica.de
 [IPv6:2a01:c23:7904:c000:5d0f:9806:2ef4:e837])
 by mx2f1d.netcup.net (Postfix) with ESMTPSA id 388A46074F
 for <wireguard@lists.zx2c4.com>; Sun, 19 Feb 2023 15:32:09 +0100 (CET)
Authentication-Results: mx2f1d;
 spf=pass (sender IP is 2a01:c23:7904:c000:5d0f:9806:2ef4:e837)
 smtp.mailfrom=luhe@fsoj.de
 smtp.helo=[IPV6:2a01:c23:7904:c000:5d0f:9806:2ef4:e837]
Received-SPF: pass (mx2f1d: connection is authenticated)
Message-ID: <4f87360e-acd3-3e0c-ad54-8cf3c54b6b4f@fsoj.de>
Date: Sun, 19 Feb 2023 15:32:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
From: Luca Heise <luhe@fsoj.de>
To: wireguard@lists.zx2c4.com
Subject: Missing translation keys from recent on-demand updates
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-PPP-Message-ID: <167681712944.19982.1155515102352984202@mx2f1d.netcup.net>
X-PPP-Vhost: fsoj.de
X-Rspamd-Queue-Id: 388A46074F
X-Spamd-Result: default: False [-1.20 / 15.00]; BAYES_HAM(-1.10)[81.79%];
 MIME_GOOD(-0.10)[text/plain]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+];
 ASN(0.00)[asn:6805, ipnet:2a01:c00::/26, country:DE];
 RCVD_COUNT_ZERO(0.00)[0]; RCPT_COUNT_ONE(0.00)[1];
 TO_DN_NONE(0.00)[]; MID_RHS_MATCH_FROM(0.00)[];
 FROM_HAS_DN(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 ARC_NA(0.00)[]
X-Rspamd-Server: rspamd-worker-8404
X-NC-CID: biDyzw2//GCanAGg9IQJ6Z2t6iTRfVguTSeLJiLO
X-Mailman-Approved-At: Sun, 19 Feb 2023 17:02:58 +0000
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

Hello,

I noticed that some translations are missing on macOS and iOS as just 
the translation-keys are shown.

According to a diff (at least) the following keys from the 
original/English version are neither in the German Localizable.strings 
nor in the German crowdin. Looks like this in other languages too.

All of these keys were added in the last updates, so I assume that they 
were just forgotten to be added.

tunnelListCaptionOnDemand
tunnelStatusAddendumOnDemand
tunnelStatusOnDemandDisabled
tunnelStatusAddendumOnDemandEnabled
tunnelStatusAddendumOnDemandDisabled
tunnelOnDemandSSIDTextFieldPlaceholder


I don't really know the translation process here. I think adding these 
keys to crowdin so people could start to translate would be the first 
step. Can anyone do that?

Luca
