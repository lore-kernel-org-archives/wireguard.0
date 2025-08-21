Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 400D1CA0FE4
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 21 Aug 2025 21:33:41 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 556d9a57;
	Thu, 21 Aug 2025 20:08:03 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id d40bfa95
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 21 Aug 2025 20:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1755806872;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MzMWVCGQW0mP4+/ULAfe7CdOmgWkAKLnoxAB4Fy092E=;
 b=U3k26lLojuRdCNgBwR1ZihkwkQjaEy8RQeTcjK1Z/GA3kx55Nm4vezg5ze72xWvFL2/0rS
 /3Lthet/wOUxegobDiOpW9bNNfn6tYj/R/dbQhLBvzN2p+BuvdEPDz+1b7dLs5SI6gUXg1
 G9ZEvz7H8hS51IH1Xw+Og7FGegbk1oA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-612-i25kPY9vOHedUdvllUmL7w-1; Thu, 21 Aug 2025 16:07:50 -0400
X-MC-Unique: i25kPY9vOHedUdvllUmL7w-1
X-Mimecast-MFC-AGG-ID: i25kPY9vOHedUdvllUmL7w_1755806869
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-3b9e743736dso787393f8f.3
 for <wireguard@lists.zx2c4.com>; Thu, 21 Aug 2025 13:07:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755806869; x=1756411669;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MzMWVCGQW0mP4+/ULAfe7CdOmgWkAKLnoxAB4Fy092E=;
 b=Rl6SheqfL2tYo+1d+WxbyN+6KvMyAURipWq69NCvLX2SfoFOvScgykha4G7OIyOJld
 evRjlspKG59dR9K6gnu92aBaa7m+pcN4e/H4e92fAiglGKa9vRzuID9xU4iCbl2BmFfi
 wIzcVz2SQhS4IA5rIlo4Tpgi8H//iOwcyPaaCxpH4z4sPL2pagozeMvDrk+b1EAz1cE0
 423ysF3j7xsUd+ut0CiEDHRg3gglWQFjicsUp1tWEYBydOJFWPtgSwScAhISki1BFZ29
 kDaUzmwVvcxhDbJPFcUKm4kxK7AeXpLSpmrNFWJbYYUItv1wogMs0De1KeVzucq1CaU0
 o1+Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUMmjreXurA5HjV7LJTHI1Q0eUiq+W0NxTq47QXKnCdzJ1Hl/0H9X7vkI3tk9GILowYAxU0P1qoHko=@lists.zx2c4.com
X-Gm-Message-State: AOJu0YxcY89op0qPllnAGNVN8KJnIYzljo6YaW8VNR+E0SWX0tib5Nhz
 yzEL3eFSMlcAqkxLmZmYWKn7KgmbUqs6zI4psVOmsHrTBNEn8Az3IEO7T0Q1EdU9XPYnWc4j83I
 Gt5QZf+zIR9tH+SMA9dcnXzqzNfFxKJtfWQm/+hdnPEdbnW+JxvE7pkxVf23/Ig==
X-Gm-Gg: ASbGncvcXOzFPIoUCnDRUdnbJAbPH24c/lSPum6ce/r+f10HZTUlFycKd7N2aetmg/a
 AaVbzCoYms1+bmtNGNBTRwfcbbDOKuMhPf2E0ouUpRfJcJfKamlJKwvmvOQc2wy9R8TLpTysGYY
 MoohC3nKhkG6RVomW2bA/tesZ0TxSbkbI/zomyUL+LrZD+oAjXrblfPooymF0wbW1LDYFbKZco7
 j5SZ+Cg5qlvcrkn4m4r9nujT3HxGvlsab8764OuRPBkmtTXBYwEpvow3xSSL1HFVw4voUxqgPeN
 NS1GSZWoJLArazNrUxxrb1O+0zS5M0oodzjouBnCNEAZYupDGRt63kZrMMRP13VZb++8nF254JR
 +JXHFuWMjGOWgjtp+fDk4rg==
X-Received: by 2002:a05:6000:2901:b0:3b7:c703:ce4 with SMTP id
 ffacd0b85a97d-3c5dcff5f3amr167802f8f.59.1755806868897; 
 Thu, 21 Aug 2025 13:07:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHCm64ALptQrKyrLlaLt4xJ2vziBy3gZm4Q1WMVX6wnWhr2W2tRcHnZJHBwxpAOnTfL4mKx+A==
X-Received: by 2002:a05:6000:2901:b0:3b7:c703:ce4 with SMTP id
 ffacd0b85a97d-3c5dcff5f3amr167760f8f.59.1755806868453; 
 Thu, 21 Aug 2025 13:07:48 -0700 (PDT)
Received: from localhost
 (p200300d82f26ba0008036ec5991806fd.dip0.t-ipconnect.de.
 [2003:d8:2f26:ba00:803:6ec5:9918:6fd])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3c5826751d5sm1323274f8f.14.2025.08.21.13.07.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Aug 2025 13:07:47 -0700 (PDT)
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
Subject: [PATCH RFC 15/35] fs: hugetlbfs: remove nth_page() usage within folio
 in adjust_range_hwpoison()
Date: Thu, 21 Aug 2025 22:06:41 +0200
Message-ID: <20250821200701.1329277-16-david@redhat.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250821200701.1329277-1-david@redhat.com>
References: <20250821200701.1329277-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: mFjt49fw3lhDNcpb9lxdoDBLf6dXXRMDurOD1LQ0l3g_1755806869
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

The nth_page() is not really required anymore, so let's remove it.
While at it, cleanup and simplify the code a bit.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 fs/hugetlbfs/inode.c | 25 ++++++++-----------------
 1 file changed, 8 insertions(+), 17 deletions(-)

diff --git a/fs/hugetlbfs/inode.c b/fs/hugetlbfs/inode.c
index 34d496a2b7de6..dc981509a7717 100644
--- a/fs/hugetlbfs/inode.c
+++ b/fs/hugetlbfs/inode.c
@@ -198,31 +198,22 @@ hugetlb_get_unmapped_area(struct file *file, unsigned long addr,
 static size_t adjust_range_hwpoison(struct folio *folio, size_t offset,
 		size_t bytes)
 {
-	struct page *page;
-	size_t n = 0;
-	size_t res = 0;
+	struct page *page = folio_page(folio, offset / PAGE_SIZE);
+	size_t n, safe_bytes;
 
-	/* First page to start the loop. */
-	page = folio_page(folio, offset / PAGE_SIZE);
 	offset %= PAGE_SIZE;
-	while (1) {
+	for (safe_bytes = 0; safe_bytes < bytes; safe_bytes += n) {
+
 		if (is_raw_hwpoison_page_in_hugepage(page))
 			break;
 
 		/* Safe to read n bytes without touching HWPOISON subpage. */
-		n = min(bytes, (size_t)PAGE_SIZE - offset);
-		res += n;
-		bytes -= n;
-		if (!bytes || !n)
-			break;
-		offset += n;
-		if (offset == PAGE_SIZE) {
-			page = nth_page(page, 1);
-			offset = 0;
-		}
+		n = min(bytes - safe_bytes, (size_t)PAGE_SIZE - offset);
+		offset = 0;
+		page++;
 	}
 
-	return res;
+	return safe_bytes;
 }
 
 /*
-- 
2.50.1

