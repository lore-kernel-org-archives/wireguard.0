Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1669CA0FE2
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 21 Aug 2025 20:07:33 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2205bd75;
	Thu, 21 Aug 2025 20:07:31 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 374b5127
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 21 Aug 2025 20:07:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1755806847;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=saIpwl0G6zoDDZA6kqzaAKGDHCkLp/ivw/dNNi90asQ=;
 b=dBdGbLGcVbRa9Ikps2KwOnaoL4YsVb8wdAXF6ARS144K7GPVFJrdibgBt7thHpBMe1Vgzy
 68z0YKbhgXTw55s7BNSlH/0FOyk4bm7wyBFmjdho+lGObZK2cz0zVmk81MszaIIKKpdo7B
 Tot+dhPdVLSrkCrClPDcdtWNEXv5Qhc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-668-cf8tXlMVNHqfz8xzdIhrug-1; Thu, 21 Aug 2025 16:07:25 -0400
X-MC-Unique: cf8tXlMVNHqfz8xzdIhrug-1
X-Mimecast-MFC-AGG-ID: cf8tXlMVNHqfz8xzdIhrug_1755806845
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-45a1b05d251so7739855e9.1
 for <wireguard@lists.zx2c4.com>; Thu, 21 Aug 2025 13:07:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755806844; x=1756411644;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=saIpwl0G6zoDDZA6kqzaAKGDHCkLp/ivw/dNNi90asQ=;
 b=lXFtmh5HV4Nn2Z5Ic329/11+eeVrIgjzYrY3nDgYnK9sRTs0Gjab2bLS+n3rfMDYsh
 FGj3iIj9AqfAQRxYEiYodg55SvAa9MI1wUTM+ACKjSREhypxyo5Uo8L7r15FSHhkllPh
 Kg9RVaPl8Pi7pxeTFNq5zU5o7hpVd5vqBdY9alx65kEEWcaHJAFcfPVXtl9iN+rzxdur
 oY3pazdn0kUf0pdtR2TdwNiildhzkhQ48Wd4YRsXhbIu4Xgjdk1cZTOTPw2v7TOj7/aY
 /FG8joTw1uGCA4VQaxNhl9Fp3XPXIbqjlGEbBtNpW2j8TWtQlSbXGr9dc4nx3NluwLNv
 FN5A==
X-Forwarded-Encrypted: i=1;
 AJvYcCV05jNfTEqC7mQdkwksTSOqZt5lutg+Z1Bxkv9J3QW4WYDuFi/d7s1l3Jb8aq63sgn/SVAzSLQ0IEo=@lists.zx2c4.com
X-Gm-Message-State: AOJu0Yzyb18Ig6brcgLMABUM32+0YdL/MyygxGmk8rxqbvW4LVrQD2lH
 ofJbOBgY9ixNzT04DS8AZ8jPwu2KJ5S5CZLS/6WumBq8bSOfGThKy9v0fKDTUULRWkxHSWFvPg4
 BMDwOOV3CbamS3fXHkmlVGRL68RknFhMWAcYgcaujDtgVhfnHRiUwbMtH5ypPbw==
X-Gm-Gg: ASbGncu619sMYeh/k8GBZIyeMvoY2Blq+JCdgeYIPjv/uzeFntu5Cy8FzkjmrC2Wd/0
 IVZfxtKkf1OfiaGhcurWx83FNTxkSxK5my273t1x1haRFXb3FN0xp5N6jHcNCc91nFTc/hZ+q1W
 Y8mp/sjY+yfb8Gbw7BumFqXOFWNOch+4VK43EiZbeBfti3Q8bQGFUuPa5jmIStbSvp2FcPkIGYK
 wF114kNvRLyOnCssNF3DrMzIpsxdxvRq3f9Q/ZPkTR10xM8jkFdD4GfFVYtTufY9NF/kJYH36Lv
 qBmMER5TGVKDkAozBnZ9zZ76xKbrnd5Kc4f0xO0Pjnll87rXmHzN0agqEdk2xfIbJWx0c3LrcgD
 Rph3hv3+YQPuqHidLiDWkrA==
