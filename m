Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA6ACCF2561
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 19 Nov 2025 00:26:57 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8d0b2dad;
	Tue, 18 Nov 2025 17:27:29 +0000 (UTC)
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id f076ef05
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 28 Aug 2025 07:18:52 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-afe9f6caf9eso87483666b.3
 for <wireguard@lists.zx2c4.com>; Thu, 28 Aug 2025 00:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756365532; x=1756970332; darn=lists.zx2c4.com;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ACPidqQG6DQZNVxh12NaJPKP3Jkf06hyqyPjQ1p5F2E=;
 b=XsdhHHiWIcpcOBuFA1vmzCRb59J0SzbefTcR1Xm67BfsPOFnav/R/5HFaT+13EDX0Y
 /IBGjNwynBcinf4MQ8m4x+W53FcICqnixQCqklisWfAUSstcuk9NWDB5QUEMT9/7egbW
 Ial9q9xYokuLd5LmbORqnojgkUYH0Y/orphtOHdNAyc4AcaTWoL0yUGkIK+Xwy32TlN+
 Zwe9uQPZDhZ1jVZP2modSfPkaiu2gm96frgxcTG2jg94WXfFPew67S9lsyJnLTlCl+vt
 2NIuAuMsNnJjQlsBCu0UoAJaLTMxa9nvrVpTYyUCwS4gbFUBDhVpdHEfTeXLKBsDUvVL
 zQ4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756365532; x=1756970332;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :reply-to:message-id:subject:cc:to:from:date:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ACPidqQG6DQZNVxh12NaJPKP3Jkf06hyqyPjQ1p5F2E=;
 b=qOLD/VwCepWx1ZIPSIGzRFQJ8wyoTipLGeW5vgAQY5Ys6XQ16pYwnTf8eZ8GgGk7Fb
 jiKfbH15vjf7zhOyjWKapvc+2ZG3ajHI3ah4FVfAP5ftF7l4t7lCSMkMD0gQ8s6u9NbI
 Oo8GQiR4LSl//G+yCjNMMKtVcqaqFWyXRz0GoWL4ul1L9mEh+z8/GKsNuEVxRP4qkJaW
 ek/Y6/EZ0b+Pdjinv8ZFETdMaQy0jMtYWf+2ibqok7X4HWgUAbBHQ63mligvfh2m4skK
 CVbfMNE1JiqgCKjGvx0JMWdpDIkq95+cuRLYRSoIZf1/6AfCa1tX000nYL8JvuKleDPf
 oewA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU1FQp+hGpQh43IPm48HXFGNJMQlMpXaRw3+u0T11lmBv0Jt9mX8VBYV9kWpSFjt1ajTVuOVbeRS5g=@lists.zx2c4.com
X-Gm-Message-State: AOJu0Yz6EywsBQ7nUDsG3f2tbwMaMk1ovdh/zGQJLyIQUuW2yfefic63
 9nwqJgmIPCb8qSXONeQM00tTADXtDptAWkLA5DNrCRdORSr3tPomrWxI
X-Gm-Gg: ASbGncu8FnT2EBQ6YvJxwjFWMgdPVSL3oZs5Wq6vJA7u7ZXsy/Kl59S3I8f9m7ZaeZ9
 QbMQuaonwPZ1X8/E6gvoku36Os9WUatgFglrjEe/ny3sBDINCYG5dGAHlFxzxqjT7D+q9SBjzHK
 SA3pYM4u86hSHLk2gGt6wOlvg5TLMGAEWVlI5vjjg5/nAWyqH+5PRWKwx3PNQEL84ZlDuJngJr5
 vlaEkC8NJ05IPpdEseRjVOmCgSRXcTq7EDka2Ep8f/nfW8cs1bezM9SOQy7CUC+QAdYeGouuxfQ
 ugmDv8BVVl7DkfWo6npHSqRxA+Tlv5oEfvwnHg4yCCsQfGYeSjDKxYflDDZnIFgxVuPVQAee2nm
 fo56/v1OSCxJ93EcjVwqvbxTyndro2YJAHDlN
X-Google-Smtp-Source: AGHT+IEf18QCG44U8jBJ4evHstdtd0oL4Hr6BpN08BPT0cHmsLXVki3gbBRZpXohq9eRx3IUTA8+0Q==
X-Received: by 2002:a17:907:d2a:b0:afe:dbfb:b10e with SMTP id
 a640c23a62f3a-afedbfbb935mr140730666b.47.1756365531421; 
 Thu, 28 Aug 2025 00:18:51 -0700 (PDT)
