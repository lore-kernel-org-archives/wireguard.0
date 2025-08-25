Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B657CA0EFA
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 25 Aug 2025 14:32:45 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id baa9fddd;
	Mon, 25 Aug 2025 14:32:44 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org
 [2600:3c0a:e001:78e:0:1991:8:25])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 70d2e251
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 25 Aug 2025 14:32:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 07341407BB;
 Mon, 25 Aug 2025 14:32:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28395C4CEED;
 Mon, 25 Aug 2025 14:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756132360;
 bh=DU+1S4Dtf6BzIA9TMfJpqm5TRVwGVofXB+Dj9RHsm1g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=n7YZsnMUaPKieR6Aen8NXplrqXq649ng2cWds08Paw0ZE1V9/s04MYuzfMJunBPPM
 e9q5l/4IYbHR+zLW6tZ3Ain+SM/EPsptEidQNiwcBG+gIXbD0MDb3NpuMIodH9q/bK
 gfUkw7ZqtLUllteesZei9c9/9Nob4tERnp37xBWgOfA8ssretvfGAj7ddnS1nJ/eSw
 gYK9m1P9+EEv6DvwLeTd0I1ynl3rIVfEsEIPpMbPhXNcaQgQQCdndA/xeV7DIotpxx
 J60e7ZU1ZivKd3L40DdBa/CHbHS/SOS0E/lE/sJu2Rz1DevUCKw6IvTf/zpKfAvZXV
 BIxp/l6R3haNQ==
Date: Mon, 25 Aug 2025 17:32:20 +0300
From: Mike Rapoport <rppt@kernel.org>
To: David Hildenbrand <david@redhat.com>
Cc: Mika =?iso-8859-1?Q?Penttil=E4?= <mpenttil@redhat.com>,
 linux-kernel@vger.kernel.org, Alexander Potapenko <glider@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Brendan Jackman <jackmanb@google.com>,
 Christoph Lameter <cl@gentwo.org>, Dennis Zhou <dennis@kernel.org>,
 Dmitry Vyukov <dvyukov@google.com>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, iommu@lists.linux.dev,
 io-uring@vger.kernel.org, Jason Gunthorpe <jgg@nvidia.com>,
 Jens Axboe <axboe@kernel.dk>, Johannes Weiner <hannes@cmpxchg.org>,
 John Hubbard <jhubbard@nvidia.com>, kasan-dev@googlegroups.com,
 kvm@vger.kernel.org, "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 linux-arm-kernel@axis.com, linux-arm-kernel@lists.infradead.org,
 linux-crypto@vger.kernel.org, linux-ide@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-mm@kvack.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Marco Elver <elver@google.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Michal Hocko <mhocko@suse.com>, Muchun Song <muchun.song@linux.dev>,
 netdev@vger.kernel.org, Oscar Salvador <osalvador@suse.de>,
 Peter Xu <peterx@redhat.com>, Robin Murphy <robin.murphy@arm.com>,
 Suren Baghdasaryan <surenb@google.com>, Tejun Heo <tj@kernel.org>,
 virtualization@lists.linux.dev, Vlastimil Babka <vbabka@suse.cz>,
 wireguard@lists.zx2c4.com, x86@kernel.org, Zi Yan <ziy@nvidia.com>
Subject: Re: [PATCH RFC 10/35] mm/hugetlb: cleanup
 hugetlb_folio_init_tail_vmemmap()
Message-ID: <aKxz9HLQTflFNYEu@kernel.org>
References: <20250821200701.1329277-1-david@redhat.com>
 <20250821200701.1329277-11-david@redhat.com>
 <9156d191-9ec4-4422-bae9-2e8ce66f9d5e@redhat.com>
 <7077e09f-6ce9-43ba-8f87-47a290680141@redhat.com>
 <aKmDBobyvEX7ZUWL@kernel.org>
 <a90cf9a3-d662-4239-ad54-7ea917c802a5@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a90cf9a3-d662-4239-ad54-7ea917c802a5@redhat.com>
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

On Mon, Aug 25, 2025 at 02:48:58PM +0200, David Hildenbrand wrote:
> On 23.08.25 10:59, Mike Rapoport wrote:
> > On Fri, Aug 22, 2025 at 08:24:31AM +0200, David Hildenbrand wrote:
> > > On 22.08.25 06:09, Mika Penttilä wrote:
> > > > 
> > > > On 8/21/25 23:06, David Hildenbrand wrote:
> > > > 
> > > > > All pages were already initialized and set to PageReserved() with a
> > > > > refcount of 1 by MM init code.
> > > > 
> > > > Just to be sure, how is this working with MEMBLOCK_RSRV_NOINIT, where MM is supposed not to
> > > > initialize struct pages?
> > > 
> > > Excellent point, I did not know about that one.
> > > 
> > > Spotting that we don't do the same for the head page made me assume that
> > > it's just a misuse of __init_single_page().
> > > 
> > > But the nasty thing is that we use memblock_reserved_mark_noinit() to only
> > > mark the tail pages ...
> > 
> > And even nastier thing is that when CONFIG_DEFERRED_STRUCT_PAGE_INIT is
> > disabled struct pages are initialized regardless of
> > memblock_reserved_mark_noinit().
> > 
> > I think this patch should go in before your updates:
> 
> Shouldn't we fix this in memblock code?
> 
> Hacking around that in the memblock_reserved_mark_noinit() user sound wrong
> -- and nothing in the doc of memblock_reserved_mark_noinit() spells that
> behavior out.

We can surely update the docs, but unfortunately I don't see how to avoid
hacking around it in hugetlb. 
Since it's used to optimise HVO even further to the point hugetlb open
codes memmap initialization, I think it's fair that it should deal with all
possible configurations.
 
> -- 
> Cheers
> 
> David / dhildenb
> 
> 

-- 
Sincerely yours,
Mike.
