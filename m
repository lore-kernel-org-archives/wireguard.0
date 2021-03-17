Return-Path: <SRS0=bERg=IP=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15177C433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 17 Mar 2021 15:30:11 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0006164FBB
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 17 Mar 2021 15:30:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0006164FBB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=tls.msk.ru
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 90a874f5;
	Wed, 17 Mar 2021 15:28:09 +0000 (UTC)
Received: from isrv.corpit.ru (isrv.corpit.ru [86.62.121.231])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 183a9ecf
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 17 Mar 2021 15:28:07 +0000 (UTC)
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 79D5840375
 for <wireguard@lists.zx2c4.com>; Wed, 17 Mar 2021 18:28:06 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 669E48C
 for <wireguard@lists.zx2c4.com>; Wed, 17 Mar 2021 18:28:06 +0300 (MSK)
To: wireguard@lists.zx2c4.com
From: Michael Tokarev <mjt@tls.msk.ru>
Subject: occasional stalls of a WG tunnel
Message-ID: <5b24bcef-79ef-dfa1-9686-4a644f3aa88d@msgid.tls.msk.ru>
Date: Wed, 17 Mar 2021 18:28:06 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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

Hi!

We're experiencing occasional stalls of a single (so far)
node in a star-like configuration.

The server in the center is a linux system with kernel 5.10.13
with a built-in wireguard module.  The client is a windows machine
with current wireguard software installed from the site.

Sometimes (which happened 3 times already), the tunnel stops
working, - no traffic goes within the tunnel as far as I can
see.  I'm not sure yet if the encrypted packets are flowing
between the two nodes, - at least the linux system is sending
them but I can't say for sure if the windows system does the
same, - this is something for me to watch the next time it
happens.

What can cure the tunnel immediately is a simple "refresh"
command, -

  wg setconf $if /etc/wireguard/$if.conf

- this makes the whole tunnel operational again immediately.

Other nodes of the tunnel are unaffected by this (except of
the momentary drop of service during the setconf operation
and the reconnect each node is doing after that).

The question is: how can I debug what's going on the next
time this happens, besides watching more closely which packets
are flowing?

Thanks,

/mjt
