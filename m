Return-Path: <SRS0=Zxtj=MY=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D6FDC4338F
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  1 Aug 2021 08:38:01 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AC6FE61057
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  1 Aug 2021 08:37:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AC6FE61057
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=tls.msk.ru
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 48f70304;
	Sun, 1 Aug 2021 08:37:52 +0000 (UTC)
Received: from isrv.corpit.ru (isrv.corpit.ru [86.62.121.231])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id c1be9e3e
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sun, 1 Aug 2021 08:37:48 +0000 (UTC)
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id AE77A4000A
 for <wireguard@lists.zx2c4.com>; Sun,  1 Aug 2021 11:37:47 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 546A2DE
 for <wireguard@lists.zx2c4.com>; Sun,  1 Aug 2021 11:31:53 +0300 (MSK)
To: wireguard@lists.zx2c4.com
From: Michael Tokarev <mjt@tls.msk.ru>
Subject: names in wireguard.conf & bringing interface up
Message-ID: <e9d6a689-9e8e-9b77-3657-15bb11c3205c@msgid.tls.msk.ru>
Date: Sun, 1 Aug 2021 11:37:47 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
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

Hello.

We're having fun issue with wireguard at boot.

The thing is that there are a few "Endpoint" settings
in wg.conf which are names, not IP addresses - names
which are being resolved over DNS.

The problem is that DNS startup is scheduled AFTER the
interfaces are up, but in order to bring interfaces up,
we're waiting for DNS.

For the wg interface to be up there's no need to resolve
names. Yet `wg setconf' insists on resovling everything.

As the result, system waits (deadwaits) for quite some
time and does not bring wg interfaces up, resulting in
network being !up.

Like this:
...
ifup[952]: Temporary failure in name resolution: `wg.corpit.ru:51820'. Trying again in 7.43 seconds...
ifup[952]: Temporary failure in name resolution: `wg.corpit.ru:51820'. Trying again in 8.92 seconds...
ifup[952]: Temporary failure in name resolution: `wg.corpit.ru:51820'. Trying again in 10.70 seconds...
ifup[952]: Temporary failure in name resolution: `wg.corpit.ru:51820'. Trying again in 12.84 seconds...
ifup[952]: Temporary failure in name resolution: `wg.corpit.ru:51820'
ifup[952]: Configuration parsing error
ifup[530]: ifup: failed to bring up wgtls

We used tinc before trying out wireguard. In tinc, we had
an asyncronous DNS resolution which continued as long as
the daemon is running (and since the daemon must run all
the time the tunnel is up, it were always running - unlike
wg). So the DNS resolution has always worked.

Now I wonder how I can solve this.  Maybe I can configure
the basic interface parameters (local IP address/netmask,
routes, etc), and try to actually set all the info about
remotes in the background somehow?

But this still looks quite fragile - we should not fail to
bring whole thing up even if we can't connect to just one
endpoint, - this way we also can't connect TO the server to
fix things if the tunnel is the only way to log in.  All
local config does not require any DNS or other remote info,
only the few "connect to this remote" require it.

Please note that we can't connect TO this server from the outside
even if I put process of configuring the peer into background,
until everything is working.

I also tried to split configuration into two parts, one which
require some network access and one which doesn't, but this
way commands like syncconf does not work anymore, obviously -
we can't change configuration at runtime and reload it.

Comments?

Thanks,

/mjt
