Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1929CA0EFF
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 21 Aug 2025 20:08:06 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f7f54553;
	Thu, 21 Aug 2025 20:07:48 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 4de2a671
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 21 Aug 2025 20:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1755806861;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QQ4Uu4zoWyKmYQrq0i4l3HgKr6VpAHaNUVdQgPTsBAE=;
 b=ZV+YS5MccerI6uY2pqf/7vKplAXlMgD6ISbOe7UToNHf+Pis1Hbm7/0PEJmAxK4QVTKneY
 /SonVCnpG2CQnRZj/aDs3UIU1fxV6K7oi/dIEom4OPfqdNZfdnQtdTrAzceNo8dPO0N2lx
 BHfva8Aq3zEMDeQ+c4MNUSKNksKzMNE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-215-JXsc1ex8MrC7eekDqztzXw-1; Thu, 21 Aug 2025 16:07:39 -0400
X-MC-Unique: JXsc1ex8MrC7eekDqztzXw-1
X-Mimecast-MFC-AGG-ID: JXsc1ex8MrC7eekDqztzXw_1755806858
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-45a256a20fcso8251845e9.2
 for <wireguard@lists.zx2c4.com>; Thu, 21 Aug 2025 13:07:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755806858; x=1756411658;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QQ4Uu4zoWyKmYQrq0i4l3HgKr6VpAHaNUVdQgPTsBAE=;
 b=FwahHwO9/dJ0w4dQ8ftGSuRa6EQpxQF+gPncagPkbUmaIe7vf22spLZYb8bOnIMcs1
 ntn0qM+2+qZeVbTH8dFSJxupaAG6KbzdgDEXfHJAOCAOyxsYbzH+DLR9o3ijYPbb1+jk
 wjupzW+yI8ob7LxA+0iK0XkhJXDX4WcDGT0n8Mgj5sAUg4Z4fuboXa02ft5QS/jpKkZZ
 CKK3MpdRRo44HZH/FoeU9mm2klbWraLVThFZfcA95s+Qsni2BmLU6T0BRcNGNLA+pENX
 28eCdPN3OJHB42AS6fREYeWs5diApOeIjWaWBPNnLAlIzsSVfdRKyDkTszEawWRxkUBN
 FKeA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUlGmM02uNsOlMdi7C84d52yR/WDLfV4kNQ2ROrBI9MJUV/BVm0jtFeM7+xR7BrnfE3xxdjS6aEqDA=@lists.zx2c4.com
X-Gm-Message-State: AOJu0Yzs87Wc5mMdBFq8enq9xfGAB95vZXvGFHEQjIrzqzZ9t6tkIRJb
 Dn6BEsOXtq8s//2xl64nXhr3U62Y2mcpiuJLyzvBIVR8UKehsI4vslpW4Ne79T4wPtju7uucnH9
 +KE5xPrOb/Q+bWxoKPviMhsms5NwRShdVDGX8ww6HEsAo4E+W5Nz2laro0iLpZQ==
X-Gm-Gg: ASbGnct0SjDd32q5ss4FO3VsAhiUZTB5xLfGUbFSRzPYLGeHyraDqSx8DGyVqDgHeuN
 cltenZMdky3RpGrAx+TORp6VCeb/AVLkc/mAOv7yvFxEcBGgk1sD7mti9nZoRW5cueaPluBHGR/
 k42gj+FdmmhEzv1LrnKlQ3HVfyjsG7drA2al+qpe5JvZtP+I6m4wnVWYalyS1PQqNCNXY1r0fiP
 x0xsOf9rICmCCYwJdbLYLMJHQqPpegYoA03PFFQqJXSIabZFfCPHQGZbBZo9uMhK2vIot46vGPg
 7Q2XQ0bLot5g5x0jvysm3XnJlVJz/dyXnoc49PjJn5nMQKqTe+GvQyJWH2IeendNtVofzXvWvh1
 JQHsFTCfCgke/5zj6UvkTRA==
X-Received: by 2002:a05:600c:5251:b0:455:f380:32e2 with SMTP id
 5b1f17b1804b1-45b517ca54cmr2646795e9.18.1755806857906; 
 Thu, 21 Aug 2025 13:07:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHlSU80KqPPviGOLp6CI40u/NjPujjG4FLCG6NoakJIlvY80lRDOTTm20w50mEKFuk0YjVSLQ==
X-Received: by 2002:a05:600c:5251:b0:455:f380:32e2 with SMTP id
 5b1f17b1804b1-45b517ca54cmr2646245e9.18.1755806857378; 
 Thu, 21 Aug 2025 13:07:37 -0700 (PDT)
Received: from localhost
 (p200300d82f26ba0008036ec5991806fd.dip0.t-ipconnect.de.
 [2003:d8:2f26:ba00:803:6ec5:9918:6fd])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-45b4e87858asm18672185e9.3.2025.08.21.13.07.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Aug 2025 13:07:36 -0700 (PDT)
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
Subject: [PATCH RFC 11/35] mm: sanity-check maximum folio size in
 folio_set_order()
Date: Thu, 21 Aug 2025 22:06:37 +0200
Message-ID: <20250821200701.1329277-12-david@redhat.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250821200701.1329277-1-david@redhat.com>
References: <20250821200701.1329277-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 0p4wqCcGyZ7HYH-EiQ92BNBk3pgZtu3f6V_3RDVa6FE_1755806858
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

Let's sanity-check in folio_set_order() whether we would be trying to
create a folio with an order that would make it exceed MAX_FOLIO_ORDER.

This will enable the check whenever a folio/compound page is initialized
through prepare_compound_head() / prepare_compound_page().

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/internal.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/mm/internal.h b/mm/internal.h
index 45b725c3dc030..946ce97036d67 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -755,6 +755,7 @@ static inline void folio_set_order(struct folio *folio, unsigned int order)
 {
 	if (WARN_ON_ONCE(!order || !folio_test_large(folio)))
 		return;
+	VM_WARN_ON_ONCE(order > MAX_FOLIO_ORDER);
 
 	folio->_flags_1 = (folio->_flags_1 & ~0xffUL) | order;
 #ifdef NR_PAGES_IN_LARGE_FOLIO
-- 
2.50.1

