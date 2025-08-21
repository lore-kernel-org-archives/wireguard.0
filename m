Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81C45CA0EFA
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 21 Aug 2025 21:33:38 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b0504485;
	Thu, 21 Aug 2025 20:07:52 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 93b3435e
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 21 Aug 2025 20:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1755806866;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PkrXh5PHMEq3NY5i+0892fbAshOERsmwyMLhbVIa0Cc=;
 b=SyYTfZbuLDjRLeVEASoNNlrJO8iu+FMJsS61MAfef62rsTA54jfinhZ2Ej15mkcMUKY3of
 8OQce9iU41kpATn1T0j8qRkpMTH4parQNIs65gYoYcrgj2R7RBYbWmsw+WSdGtZkvT9hhe
 lvoZhhvzh3D5UPfAOd+aDROv/cVlIFY=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-543-Bpj-Q20INECiFot_Ewvcdg-1; Thu, 21 Aug 2025 16:07:44 -0400
X-MC-Unique: Bpj-Q20INECiFot_Ewvcdg-1
X-Mimecast-MFC-AGG-ID: Bpj-Q20INECiFot_Ewvcdg_1755806864
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-45a1b05d251so7742315e9.1
 for <wireguard@lists.zx2c4.com>; Thu, 21 Aug 2025 13:07:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755806863; x=1756411663;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PkrXh5PHMEq3NY5i+0892fbAshOERsmwyMLhbVIa0Cc=;
 b=rk+hFrVaTRsywGlPE0qDYFVkkXVPE9T34DHJFI1qe0qm6caRMqeRG32p6k6Uk+Nye4
 LbrbwNkAOC9FcumJjximkimuPY5/xOqk6KHKO04IUGtNsrS+3iNPQBRcq+25Uy2uu9l5
 gF/YDLmfYG+1woQ4aJfX9FjaSHEOumCQQD+J8vFblQDtXw/lp9VTm8jX6rMSDKANDFNp
 UO7psAIHjknpR8njYVlmcp9ZDzVtBjSEMMUBR37cT6lxi7ROS2WJLY4lEiRalI81dEso
 XP6SjnfR4NI4Xx4Rmj4zHtZZ3mbKAmUiyQqnZy2ruxGCzuZz4p6uzGMAkV93vlcBf0TJ
 lKbA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVHGEHoBy4X2LfSzdp/0x7H7QCExX1GAxo8YoQzVLixvuptxYJ5f67HjEP+tDr8gvBdteGo1w3ktDE=@lists.zx2c4.com
X-Gm-Message-State: AOJu0YxYkrUJoCGOv3w50vnoWEXmr1R4GWAhYTbb6DqRRBhuJZYjABeq
 R4K0iqlOZ4nvd2/Gva8o84bxLvNx1C7V/mBjpkLMS1R9SOiAiOYWdtPqjZ+3rySbcR5MiO56Jl6
 BNUb44v1gIaNZykCatBHC9olVMgdhoi3Ur3/I9Q8N4hWQtIda/0/xh5RkzaLRHg==
X-Gm-Gg: ASbGnctBFPwTBBBrT92l/R4HG3johm35nMOt70G1C+3KRnCso9A0THx2d2pclqdsyYh
 UhxBLPrUxZ/1dDZMCQvJpEUg2bprQVsXuL2bBufmDa+eko2cdFydDISzJGeP/uiotNl7TC9L00E
 EaLHLy+VgH7c09jsmGLZCokZ7nDqQCmbvtaJ+X8V+iO0dzT7cLssHMihk//OnB2U/b/X4JwkYFS
 fKvDZuJItNWOtH5L/8ApdCzzkbYcwCokZUBfR+iJMmaRk8FJFcIfs01UgwWdyMb3mcCQndXdDMs
 GvEdHBfcSg8wuuoX+vzEeSpPHywTo2wsitVystajw2rfEzMI0sYUu2MOrx/kRiAVgRRnUoMG/O0
 xJezeA/6BBeekfNpWGXrpiw==
X-Received: by 2002:a5d:5d0a:0:b0:3b9:14f2:7eea with SMTP id
 ffacd0b85a97d-3c5daefc2a3mr192559f8f.18.1755806863493; 
 Thu, 21 Aug 2025 13:07:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFB28V/U3gI+p1afMr2c1HujEN1g59N1A45YIj+RBO5vrtdOMlsNhrN6BtrkE7YShkW7nBB8Q==