Received: from localhost ([185.92.221.13]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afe98ade972sm616427066b.50.2025.08.28.00.18.50
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 28 Aug 2025 00:18:50 -0700 (PDT)
Date: Thu, 28 Aug 2025 07:18:50 +0000
From: Wei Yang <richard.weiyang@gmail.com>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, Zi Yan <ziy@nvidia.com>,
 "Mike Rapoport (Microsoft)" <rppt@kernel.org>,
 SeongJae Park <sj@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
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
 wireguard@lists.zx2c4.com, x86@kernel.org
Subject: Re: [PATCH v1 01/36] mm: stop making SPARSEMEM_VMEMMAP user-selectable
Message-ID: <20250828071850.kl7clyh6e75horlk@master>
References: <20250827220141.262669-1-david@redhat.com>
 <20250827220141.262669-2-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250827220141.262669-2-david@redhat.com>
User-Agent: NeoMutt/20170113 (1.7.2)
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
Reply-To: Wei Yang <richard.weiyang@gmail.com>
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

On Thu, Aug 28, 2025 at 12:01:05AM +0200, David Hildenbrand wrote:
>In an ideal world, we wouldn't have to deal with SPARSEMEM without
>SPARSEMEM_VMEMMAP, but in particular for 32bit SPARSEMEM_VMEMMAP is
>considered too costly and consequently not supported.
>
>However, if an architecture does support SPARSEMEM with
>SPARSEMEM_VMEMMAP, let's forbid the user to disable VMEMMAP: just
>like we already do for arm64, s390 and x86.
>
>So if SPARSEMEM_VMEMMAP is supported, don't allow to use SPARSEMEM without
>SPARSEMEM_VMEMMAP.
>
>This implies that the option to not use SPARSEMEM_VMEMMAP will now be
>gone for loongarch, powerpc, riscv and sparc. All architectures only
>enable SPARSEMEM_VMEMMAP with 64bit support, so there should not really
>be a big downside to using the VMEMMAP (quite the contrary).
>
>This is a preparation for not supporting
>
>(1) folio sizes that exceed a single memory section
>(2) CMA allocations of non-contiguous page ranges
>
>in SPARSEMEM without SPARSEMEM_VMEMMAP configs, whereby we
>want to limit possible impact as much as possible (e.g., gigantic hugetlb
>page allocations suddenly fails).
>
>Acked-by: Zi Yan <ziy@nvidia.com>
>Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
>Acked-by: SeongJae Park <sj@kernel.org>
>Cc: Huacai Chen <chenhuacai@kernel.org>
>Cc: WANG Xuerui <kernel@xen0n.name>
>Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
>Cc: Michael Ellerman <mpe@ellerman.id.au>
>Cc: Nicholas Piggin <npiggin@gmail.com>
>Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
>Cc: Paul Walmsley <paul.walmsley@sifive.com>
>Cc: Palmer Dabbelt <palmer@dabbelt.com>
>Cc: Albert Ou <aou@eecs.berkeley.edu>
>Cc: Alexandre Ghiti <alex@ghiti.fr>
>Cc: "David S. Miller" <davem@davemloft.net>
>Cc: Andreas Larsson <andreas@gaisler.com>
>Signed-off-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Wei Yang <richard.weiyang@gmail.com>

>---
> mm/Kconfig | 3 +--
> 1 file changed, 1 insertion(+), 2 deletions(-)
>
>diff --git a/mm/Kconfig b/mm/Kconfig
>index 4108bcd967848..330d0e698ef96 100644
>--- a/mm/Kconfig
>+++ b/mm/Kconfig
>@@ -439,9 +439,8 @@ config SPARSEMEM_VMEMMAP_ENABLE
> 	bool
> 
> config SPARSEMEM_VMEMMAP
>-	bool "Sparse Memory virtual memmap"
>+	def_bool y
> 	depends on SPARSEMEM && SPARSEMEM_VMEMMAP_ENABLE
>-	default y
> 	help
> 	  SPARSEMEM_VMEMMAP uses a virtually mapped memmap to optimise
> 	  pfn_to_page and page_to_pfn operations.  This is the most
>-- 
>2.50.1
>

-- 
Wei Yang
Help you, Help me
