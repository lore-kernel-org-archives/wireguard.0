Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C90ECA0EFF
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 21 Aug 2025 21:33:45 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 246cc3dd;
	Thu, 21 Aug 2025 20:08:46 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 861d2a0c
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 21 Aug 2025 20:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1755806920;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wK69Pd9CHZjKZhmlaft7kkJNdToX7IH/S9WvVIRScQg=;
 b=fOD49HRFKqBx+Jh+YkATToKV9bMInucg7AS0hzHpNKARRp1dprl6+iaqjuE27C/lFKIN6W
 dmqPhLKblNQy1oZ5uTWhnn1afLrnKSRxlIaV/6hNuVFw4Q3qkFR1TKK+XMEsQS1s8l22rO
 gWSSaO3J2B4md5pg/bQzbWez8iOVZjY=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-361-R2MiSCNKPn2jv9QPwehJwQ-1; Thu, 21 Aug 2025 16:08:39 -0400
X-MC-Unique: R2MiSCNKPn2jv9QPwehJwQ-1
X-Mimecast-MFC-AGG-ID: R2MiSCNKPn2jv9QPwehJwQ_1755806918
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-3b9d41b88ffso838827f8f.0
 for <wireguard@lists.zx2c4.com>; Thu, 21 Aug 2025 13:08:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755806918; x=1756411718;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wK69Pd9CHZjKZhmlaft7kkJNdToX7IH/S9WvVIRScQg=;
 b=jIaLHG4H3ElNoLmJ1+/2C0ejFjyidAz65g43sGA5OgXNZBt5Z9NZ+Tf+XuKOHmVDNX
 JCNa2xrVVZJLsJXE58IK5UZDs/osG6qD7R/S2ctyE2VteRXuuSkK+KfaGk/1/z98eO32
 dvmnsM4e5QodQoCAy0/4M1a965cjJNZl+d8/TrKotH8iJO4EgBeJk8WHHr/IaNR6HYuo
 rJUosdz5u9mD+JoGjn3MJ0chDrKeW6vgHW8kWeSQsOAUh87qwEb02nJ7Ifd9/8+A2iuJ
 neC4M38jytpB3dMg0EQWpC3P0hmq2CcLBPbmhmC0vgpaYjUO1oSaKirPQEp3dHOcNgNp
 Uvpw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXAtZJxqbeqsVEXalij9UYzsh8OQm0COLVxbUthN3xFs1LFr8nYqntwI6l1fHMog5skeL06Us0NLWM=@lists.zx2c4.com
X-Gm-Message-State: AOJu0YwKgIYFnrv1ksxNnxXKz9h5YHMYNaz303QhgbAyXHl90L+X5BHB
 9q5m6YfmUCGkncPZlypv2xCNeAsV3+jtfYbE6LC0d6U5JjIcKdOHeDeoqdroL8tIWh2yGyLvlZD
 NzDg9/aF53D7xOfEsMfbFlLndSffTE05E9jAxTabKGiPEN0vjAACuavFMzBdubw==
X-Gm-Gg: ASbGnctiL89FhULxIF1BAUQPiU4DXPK4tT1NLkeSvjNJRJAd87yxGTyO5URxQTMvR5N
 6ILop9puW6BUGC4pSay21WqESweVUq4RgL6ZhoOpXl2u8EVc3HT1FE58URV7SYWERD1JNpOhOHU
 H2I2ojEi+x8aZu1k4hN6n/FBAuqF5qIF4UgABfZ5CyiMEOW7OY8uiSKiaKugp+2L/VQFvoKcD89
 7jZ9B2AmaAcSuJdizxCRNvyTxc7/UNKHLpl+FdOc8EoJvuBdcHuvy38yb5FhF4uvKYpt8H9QdzM
 mdm1I2Q2Y4S1lj1Vg/l8MxfqSCaOalB2Oouh7yfuKyzGj9NHC/LoZBUpI1K36V3HyaDzDbhWc3f
 xnWgja0o3FjxzIsPpXrgKFg==
X-Received: by 2002:a5d:64e9:0:b0:3b8:d7c7:62d7 with SMTP id
 ffacd0b85a97d-3c5daefc298mr218332f8f.16.1755806917867; 
 Thu, 21 Aug 2025 13:08:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IETBfJ8klmP3LMs+G3FmlUfLKA9Qlb/rzelQ5gyETYamNwKefh2PCq6Da3p1XS4Ia+K1NPGrw==
X-Received: by 2002:a5d:64e9:0:b0:3b8:d7c7:62d7 with SMTP id
 ffacd0b85a97d-3c5daefc298mr218279f8f.16.1755806917364; 
 Thu, 21 Aug 2025 13:08:37 -0700 (PDT)
Received: from localhost
 (p200300d82f26ba0008036ec5991806fd.dip0.t-ipconnect.de.
 [2003:d8:2f26:ba00:803:6ec5:9918:6fd])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3c4ccbf04fasm3355197f8f.7.2025.08.21.13.08.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Aug 2025 13:08:36 -0700 (PDT)
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
Subject: [PATCH RFC 32/35] mm/gup: drop nth_page() usage in
 unpin_user_page_range_dirty_lock()
Date: Thu, 21 Aug 2025 22:06:58 +0200
Message-ID: <20250821200701.1329277-33-david@redhat.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250821200701.1329277-1-david@redhat.com>
References: <20250821200701.1329277-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: xTELoaRNAW_GT8kfWqYgTOR0dqbEgYQq3u72JmqnP9w_1755806918
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

There is the concern that unpin_user_page_range_dirty_lock() might do
some weird merging of PFN ranges -- either now or in the future -- such
that PFN range is contiguous but the page range might not be.

Let's sanity-check for that and drop the nth_page() usage.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/gup.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/mm/gup.c b/mm/gup.c
index f017ff6d7d61a..0a669a766204b 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -237,7 +237,7 @@ void folio_add_pin(struct folio *folio)
 static inline struct folio *gup_folio_range_next(struct page *start,
 		unsigned long npages, unsigned long i, unsigned int *ntails)
 {
-	struct page *next = nth_page(start, i);
+	struct page *next = start + i;
 	struct folio *folio = page_folio(next);
 	unsigned int nr = 1;
 
@@ -342,6 +342,9 @@ EXPORT_SYMBOL(unpin_user_pages_dirty_lock);
  * "gup-pinned page range" refers to a range of pages that has had one of the
  * pin_user_pages() variants called on that page.
  *
+ * The page range must be truly contiguous: the page range corresponds
+ * to a contiguous PFN range and all pages can be iterated naturally.
+ *
  * For the page ranges defined by [page .. page+npages], make that range (or
  * its head pages, if a compound page) dirty, if @make_dirty is true, and if the
  * page range was previously listed as clean.
@@ -359,6 +362,8 @@ void unpin_user_page_range_dirty_lock(struct page *page, unsigned long npages,
 	struct folio *folio;
 	unsigned int nr;
 
+	VM_WARN_ON_ONCE(!page_range_contiguous(page, npages));
+
 	for (i = 0; i < npages; i += nr) {
 		folio = gup_folio_range_next(page, npages, i, &nr);
 		if (make_dirty && !folio_test_dirty(folio)) {
-- 
2.50.1

