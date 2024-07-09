Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5102C2BD09
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  9 Jul 2024 08:25:58 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id aa7619d1;
	Tue, 9 Jul 2024 08:23:31 +0000 (UTC)
Received: from mx2.heinlein-support.de (mx2.heinlein-support.de
 [91.198.250.20])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id c9c6fbdf
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 9 Jul 2024 08:23:27 +0000 (UTC)
Received: from marchiv.heinlein-support.de (marchiv.heinlein-support.de
 [91.198.250.63])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mx2.heinlein-support.de (Postfix) with ESMTPS id 46C0B2E0B4E
 for <wireguard@lists.zx2c4.com>; Tue,  9 Jul 2024 10:23:15 +0200 (CEST)
Received: from MailAppDispatcher (localhost.localdomain [127.0.0.1])
 by marchiv.heinlein-support.de (Postfix) with ESMTP id F0D2748148
 for <wireguard@lists.zx2c4.com>; Tue,  9 Jul 2024 10:23:14 +0200 (CEST)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by marchiv.heinlein-support.de (Postfix) with ESMTP id D15F348172
 for <wireguard@lists.zx2c4.com>; Tue,  9 Jul 2024 10:23:14 +0200 (CEST)
X-Virus-Scanned: Heinlein Anti-Spam at mail-archiv
Received: from marchiv.heinlein-support.de ([127.0.0.1])
 by localhost (marchiv.heinlein-support.de [127.0.0.1]) (amavisd-new,
 port 10024)
 with ESMTP id fMFbjiyqMgAp for <wireguard@lists.zx2c4.com>;
 Tue,  9 Jul 2024 10:23:10 +0200 (CEST)
Received: from plasma4.jpberlin.de (plasma4.jpberlin.de [80.241.57.33])
 by marchiv.heinlein-support.de (Postfix) with ESMTPS
 for <wireguard@lists.zx2c4.com>; Tue,  9 Jul 2024 10:23:10 +0200 (CEST)
Received: from [192.168.102.183] (i689719B5.versanet.de [104.151.25.181])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 (Authenticated sender: r.sander@heinlein-support.de)
 by plasma.jpberlin.de (Postfix) with ESMTPSA id ADC94C3641
 for <wireguard@lists.zx2c4.com>; Tue,  9 Jul 2024 10:23:10 +0200 (CEST)
Message-ID: <5f5fe5f9-fa9d-4d11-a33f-9d7e326823f5@heinlein-support.de>
Date: Tue, 9 Jul 2024 10:23:10 +0200
MIME-Version: 1.0
To: wireguard@lists.zx2c4.com
Content-Language: en-US, de-DE
From: Robert Sander <r.sander@heinlein-support.de>
Subject: disable roaming?
Autocrypt: addr=r.sander@heinlein-support.de; keydata=
 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
 Wy3fgftV2MQ=
Organization: Heinlein Consulting GmbH
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailarchiv-ID: 9905716
X-MBO-SPAM-Probability: 
X-Rspamd-Score: -8.93 / 15.00 / 15.00
X-Rspamd-Queue-Id: 46C0B2E0B4E
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

I want to setup a wg tunnel between an office and a pair of routers 
which use keepalived for a service IP.

The office router would have the service IP in its config.

As soon as the IP failover happens between the two routers the office 
router gets a new peer address for its connection (which is not reachable).

How do I disable the wireguard roaming on the server side?

Wireguard on the office router should always connect to the service IP.
Both routers have the same private/public key so that should be possible.

Regards
-- 
Robert Sander
Heinlein Consulting GmbH
Schwedter Str. 8/9b, 10119 Berlin

https://www.heinlein-support.de

Tel: 030 / 405051-43
Fax: 030 / 405051-19

Amtsgericht Berlin-Charlottenburg - HRB 220009 B
Geschäftsführer: Peer Heinlein - Sitz: Berlin
