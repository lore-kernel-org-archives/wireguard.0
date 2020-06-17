Return-Path: <SRS0=P8C1=77=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5016FC433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 18 Jun 2020 00:01:58 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 03C9221556
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 18 Jun 2020 00:01:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 03C9221556
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3aa1613c;
	Wed, 17 Jun 2020 23:43:21 +0000 (UTC)
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
 [209.85.208.66])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id cc80d6cc
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 17 Jun 2020 23:43:19 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id e12so3502219eds.2
 for <wireguard@lists.zx2c4.com>; Wed, 17 Jun 2020 17:01:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=fOVgSeVqTVqWvUfLoOdj4nt+48hh42lucWZp1VWswtg=;
 b=QiH1qanAk1UoASb26wgiYDc6PgbquwJDSS7vpcO8iCHSAKeICldVa2xatWNj2F/v/M
 roJ0vmRMMeL1izBQBGJhoV7aae3SBtPR8PKCLK1E059o7fZce1oQmM/lB0mST7Sxpb7x
 jnbIYY7fWTOu+ZGJbiKz1jdAolyD5fs02fIZ461YPWx8pY7RRvzp8kwVYBOI0aiPafey
 Geu7tp6FslwCuBAHJiIhr9H85ZoJw7Da8BJiZGf6wXIU0CHVyG1RklqVRvg2cVpiuGvS
 88wkBkXfjaNE47XVqn2CqrdMBSg2dY45epwdZ4g6JJI340Q4EeRszplf4ee1ud1Ku6vK
 ZUzw==
X-Gm-Message-State: AOAM532HhX2EvuWYbsma1jFwbQLtjZEvpBiC/IgI2GRs7eRUUPtpg/5v
 AFO1PWYOFl09loBMXaF43/F2RUJmfV4=
X-Google-Smtp-Source: ABdhPJz5smjYQcDGdXsq8Ug+fgHwHPeIMnfqM9kX0E57nHrzErZZpyVOrifVPC/iAZURBZCGoIl/9Q==
X-Received: by 2002:a17:906:aad8:: with SMTP id
 kt24mr7265073ejb.527.1592398555771; 
 Wed, 17 Jun 2020 05:55:55 -0700 (PDT)
Received: from localhost (ip-37-188-158-19.eurotel.cz. [37.188.158.19])
 by smtp.gmail.com with ESMTPSA id mh14sm13501385ejb.116.2020.06.17.05.55.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2020 05:55:54 -0700 (PDT)
Date: Wed, 17 Jun 2020 14:55:53 +0200
From: Michal Hocko <mhocko@kernel.org>
To: Matthew Wilcox <willy@infradead.org>
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
Message-ID: <20200617125553.GO9499@dhcp22.suse.cz>
References: <20200616015718.7812-1-longman@redhat.com>
 <fe3b9a437be4aeab3bac68f04193cb6daaa5bee4.camel@perches.com>
 <20200616230130.GJ27795@twin.jikos.cz>
 <20200617003711.GD8681@bombadil.infradead.org>
 <20200617071212.GJ9499@dhcp22.suse.cz>
 <20200617110820.GG8681@bombadil.infradead.org>
 <20200617113157.GM9499@dhcp22.suse.cz>
 <20200617122321.GJ8681@bombadil.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200617122321.GJ8681@bombadil.infradead.org>
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

On Wed 17-06-20 05:23:21, Matthew Wilcox wrote:
> On Wed, Jun 17, 2020 at 01:31:57PM +0200, Michal Hocko wrote:
> > On Wed 17-06-20 04:08:20, Matthew Wilcox wrote:
> > > If you call vfree() under
> > > a spinlock, you're in trouble.  in_atomic() only knows if we hold a
> > > spinlock for CONFIG_PREEMPT, so it's not safe to check for in_atomic()
> > > in __vfree().  So we need the warning in order that preempt people can
> > > tell those without that there is a bug here.
> > 
> > ... Unless I am missing something in_interrupt depends on preempt_count() as
> > well so neither of the two is reliable without PREEMPT_COUNT configured.
> 
> preempt_count() always tracks whether we're in interrupt context,
> regardless of CONFIG_PREEMPT.  The difference is that CONFIG_PREEMPT
> will track spinlock acquisitions as well.

Right you are! Thanks for the clarification. I find the situation
around preempt_count quite confusing TBH. Looking at existing users
of in_atomic() (e.g. a random one zd_usb_iowrite16v_async which check
in_atomic and then does GFP_KERNEL allocation which would be obviously
broken on !PREEMPT if the function can be called from an atomic
context), I am wondering whether it would make sense to track atomic
context also for !PREEMPT. This check is just terribly error prone.

-- 
Michal Hocko
SUSE Labs
