Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A3B0CD3427
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  5 May 2026 16:47:38 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 57e60495;
	Tue, 5 May 2026 16:47:37 +0000 (UTC)
Received: from smtp94.iad3a.emailsrvr.com (smtp94.iad3a.emailsrvr.com
 [173.203.187.94])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 8b68ff68
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 5 May 2026 16:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=uekermann.me;
 s=20230325-gcqqzkht; t=1777999654;
 bh=CMBSqkRbZOIY5Cl1prev+CjuC5BIBx1QiT9RBnFYX9I=;
 h=Date:Subject:To:From:From;
 b=oznXW9WtMCckvDjceIvpare0qz8EYDlb3/bLg3hObtfE9C8rvQBlRGtVQQ88Pwg5m
 yhxh5YIX6ZuG5Xw5n+9eKW+vnU0V7GDyM7QPWoUJcvE2LqqwAluoO3T1BBYG0kE6iS
 q5oyKR44TGlY8J/T+9GPoqNdaIw57hsKm4qMBLdw=
X-Auth-ID: florian@uekermann.email
Received: by smtp28.relay.iad3a.emailsrvr.com (Authenticated sender:
 florian-AT-uekermann.email) with ESMTPSA id 3CB86545C; 
 Tue,  5 May 2026 12:47:34 -0400 (EDT)
Message-ID: <8358be3e-d696-454e-a970-2305f23fce2f@uekermann.me>
Date: Tue, 5 May 2026 18:47:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wg-quick: fix darwin MTU detection
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: wireguard@lists.zx2c4.com, A Jonas <jonas@chaincode.com>,
 Carl Dong <carl@obscura.net>
References: <20251020142254.16546-2-florian@uekermann.me>
 <afiJFxeMxJw-n9-G@zx2c4.com>
Content-Language: en-US
From: Florian Uekermann <florian@uekermann.me>
In-Reply-To: <afiJFxeMxJw-n9-G@zx2c4.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Classification-ID: 69a80a89-da65-4e4d-a219-db3de78ccc37-1-1
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

Hi Jason,

Thanks for following up.

On 04/05/2026 13:55, Jason A. Donenfeld wrote:

> If you're submitting a patch with your name on it, please do the
> research to make sure it's correct! Otherwise, what you're submitting is
> more of a bug report than a patch.

Please treat this as a bug report. That's why I added the disclaimer.

I tried a number of different things before sending this patch with ack,
because I wasn't able to get the bug report through the filter (mailing 
list,
mod-mail) or noticed (IRC, Github) after many failed attempts to report it.
Some avenue for drive-by bug reports may be beneficial (maybe Github 
issues).
I had given up on reporting this until your reply. Anyway, happy you saw 
this now.

> Should this be changed for the other invocations of `netstat -nr -f ...`
> in the code? It's a bit confusing because in del_route(), it looks like
> the first invocation (for inet) is aware that it's the 6th parameter,
> while the second invocation (for inet6) seems to stick with this
> presumption that it's the 4th. So what's going on here?

I also suspect del_route needs to be adjusted too, but I have no idea 
what's going on here.

> I'd like to get to the bottom of this before applying this patch. When
> you submit a v2, please include your explanation as part of the commit
> message.

Sorry, I'm not very familiar with the Apple ecosystem and can't figure 
out what exactly happened or should be done here with the necessary 
confidence. Please just take this as a bug report.

Best regards,
Florian
