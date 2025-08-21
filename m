Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B41B6CA0EFA
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 21 Aug 2025 23:17:01 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7e94f9bd;
	Thu, 21 Aug 2025 20:08:54 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 27a2150d
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 21 Aug 2025 20:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1755806928;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8aQmj/0+AYT4mPx/DatgQPPbmq0Lkvm9KCqKkKCdC9Q=;
 b=E+EKZVNoIN341jMTTRkCIXdmOqy0S50EZmPngqAufEwPbx8Oovknj/Of1Vh+DK6sLftdgY
 L++eBcRmIkt7n+h5FO9EfzS43bnLz3RahmZyzXuxYejpK2VM4NKGP871WLsIEKMqLyzFZW
 j9CGwzD4GF76CZDfMH8D9xnFLWmSOgg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-347-N6WRKwEvNGa8TVOYcm5akQ-1; Thu, 21 Aug 2025 16:08:46 -0400
X-MC-Unique: N6WRKwEvNGa8TVOYcm5akQ-1
X-Mimecast-MFC-AGG-ID: N6WRKwEvNGa8TVOYcm5akQ_1755806926
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-45a1b0d221aso6550515e9.3
 for <wireguard@lists.zx2c4.com>; Thu, 21 Aug 2025 13:08:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755806925; x=1756411725;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8aQmj/0+AYT4mPx/DatgQPPbmq0Lkvm9KCqKkKCdC9Q=;
 b=GUwvTo0Uet0UqdavlPvZK/lA8QqvEI/dy1TP0XGsre/IwB8wz7h4k4l79BbOJ8ewgL
 yIBb/xtk7njd33fsFAU20Mt7glbNmnfPx5jvbfkRbcn3l+1Snyxb7HT3unXNvmKIs0+d
 o4CwUKI6lPJPgAGzU2T09E6e12TqlPwlTdUq0PNVuSnYJw97nRpJUmF2yGCUnqnjc04o
 w55pD8pVSUniWhImUea4J5cgKFmF9Dz6kdM6QMyzFveALB+EP7rKaNcnQo5SN6LwroEr
 iXyjn+tFR21KdG5KXYHMkGo/RHgt8n8mlvfmMfwGTMR3y4E4BIvyaLm0TyuODAiydVlG
 qBAw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWv/56p6fdfidzDr/y+EzS9AQRRO2VhECOuxDj9FPrH5CbdMfqF4OKAPqyuEl12jr3ZoznSFCycPUY=@lists.zx2c4.com
X-Gm-Message-State: AOJu0YwUP+6icAaEc58B3fCmXJzHfSjQkt5Gr10bue5klecN4Hs6ryeV
 98uJ2Exc2h3T0wlQxubVwA4QTPctLK+uDzRZg7SR5NmeS8y1IGNHD0ORDcuPOyuri3G+XrJLRsW
 qRGEWU2Xl0YnhhQ9BFJGJTAy2Mwq2H2AcnESquC0FwZINA2I6mUYU0n0tXhk0CQ==
X-Gm-Gg: ASbGncusbt+Dz5HRAEg42VjfnYHVfP6MxgymFY7IK0KAg6iLiV3kVCkvMlFzyub0vG4
 ZR5AXSLKrGl3XXJXD24su5V97iSSbz4HXje7CBnIB/aEft1irtVfCsT3q9wOdIhRJ403c74ldcJ
 mxmIH+4pTJA5T84XUqfOIi+gIXVT6gc44w4Vi1CLBTjYJzYzIiKH1VmckiA0xI/mlEtobQweIfu
 /GiAjIIzZnfxISPEnFrhMSZygevPy5dXaRaIB/3dt2hY/NeCIlqE7B8Lqr5lxPJwoFi24tqPTkc
 XkYIV1VAnffe+O405iOoFkAHegoMyrv+rugxkt5gGqf3U0pjqlk+ctnpFCYYpWmvwHkt5oDn7di
 rX/g3jK1HrIYfzGSOibAHDQ==
X-Received: by 2002:a05:600c:3b25:b0:459:da89:b06 with SMTP id
 5b1f17b1804b1-45b517b008dmr3774435e9.16.1755806925537; 
 Thu, 21 Aug 2025 13:08:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHDDv+I9AWZPVyKVFD2prHDmQqsK3mzEWwP5yNf0oRJXtHjmqgi3hMC3hwAmszm5rTAtK85Rg==
X-Received: by 2002:a05:600c:3b25:b0:459:da89:b06 with SMTP id
 5b1f17b1804b1-45b517b008dmr3774035e9.16.1755806925116; 
 Thu, 21 Aug 2025 13:08:45 -0700 (PDT)
Received: from localhost
 (p200300d82f26ba0008036ec5991806fd.dip0.t-ipconnect.de.
 [2003:d8:2f26:ba00:803:6ec5:9918:6fd])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-45b50e0a479sm8895255e9.21.2025.08.21.13.08.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Aug 2025 13:08:44 -0700 (PDT)
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
Subject: [PATCH RFC 35/35] mm: remove nth_page()
Date: Thu, 21 Aug 2025 22:07:01 +0200
Message-ID: <20250821200701.1329277-36-david@redhat.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250821200701.1329277-1-david@redhat.com>
References: <20250821200701.1329277-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: VjeMog03pjrC5QJdzDXwKuKmL0O5VKxsKFh57-6Tpdk_1755806926
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

Now that all users are gone, let's remove it.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/linux/mm.h                   | 2 --
 tools/testing/scatterlist/linux/mm.h | 1 -
 2 files changed, 3 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index f59ad1f9fc792..3ded0db8322f7 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -210,9 +210,7 @@ extern unsigned long sysctl_admin_reserve_kbytes;
 
 #if defined(CONFIG_SPARSEMEM) && !defined(CONFIG_SPARSEMEM_VMEMMAP)
 bool page_range_contiguous(const struct page *page, unsigned long nr_pages);
-#define nth_page(page,n) pfn_to_page(page_to_pfn((page)) + (n))
 #else
-#define nth_page(page,n) ((page) + (n))
 static inline bool page_range_contiguous(const struct page *page,
 		unsigned long nr_pages)
 {
diff --git a/tools/testing/scatterlist/linux/mm.h b/tools/testing/scatterlist/linux/mm.h
index 5bd9e6e806254..121ae78d6e885 100644
--- a/tools/testing/scatterlist/linux/mm.h
+++ b/tools/testing/scatterlist/linux/mm.h
@@ -51,7 +51,6 @@ static inline unsigned long page_to_phys(struct page *page)
 
 #define page_to_pfn(page) ((unsigned long)(page) / PAGE_SIZE)
 #define pfn_to_page(pfn) (void *)((pfn) * PAGE_SIZE)
-#define nth_page(page,n) pfn_to_page(page_to_pfn((page)) + (n))
 
 #define __min(t1, t2, min1, min2, x, y) ({              \
 	t1 min1 = (x);                                  \
-- 
2.50.1