X-Received: by 2002:a5d:5d0a:0:b0:3b9:14f2:7eea with SMTP id
 ffacd0b85a97d-3c5daefc2a3mr192518f8f.18.1755806862961; 
 Thu, 21 Aug 2025 13:07:42 -0700 (PDT)
Received: from localhost
 (p200300d82f26ba0008036ec5991806fd.dip0.t-ipconnect.de.
 [2003:d8:2f26:ba00:803:6ec5:9918:6fd])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-45b51b61256sm1742995e9.3.2025.08.21.13.07.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Aug 2025 13:07:42 -0700 (PDT)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: David Hildenbrand <david@redhat.com>,
 Alexander Potapenko <glider@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Brendan Jackman <jackmanb@google.com>, Christoph Lameter <cl@gentwo.org>,
 Dennis Zhou <dennis@kernel.org>, Dmitry Vyukov <dvyukov@google.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 iommu@lists.linux.dev, io-uring@vger.kernel.org,
 Jason Gunthorpe <jgg@nvidia.com>, Jens Axboe <axboe@kernel.dk>,
 Johannes Weiner <hannes@cmpxchg.org>, John Hubbard <jhubbard@nvidia.com>,
 kasan-dev@googlegroups.com, kvm@vger.kernel.org,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Linus Torvalds <torvalds@linux-foundation.org>, linux-arm-kernel@axis.com,
 linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org,
 linux-ide@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-mmc@vger.kernel.org, linux-mm@kvack.org,
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
 wireguard@lists.zx2c4.com, x86@kernel.org, Zi Yan <ziy@nvidia.com>
Subject: [PATCH RFC 13/35] mm: simplify folio_page() and folio_page_idx()
Date: Thu, 21 Aug 2025 22:06:39 +0200
Message-ID: <20250821200701.1329277-14-david@redhat.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250821200701.1329277-1-david@redhat.com>
References: <20250821200701.1329277-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Qyo4Tdou9mJSWYrADoM_nq5dmQLKAKq6TsZi7_ak3ME_1755806864
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
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

Now that a single folio/compound page can no longer span memory sections
in problematic kernel configurations, we can stop using nth_page().

While at it, turn both macros into static inline functions and add
kernel doc for folio_page_idx().

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/linux/mm.h         | 16 ++++++++++++++--
 include/linux/page-flags.h |  5 ++++-
 2 files changed, 18 insertions(+), 3 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 48a985e17ef4e..ef360b72cb05c 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -210,10 +210,8 @@ extern unsigned long sysctl_admin_reserve_kbytes;
 
 #if defined(CONFIG_SPARSEMEM) && !defined(CONFIG_SPARSEMEM_VMEMMAP)
 #define nth_page(page,n) pfn_to_page(page_to_pfn((page)) + (n))
-#define folio_page_idx(folio, p)	(page_to_pfn(p) - folio_pfn(folio))
 #else
 #define nth_page(page,n) ((page) + (n))
-#define folio_page_idx(folio, p)	((p) - &(folio)->page)
 #endif
 
 /* to align the pointer to the (next) page boundary */
@@ -225,6 +223,20 @@ extern unsigned long sysctl_admin_reserve_kbytes;
 /* test whether an address (unsigned long or pointer) is aligned to PAGE_SIZE */
 #define PAGE_ALIGNED(addr)	IS_ALIGNED((unsigned long)(addr), PAGE_SIZE)
 
+/**
+ * folio_page_idx - Return the number of a page in a folio.
+ * @folio: The folio.
+ * @page: The folio page.
+ *
+ * This function expects that the page is actually part of the folio.
+ * The returned number is relative to the start of the folio.
+ */
+static inline unsigned long folio_page_idx(const struct folio *folio,
+		const struct page *page)
+{
+	return page - &folio->page;
+}
+
 static inline struct folio *lru_to_folio(struct list_head *head)
 {
 	return list_entry((head)->prev, struct folio, lru);
diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
index d53a86e68c89b..080ad10c0defc 100644
--- a/include/linux/page-flags.h
+++ b/include/linux/page-flags.h
@@ -316,7 +316,10 @@ static __always_inline unsigned long _compound_head(const struct page *page)
  * check that the page number lies within @folio; the caller is presumed
  * to have a reference to the page.
  */
-#define folio_page(folio, n)	nth_page(&(folio)->page, n)
+static inline struct page *folio_page(struct folio *folio, unsigned long nr)
+{
+	return &folio->page + nr;
+}
 
 static __always_inline int PageTail(const struct page *page)
 {
-- 
2.50.1

