Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8096CA0FE7
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 21 Aug 2025 21:33:45 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5147cd63;
	Thu, 21 Aug 2025 20:08:20 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 86f69bca
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 21 Aug 2025 20:08:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1755806894;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NKFS9/TuG2v9AIcAoooIJr3bGKW6zmP0XL+5izT5Y+4=;
 b=Asgvc2nRe+TJEI/uMByKO0brPcrRkTx89JxKNv/DzB0ld+4mIl0YJFypNHpcqTdk7x3Vbu
 0xnohi5l3C7ieinDW9UAB/Y4J6Pyq6TeJ5iZ2kNUsH1yFrKBwpCY9USfDDICSpbEYpzpOf
 bmBgtmyzF4u/4vr9Pyaua/G5SjzFLjw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-592-MVgyWWBVM9e0ODXCo_wWyQ-1; Thu, 21 Aug 2025 16:08:13 -0400
X-MC-Unique: MVgyWWBVM9e0ODXCo_wWyQ-1
X-Mimecast-MFC-AGG-ID: MVgyWWBVM9e0ODXCo_wWyQ_1755806892
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-45a1b0ccb6cso6975135e9.3
 for <wireguard@lists.zx2c4.com>; Thu, 21 Aug 2025 13:08:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755806892; x=1756411692;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NKFS9/TuG2v9AIcAoooIJr3bGKW6zmP0XL+5izT5Y+4=;
 b=ZKELTxHZn0SgCRyStc/b1SMEdm7jgEZIh8UCQkI1de4C8WGx3Prn0a+6sDv99DKRvt
 vlxLkHdkfxVvOrwMHHFqbg3LTq8O637UhcXegnhm7mD6wXsR1STbVTOLKoGkrXzfjiiH
 xg4T1oYfJ+ehS+Gz+rQFq384BIf6xFhDxrkqqem5s5slRyVuC/bWGaBUfaDM2gXrYFBc
 2dLS5504WqfV7WvpcCGWvsyZRurtdf9F7CvV1bmRaAc78Z/U9Y82dPBnGfFlE7+h4rz8
 mw9FTt8FE0IZ/RDFTnbrReiWvgytgE3cLBbs8lfDR374LL7AWN9s+c8W529DeqUXszpd
 Q+Og==
X-Forwarded-Encrypted: i=1;
 AJvYcCV08jCD91w1cTWFpjNu/I8zpaEsZCY/YSIr523bunO04jkLJlirelksZLVRzvmBRPS0Ta+EjKxZi4w=@lists.zx2c4.com
X-Gm-Message-State: AOJu0Yzk8i3ybD7LobruQTm8Apsb+RLZ6uei6xSB7XDaw44aSI4GxE6z
 Ng/P0Hr9sT1RGL5VeD3N4umFILwaWpiI/0GKya36gfHkt4gfIRn8B15Jc1HT+As8oh9HRCee4PQ
 rqxZ6VxKGbq9Hv8lcsyP3Kdt+qrsBKpcLFomvvwn6L453Jt4ryvF+tWkue0mfBw==
X-Gm-Gg: ASbGnctnLynpZCkOz4nLRefPWlHsQvTiwu3diJ6jXjoCAQBLh+TDo6ZevSzwpTviCU/
 DlXpBUVn+fduuXY44od7JI6PJ1Qo6DAQx4xR1U29JCddHeaLnnK72rZQEteAa2hK5wPNBv3QzKC
 U/MZBpCaNVRcqGJ5vnt/2vyQDYoTKKij1MQGvmWO0ENRpsbNnFVJHkJ4eFitb2ziMWNAdNbN2yy
 9l9OwVNtjONOkB3iPRejzowjIjF+5UFNsUYfu+hx7aS1mznm5NblIBt72qmq8fh3ha8tcL3pgyX
 8ALwbv4MQs6ZM/BJvlnY0wO9YZfxNgkMbrJV7G4tansjvRiixGI/Pjv0Ta4/pWLFaPyz/CsCpqP
 ln6k7BkIIIoJQ/8DrjgosAw==
X-Received: by 2002:a05:600c:1f1a:b0:45b:43cc:e557 with SMTP id
 5b1f17b1804b1-45b517cbee2mr2552425e9.34.1755806891747; 
 Thu, 21 Aug 2025 13:08:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE/z26sBz7JGLAktk/cnLNnmvA2KmHoRy5M1TseKC0NpCNohvOWfWbiwnk6fyruz4Gv4BdEig==
X-Received: by 2002:a05:600c:1f1a:b0:45b:43cc:e557 with SMTP id
 5b1f17b1804b1-45b517cbee2mr2552235e9.34.1755806891155; 
 Thu, 21 Aug 2025 13:08:11 -0700 (PDT)
Received: from localhost
 (p200300d82f26ba0008036ec5991806fd.dip0.t-ipconnect.de.
 [2003:d8:2f26:ba00:803:6ec5:9918:6fd])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3c0748797acsm12277591f8f.10.2025.08.21.13.08.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Aug 2025 13:08:10 -0700 (PDT)
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
Subject: [PATCH RFC 23/35] scatterlist: disallow non-contigous page ranges in
 a single SG entry
Date: Thu, 21 Aug 2025 22:06:49 +0200
Message-ID: <20250821200701.1329277-24-david@redhat.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250821200701.1329277-1-david@redhat.com>
References: <20250821200701.1329277-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 1MbN45-1SYc7ySgBufiatzsL8SB3u4wilGNK8zfSDpo_1755806892
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

The expectation is that there is currently no user that would pass in
non-contigous page ranges: no allocator, not even VMA, will hand these
out.

The only problematic part would be if someone would provide a range
obtained directly from memblock, or manually merge problematic ranges.
If we find such cases, we should fix them to create separate
SG entries.

Let's check in sg_set_page() that this is really the case. No need to
check in sg_set_folio(), as pages in a folio are guaranteed to be
contiguous.

We can now drop the nth_page() usage in sg_page_iter_page().

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/linux/scatterlist.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/include/linux/scatterlist.h b/include/linux/scatterlist.h
index 6f8a4965f9b98..8196949dfc82c 100644
--- a/include/linux/scatterlist.h
+++ b/include/linux/scatterlist.h
@@ -6,6 +6,7 @@
 #include <linux/types.h>
 #include <linux/bug.h>
 #include <linux/mm.h>
+#include <linux/mm_inline.h>
 #include <asm/io.h>
 
 struct scatterlist {
@@ -158,6 +159,7 @@ static inline void sg_assign_page(struct scatterlist *sg, struct page *page)
 static inline void sg_set_page(struct scatterlist *sg, struct page *page,
 			       unsigned int len, unsigned int offset)
 {
+	VM_WARN_ON_ONCE(!page_range_contiguous(page, ALIGN(len + offset, PAGE_SIZE) / PAGE_SIZE));
 	sg_assign_page(sg, page);
 	sg->offset = offset;
 	sg->length = len;
@@ -600,7 +602,7 @@ void __sg_page_iter_start(struct sg_page_iter *piter,
  */
 static inline struct page *sg_page_iter_page(struct sg_page_iter *piter)
 {
-	return nth_page(sg_page(piter->sg), piter->sg_pgoffset);
+	return sg_page(piter->sg) + piter->sg_pgoffset;
 }
 
 /**
-- 
2.50.1

