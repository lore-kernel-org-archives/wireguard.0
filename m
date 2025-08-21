Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0C3CCA0EFA
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 21 Aug 2025 21:33:43 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 38f583b9;
	Thu, 21 Aug 2025 20:08:09 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 4f6c2846
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 21 Aug 2025 20:08:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1755806882;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hICKs+PYshPEfoclHwqOXtWPheskj6p8LyRcJkrFnX4=;
 b=bHMNU+ZDBRq/e4ZtTq1tuqKgVltHSZahfKBgUQDq38bGJaMpZfvL2/XbXIPZ+55KtMSIcN
 l9RMfGkycmGdrh+P1gj9FYpjUe4VuWoJodv1p8xDz44LXJB7v+EZ37/Ll5fVGX6HUoJWi3
 8C+5zlQQq/oaZ7Dv1+afr9ZwtAo27do=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-158-lCH2MJa9O_OYbnMm1fDDgQ-1; Thu, 21 Aug 2025 16:07:59 -0400
X-MC-Unique: lCH2MJa9O_OYbnMm1fDDgQ-1
X-Mimecast-MFC-AGG-ID: lCH2MJa9O_OYbnMm1fDDgQ_1755806877
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-3c380aa19c1so770309f8f.1
 for <wireguard@lists.zx2c4.com>; Thu, 21 Aug 2025 13:07:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755806877; x=1756411677;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hICKs+PYshPEfoclHwqOXtWPheskj6p8LyRcJkrFnX4=;
 b=aJi+hnMdM+ZN/1+/gqwA9gLvoQQ+b0CwSdKlN/z1qda3XFym7Le83PuIqB/HMQvzJE
 Km3/SAOwK9t1JHxoyyYU+OQs8JtwFO5YCXord3nsfToj0hPav/BKzqSx9gA6dZVaqGYm
 Z6BIuN4f+T9G+diPAKk2PHKo5P7zBqqKqVf+T4nSEzMEz7RBZywsAncBe1rYyz1JMfVK
 xSBtc8JQvVqbK3v/6Y/kAolNKhKihBm5umBV5R7rXEnVbEZ5sKc3m1QjzvuTnxYQ6iVF
 JX3f2ecV9c1RbsWJdMCIHuP5nnTYt8aEHzwb0pddSl9q346/ws9RlTU3QQd8C8I9JFVI
 1bGg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUvLoMFl6xc9V1abW/r//hT3L/zArJNUUkWRJ77IQdinFaDBghIwejxChXn5UdkWdOcdPbpJluRbLc=@lists.zx2c4.com
X-Gm-Message-State: AOJu0YyrQY0w+nc8pJ87hd5OmFtFXtvJmcO+2j9HpsRdj4Nb1vYT4PJv
 g6Y3IeQ67aITwjom0FkbVOH7eJK0PYYLIBV4fZr6ghfK2N8A+0OOI/C2d+FnmXbfP+UQvGBDXB/
 h39mDN8WK+2EAf7rG0YyGZplwF9Ir//rSpH1VflWEeiuAk5f4bBMNWKdjMbqbbg==
X-Gm-Gg: ASbGnctXtSPP2SyZ976O1av1Yuyr8UiXhyWjptbxgcidG9Q+RVf56X4ycfEwEjiwTeb
 RsUcIOhtNfRblwXqPtTKrP+l8v2+c7r1BoxqSwN+rQ9ngsa/EJjAU4YnQWS3IoUBZKP90fvk+Bs
 26qZj+irF7kwgVZa85r71aG4MFmJRzTXHqBzjjs53Fnxx1AQ5r3l7xUkzQ+/UdJtmGWNSrlAnrT
 b6rc3BcEuJubNg5XDAFlC4rRo+1ohvvba0TjG4tHKeSxlAR765XlJh9S3hv41C4sDz8E4cPzMyN
 BaP6phTCCHIvWjq8h2AuPEVdImNOk4WZ5FQKN7k26+/6CW8EALA2TMAsArHAXMtxF+ldgEHcC6l
 kRhusGAECaW3YjGfssdXiLg==
X-Received: by 2002:a05:6000:1789:b0:3b4:9721:2b2b with SMTP id
 ffacd0b85a97d-3c5dac17062mr195830f8f.12.1755806877258; 
 Thu, 21 Aug 2025 13:07:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHgVLjhFaRrDh3LOBLGV7UmH7wFAxvy1IR++ErfO8cOP/XFU/ikMyZpM3bVU7Jjqctj1mhmFQ==
