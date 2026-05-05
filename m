Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 480BCFF8855
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  5 May 2026 15:05:33 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 59a6a9e2;
	Tue, 5 May 2026 15:05:32 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id a3930e18
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 5 May 2026 15:05:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id BB627601EE;
 Tue,  5 May 2026 15:05:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42617C2BCB4;
 Tue,  5 May 2026 15:05:23 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="emdA+EcK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1777993521;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=n/PjvtdnxjKogdxEJRfX74XZLGxhj7pPVIUidngzdYI=;
 b=emdA+EcKpSLwu36MNe7/d73mfG8Qb60oSgaxeFmJtqdQujDaJYKviwMu3gmeya/MMZregz
 m/78IiqJISqonQKXX0Ts6dGW3qNRfodIDZmLBuFr3oUXVzIEgO5A2c0u4gr7SEbL/2BsE2
 WBWgX2mTagt8OVQgB6imiSlycq6Rlp0=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 9b2cd7af
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Tue, 5 May 2026 15:05:21 +0000 (UTC)
Date: Tue, 5 May 2026 17:05:19 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Valentin Spreckels <valentin@spreckels.dev>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 wireguard@lists.zx2c4.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH wireguard] wireguard: prevent ipv6 addrconf via
 IFF_NO_ADDRCONF flag
Message-ID: <afoHLzrKk6AOetQk@zx2c4.com>
References: <20260208170545.31942-1-valentin@spreckels.dev>
 <abHz3xcsLhIPc_Jn@zx2c4.com>
 <c486b63c-521f-4972-80bf-ebb2bfe04724@spreckels.dev>
 <afefejiY8SX8UfTm@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <afefejiY8SX8UfTm@zx2c4.com>
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

On Sun, May 03, 2026 at 09:18:18PM +0200, Jason A. Donenfeld wrote:
> On Sat, Mar 21, 2026 at 08:20:53PM +0100, Valentin Spreckels wrote:
> > Hi Jason,
> > 
> > On 11/03/2026 23:59, Jason A. Donenfeld wrote:
> > > Hi Valentin,
> > > 
> > > On Sun, Feb 08, 2026 at 06:05:45PM +0100, Valentin Spreckels wrote:
> > >> Use the flag introduced in commit 8a321cf7becc6 ("net: add
> > >> IFF_NO_ADDRCONF and use it in bonding to prevent ipv6 addrconf")
> > >> instead of mangling the addr_gen_mode to prevent ipv6 addrconf.
> > > 
> > > Can you give some more context here? Why was IFF_NO_ADDRCONF added when
> > > the IN6_ADDR_GEN_MODE_NONE method has been working fine? What's the
> > > difference between these approaches? I don't doubt that your patch is
> > > correct, but I would like to better understand this.
> > 
> > Only wireguard configures addr_gen_mode inside the kernel, otherwise it 
> > is only set by userspace; userspace is also able to overwrite the 
> > IFF_NO_ADDRCONF set by wireguard.
> > 
> > Commit 8a321cf7becc ("net: add IFF_NO_ADDRCONF and use it in bonding to 
> > prevent ipv6 addrconf") introduces the private interface flag 
> > IFF_NO_ADDRCONF, which isn't accessible by userspace.
> > 
> > Thus use the IFF_NO_ADDRCONF flag in wireguard.
> > 
> > 
> > Does that answer your questions? If yes, I will submit a v2 with this as 
> > commit message.
> 
> I applied this here:
> https://git.zx2c4.com/wireguard-linux/commit/?id=88427bcbe5bd3711de387b1c1f6540ef6fc05a78
> 
> Sorry for the delay! Patch looks good as-is, once I looked into the
> internal mechanism.

I'm backing this patch out for now. It seems to break the selftests:

    [+] NS2: ping6 -c 10 -f -W 1 fd00::1
    ping6: connect: Network unreachable

Try it yourself with:

    $ make -C tools/testing/selftests/wireguard/qemu -j$(nproc) 

I assume it's because of:

        case NETDEV_UP:
        case NETDEV_CHANGE:
                if (idev && idev->cnf.disable_ipv6)
                        break;

                if (dev->priv_flags & IFF_NO_ADDRCONF) {
			[...]
                        break;
                }

Feel free to submit a v2 if you think this is fixable or if the tests
themselves are wrong.

Jason
