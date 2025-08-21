Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7745FCA0FE2
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 21 Aug 2025 21:33:39 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e4c6baba;
	Thu, 21 Aug 2025 20:08:01 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 0b972554
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 21 Aug 2025 20:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1755806870;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TaqjYk7qiFpFT4dP16wKMuC8fiQfbkUwRRgQVKGzHC8=;
 b=IGYTHvbrGnJ0zw0LSSPMNrXXS6JxBVfWyvnQaGL+pN8gABiukma9Ut5NPFiGVIh0r4L7yZ
 CUEz1dDtWGE4qBd2INWedt2G5aU78hUPN5QMDn5QeSuNOZVifFLiJSK3bntAD3cqcboDpQ
 KbgT0klZ5I+GxZFaJcaG9WwRgCr6Cnw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-620-uuQ9V7uKOdC5Kh-IQwIYoA-1; Thu, 21 Aug 2025 16:07:48 -0400
X-MC-Unique: uuQ9V7uKOdC5Kh-IQwIYoA-1
X-Mimecast-MFC-AGG-ID: uuQ9V7uKOdC5Kh-IQwIYoA_1755806866
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-45a1b05d31cso7260895e9.1
 for <wireguard@lists.zx2c4.com>; Thu, 21 Aug 2025 13:07:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755806866; x=1756411666;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TaqjYk7qiFpFT4dP16wKMuC8fiQfbkUwRRgQVKGzHC8=;
 b=qWQg5uobaa/OPNoV0qxSldwvSaGZWy5l0N3TqcRuKZ6Ym99w3bZWYah54c2yryNrkv
 KgbxEaa4q3HfFP6C267WF66MVWklcyUcdEa64AeiXeF51tgQ4vxKtL/tsnXEEnW54tCn
 m/zomjxqiahvAn9iMaXlEozs2cJVbsAoIYhmH9rs1a+me81hBDvgIwc2lzROeQe0S1sJ
 A0VJjZLoH4dW1G/FY1OCppYhXbdx+H6AitWb1ZC57WTJEXXlT4MAa/M3nVIuJLoISKDi
 xswwrc54mxHlwuQ2S+eJMBMaXCQt+sAZR1Hevs6bEzFMMPOkXg82PMEyR0PB3/yba2r7
 RGXA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVFppj1cQ/qHI47GUneKfFWQYkJloKk+GMz1si2+iM4ryJQRkoP/FbeWeATj5uJD1yAIB6F6G7NGBo=@lists.zx2c4.com
X-Gm-Message-State: AOJu0YxY1GDnAlSxqsX4RSAzDIytvjsI3vgdrbmBpWQ+0P1Gzv+KOOxI
 QDVt71ftqPBBmKx/UAsybUcWwXKyrYdFBgVOtb7PUId+jSc9XE8zgyHdu1RdmZyV166wAbI1a1d
 +OBCFwN3fdMXYE0g+Il5VBhVrDw8eDndEY8F/3LcqdC5bqWi3h05oXhG9YVTeFA==
X-Gm-Gg: ASbGnctWwBAn6+yPX2/x7iM7nH0gvqKdVTN9YDeoKWDLpUEDznKLbtK/kUx+SZ3fZkr
 +86zM8a8l/vbg/8JcjTXsOVLjmKNjEMg+GPL3isZ3Wmsc10j0W4R+4JJJeATgSqYvU7aqkUSzdi
 7AIoSnwcMr0p41YBZFn/t0Q1XmQXsdNgFJ2u1faBuQGOApVCjV0887tpqeD3YzVh8z5qB1VBEX5
 8FwN6RkF1h7vwef0fblAe+iUzgnkFpZfDN6QEvZV91HUu++JcY8+91Bj4vINaDJEtCVlfBvPCOI
 rWQ8Akai5AZnp/j9Amq768KLKXtCK71cTI3EagGUDjtQfKEuREJ8Ta08Cocr7zaUoc6Wgv0RqX6
 jW+KagSKJ8lfNN0w2/ArnYg==
X-Received: by 2002:a05:600c:1392:b0:453:5a04:b60e with SMTP id
 5b1f17b1804b1-45b517d4e23mr2819435e9.26.1755806866190; 
 Thu, 21 Aug 2025 13:07:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHUtzGc4rPv18tjnV22wd1xjfGI25AJiVbHUBF3o7jj7YvZLrrv8XzLc39l/Z4dCqHj4yY2QA==
X-Received: by 2002:a05:600c:1392:b0:453:5a04:b60e with SMTP id
 5b1f17b1804b1-45b517d4e23mr2819075e9.26.1755806865726; 
 Thu, 21 Aug 2025 13:07:45 -0700 (PDT)
Received: from localhost
 (p200300d82f26ba0008036ec5991806fd.dip0.t-ipconnect.de.
 [2003:d8:2f26:ba00:803:6ec5:9918:6fd])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-45b50dd0380sm8632985e9.10.2025.08.21.13.07.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Aug 2025 13:07:45 -0700 (PDT)
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
Subject: [PATCH RFC 14/35] mm/mm/percpu-km: drop nth_page() usage within
 single allocation
Date: Thu, 21 Aug 2025 22:06:40 +0200
Message-ID: <20250821200701.1329277-15-david@redhat.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250821200701.1329277-1-david@redhat.com>
References: <20250821200701.1329277-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 132DyQgvqiSgu-Dbj1nqyiE-yIIRx2Igh70nPw_7ink_1755806866
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

We're allocating a higher-order page from the buddy. For these pages
(that are guaranteed to not exceed a single memory section) there is no
need to use nth_page().

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/percpu-km.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/percpu-km.c b/mm/percpu-km.c
index fe31aa19db81a..4efa74a495cb6 100644
--- a/mm/percpu-km.c
+++ b/mm/percpu-km.c
@@ -69,7 +69,7 @@ static struct pcpu_chunk *pcpu_create_chunk(gfp_t gfp)
 	}
 
 	for (i = 0; i < nr_pages; i++)
-		pcpu_set_page_chunk(nth_page(pages, i), chunk);
+		pcpu_set_page_chunk(pages + i, chunk);
 
 	chunk->data = pages;
 	chunk->base_addr = page_address(pages);
-- 
2.50.1

