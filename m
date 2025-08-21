Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 243C5CA0EEB
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 21 Aug 2025 21:33:41 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1c4a041c;
	Thu, 21 Aug 2025 20:08:04 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 59f4ada3
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 21 Aug 2025 20:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1755806878;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NPs2EdTZ9fd3MpWdb0ATDCa6nUqfGtFMv2uyZP7L+uU=;
 b=fZ5Ty5sW0qYz/PmHJwB7r+5zVnYtzRpVlLaUlzm3PSHu5K6hamNED5c6VRFgrH71JEg4Z/
 wWDBbUjKT1SY/c9ehqhg/OoH672bAuvfrs1c1EfDAO5Hd6Amygv0bVitRC+qOAkKHCn1j6
 GpFL7RYOiyBMHmebo8RJtNauZ0sANPg=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-156-gRdiKMcyPOWwMqsxQfb-9A-1; Thu, 21 Aug 2025 16:07:55 -0400
X-MC-Unique: gRdiKMcyPOWwMqsxQfb-9A-1
X-Mimecast-MFC-AGG-ID: gRdiKMcyPOWwMqsxQfb-9A_1755806874
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-45a1b0514a5so6771765e9.1
 for <wireguard@lists.zx2c4.com>; Thu, 21 Aug 2025 13:07:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755806874; x=1756411674;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NPs2EdTZ9fd3MpWdb0ATDCa6nUqfGtFMv2uyZP7L+uU=;
 b=Brij5mSXC+HSv2DHQsHxIOyDFRuYJyPAXEi8ojNDlO0yahZzPCTcd+XFqH6l628gfg
 DA/upeiYU5DvWclK3Y6KYuPddul5VmqXMGXV40bg81dcZHVmckEPJALqJRcZ/i+A6jKn
 aU8AuO2TBzkagU3eFMyK6fW9U7/cl0bu4oaBDK2ESwpLG0SoEwZhUV1jskk9xC3Z6Jm5
 dVN98EYpoMo4g0M1bba+R75yacK+Z5bUuv2B3iII76VlbjnVYjlTANTqFP8Lk0zd5ezm
 wJStoQeDcCil3rppuJABo53CatsHvWWS9tHHCv9eYFX8bsOuxL0GAuw3Lxozgp4fYSIt
 0yUg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWCHSOuh/AaoWSguzlbFL/WY6qr4s6PLs8wpBHFOqofTCrawMGrd58V3kfpqOsvfCwDP3MMej41q24=@lists.zx2c4.com
X-Gm-Message-State: AOJu0Yye7mtJ5RQJE3ccWgbayfPvY1CtgRcZjKoLh/JxpQJBvwPH5Ypg
 7c7gxWT4fivSOkwuzsE8sHDW/JE2vobSfUesmago9rBFmDnt2skCuymrpSaVOmMsMEkWCA2zA3x
 FZqWpgmZGsEklWy7emLcL3aLFL6zN3eo9yX50l/iBzcv9mkbxslK/nf1cCCSuSA==
X-Gm-Gg: ASbGnctln9pGFkFcCVlgbl3tYr74ryIC0S/90w1iNvh/zFv2UW0g7bir1x1oIb//l1J
 ACwwPsJRswONRgXR6neGQA6vwZ7Ja8XXsv/ShRLN/3a+WA2sc2AJxW6TATF4onPH3dRFL33I49l
 tzwNzj9nkLjfycoPtwDeeGWDkXH9I7p+mbPrN9JFh26lBmEf9dxROSc4cN65rOGd84aU34TDCjw
 hyqdlBlSzF6/8Zo9m6svMPf4MEfMpCbbEKlv6mGyb6IOBOT4a1nkRdLmQ5752UKp6bk8mcW3oNZ
 0gBXv9thdmJQYoVFP4SJFKdyfag775e6hkao6ETjFvT8U1s7HkGMQcJf9rplMcjGdPE23/RLYx2
 VklbFSBlSNUojmQudNJjkVQ==
X-Received: by 2002:a05:600c:1388:b0:459:d451:3364 with SMTP id
 5b1f17b1804b1-45b517d40f2mr2554215e9.24.1755806874310; 
 Thu, 21 Aug 2025 13:07:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFo8ikhW4DoWVw60oDeAXqMRvn4UERlcVawLCjGel2pacwRc1R1ONhYVQm5EzuW0YIJQT4FDg==
X-Received: by 2002:a05:600c:1388:b0:459:d451:3364 with SMTP id
 5b1f17b1804b1-45b517d40f2mr2553905e9.24.1755806873856; 
 Thu, 21 Aug 2025 13:07:53 -0700 (PDT)
Received: from localhost
 (p200300d82f26ba0008036ec5991806fd.dip0.t-ipconnect.de.
 [2003:d8:2f26:ba00:803:6ec5:9918:6fd])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3c07487a009sm12690403f8f.11.2025.08.21.13.07.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Aug 2025 13:07:53 -0700 (PDT)
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
Subject: [PATCH RFC 17/35] mm/gup: drop nth_page() usage within folio when
 recording subpages
Date: Thu, 21 Aug 2025 22:06:43 +0200
Message-ID: <20250821200701.1329277-18-david@redhat.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250821200701.1329277-1-david@redhat.com>
References: <20250821200701.1329277-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: QJ40MIzL_FOCUNRQMlP8usWrAovhzaEzsJNzpTi-O_s_1755806874
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

nth_page() is no longer required when iterating over pages within a
single folio, so let's just drop it when recording subpages.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/gup.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/mm/gup.c b/mm/gup.c
index b2a78f0291273..f017ff6d7d61a 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -491,9 +491,9 @@ static int record_subpages(struct page *page, unsigned long sz,
 	struct page *start_page;
 	int nr;
 
-	start_page = nth_page(page, (addr & (sz - 1)) >> PAGE_SHIFT);
+	start_page = page + ((addr & (sz - 1)) >> PAGE_SHIFT);
 	for (nr = 0; addr != end; nr++, addr += PAGE_SIZE)
-		pages[nr] = nth_page(start_page, nr);
+		pages[nr] = start_page + nr;
 
 	return nr;
 }
@@ -1512,7 +1512,7 @@ static long __get_user_pages(struct mm_struct *mm,
 			}
 
 			for (j = 0; j < page_increm; j++) {
-				subpage = nth_page(page, j);
+				subpage = page + j;
 				pages[i + j] = subpage;
 				flush_anon_page(vma, subpage, start + j * PAGE_SIZE);
 				flush_dcache_page(subpage);
-- 
2.50.1

