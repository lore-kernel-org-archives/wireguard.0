Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17A73CA0EFF
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 21 Aug 2025 20:07:40 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9709a527;
	Thu, 21 Aug 2025 20:07:39 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 7cc4fb57
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 21 Aug 2025 20:07:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1755806852;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G9hzYOZv6YXUN4v1wicJ53nqMhopJDezqYU76J2buLg=;
 b=VeBAVrOi7cMxlUiYW8SoxD87n24+6Clf5QZOY6oNbvz5GGSHa760IINbspI1FcV1fURR7i
 czuib7xp5VRPjCHNu99CNa+7BE7k0bIrp8DQFg+ZK3yzEmqpYeAyb50LYqYdLvI3UI+6tY
 ZKn6jENeKkH1OWciklnx/zcrOJqBfcU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-32-svimO_MOMh6JegIavuf1Rw-1; Thu, 21 Aug 2025 16:07:31 -0400
X-MC-Unique: svimO_MOMh6JegIavuf1Rw-1
X-Mimecast-MFC-AGG-ID: svimO_MOMh6JegIavuf1Rw_1755806850
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-45a1b0045a0so8434385e9.0
 for <wireguard@lists.zx2c4.com>; Thu, 21 Aug 2025 13:07:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755806850; x=1756411650;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=G9hzYOZv6YXUN4v1wicJ53nqMhopJDezqYU76J2buLg=;
 b=A6V6ClOq/NQex3/msSzEA8zQT1+yRKGjZf8lLhd1NxiTzcmuQ8rjibb+okwW+E5Sze
 ydvMMzHWpyuYgkE42ffmJOF2dibJBqpZvmRtDsoP3bIesMT0CMY+F1wT7qoF4ubxyfEO
 5d3PDRq5wfe/pKJNkrGyInSTDA8QBxXvOORR65S70WUOfwxRwelSYpneBuUkNHV44nxL
 bY5/RVzb3z7AjLPNwarvB75pqpR0Gtwa6TG6ZCZilr0SnkEyGMz/S1T/lomtCLJH1vPG
 aafTL7rAKeHCpPAOCHmckToIjvfd3RZFn9mNZglH6Nd4y7t03jWScgCM3JlgmeYcIshK
 KArA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUqUpynl495otgXQqLnPLi9+sti+hxcsCeEea68E5b62vfM0jy50fa8vGU7OY0UL3zmj1SD3vUA+Oo=@lists.zx2c4.com
X-Gm-Message-State: AOJu0YzBidcumracL92LAlcq8boLnrUQ8p8FzXaPilcH5EkNFTZDaA7f
 ljrhRuC43qxEGBvlY2T/jlFf2qAyTcAfUseG54M5BjRa1TIzogpvQ+tW+myfZSQQY2M/FL+Y8xp
 B6qq172Ah2gx+B1rw4+5rkzgzXKh84MjaK0M10ob21oAn8me+n14B2I0LLxRdJg==
X-Gm-Gg: ASbGncu+JJG/K3nWciJAcf2o1UIFRUzr1mmVmcRuABgs6jARJCg+z8Ml6jgBciVZ7vl
 x1Euw3caYRrpUy1iA/gQRHSo3KI/TcWCj+wTVOIwfxtPOJBUvN5zIdahRW442IoA/TqNo+hplpK
 drLXPEUjC7S2kehFiquyXKV2GnLNv0hRgaVnklofXDzoNPgsOwykVpehIwF4mbvs1Y9ppyGyyeJ
 LZPKRy4WKuF1mySMkNwYffZUIavw1VPhSXmhUtajN26OiPxN+6+phfAohhv7oxOXQ+6BmP+6LDV
 b89bBJG9xeyTXxu+fV1DotekrSw8hG506iO3gEaZ0zKDCyOf6vbKc8w3PusHofbPOwvcRFQbMV/
 ndQxXmReM6X1QP5poWRHM/g==
X-Received: by 2002:a05:600c:1548:b0:459:dfde:3329 with SMTP id
 5b1f17b1804b1-45b517ddbe2mr2956125e9.31.1755806850060; 
 Thu, 21 Aug 2025 13:07:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHPNoTdvVqQJqQwQf/z0aFpcDb/7HunF1Y6KwbAqmFFF4D3cnAaKEmAnoGbjwE6N5eIepmoyw==
X-Received: by 2002:a05:600c:1548:b0:459:dfde:3329 with SMTP id
 5b1f17b1804b1-45b517ddbe2mr2955545e9.31.1755806849496; 
 Thu, 21 Aug 2025 13:07:29 -0700 (PDT)
Received: from localhost
 (p200300d82f26ba0008036ec5991806fd.dip0.t-ipconnect.de.
 [2003:d8:2f26:ba00:803:6ec5:9918:6fd])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3c3a8980ed5sm7242256f8f.16.2025.08.21.13.07.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Aug 2025 13:07:29 -0700 (PDT)
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
Subject: [PATCH RFC 08/35] mm/hugetlb: check for unreasonable folio sizes when
 registering hstate
Date: Thu, 21 Aug 2025 22:06:34 +0200
Message-ID: <20250821200701.1329277-9-david@redhat.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250821200701.1329277-1-david@redhat.com>
References: <20250821200701.1329277-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: y96BfPHw3zdKK51K7CYQB9joFJiC-Obgx20TssETwFY_1755806850
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

Let's check that no hstate that corresponds to an unreasonable folio size
is registered by an architecture. If we were to succeed registering, we
could later try allocating an unsupported gigantic folio size.

Further, let's add a BUILD_BUG_ON() for checking that HUGETLB_PAGE_ORDER
is sane at build time. As HUGETLB_PAGE_ORDER is dynamic on powerpc, we have
to use a BUILD_BUG_ON_INVALID() to make it compile.

No existing kernel configuration should be able to trigger this check:
either SPARSEMEM without SPARSEMEM_VMEMMAP cannot be configured or
gigantic folios will not exceed a memory section (the case on sparse).

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/hugetlb.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 514fab5a20ef8..d12a9d5146af4 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -4657,6 +4657,7 @@ static int __init hugetlb_init(void)
 
 	BUILD_BUG_ON(sizeof_field(struct page, private) * BITS_PER_BYTE <
 			__NR_HPAGEFLAGS);
+	BUILD_BUG_ON_INVALID(HUGETLB_PAGE_ORDER > MAX_FOLIO_ORDER);
 
 	if (!hugepages_supported()) {
 		if (hugetlb_max_hstate || default_hstate_max_huge_pages)
@@ -4740,6 +4741,7 @@ void __init hugetlb_add_hstate(unsigned int order)
 	}
 	BUG_ON(hugetlb_max_hstate >= HUGE_MAX_HSTATE);
 	BUG_ON(order < order_base_2(__NR_USED_SUBPAGE));
+	WARN_ON(order > MAX_FOLIO_ORDER);
 	h = &hstates[hugetlb_max_hstate++];
 	__mutex_init(&h->resize_lock, "resize mutex", &h->resize_key);
 	h->order = order;
-- 
2.50.1

