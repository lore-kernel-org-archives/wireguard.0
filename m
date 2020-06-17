Return-Path: <SRS0=P8C1=77=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=3.0 tests=DATE_IN_PAST_12_24,
	DKIM_INVALID,DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B37D6C433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 18 Jun 2020 03:10:41 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 26BCA2100A
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 18 Jun 2020 03:10:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="uEnXH1vp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 26BCA2100A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3935c4df;
	Thu, 18 Jun 2020 02:52:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [2607:7c80:54:e::133])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id a5f94b02
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 18 Jun 2020 02:52:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=6UMFO2TmbdpnJT0c5EXP2Aydp2MaQ5RYJc+GA8ZrxVg=; b=uEnXH1vpZaG2U8FFM/pYkfHc5Y
 SeAjiiS0wb4uxVIyAse/Mlkd6U3qaJ4r4kEh9T7lE+/o5L5t1dNjJ28G/NIqVe0DWG/fV4/lQHo1o
 QDwGZP0qomelniIocS0ybLZQjvlRxX/INLpmjUp5+LL4fh2HQo9F6qYCqhyg1imU2AHxFgkQk0jvm
 8nOqGDFYb7CZcfryOG0jsO4VWYAKfvslQU5aBRvXZEAb7odmsPQzoqooHS6qL3UZV2AdZFQmkWhak
 uKTLzMfmXR1ZbqokaLQoFEtbowD5zP+hhe/qVdQ+y0/QB4rOvsOqTW0JOhm+R3UUkEQZTtPszFNR9
 vDBLz4ZQ==;
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1jlVvY-0007BQ-88; Wed, 17 Jun 2020 11:08:20 +0000
Date: Wed, 17 Jun 2020 04:08:20 -0700
From: Matthew Wilcox <willy@infradead.org>
To: Michal Hocko <mhocko@kernel.org>
Cc: dsterba@suse.cz, Joe Perches <joe@perches.com>,
 Waiman Long <longman@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Howells <dhowells@redhat.com>,
 Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
 James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 David Rientjes <rientjes@google.com>, Johannes Weiner <hannes@cmpxchg.org>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 "Jason A . Donenfeld" <Jason@zx2c4.com>, linux-mm@kvack.org,
 keyrings@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-amlogic@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 virtualization@lists.linux-foundation.org, netdev@vger.kernel.org,
 linux-ppp@vger.kernel.org, wireguard@lists.zx2c4.com,
 linux-wireless@vger.kernel.org, devel@driverdev.osuosl.org,
 linux-scsi@vger.kernel.org, target-devel@vger.kernel.org,
 linux-btrfs@vger.kernel.org, linux-cifs@vger.kernel.org,
 linux-fscrypt@vger.kernel.org, ecryptfs@vger.kernel.org,
 kasan-dev@googlegroups.com, linux-bluetooth@vger.kernel.org,
 linux-wpan@vger.kernel.org, linux-sctp@vger.kernel.org,
 linux-nfs@vger.kernel.org, tipc-discussion@lists.sourceforge.net,
 linux-security-module@vger.kernel.org, linux-integrity@vger.kernel.org
Subject: Re: [PATCH v4 0/3] mm, treewide: Rename kzfree() to kfree_sensitive()
Message-ID: <20200617110820.GG8681@bombadil.infradead.org>
References: <20200616015718.7812-1-longman@redhat.com>
 <fe3b9a437be4aeab3bac68f04193cb6daaa5bee4.camel@perches.com>
 <20200616230130.GJ27795@twin.jikos.cz>
 <20200617003711.GD8681@bombadil.infradead.org>
 <20200617071212.GJ9499@dhcp22.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200617071212.GJ9499@dhcp22.suse.cz>
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

On Wed, Jun 17, 2020 at 09:12:12AM +0200, Michal Hocko wrote:
> On Tue 16-06-20 17:37:11, Matthew Wilcox wrote:
> > Not just performance critical, but correctness critical.  Since kvfree()
> > may allocate from the vmalloc allocator, I really think that kvfree()
> > should assert that it's !in_atomic().  Otherwise we can get into trouble
> > if we end up calling vfree() and have to take the mutex.
> 
> FWIW __vfree already checks for atomic context and put the work into a
> deferred context. So this should be safe. It should be used as a last
> resort, though.

Actually, it only checks for in_interrupt().  If you call vfree() under
a spinlock, you're in trouble.  in_atomic() only knows if we hold a
spinlock for CONFIG_PREEMPT, so it's not safe to check for in_atomic()
in __vfree().  So we need the warning in order that preempt people can
tell those without that there is a bug here.
