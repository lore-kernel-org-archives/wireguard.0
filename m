Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E8CDCF2561
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 19 Nov 2025 00:51:43 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 93d93d94;
	Tue, 18 Nov 2025 17:27:41 +0000 (UTC)
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id d90330e2
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 28 Aug 2025 07:43:57 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-afea7e61575so66210066b.2
 for <wireguard@lists.zx2c4.com>; Thu, 28 Aug 2025 00:43:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756367037; x=1756971837; darn=lists.zx2c4.com;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uCyWFKVmsqDpuka3mORfqvZ6ED5815cQsuT83UfJ0fY=;
 b=RIUnaHo86ex0EUCWIGpwEWuTK+UTqWHZqbdYoz9d2NzyK9jBuHXPMp9S26uaKM9RN5
 aO6brZBFh2wtINlUilL2D35N8Bj0SQrIgtFutbLVzK5AE/69757nfGUK0run2gXVAPnu
 q0ftN/Czh6u2c9FVuNoT/NwCyCkIRIW+agP5MxYRemsgFyXCF3t0ZaFkXJycvwFepLft
 Kr4MxU3BoaGcqvb/psIps9G3OWETH7clzf7cqXn/12wc+G+5dWLpysAJISsdUgy9v7zn
 3aFCzTZCpCdOwqzhvAexggqzlKDA3Ic0PkiW+7F29OZtzAyCQxwauntMSelY/+DKniNf
 8UaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756367037; x=1756971837;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :reply-to:message-id:subject:cc:to:from:date:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=uCyWFKVmsqDpuka3mORfqvZ6ED5815cQsuT83UfJ0fY=;
 b=MzyP3jJhE5Fn1M/6I1gVn0M4wLvqXj1q11LhvNNjVcnc2nKvzRs802y4f/yT1FvUh5
 cyCA/wfZWITTIoiewN0z0hE3FD5PoRquR4JJTYYZwTUBtJ9y1E6zG3TEpwE6CzKGDtA3
 k4mdXigmrMcqM80S3FvqNw8zBt64VTfb4K7r8RjmxqZbxgZiSGA9L/IFkT/8IXz/1x0w
 Ya6gZsjKgyUIUUCA1ajAdenWyl7mvJ2YXRaJRzR+YIyXiuiyYUQfuQSA+OAXADtczdit
 uvD8d5qGwkjGoM3ejpvMx16Af7+vaOe79PAZwNM8qYLSfMCebFsUu5JRmb9O7skrfWPO
 7fzA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVn+SQZVtXM3n44PACpoLKqcSb78z5++7+gs66sY38tS0NrbK8oa+CQ/zpyYHNJmMVWeEZq5hyFD/w=@lists.zx2c4.com
X-Gm-Message-State: AOJu0YzzY87wVUuUvcG50BACumloBtmSGp0f8rpTDi7NhHxAF8eICRyZ
 BL6Rp2zVyXKq5ESQ603NbaxDaMm2DmXrsXF07IvIuv4skac5wkeAuxjd
X-Gm-Gg: ASbGncvsCHWF2Xf29yO+hfr9nSJowlUMhqow0QAA+abHKkK1749VkUMEkTpQBocRbLS
 EVzpfx1Deu7gTgkfbklnbJ90E1Py+/759Ra/xScjfgWPBiGtqkWCPCQT4NVnquJqUqelCR6okhK
 YfEEDZK4kSchS87U/pU6cw4WsswQywveDQZvuafMQc2ppIpIvY2tl8fMChFnXu1ZrDsDqsIAyjH
 Fcug0nfhLzXV08QeywU3A6NipVPSDab0F5jwfwm08FnG0HjN+2X/h9EX1PFfGesNoJSRh9npAVw
 L+1ypedv1Tl2GCV+EoZBEOWl+VG0xcIhu2IBeHOxP2Z26kHTP765ZvZUgrvCAiAGOz1ARM7J+BD
 V9tVhuPJEr39pZQuOS5Cs67kh5yp79Quqk3amCh5utGkn7N0=
X-Google-Smtp-Source: AGHT+IFCWGCB9w3JZkSqlrk4a0OYpaWYnOsewLh1z3k9Jb7NB4buZSqln74MwC7LX4UWbpbQGZTMJw==
X-Received: by 2002:a17:906:3717:b0:afe:764d:6b31 with SMTP id
 a640c23a62f3a-afe764d736dmr1280383766b.4.1756367036783; 
 Thu, 28 Aug 2025 00:43:56 -0700 (PDT)
