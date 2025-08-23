Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D71B2CA0EFA
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 23 Aug 2025 09:02:29 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0c9e376e;
	Sat, 23 Aug 2025 09:00:12 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id e17745d2
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 23 Aug 2025 09:00:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 6ABA25C0FCC;
 Sat, 23 Aug 2025 09:00:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F35E6C113D0;
 Sat, 23 Aug 2025 08:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755939608;
 bh=aU4s6rL8qphUf3ASSPtkvFhSbnF7KQL/5p/AkB6ZkD0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rOGkWtsURQmqeVJWZZ8QU1TwZHK57H1RHXwc/i48rhECw+oAVRa4mF0zfqNM3aJ7b
 K4ufsfNlCAWHsLgknGRRJAM8fAg49ifByU7aHcJpd60KD5n2ftLsVEjekOSHSO2hKf
 TyNgVi/IP/sZ+Zv1HQC39pwpdaVXtYVat6Ea2uqdZXF6QBRAllDzvBMajMv+E6mXfL
 wV6BxOvsD2NYhNSk4hF0URYans98VMn0JY+kTDajsHLCy41MHKhsR0ynwpYDfvi23F
 uDIHwC7s5hdPOSqfKNvqn2djgrkhoLcYMLwZ0RX2xL3FelT1nsv2lD+CEaDl2f3oOX
 wFjm0sW7YW4bQ==
Date: Sat, 23 Aug 2025 11:59:50 +0300
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
Message-ID: <aKmDBobyvEX7ZUWL@kernel.org>
References: <20250821200701.1329277-1-david@redhat.com>
 <20250821200701.1329277-11-david@redhat.com>
 <9156d191-9ec4-4422-bae9-2e8ce66f9d5e@redhat.com>
 <7077e09f-6ce9-43ba-8f87-47a290680141@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7077e09f-6ce9-43ba-8f87-47a290680141@redhat.com>
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

On Fri, Aug 22, 2025 at 08:24:31AM +0200, David Hildenbrand wrote:
> On 22.08.25 06:09, Mika Penttilä wrote:
> > 
> > On 8/21/25 23:06, David Hildenbrand wrote:
> > 
> > > All pages were already initialized and set to PageReserved() with a
> > > refcount of 1 by MM init code.
> > 
> > Just to be sure, how is this working with MEMBLOCK_RSRV_NOINIT, where MM is supposed not to
> > initialize struct pages?
> 
> Excellent point, I did not know about that one.
> 
> Spotting that we don't do the same for the head page made me assume that
> it's just a misuse of __init_single_page().
> 
> But the nasty thing is that we use memblock_reserved_mark_noinit() to only
> mark the tail pages ...

And even nastier thing is that when CONFIG_DEFERRED_STRUCT_PAGE_INIT is
disabled struct pages are initialized regardless of
memblock_reserved_mark_noinit().

I think this patch should go in before your updates:

diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 753f99b4c718..1c51788339a5 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -3230,6 +3230,22 @@ int __alloc_bootmem_huge_page(struct hstate *h, int nid)
 	return 1;
 }
 
+/*
+ * Tail pages in a huge folio allocated from memblock are marked as 'noinit',
+ * which means that when CONFIG_DEFERRED_STRUCT_PAGE_INIT is enabled their
+ * struct page won't be initialized
+ */
+#ifdef CONFIG_DEFERRED_STRUCT_PAGE_INIT
+static void __init hugetlb_init_tail_page(struct page *page, unsigned long pfn,
+					enum zone_type zone, int nid)
+{
+	__init_single_page(page, pfn, zone, nid);
+}
+#else
+static inline void hugetlb_init_tail_page(struct page *page, unsigned long pfn,
+					enum zone_type zone, int nid) {}
+#endif
+
 /* Initialize [start_page:end_page_number] tail struct pages of a hugepage */
 static void __init hugetlb_folio_init_tail_vmemmap(struct folio *folio,
 					unsigned long start_page_number,
@@ -3244,7 +3260,7 @@ static void __init hugetlb_folio_init_tail_vmemmap(struct folio *folio,
 	for (pfn = head_pfn + start_page_number; pfn < end_pfn; pfn++) {
 		struct page *page = pfn_to_page(pfn);
 
-		__init_single_page(page, pfn, zone, nid);
+		hugetlb_init_tail_page(page, pfn, zone, nid);
 		prep_compound_tail((struct page *)folio, pfn - head_pfn);
 		ret = page_ref_freeze(page, 1);
 		VM_BUG_ON(!ret);
 
> Let me revert back to __init_single_page() and add a big fat comment why
> this is required.
> 
> Thanks!

-- 
Sincerely yours,
Mike.