X-Received: by 2002:a05:600c:35c3:b0:456:285b:db3c with SMTP id
 5b1f17b1804b1-45b5178e768mr3050185e9.3.1755806844552; 
 Thu, 21 Aug 2025 13:07:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFwjTyvRglWWHHllkR7aRLdEFYS2lmKXV2DYH9bn4L7+YG6UNdB0HbBuiJbZZ1vy18QyYWFNg==
X-Received: by 2002:a05:600c:35c3:b0:456:285b:db3c with SMTP id
 5b1f17b1804b1-45b5178e768mr3049835e9.3.1755806844048; 
 Thu, 21 Aug 2025 13:07:24 -0700 (PDT)
Received: from localhost
 (p200300d82f26ba0008036ec5991806fd.dip0.t-ipconnect.de.
 [2003:d8:2f26:ba00:803:6ec5:9918:6fd])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3c074e38d65sm12980909f8f.27.2025.08.21.13.07.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Aug 2025 13:07:23 -0700 (PDT)
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
Subject: [PATCH RFC 06/35] mm/page_alloc: reject unreasonable folio/compound
 page sizes in alloc_contig_range_noprof()
Date: Thu, 21 Aug 2025 22:06:32 +0200
Message-ID: <20250821200701.1329277-7-david@redhat.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250821200701.1329277-1-david@redhat.com>
References: <20250821200701.1329277-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: xQWNl4B32wDnnsxtb_fqvq2DkZwShJJIDxdh5FnB6BY_1755806845
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

Let's reject them early, which in turn makes folio_alloc_gigantic() reject
them properly.

To avoid converting from order to nr_pages, let's just add MAX_FOLIO_ORDER
and calculate MAX_FOLIO_NR_PAGES based on that.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/linux/mm.h | 6 ++++--
 mm/page_alloc.c    | 5 ++++-
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 00c8a54127d37..77737cbf2216a 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2055,11 +2055,13 @@ static inline long folio_nr_pages(const struct folio *folio)
 
 /* Only hugetlbfs can allocate folios larger than MAX_ORDER */
 #ifdef CONFIG_ARCH_HAS_GIGANTIC_PAGE
-#define MAX_FOLIO_NR_PAGES	(1UL << PUD_ORDER)
+#define MAX_FOLIO_ORDER		PUD_ORDER
 #else
-#define MAX_FOLIO_NR_PAGES	MAX_ORDER_NR_PAGES
+#define MAX_FOLIO_ORDER		MAX_PAGE_ORDER
 #endif
 
+#define MAX_FOLIO_NR_PAGES	(1UL << MAX_FOLIO_ORDER)
+
 /*
  * compound_nr() returns the number of pages in this potentially compound
  * page.  compound_nr() can be called on a tail page, and is defined to
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index ca9e6b9633f79..1e6ae4c395b30 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -6833,6 +6833,7 @@ static int __alloc_contig_verify_gfp_mask(gfp_t gfp_mask, gfp_t *gfp_cc_mask)
 int alloc_contig_range_noprof(unsigned long start, unsigned long end,
 			      acr_flags_t alloc_flags, gfp_t gfp_mask)
 {
+	const unsigned int order = ilog2(end - start);
 	unsigned long outer_start, outer_end;
 	int ret = 0;
 
@@ -6850,6 +6851,9 @@ int alloc_contig_range_noprof(unsigned long start, unsigned long end,
 					    PB_ISOLATE_MODE_CMA_ALLOC :
 					    PB_ISOLATE_MODE_OTHER;
 
+	if (WARN_ON_ONCE((gfp_mask & __GFP_COMP) && order > MAX_FOLIO_ORDER))
+		return -EINVAL;
+
 	gfp_mask = current_gfp_context(gfp_mask);
 	if (__alloc_contig_verify_gfp_mask(gfp_mask, (gfp_t *)&cc.gfp_mask))
 		return -EINVAL;
@@ -6947,7 +6951,6 @@ int alloc_contig_range_noprof(unsigned long start, unsigned long end,
 			free_contig_range(end, outer_end - end);
 	} else if (start == outer_start && end == outer_end && is_power_of_2(end - start)) {
 		struct page *head = pfn_to_page(start);
-		int order = ilog2(end - start);
 
 		check_new_pages(head, order);
 		prep_new_page(head, order, gfp_mask, 0);
-- 
2.50.1

