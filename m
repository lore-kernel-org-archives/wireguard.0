Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B22BEC54ED1
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 21 May 2025 16:10:13 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cf6c662f;
	Tue, 20 May 2025 19:43:08 +0000 (UTC)
Received: from orbyte.nwl.cc (orbyte.nwl.cc [2001:41d0:e:133a::1])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id cb762137
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 21 Mar 2025 11:42:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nwl.cc;
 s=mail2022; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=SUatzUQOETLhyGOv5BeLJaiThxY9I/fVLvbux0oPWl4=; b=Fp6eyCEn+kDEMEmPcxnB+sYMTk
 GvmbJdhOOPpfrsHFIDcPJcNOwBj04mwOH13z2F7r06DT+NYoDV+e+2024/qY9cX/XkQzj/oXit1NU
 8B9LMAd67NghAhQ8AwWojqsRKNXJQLiBE2lJ7lI4oreusm0e+akEp7fh7A6agov+192p051BMckMg
 kGsnJf5YE8W1Sk2VSs8QmInKyKKXtUcEWZ35CpfswcHdfB4PlbzMoq6IuH/gfZHB5Hg8Jizr1Cli/
 6m2gY2UEOjjwUWbAo8aIXSrg05K+PgIDspLu8mHU3eks1XvDjk+joBTMzWOO01KF3s0dmRi6E7YAs
 DafGgLdQ==;
Received: from n0-1 by orbyte.nwl.cc with local (Exim 4.97.1)
 (envelope-from <phil@nwl.cc>) id 1tvalu-000000001kr-4BEA;
 Fri, 21 Mar 2025 12:42:43 +0100
Date: Fri, 21 Mar 2025 12:42:42 +0100
From: Phil Sutter <phil@nwl.cc>
To: Hangbin Liu <liuhangbin@gmail.com>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, netdev@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Shuah Khan <shuah@kernel.org>,
 "David S. Miller" <davem@davemloft.net>,
 Simon Horman <horms@kernel.org>, Florian Westphal <fw@strlen.de>,
 Petr Mladek <pmladek@suse.com>,
 Yoann Congal <yoann.congal@smile.fr>, wireguard@lists.zx2c4.com,
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCHv4 RESEND net-next 2/2] selftests: wireguard: update to
 using nft for qemu test
Message-ID: <Z91QshzKRlmPdpv7@orbyte.nwl.cc>
Mail-Followup-To: Phil Sutter <phil@nwl.cc>,
 Hangbin Liu <liuhangbin@gmail.com>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>, netdev@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Shuah Khan <shuah@kernel.org>,
 "David S. Miller" <davem@davemloft.net>,
 Simon Horman <horms@kernel.org>, Florian Westphal <fw@strlen.de>,
 Petr Mladek <pmladek@suse.com>,
 Yoann Congal <yoann.congal@smile.fr>, wireguard@lists.zx2c4.com,
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250106081043.2073169-1-liuhangbin@gmail.com>
 <20250106081043.2073169-3-liuhangbin@gmail.com>
 <Z9rtrVk-15Ts_BNp@zx2c4.com> <Z91CGRP9QLdZONiZ@fedora>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z91CGRP9QLdZONiZ@fedora>
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

Hi Hangbin,

On Fri, Mar 21, 2025 at 10:40:25AM +0000, Hangbin Liu wrote:
> Hi Jason, Phil,
> On Wed, Mar 19, 2025 at 05:15:41PM +0100, Jason A. Donenfeld wrote:
> > On Mon, Jan 06, 2025 at 08:10:43AM +0000, Hangbin Liu wrote:
> > > +	echo "file /bin/nft $(NFTABLES_PATH)/src/nft 755 0 0" >> $@
> > > +	echo "file /lib/libmnl.so.0 $(TOOLCHAIN_PATH)/lib/libmnl.so.0 755 0 0" >> $@
> > > +	echo "file /lib/libnftnl.so.11 $(TOOLCHAIN_PATH)/lib/libnftnl.so.11 755 0 0" >> $@
> > 
> > Can't these be statically linked into the nft binary?
> 
> If I omit these, I will got error like
> 
> mnl_attr_put: symbol not found
> 
> Even though I set `--enable-static` in nft build.
> 
> Do you know what's the reason?

I was able to have nft linked statically against built libmnl and
libnftnl by passing '--disable-shared --enable-static' to configure
calls of all three build systems. With --enable-shared in library
configure calls, nftables build preferred to link against the DSOs and I
did not find a way to change this.

Cheers, Phil
