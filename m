Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FBFDECAAD3
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  4 Sep 2022 16:58:05 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 282e29e0;
	Sun, 4 Sep 2022 16:58:03 +0000 (UTC)
Received: from mx-rz-3.rrze.uni-erlangen.de (mx-rz-3.rrze.uni-erlangen.de
 [2001:638:a000:1025::16])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 4fb510ca
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 30 Aug 2022 12:07:08 +0000 (UTC)
Received: from mx-exchlnx-3.rrze.uni-erlangen.de
 (mx-exchlnx-3.rrze.uni-erlangen.de [IPv6:2001:638:a000:1025::39])
 by mx-rz-3.rrze.uni-erlangen.de (Postfix) with ESMTP id 4MH5dl6fvgz20f8
 for <wireguard@lists.zx2c4.com>; Tue, 30 Aug 2022 14:07:07 +0200 (CEST)
Authentication-Results: mx-rz-3.rrze.uni-erlangen.de; dkim=none;
 dkim-atps=neutral
X-Virus-Scanned: amavisd-new at boeck5.rrze.uni-erlangen.de (RRZE)
X-RRZE-Flag: Not-Spam
Received: from mbx6.exch.uni-erlangen.de (mbx6.exch.uni-erlangen.de
 [10.15.8.48])
 by mx-exchlnx-3.rrze.uni-erlangen.de (Postfix) with ESMTP id 4MH5dj4VNDz20kW
 for <wireguard@lists.zx2c4.com>; Tue, 30 Aug 2022 14:07:05 +0200 (CEST)
Received: from mbx7.exch.uni-erlangen.de (10.15.8.49) by
 mbx6.exch.uni-erlangen.de (10.15.8.48) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.29; Tue, 30 Aug 2022 14:07:02 +0200
Received: from [131.188.158.211] (131.188.158.211) by
 mbx7.exch.uni-erlangen.de (10.15.8.49) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.29; Tue, 30 Aug 2022 14:07:02 +0200
Message-ID: <b3f6decc-4622-a15c-dab6-57f58a5abcb7@audiolabs-erlangen.de>
Date: Tue, 30 Aug 2022 14:07:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Content-Language: en-US
To: <wireguard@lists.zx2c4.com>
From: Nils Werner <nils.werner@audiolabs-erlangen.de>
Subject: wg-quick@.service argument prevents configs in non-standard locations
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [131.188.158.211]
X-ClientProxiedBy: mbx6.exch.uni-erlangen.de (10.15.8.48) To
 mbx7.exch.uni-erlangen.de (10.15.8.49)
X-Mailman-Approved-At: Sun, 04 Sep 2022 16:58:02 +0000
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

right now `wg-quick@.service` uses the lines

     ExecStart=/usr/bin/wg-quick up %i
     ExecStop=/usr/bin/wg-quick down %i
     ExecReload=/bin/bash -c 'exec /usr/bin/wg syncconf %i <(exec 
/usr/bin/wg-quick strip %i)'

to interact with `wq-quick`.

The use of `%i` only allows the use of INTERFACE names, e.g.

     systemctl up wg-quick@wg0

but prevents users of passing CONFIG_FILE paths, e.g.

     systemctl up wg-quick@-home-me-configs-wg0.conf

because `-home-me-configs-wg0.conf` does not get unescaped to 
`/home/me/configs/wg0.conf`.

By replacing the first two lines with

     ExecStart=/usr/bin/wg-quick up %I
     ExecStop=/usr/bin/wg-quick down %I

would allow such usage.

The third line however is a bit tricky, as the argument to `wg syncconf` 
is expected to be an INTERFACE name, and the argument to `wg-quick 
strip` can also be a CONFIG_FILE path.

I am not sure how to solve the `ExecReload` argument issue, but I think 
having the option to also pass in CONFIG_FILE paths to the unit would be 
quite helpful.

Best
-- 
Nils Werner
