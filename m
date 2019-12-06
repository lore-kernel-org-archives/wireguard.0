Return-Path: <SRS0=ImwE=Z4=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9205C43603
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  6 Dec 2019 15:08:09 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8AA0724659
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  6 Dec 2019 15:08:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=breakpointingbad.com header.i=@breakpointingbad.com header.b="kZuwr4jd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8AA0724659
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=breakpointingbad.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 28c353c0;
	Fri, 6 Dec 2019 15:07:37 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c1719876
 for <wireguard@lists.zx2c4.com>; Fri, 6 Dec 2019 12:58:45 +0000 (UTC)
Received: from mail.breakpointingbad.com
 (ec2-34-238-97-160.compute-1.amazonaws.com [34.238.97.160])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2fe8625a
 for <wireguard@lists.zx2c4.com>; Fri, 6 Dec 2019 12:58:45 +0000 (UTC)
Received: from mail.breakpointingbad.com (mail.breakpointingbad.com
 [127.0.0.1])
 by mail.breakpointingbad.com (Postfix) with ESMTP id 47Tt1x4kDXzCkhY
 for <wireguard@lists.zx2c4.com>; Fri,  6 Dec 2019 12:58:45 +0000 (UTC)
Authentication-Results: mail.breakpointingbad.com (amavisd-new);
 dkim=pass (1024-bit key) reason="pass (just generated, assumed good)"
 header.d=breakpointingbad.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 breakpointingbad.com; h=content-transfer-encoding:mime-version
 :user-agent:content-type:content-type:references:in-reply-to
 :date:date:to:from:from:subject:subject:message-id; s=dkim; t=
 1575637125; x=1578229126; bh=D46fbDPsf1VskJ/N+7uod42KjLX+dGsiuZM
 ipLQxGFc=; b=kZuwr4jduSyZYhaWIqasyZvoTZ01rQtiXp7MQDaKqJ1pWwmhOVO
 +bWpf6nhHNMdZ7rIy7OEdmDn5VZtz4bR8XQirZnkdrLYcNeBYuWYztEXOA7wfliM
 5481bTCvahJATM4WTx+JCUF/b68zflzEzxrK97Viw+IzNzsLdcieoQdo=
X-Virus-Scanned: Debian amavisd-new at mail.breakpointingbad.com
Received: from mail.breakpointingbad.com ([127.0.0.1])
 by mail.breakpointingbad.com (mail.breakpointingbad.com [127.0.0.1])
 (amavisd-new, port 10026)
 with ESMTP id ZCY_kfDqCD6w for <wireguard@lists.zx2c4.com>;
 Fri,  6 Dec 2019 12:58:45 +0000 (UTC)
Received: from spectre (unknown [185.229.59.105])
 by mail.breakpointingbad.com (Postfix) with ESMTPSA id 47Tt1w1LwdzCkgm;
 Fri,  6 Dec 2019 12:58:44 +0000 (UTC)
Message-ID: <4e3e406b9511495b10964975b848cd686fa05719.camel@breakpointingbad.com>
Subject: Re: Regarding "Inferring and hijacking VPN-tunneled TCP connections"
From: "William J. Tolley" <william@breakpointingbad.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>, Vasili Pupkin <diggest@gmail.com>
Date: Fri, 06 Dec 2019 05:58:43 -0700
In-Reply-To: <CAHmME9osDRPQvfYMexRcAhHdAb-x2PjD8Wnf+nrcHyX42ivmqA@mail.gmail.com>
References: <20191205191318.GA44156@zx2c4.com>
 <db72ae85-4e68-1745-e11b-0fb81016358e@gmail.com>
 <CAHmME9osDRPQvfYMexRcAhHdAb-x2PjD8Wnf+nrcHyX42ivmqA@mail.gmail.com>
User-Agent: Evolution 3.34.1 
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 06 Dec 2019 16:07:36 +0100
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
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

Hi all,

So the nft rule worked flawlessly on our Ubuntu machines, but I'm
having trouble applying the rule in Manjaro (undoubtedly user error).
I'll try again on some different machines in the lab.

Addressing zrm's question about carrying out the first two parts of the
attack with rp_filter is strict mode - it should have been clarified
that, as far as we know, this only affects certain systems with
sufficiently complicated and/or misconfigured routing rules using
connmarks and fwmarks, such as Android. 

The patch was issued for Android in the September security update,
however, I can still perform the attack without any modification. The
difference now is that if I manually set rp_filter to strict on Android
I can prevent the attack for IPv4 etc. Before this update, it would
basically respond to any spoofed
packets addressed to the virtual interface IP on the wireless and/or
mobile interface(s). This is CVE-2019-9461.

Thanks,

Wm.


On Thu, 2019-12-05 at 21:24 +0100, Jason A. Donenfeld wrote:
> Hey Vasili,
> 
> On Thu, Dec 5, 2019 at 8:50 PM Vasili Pupkin <diggest@gmail.com>
> wrote:
> > Isn't it enough to just enforce Strong Host Model, i.e. a host
> > won't
> > respond from it's IP that is not facing the interface. If a host is
> > connected to two subnets 10.1.x.x and 10.2.x.x and have two IP
> > 10.1.0.1
> > and 10.2.0.1, it will just drop all the packets sent to 10.1.0.1
> > that
> > came from the interface 10.2.0.1 and vice verse. This model can be
> > emulated using the FIB lookup feature of NFT with this one liner:
> > 
> > nft add rule inet filter input fib daddr . iif type != { local,
> > broadcast, multicast } drop
> > 
> > this also works for both IP4 and IP6. This mode can be safely
> > enabled on
> > most setups not breaking things. Enabling it is a good precaution
> > measure anyway and it is a shame that it is not widely assumed as
> > default and standard.
> > 
> > Doing the same with just iptables isn't easy and can't be
> > accomplished
> > with one liner but nft perfectly coexist with iptables.
> > 
> 
> That actually appears to work pretty well in my quick bootleg setup.
> Thanks. I'm adding William to the email chain -- perhaps he can try
> this and report back with his attack rig?
> 
> If we can make nft coexistance work reliably, perhaps we can run the
> nft rule on systems where the nft binary simply exists.
> 
> For cleanup, we'll need some way of marking that rule as belonging to
> wg-quick(8) for our interface. The iptables magic currently uses
> --comment for that.
> 
> There's also the issue with nft not having default table and chain
> names. Perhaps it'd be cleanest to just ad a new table and chain with
> a given name, and set that as a high priority input hook?
> 
> We'll also probably want to make this only apply to our interface,
> and
> not others, if that's possible.
> 
> Any downsides I'm overlooking?
> 
> William -- you might want to subscribe to follow along better:
> https://lists.zx2c4.com/pipermail/wireguard/2019-December/004679.html
> https://lists.zx2c4.com/mailman/listinfo/wireguard

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