Received: from localhost ([185.92.221.13]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afe48fae316sm1165798866b.28.2025.08.28.00.43.56
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 28 Aug 2025 00:43:56 -0700 (PDT)
Date: Thu, 28 Aug 2025 07:43:56 +0000
From: Wei Yang <richard.weiyang@gmail.com>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, Zi Yan <ziy@nvidia.com>,
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
 Michal Hocko <mhocko@suse.com>, Mike Rapoport <rppt@kernel.org>,
 Muchun Song <muchun.song@linux.dev>, netdev@vger.kernel.org,
 Oscar Salvador <osalvador@suse.de>, Peter Xu <peterx@redhat.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Suren Baghdasaryan <surenb@google.com>, Tejun Heo <tj@kernel.org>,
 virtualization@lists.linux.dev, Vlastimil Babka <vbabka@suse.cz>,
 wireguard@lists.zx2c4.com, x86@kernel.org
Subject: Re: [PATCH v1 12/36] mm: simplify folio_page() and folio_page_idx()
Message-ID: <20250828074356.3xiuqugokg36yuxw@master>
References: <20250827220141.262669-1-david@redhat.com>
 <20250827220141.262669-13-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250827220141.262669-13-david@redhat.com>
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

On Thu, Aug 28, 2025 at 12:01:16AM +0200, David Hildenbrand wrote:
>Now that a single folio/compound page can no longer span memory sections
>in problematic kernel configurations, we can stop using nth_page().
>
>While at it, turn both macros into static inline functions and add
>kernel doc for folio_page_idx().
>
>Reviewed-by: Zi Yan <ziy@nvidia.com>
>Signed-off-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Wei Yang <richard.weiyang@gmail.com>

The code looks good, while one nit below.

>---
> include/linux/mm.h         | 16 ++++++++++++++--
> include/linux/page-flags.h |  5 ++++-
> 2 files changed, 18 insertions(+), 3 deletions(-)
>
>diff --git a/include/linux/mm.h b/include/linux/mm.h
>index 2dee79fa2efcf..f6880e3225c5c 100644
>--- a/include/linux/mm.h
>+++ b/include/linux/mm.h
>@@ -210,10 +210,8 @@ extern unsigned long sysctl_admin_reserve_kbytes;
> 
> #if defined(CONFIG_SPARSEMEM) && !defined(CONFIG_SPARSEMEM_VMEMMAP)
> #define nth_page(page,n) pfn_to_page(page_to_pfn((page)) + (n))
>-#define folio_page_idx(folio, p)	(page_to_pfn(p) - folio_pfn(folio))
> #else
> #define nth_page(page,n) ((page) + (n))
>-#define folio_page_idx(folio, p)	((p) - &(folio)->page)
> #endif
> 
> /* to align the pointer to the (next) page boundary */
>@@ -225,6 +223,20 @@ extern unsigned long sysctl_admin_reserve_kbytes;
> /* test whether an address (unsigned long or pointer) is aligned to PAGE_SIZE */
> #define PAGE_ALIGNED(addr)	IS_ALIGNED((unsigned long)(addr), PAGE_SIZE)
> 
>+/**
>+ * folio_page_idx - Return the number of a page in a folio.
>+ * @folio: The folio.
>+ * @page: The folio page.
>+ *
>+ * This function expects that the page is actually part of the folio.
>+ * The returned number is relative to the start of the folio.
>+ */
>+static inline unsigned long folio_page_idx(const struct folio *folio,
>+		const struct page *page)
>+{
>+	return page - &folio->page;
>+}
>+
> static inline struct folio *lru_to_folio(struct list_head *head)
> {
> 	return list_entry((head)->prev, struct folio, lru);
>diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
>index 5ee6ffbdbf831..faf17ca211b4f 100644
>--- a/include/linux/page-flags.h
>+++ b/include/linux/page-flags.h
>@@ -316,7 +316,10 @@ static __always_inline unsigned long _compound_head(const struct page *page)
>  * check that the page number lies within @folio; the caller is presumed
>  * to have a reference to the page.
>  */
>-#define folio_page(folio, n)	nth_page(&(folio)->page, n)
>+static inline struct page *folio_page(struct folio *folio, unsigned long n)
>+{
>+	return &folio->page + n;
>+}
> 

Curious about why it is in page-flags.h. It seems not related to page-flags.

> static __always_inline int PageTail(const struct page *page)
> {
>-- 
>2.50.1
>

-- 
Wei Yang
Help you, Help me