X-Received: by 2002:a05:6000:1789:b0:3b4:9721:2b2b with SMTP id
 ffacd0b85a97d-3c5dac17062mr195797f8f.12.1755806876810; 
 Thu, 21 Aug 2025 13:07:56 -0700 (PDT)
Received: from localhost
 (p200300d82f26ba0008036ec5991806fd.dip0.t-ipconnect.de.
 [2003:d8:2f26:ba00:803:6ec5:9918:6fd])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3c4f77e968esm2903478f8f.21.2025.08.21.13.07.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Aug 2025 13:07:56 -0700 (PDT)
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
Subject: [PATCH RFC 18/35] io_uring/zcrx: remove "struct io_copy_cache" and
 one nth_page() usage
Date: Thu, 21 Aug 2025 22:06:44 +0200
Message-ID: <20250821200701.1329277-19-david@redhat.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250821200701.1329277-1-david@redhat.com>
References: <20250821200701.1329277-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Ges1--0XrsJhxJdYbjIAIh82FiLzhf7A1CC8IHQwKds_1755806877
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

We always provide a single dst page, it's unclear why the io_copy_cache
complexity is required.

So let's simplify and get rid of "struct io_copy_cache", simply working on
the single page.

... which immediately allows us for dropping one "nth_page" usage,
because it's really just a single page.

Cc: Jens Axboe <axboe@kernel.dk>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 io_uring/zcrx.c | 32 +++++++-------------------------
 1 file changed, 7 insertions(+), 25 deletions(-)

diff --git a/io_uring/zcrx.c b/io_uring/zcrx.c
index e5ff49f3425e0..f29b2a4867516 100644
--- a/io_uring/zcrx.c
+++ b/io_uring/zcrx.c
@@ -954,29 +954,18 @@ static struct net_iov *io_zcrx_alloc_fallback(struct io_zcrx_area *area)
 	return niov;
 }
 
-struct io_copy_cache {
-	struct page		*page;
-	unsigned long		offset;
-	size_t			size;
-};
-
-static ssize_t io_copy_page(struct io_copy_cache *cc, struct page *src_page,
+static ssize_t io_copy_page(struct page *dst_page, struct page *src_page,
 			    unsigned int src_offset, size_t len)
 {
-	size_t copied = 0;
+	size_t dst_offset = 0;
 
-	len = min(len, cc->size);
+	len = min(len, PAGE_SIZE);
 
 	while (len) {
 		void *src_addr, *dst_addr;
-		struct page *dst_page = cc->page;
-		unsigned dst_offset = cc->offset;
 		size_t n = len;
 
-		if (folio_test_partial_kmap(page_folio(dst_page)) ||
-		    folio_test_partial_kmap(page_folio(src_page))) {
-			dst_page = nth_page(dst_page, dst_offset / PAGE_SIZE);
-			dst_offset = offset_in_page(dst_offset);
+		if (folio_test_partial_kmap(page_folio(src_page))) {
 			src_page = nth_page(src_page, src_offset / PAGE_SIZE);
 			src_offset = offset_in_page(src_offset);
 			n = min(PAGE_SIZE - src_offset, PAGE_SIZE - dst_offset);
@@ -991,12 +980,10 @@ static ssize_t io_copy_page(struct io_copy_cache *cc, struct page *src_page,
 		kunmap_local(src_addr);
 		kunmap_local(dst_addr);
 
-		cc->size -= n;
-		cc->offset += n;
+		dst_offset += n;
 		len -= n;
-		copied += n;
 	}
-	return copied;
+	return dst_offset;
 }
 
 static ssize_t io_zcrx_copy_chunk(struct io_kiocb *req, struct io_zcrx_ifq *ifq,
@@ -1011,7 +998,6 @@ static ssize_t io_zcrx_copy_chunk(struct io_kiocb *req, struct io_zcrx_ifq *ifq,
 		return -EFAULT;
 
 	while (len) {
-		struct io_copy_cache cc;
 		struct net_iov *niov;
 		size_t n;
 
@@ -1021,11 +1007,7 @@ static ssize_t io_zcrx_copy_chunk(struct io_kiocb *req, struct io_zcrx_ifq *ifq,
 			break;
 		}
 
-		cc.page = io_zcrx_iov_page(niov);
-		cc.offset = 0;
-		cc.size = PAGE_SIZE;
-
-		n = io_copy_page(&cc, src_page, src_offset, len);
+		n = io_copy_page(io_zcrx_iov_page(niov), src_page, src_offset, len);
 
 		if (!io_zcrx_queue_cqe(req, niov, ifq, 0, n)) {
 			io_zcrx_return_niov(niov);
-- 
2.50.1

