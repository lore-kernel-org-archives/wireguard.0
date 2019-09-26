Return-Path: <SRS0=F87Q=YJ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7C3BECE599
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 16 Oct 2019 20:15:45 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 997ED20659
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 16 Oct 2019 20:15:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 997ED20659
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=martini.nu
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 095bdb08;
	Wed, 16 Oct 2019 20:15:29 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ed33b7dd
 for <wireguard@lists.zx2c4.com>;
 Thu, 26 Sep 2019 21:49:17 +0000 (UTC)
Received: from martini.nu (martini.nu [69.163.39.203])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with SMTP id 57f078fa
 for <wireguard@lists.zx2c4.com>;
 Thu, 26 Sep 2019 21:49:17 +0000 (UTC)
Received: (qmail 23422 invoked by uid 1000); 26 Sep 2019 21:49:16 -0000
Date: Thu, 26 Sep 2019 14:49:16 -0700
From: "Mahlon E. Smith" <mahlon@martini.nu>
To: wireguard@lists.zx2c4.com
Subject: Android 10 and DNS
Message-ID: <20190926214916.7zazh6nzzxuqcwl4@martini.nu>
MIME-Version: 1.0
Content-Disposition: inline
X-GPG-Fingerprint: 1F7E 39D8 BDEA E34B 1169  F285 0741 7A1E E630 75D2
X-GPG-Key: http://martini.nu/misc/key.txt
X-Sysinfo: FreeBSD 12.0-RELEASE-p5 amd64
User-Agent: NeoMutt/20180716
X-Mailman-Approved-At: Wed, 16 Oct 2019 22:15:27 +0200
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


Heya all.  New to the list, apologies for not continuing this
conversation on the thread at:

    https://lists.zx2c4.com/pipermail/wireguard/2019-September/004498.html


We're piloting Wireguard at my $dayjob, and so far it has been working
extremely well.  One of our testers just upgraded to Android 10, and
reported that it no longer was functional after the update.

I confirmed he -is- actually negotiated, and can reach across the VPN
without issue.  He can't resolve anything, however.

(We installed Termux and the dnsutils package -- resolution works fine
manually with the 'host' utility and the servers we've specified in the
config -- just not working transparently, which is a deal breaker for
our end users.)


I'm not sure what else to gather that would be helpful.  It appears
Wireguard is no longer using the 'DNS =' client config under 10.

--
Mahlon E. Smith  
http://www.martini.nu/
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
