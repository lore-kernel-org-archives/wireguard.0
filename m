Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AF2EC54EDA
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 21 May 2025 14:22:11 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6bcd22de;
	Tue, 20 May 2025 19:43:14 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 111e1632
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 21 Mar 2025 12:51:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id BD4D55C6E22;
 Fri, 21 Mar 2025 12:48:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25DDAC4CEE3;
 Fri, 21 Mar 2025 12:51:08 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="SfQ4S5k0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1742561466;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1dUf+NuD25WdVcY/g4ihIatL9n9p+d1MPap8zY1l6+Y=;
 b=SfQ4S5k0pTvKrxFXVspBerla/SbUp0Opfi1U//bwYh9m4JHnvyn19VfONZNdUhstjg+pCk
 zg1c+e0ozExXfzaWwUGKFmjtnLhvIiLoFhAPuffwWmgYwiRkQbcVkRsehvpqwa9xn16W7I
 ZSnCZbZpUksmk6EnYC1HPvZ+Gfcqo5Y=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 4f1bf067
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Fri, 21 Mar 2025 12:51:05 +0000 (UTC)
Date: Fri, 21 Mar 2025 13:51:02 +0100
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Hangbin Liu <liuhangbin@gmail.com>
Cc: Phil Sutter <phil@nwl.cc>, netdev@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Shuah Khan <shuah@kernel.org>,
 "David S. Miller" <davem@davemloft.net>,
 Simon Horman <horms@kernel.org>, Florian Westphal <fw@strlen.de>,
 Petr Mladek <pmladek@suse.com>,
 Yoann Congal <yoann.congal@smile.fr>, wireguard@lists.zx2c4.com,
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCHv4 RESEND net-next 2/2] selftests: wireguard: update to
 using nft for qemu test
Message-ID: <Z91gtk_5nA76iYGw@zx2c4.com>
References: <20250106081043.2073169-1-liuhangbin@gmail.com>
 <20250106081043.2073169-3-liuhangbin@gmail.com>
 <Z9rtrVk-15Ts_BNp@zx2c4.com> <Z91CGRP9QLdZONiZ@fedora>
 <Z91QshzKRlmPdpv7@orbyte.nwl.cc> <Z91fXURX3BQFDaq9@fedora>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Z91fXURX3BQFDaq9@fedora>
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

On Fri, Mar 21, 2025 at 12:45:17PM +0000, Hangbin Liu wrote:
> On Fri, Mar 21, 2025 at 12:42:42PM +0100, Phil Sutter wrote:
> > Hi Hangbin,
> > 
> > On Fri, Mar 21, 2025 at 10:40:25AM +0000, Hangbin Liu wrote:
> > > Hi Jason, Phil,
> > > On Wed, Mar 19, 2025 at 05:15:41PM +0100, Jason A. Donenfeld wrote:
> > > > On Mon, Jan 06, 2025 at 08:10:43AM +0000, Hangbin Liu wrote:
> > > > > +	echo "file /bin/nft $(NFTABLES_PATH)/src/nft 755 0 0" >> $@
> > > > > +	echo "file /lib/libmnl.so.0 $(TOOLCHAIN_PATH)/lib/libmnl.so.0 755 0 0" >> $@
> > > > > +	echo "file /lib/libnftnl.so.11 $(TOOLCHAIN_PATH)/lib/libnftnl.so.11 755 0 0" >> $@
> > > > 
> > > > Can't these be statically linked into the nft binary?
> > > 
> > > If I omit these, I will got error like
> > > 
> > > mnl_attr_put: symbol not found
> > > 
> > > Even though I set `--enable-static` in nft build.
> > > 
> > > Do you know what's the reason?
> > 
> > I was able to have nft linked statically against built libmnl and
> > libnftnl by passing '--disable-shared --enable-static' to configure
> > calls of all three build systems. With --enable-shared in library
> > configure calls, nftables build preferred to link against the DSOs and I
> > did not find a way to change this.
> 
> The patch is using
> "./configure --prefix=/ $(CROSS_COMPILE_FLAG) --enable-static \
> --disable-shared --disable-debug --disable-man-doc --with-mini-gmp --without-cli"
> to build nft.
> 
> I don't know why it's not linked static.

All three DSOs...
