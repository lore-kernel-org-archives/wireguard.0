Return-Path: <SRS0=YN3W=RD=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B969CC43381
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 28 Feb 2019 18:24:11 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 33A30218CD
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 28 Feb 2019 18:24:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 33A30218CD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bda.space
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 950947da;
	Thu, 28 Feb 2019 18:14:21 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id dc623c3a
 for <wireguard@lists.zx2c4.com>; Tue, 5 Feb 2019 18:10:18 +0000 (UTC)
Received: from bda.ath.cx (2600:3c03::f03c:91ff:fe96:7c1a
 [IPv6:2600:3c03::f03c:91ff:fe96:7c1a])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 00fe49e5
 for <wireguard@lists.zx2c4.com>; Tue, 5 Feb 2019 18:10:18 +0000 (UTC)
Received: from msi (c-73-50-250-202.hsd1.il.comcast.net [73.50.250.202])
 by bda.ath.cx (Postfix) with ESMTPSA id 55A3EC0A7
 for <wireguard@lists.zx2c4.com>; Tue,  5 Feb 2019 12:17:04 -0600 (CST)
Date: Tue, 5 Feb 2019 12:16:58 -0600
From: Bryce Allen <bryce@bda.space>
To: wireguard@lists.zx2c4.com
Subject: bind to specific ip address
Message-ID: <20190205121658.1973fd89@msi>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 28 Feb 2019 19:14:20 +0100
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Hi,

I have run into several wifi networks that block almost all traffic,
allowing only 80/443 and 53. To work around this, I got a second IP
address for my linode server, intending to run ssh on port 80 and
wireguard on 53. This works for ssh, which I set up to bind on port 80
to the new IP only, so it doesn't interfere with nginx on my main IP.

It looks like wireguard doesn't support binding to a specific address?
I understand the security and routing do not require binding to a
specific address, but I think it is useful for scenarios like this.
When I try to bring up the wg interface with ListenPort 53 in my
config, with unbound already running on 53 at other addresses, I get
"RTNETLINK answers: Address already in use\nFailed to bring up
wg-server.". The interface is still created, but the tunnel doesn't
work. I also had to manually delete the interface with "ip link del
wg-server" before I could bring it back up with the config changed back
to the original port.

I'm guessing that doing deep packet inspecion is too expensive /
overkill for a mall wifi, so I do think this workaround of using
port 53 would work. Is this address binding a feature that you would
consider adding to wireguard, or would accept a patch for? Any other
ideas for working around obnoxious firewalls?

Thanks,
Bryce
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
