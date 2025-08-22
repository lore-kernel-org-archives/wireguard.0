Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 296D1CF2560
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 18 Nov 2025 23:34:55 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b0120bb4;
	Tue, 18 Nov 2025 17:27:01 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org
 [2600:3c0a:e001:78e:0:1991:8:25])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 9f1b2236
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 22 Aug 2025 15:09:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id B028D4368F;
 Fri, 22 Aug 2025 15:09:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DC2FC113D0;
 Fri, 22 Aug 2025 15:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755875364;
 bh=BbeE+oYVvXyCl/P3cWovjJUaU7WzCVAlNkMT749qO5w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Prntf9uZKZis/U/bJlHQFXtv4HnPV3FVBr1/P31JtBZdZlx8pNyYQrIV2U1OHL2Ph
 KWg0PSoWLWhirFvfgHCyLwMGddND32c/PoybCUWyTY4uJJaWAm3pqSnmsGRF97A6G4
 VDGi/p4toQ5nig1708cGRPMAz3wCxoj5eCkSR54XvHPYG/bVMzGFIuTMu74kogSth9
 uZBDebwYJugk9IlUMY2oDzjDlJybUXGUDToJl2tsj04xT1jSsHqLJwHeqPJg2mwSqm
 1JhNQxwyrU8QnJ30mOJ/Iq/kXqrUNLLTQ0bAe831b6zLWD86rnmkM7tBokSIpXtEvj
 XiFVPUzX/IwAA==
Date: Fri, 22 Aug 2025 18:09:03 +0300
From: Mike Rapoport <rppt@kernel.org>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, Huacai Chen <chenhuacai@kernel.org>,
 WANG Xuerui <kernel@xen0n.name>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 "David S. Miller" <davem@davemloft.net>,
 Andreas Larsson <andreas@gaisler.com>,
 Alexander Potapenko <glider@google.com>,
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
Subject: Re: [PATCH RFC 01/35] mm: stop making SPARSEMEM_VMEMMAP
 user-selectable
Message-ID: <aKiID8i6dYrlVi5T@kernel.org>
References: <20250821200701.1329277-1-david@redhat.com>
 <20250821200701.1329277-2-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250821200701.1329277-2-david@redhat.com>
X-Mailman-Approved-At: Tue, 18 Nov 2025 17:23:16 +0000
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

On Thu, Aug 21, 2025 at 10:06:27PM +0200, David Hildenbrand wrote:
> In an ideal world, we wouldn't have to deal with SPARSEMEM without
> SPARSEMEM_VMEMMAP, but in particular for 32bit SPARSEMEM_VMEMMAP is
> considered too costly and consequently not supported.
> 
> However, if an architecture does support SPARSEMEM with
> SPARSEMEM_VMEMMAP, let's forbid the user to disable VMEMMAP: just
> like we already do for arm64, s390 and x86.
> 
> So if SPARSEMEM_VMEMMAP is supported, don't allow to use SPARSEMEM without
> SPARSEMEM_VMEMMAP.
> 
> This implies that the option to not use SPARSEMEM_VMEMMAP will now be
> gone for loongarch, powerpc, riscv and sparc. All architectures only
> enable SPARSEMEM_VMEMMAP with 64bit support, so there should not really
> be a big downside to using the VMEMMAP (quite the contrary).
> 
> This is a preparation for not supporting
> 
> (1) folio sizes that exceed a single memory section
> (2) CMA allocations of non-contiguous page ranges
> 
> in SPARSEMEM without SPARSEMEM_VMEMMAP configs, whereby we
> want to limit possible impact as much as possible (e.g., gigantic hugetlb
> page allocations suddenly fails).
> 
> Cc: Huacai Chen <chenhuacai@kernel.org>
> Cc: WANG Xuerui <kernel@xen0n.name>
> Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Nicholas Piggin <npiggin@gmail.com>
> Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
> Cc: Paul Walmsley <paul.walmsley@sifive.com>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Albert Ou <aou@eecs.berkeley.edu>
> Cc: Alexandre Ghiti <alex@ghiti.fr>
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: Andreas Larsson <andreas@gaisler.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>

Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

> ---
>  mm/Kconfig | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/mm/Kconfig b/mm/Kconfig
> index 4108bcd967848..330d0e698ef96 100644
> --- a/mm/Kconfig
> +++ b/mm/Kconfig
> @@ -439,9 +439,8 @@ config SPARSEMEM_VMEMMAP_ENABLE
>  	bool
>  
>  config SPARSEMEM_VMEMMAP
> -	bool "Sparse Memory virtual memmap"
> +	def_bool y
>  	depends on SPARSEMEM && SPARSEMEM_VMEMMAP_ENABLE
> -	default y
>  	help
>  	  SPARSEMEM_VMEMMAP uses a virtually mapped memmap to optimise
>  	  pfn_to_page and page_to_pfn operations.  This is the most
> -- 
> 2.50.1
> 

-- 
Sincerely yours,
Mike.
