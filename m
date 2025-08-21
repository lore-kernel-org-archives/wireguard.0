Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 420A4CA0EEB
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 21 Aug 2025 21:33:45 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 99897daf;
	Thu, 21 Aug 2025 20:08:17 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 96becd40
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 21 Aug 2025 20:08:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1755806893;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Pq6EMCEhMXNA7HGNe/O1qYHWHhWZrBzRdRZ7YmKumJw=;
 b=YxKNwrfjPfCq6Zy96UU+IMq51hEwt3zIdHEDUIKuhhSIJ+DS+vnNUWJ+tQs1kIgsLYIZtj
 ZKUYEa5298vPySR+hWerEWhgMDwKkSB5MAplIC+b/X6jBcs/I2AfLBIe9xh2cAWy8Yn8oU
 rk+SIwtg7My6lVqIehFfk/jjOsymZ30=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-395-4jjOE0OgNxCyn0IOTvJXMg-1; Thu, 21 Aug 2025 16:08:10 -0400
X-MC-Unique: 4jjOE0OgNxCyn0IOTvJXMg-1
X-Mimecast-MFC-AGG-ID: 4jjOE0OgNxCyn0IOTvJXMg_1755806889
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-3b9d41b88ffso838240f8f.0
 for <wireguard@lists.zx2c4.com>; Thu, 21 Aug 2025 13:08:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755806889; x=1756411689;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Pq6EMCEhMXNA7HGNe/O1qYHWHhWZrBzRdRZ7YmKumJw=;
 b=mVA5X7uoMbzSoHDg7CwyoKWvV6EkvIpw1M7rqn7R2sMXvxMNqgbTFOh4JPEzO0NXds
 NCq8FrXty0Oq3ckuvRDhAUYzK3k2/vpZ6V9G/jhdON6KY8AgPpkwMapLei8aDiUpia+w
 gQz25QQr8JMHt9a1sNrTdxEeSY2MqTrIGiQ6867Iov7xdZBpSvLYAgESJEImq0j50tfq
 L7O895bCkwlYyXQQX+k9SHJ7J/rGuJFt7ADitnI3LOJH65BUBoqyrKqAU4TiMJhnJ6Tv
 9M0uRdnUcwRzrEKc90VSSIZuJqgRL1K16ElmRvq0ujO6+dVx0OvqTM5v8ILM/Gx3yjhT
 IlRw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXToXsz9J7lFOUV+oFmpgmReFxUZzjXYuRo5TBGSx+ELUEWmucHiOQKqk9t1IfvM4yXmCi19i2Sew4=@lists.zx2c4.com
X-Gm-Message-State: AOJu0YzQo2UhfBaMZiPpfhZ7FN/WpgI3CJDULA07yEN3LvudJzVFp2CP
 C16dA3BEpKCn1d2MM98SQnJScq8JlYyM+GD9ekvfX7oMDEnmPORbSHSYNDJc900rlNlu+xxG9oQ
 YlgQGxIb6CEYTtMkg71bIHjE3fP1T2kX1JUbjaZzrlC7xINAY+gBIJi7tepbbCQ==
X-Gm-Gg: ASbGncuS2Wv8jVcxCq6lnnuZKp1Nl4wSlY3lHVg+QqUpfYDeAeghJNJLtPeP0QPa22h
 eWatLiZL9zrQpyJNDOvezxg9LgKJ2+dPygFmS9/e+o/4P01v53TTX3odUhdgEf7YKe0FygubfGL
 RSUo2iI0+vROWQwkAUEnBFt0lr9+VQB+Xho/qrOt8MaQhvdfSkc2W2cwlHuIWV5bjPgXoI3vutA
 jiS8rYRb9UVOPFKnI3I/NOrMmcpzWGMTam2t1UCJv2V7q4j2zb6K/L1tzUx63nAmrb4sS7fHJtO
 unZCwAqsm/vfA+jYJHiGea178slcMqtCOI3GMliv4099y8zbmw3Qe60o/GeCY/1qT1zdnSozFRN
 KhI54vo6itn4+s/oDjIQX+w==
X-Received: by 2002:a05:6000:40c9:b0:3b7:911c:83f with SMTP id
 ffacd0b85a97d-3c5da83bf5bmr151935f8f.9.1755806888882; 
 Thu, 21 Aug 2025 13:08:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGeHEkncn914iQLB6IDJFbFllUgyuseH1VcCPvg+Bdgchh7CcvmYDhAXktPsYS0hqHcr6hQuQ==
X-Received: by 2002:a05:6000:40c9:b0:3b7:911c:83f with SMTP id
 ffacd0b85a97d-3c5da83bf5bmr151916f8f.9.1755806888456; 
 Thu, 21 Aug 2025 13:08:08 -0700 (PDT)
Received: from localhost
 (p200300d82f26ba0008036ec5991806fd.dip0.t-ipconnect.de.
 [2003:d8:2f26:ba00:803:6ec5:9918:6fd])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-45b4e2790a8sm21120815e9.1.2025.08.21.13.08.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Aug 2025 13:08:07 -0700 (PDT)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: David Hildenbrand <david@redhat.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Robin Murphy <robin.murphy@arm.com>,
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
 Marco Elver <elver@google.com>, Michal Hocko <mhocko@suse.com>,
 Mike Rapoport <rppt@kernel.org>, Muchun Song <muchun.song@linux.dev>,
 netdev@vger.kernel.org, Oscar Salvador <osalvador@suse.de>,
 Peter Xu <peterx@redhat.com>, Suren Baghdasaryan <surenb@google.com>,
 Tejun Heo <tj@kernel.org>, virtualization@lists.linux.dev,
 Vlastimil Babka <vbabka@suse.cz>, wireguard@lists.zx2c4.com,
 x86@kernel.org, Zi Yan <ziy@nvidia.com>
Subject: [PATCH RFC 22/35] dma-remap: drop nth_page() in
 dma_common_contiguous_remap()
Date: Thu, 21 Aug 2025 22:06:48 +0200
Message-ID: <20250821200701.1329277-23-david@redhat.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250821200701.1329277-1-david@redhat.com>
References: <20250821200701.1329277-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: UoHzuGpRhGDdvFZ-ZxjMMok_2nu2YD_iT9YOy5ZziEA_1755806889
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

dma_common_contiguous_remap() is used to remap an "allocated contiguous
region". Within a single allocation, there is no need to use nth_page()
anymore.

Neither the buddy, nor hugetlb, nor CMA will hand out problematic page
ranges.

Cc: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Robin Murphy <robin.murphy@arm.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 kernel/dma/remap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/dma/remap.c b/kernel/dma/remap.c
index 9e2afad1c6152..b7c1c0c92d0c8 100644
--- a/kernel/dma/remap.c
+++ b/kernel/dma/remap.c
@@ -49,7 +49,7 @@ void *dma_common_contiguous_remap(struct page *page, size_t size,
 	if (!pages)
 		return NULL;
 	for (i = 0; i < count; i++)
-		pages[i] = nth_page(page, i);
+		pages[i] = page++;
 	vaddr = vmap(pages, count, VM_DMA_COHERENT, prot);
 	kvfree(pages);
 
-- 
2.50.1

