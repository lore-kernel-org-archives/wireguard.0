Return-Path: <SRS0=n59I=76=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F3A2C433E2
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 17 Jun 2020 07:12:19 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 212EE206D8
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 17 Jun 2020 07:12:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 212EE206D8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c50e297c;
	Wed, 17 Jun 2020 06:54:14 +0000 (UTC)
Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com
 [209.85.218.66])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 24c3dbe7
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 17 Jun 2020 06:54:12 +0000 (UTC)
Received: by mail-ej1-f66.google.com with SMTP id y13so1170674eju.2
 for <wireguard@lists.zx2c4.com>; Wed, 17 Jun 2020 00:12:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=E5EcWVbc+7tsS+GAmjqiwsU8zuC9ZQ4KDsXaJSfWulo=;
 b=IXdk6x2QbrsIQms/rpjDTaBKIikgTzo/SgwwCWRGgZjpsXyGV7D0dkHm0c10yjCrsQ
 5W0USKxYVqsPw5b35hZTm2urUGh7gN1WJs/OQRwUp2gFd/u5izRQB9FQQ4XrRso0x3xI
 OeLhT94tvmdYuAAnKxDE4IvCaih+LmlGpxnd7H6qP0FScZxmyiw/JV71TgcGSmCe0YHY
 DJVn/1jUqbAwhZzk8s/W+B65ji6Oly/ys+YhxBv9gc33VgnEh7TW/MKMgGOqqv9wjgjc
 6EiM0DBrxRstqKtaiAhGQFy+V7wm85GUw9t5N9v+f4yvUhg29ZDqwdC1TElQpTFEvq6O
 dOFg==
X-Gm-Message-State: AOAM530Jx2qM7reTxbc3k60f4qtRXI7XorY46AokfNlJakg3eMq7CRka
 AaHoAhDVMtf+Knv0QPnpOBE=
X-Google-Smtp-Source: ABdhPJzxXEZ/32Vk1uutSgWgDm/2Kml+FRFv6q/oUOzaHXvM3d9a7wcEm5DrSyb0iZ8v3ZPtZ+pKKg==
X-Received: by 2002:a17:906:2581:: with SMTP id
 m1mr6681797ejb.89.1592377934427; 
 Wed, 17 Jun 2020 00:12:14 -0700 (PDT)
Received: from localhost (ip-37-188-158-19.eurotel.cz. [37.188.158.19])
 by smtp.gmail.com with ESMTPSA id g22sm12516138ejo.1.2020.06.17.00.12.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2020 00:12:13 -0700 (PDT)
Date: Wed, 17 Jun 2020 09:12:12 +0200
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
Message-ID: <20200617071212.GJ9499@dhcp22.suse.cz>
References: <20200616015718.7812-1-longman@redhat.com>
 <fe3b9a437be4aeab3bac68f04193cb6daaa5bee4.camel@perches.com>
 <20200616230130.GJ27795@twin.jikos.cz>
 <20200617003711.GD8681@bombadil.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200617003711.GD8681@bombadil.infradead.org>
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

On Tue 16-06-20 17:37:11, Matthew Wilcox wrote:
> On Wed, Jun 17, 2020 at 01:01:30AM +0200, David Sterba wrote:
> > On Tue, Jun 16, 2020 at 11:53:50AM -0700, Joe Perches wrote:
> > > On Mon, 2020-06-15 at 21:57 -0400, Waiman Long wrote:
> > > >  v4:
> > > >   - Break out the memzero_explicit() change as suggested by Dan Carpenter
> > > >     so that it can be backported to stable.
> > > >   - Drop the "crypto: Remove unnecessary memzero_explicit()" patch for
> > > >     now as there can be a bit more discussion on what is best. It will be
> > > >     introduced as a separate patch later on after this one is merged.
> > > 
> > > To this larger audience and last week without reply:
> > > https://lore.kernel.org/lkml/573b3fbd5927c643920e1364230c296b23e7584d.camel@perches.com/
> > > 
> > > Are there _any_ fastpath uses of kfree or vfree?
> > 
> > I'd consider kfree performance critical for cases where it is called
> > under locks. If possible the kfree is moved outside of the critical
> > section, but we have rbtrees or lists that get deleted under locks and
> > restructuring the code to do eg. splice and free it outside of the lock
> > is not always possible.
> 
> Not just performance critical, but correctness critical.  Since kvfree()
> may allocate from the vmalloc allocator, I really think that kvfree()
> should assert that it's !in_atomic().  Otherwise we can get into trouble
> if we end up calling vfree() and have to take the mutex.

FWIW __vfree already checks for atomic context and put the work into a
deferred context. So this should be safe. It should be used as a last
resort, though.

-- 
Michal Hocko
SUSE Labs
