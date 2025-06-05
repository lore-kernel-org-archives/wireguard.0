Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07046C5B543
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  5 Jun 2025 12:07:19 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 16adc46b;
	Thu, 5 Jun 2025 12:05:02 +0000 (UTC)
Received: from nt.romanrm.net (nt.romanrm.net [2a0b:8bc0:1:1cd::1])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id fca490ab
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 5 Jun 2025 12:05:00 +0000 (UTC)
Received: from nvm (umi.2.romanrm.net
 [IPv6:fd39:a37d:999f:7e35:7900:fcd:12a3:6181])
 by nt.romanrm.net (Postfix) with SMTP id D205240EA4;
 Thu,  5 Jun 2025 12:04:59 +0000 (UTC)
Date: Thu, 5 Jun 2025 17:04:59 +0500
From: Roman Mamedov <rm@romanrm.net>
To: Andre Tann <atann@alphasrv.net>
Cc: wireguard@lists.zx2c4.com
Subject: Re: Delay in ipv6
Message-ID: <20250605170459.43439532@nvm>
In-Reply-To: <7e977585-5b93-4591-94f7-bf33c8923543@alphasrv.net>
References: <7e977585-5b93-4591-94f7-bf33c8923543@alphasrv.net>
X-Mailer: Claws Mail 3.11.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

On Wed, 4 Jun 2025 16:53:33 +0200
Andre Tann <atann@alphasrv.net> wrote:

> Hi all,
> 
> I hope this is not offtopic here. If so, pls let me know a better place 
> for this question.
> 
> I configured wireguard to route both IPv4 and IPv6. Both protocols work 
> fine. But test-ipv6.com only gives 9/10 points because the browser does 
> not use IPV6 even though it is available.
> 
> Then I investigated a bit and found this:
> 
> ping -4 dns.google => ping sequence starts immediately
> ping -6 dns.google => .5 secs delay => ping sequence starts
> ping -6 dns.google => ping sequence starts immediately
> 
> i.e.: On the first try, ping6 takes longer, but the second time there is 
> no delay anymore.

Hello,

Which DNS resolvers do you use?
Try 8.8.8.8 or 1.1.1.1 at first, and then their v6 equivalents.

> I suspected DNS trouble, but pinging 2001:4860:4860::8844 shows the 
> exact same behavior: delay the first time, no delay next time.

This might be caused by DNS again, trying to resolve PTR record for the IP.

Recheck if "ping -n" starts in this case without a delay.

-- 
With respect,
Roman
