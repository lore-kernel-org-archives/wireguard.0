Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 080C6CA0EFF
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 21 Aug 2025 21:33:42 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9448a1cf;
	Thu, 21 Aug 2025 20:08:08 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 09265851
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 21 Aug 2025 20:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1755806883;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w6VkvDa+3msZeC5nA9B9+aDln+Mg2ABReefULBX94/4=;
 b=CnT07iXmzAJ/92HtUcz8hNpOvtWIYgdkVxaSTewAJk9elXxJc9veyLubyrkG5MLS9rBYvF
 UDbPW4lEECvgj3K20kiXeYVb84RF6UU5ntfLCVFOSI3QX7Dh1g37skkwiLGju6hSLPgDUn
 UKobI1Nz3d6NF4tOIMM4zYJ6XiBxJNk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-299-VsqTMqa6MiitZYml0WRUtg-1; Thu, 21 Aug 2025 16:08:01 -0400
X-MC-Unique: VsqTMqa6MiitZYml0WRUtg-1
X-Mimecast-MFC-AGG-ID: VsqTMqa6MiitZYml0WRUtg_1755806880
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-45a15fd6b45so10808195e9.1
 for <wireguard@lists.zx2c4.com>; Thu, 21 Aug 2025 13:08:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755806880; x=1756411680;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=w6VkvDa+3msZeC5nA9B9+aDln+Mg2ABReefULBX94/4=;
 b=pP3TqKBD9UUf1pMOKRIZiUoywyTONkkvTMVnKdAmML2MJV/+dT8qQ6jtLOqZngSkkx
 Qo5wcEnt5kjmqSaxV8GhyZj4V0pLBNsydA/m/hDA56LbGxWeAcRvHcWzbB+Cl9XJKs+A
 2wUwZWG2UA06PX1YuyU3xccc+2POkK7S61JoouAzDr5nE5AmO1Wpt13IQzyRNh5FkqgO
 laHnc4EZRfnChca1rMde32VXtazN4qRRjhorIAh2Z6wes4LaJhwqh1kqegOudHlBuX5q
 Sd2QC+uKE6vtqocGg7C16a0TP+NbrywsmQ/ATeUaVtLTMonGNgjTDJOzWvDgcKka6e/n
 T+RQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVS+M3SeMmZ0sp2+fd6MgasviMITxLXqE2Z6voLuaPNy5lHoch1AAYR4KdAhVSLLgIEflxHn9DqWS8=@lists.zx2c4.com
X-Gm-Message-State: AOJu0Yw+nIEvQFdvidHZeUIXbBbYidTkrdtEE8itYxSuxXz0ZPaw+bqG
 EwgupninQ+JWb1HcKetr9pZF+Fqk9jWHd8+NWphQ/WxhEYszHq079XCPDVH+z/DrAvOr1+L14TS
 VEHg/bbgoeW9BlbOILSE3HwgbQYWKBxnjP4M3WYGsLMhPwlFvZyMmToFwQRc13g==
X-Gm-Gg: ASbGncuIu2K+2fQ46B7kNqOfsMxcMYKgGDJIy5PYiKUIznrkWMpWHHPy0YOQZ7aH/ce
 tEEWh2Yyru5xFBHrXxQLwU43DhomY+ZprdkDR7pU0SZ2VjfeEpFdSDMugogKoW2c0IcRWHINekK
 0sV3g8nHQ4WYugJg7Tg53iUx5hjAPPovmGl3KFcJWcfv5WEcQQyMsWrH/BGJ7o5oTrj+WzceKny
 aJpHpuL4MviauOc6X1Kshk5FuNYtNS1fVxlZqX2ZjN4eNWuXE8JKaPxZeIfONQW1yXUnsblvU+t
 rSzRlu6hnyq2Sezna0rpUrLFQ51+zrIVH9qZSKhgqwz93kdpzzbwI7bJiKtKjv8Tp57RcN2uXhV
 Vk1JdCqeI7WKlb5mk9cfFgw==
X-Received: by 2002:a05:600c:1c87:b0:456:942:b162 with SMTP id
 5b1f17b1804b1-45b51792539mr3328865e9.11.1755806880060; 
 Thu, 21 Aug 2025 13:08:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG9ciI0WdoI3CxhUtu7m/cESVsdReJmvmXFWCMaWsO+hhXySreox2GeOL2sJ8kVyLPwCYhbEA==
X-Received: by 2002:a05:600c:1c87:b0:456:942:b162 with SMTP id
 5b1f17b1804b1-45b51792539mr3328365e9.11.1755806879543; 
 Thu, 21 Aug 2025 13:07:59 -0700 (PDT)
Received: from localhost
 (p200300d82f26ba0008036ec5991806fd.dip0.t-ipconnect.de.
 [2003:d8:2f26:ba00:803:6ec5:9918:6fd])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3c07778939bsm12219075f8f.46.2025.08.21.13.07.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Aug 2025 13:07:59 -0700 (PDT)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: David Hildenbrand <david@redhat.com>, Jens Axboe <axboe@kernel.dk>,
 Alexander Potapenko <glider@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Brendan Jackman <jackmanb@google.com>, Christoph Lameter <cl@gentwo.org>,
 Dennis Zhou <dennis@kernel.org>, Dmitry Vyukov <dvyukov@google.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 iommu@lists.linux.dev, io-uring@vger.kernel.org,
 Jason Gunthorpe <jgg@nvidia.com>, Johannes Weiner <hannes@cmpxchg.org>,
 John Hubbard <jhubbard@nvidia.com>, kasan-dev@googlegroups.com,
 kvm@vger.kernel.org, "Liam R. Howlett" <Liam.Howlett@oracle.com>,
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
Subject: [PATCH RFC 19/35] io_uring/zcrx: remove nth_page() usage within folio
Date: Thu, 21 Aug 2025 22:06:45 +0200
Message-ID: <20250821200701.1329277-20-david@redhat.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250821200701.1329277-1-david@redhat.com>
References: <20250821200701.1329277-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 0RZQhwLXJHXY23ZSyVBNLc3b1tmoDJnZ34m6ApG0aWU_1755806880
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

Within a folio/compound page, nth_page() is no longer required.
Given that we call folio_test_partial_kmap()+kmap_local_page(), the code
would already be problematic if the src_pages would span multiple folios.

So let's just assume that all src pages belong to a single
folio/compound page and can be iterated ordinarily.

Cc: Jens Axboe <axboe@kernel.dk>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 io_uring/zcrx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/io_uring/zcrx.c b/io_uring/zcrx.c
index f29b2a4867516..107b2a1b31c1c 100644
--- a/io_uring/zcrx.c
+++ b/io_uring/zcrx.c
@@ -966,7 +966,7 @@ static ssize_t io_copy_page(struct page *dst_page, struct page *src_page,
 		size_t n = len;
 
 		if (folio_test_partial_kmap(page_folio(src_page))) {
-			src_page = nth_page(src_page, src_offset / PAGE_SIZE);
+			src_page += src_offset / PAGE_SIZE;
 			src_offset = offset_in_page(src_offset);
 			n = min(PAGE_SIZE - src_offset, PAGE_SIZE - dst_offset);
 			n = min(n, len);
-- 
2.50.1

