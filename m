Return-Path: <SRS0=nfW+=NA=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 895C1C67863
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 20 Oct 2018 21:00:05 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 73575216C4
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 20 Oct 2018 21:00:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 73575216C4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=powerneth.ro
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 82518ade;
	Sat, 20 Oct 2018 20:56:58 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f0760cbf
 for <wireguard@lists.zx2c4.com>;
 Sat, 20 Oct 2018 20:56:56 +0000 (UTC)
Received: from mail.insteeldesign.ro (mail.crimel.ro [109.166.220.71])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c6fcd939
 for <wireguard@lists.zx2c4.com>;
 Sat, 20 Oct 2018 20:56:56 +0000 (UTC)
Received: from [192.168.123.118] (unknown [188.26.79.221])
 by mail.insteeldesign.ro (Postfix) with ESMTPSA id 13B4522222AD
 for <wireguard@lists.zx2c4.com>; Sat, 20 Oct 2018 23:59:11 +0300 (EEST)
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
From: Lucian Cristian <luci@powerneth.ro>
Subject: wireguard dkms systemd
Message-ID: <0e93f5b4-8883-57e4-0114-42f0bfd5f6c3@powerneth.ro>
Date: Sat, 20 Oct 2018 23:59:17 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
Content-Language: en-US
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

updating the wireguard module on systemd based linux gives

Warning: The unit file, source configuration file or drop-ins of 
wg-quick@wg0.service changed on disk. Run 'systemctl daemon-reload' to 
reload units.
Sleeping 3 seconds...

can this be fixed int the restart script ?

the tunnel won't come up if the unit is not reloaded

Thank you !

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
