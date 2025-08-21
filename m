Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C2DACA0EFF
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 21 Aug 2025 21:33:40 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e09392d2;
	Thu, 21 Aug 2025 20:08:02 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 368a1830
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 21 Aug 2025 20:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1755806875;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QCvnB/7xI7T/4p4mwWx/D4+W6s//h9G2+oSyfbDOFZs=;
 b=G+CZgNUEzSQLJQwIThKqzOElNl60IpSHI0G8WEH1Kb07Xpe7Qthvh4flAOa7Lk/pCP40GN
 oz6Ib2b1vdKYzzWOQvSUymmnlsQDaunkPY01qS6f6PgTmAJZyLv49ifoOCxUzPp3v6/WQd
 DpmsAWewxFzq6Wfg1vHOCkCFLY2rpgM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-354-2f8jH8O9PfKJPzq3LgQyTA-1; Thu, 21 Aug 2025 16:07:53 -0400
X-MC-Unique: 2f8jH8O9PfKJPzq3LgQyTA-1
X-Mimecast-MFC-AGG-ID: 2f8jH8O9PfKJPzq3LgQyTA_1755806872
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-45a1b0cb0aaso10738865e9.3
 for <wireguard@lists.zx2c4.com>; Thu, 21 Aug 2025 13:07:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755806872; x=1756411672;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QCvnB/7xI7T/4p4mwWx/D4+W6s//h9G2+oSyfbDOFZs=;
 b=KNBjXLBM2b27xuf/su9U/3M/lkPFRrrphth+jw2aUgWzLUX0DMdKnnamqlupHfg57L
 Dgetw35azAzUhsQ5Lt35yGowmxelbavnB2XglMfHHZ7C0inxCdjBENEkDxX4JxStv9ZX
 /Wwk6xaO/hpC7rTvG/NNfB8mPcXw4oWQGP+1gkqoZSaSlDr2S0Nxc/xsEapQk+jn64om
 vdr18jUe3Z7M1mgZkTbe0/jOiKTnCfBXF67MmjjC/niQxHuo2lIZf4/8nlF/fktlSHLy
 Omv+OLP85tTljfxGAdD1mdi581kRlBBS4tzLgVFKcZy45DtsMZWeRq+cWrNom2Z16AsQ
 UA8w==
X-Forwarded-Encrypted: i=1;
 AJvYcCV8TV4RSEW9yHoLUr/IU0lqQRlm+gH69oGfT0a0/B/e3ibNgUm9xKPmlyDu6n3JHYZ8XwrRHDsRjqI=@lists.zx2c4.com
X-Gm-Message-State: AOJu0YzKOfOTKvAbqU3tbcaNJGD0s6NSnB0soESD/jiBpzwkuagQ8kH6
 xtlW69gI8B5gCLjHMtWucn+dbg7uN9MM90woy1EWE19L9KNTJpD6936IXAjhP7rmAFAFrSDQuiy
 zkYp8kLMwIcq5x2XEh5+xBuMpddxlkIBV0mTsvOtQdRGdU2zzbDuhbApz+J7AWg==
X-Gm-Gg: ASbGnctrM5RMNoBb/ttUGE3IAmXYrOQ9brV7L224c31DBVIai4Z133X7rNyXV/wVovZ
 mknQeiEF4EcTNqMWWsQiH6T0vjlojaLQCIX7DchTIymKmm0F9f+FItyxgJ2lOVB7OqCibf1Kklo
 kfiDidddhZ+ZENxugxQJlsJWTfrD/4Yq2Ibi+5+GLzyF0cAPW/0Y6wJJ1do4sEZPmbnsh4KKphi
 WD2957ma0IjDfJgd+WAI838cxeoL0oE9TetUe1fInTC5QwljUi5oJkbdOe6Ttej9xzC0YSB1rCg
 VW1nunYyJhAFtHJ9ZOmKpNILkpkU0gcbPZTCxyo7hoZzepf9ZrNlPJtxGYlTxikwxbRt33hQo6M
 LeKBQDzS22fQCTLIPVAvaBQ==
X-Received: by 2002:a05:600c:1d07:b0:459:e025:8c40 with SMTP id
 5b1f17b1804b1-45b5179e897mr2279005e9.10.1755806871597; 
 Thu, 21 Aug 2025 13:07:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGQe1GSIQC6LfutgynQLrqB1o4Jo0GTrBjlhxRWjM7nqTD8l8oEo1HOcPxtIuVQVn3tsHm8QA==
X-Received: by 2002:a05:600c:1d07:b0:459:e025:8c40 with SMTP id
 5b1f17b1804b1-45b5179e897mr2278575e9.10.1755806871147; 
 Thu, 21 Aug 2025 13:07:51 -0700 (PDT)
Received: from localhost
 (p200300d82f26ba0008036ec5991806fd.dip0.t-ipconnect.de.
 [2003:d8:2f26:ba00:803:6ec5:9918:6fd])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-45b4e1d77e0sm22159155e9.0.2025.08.21.13.07.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Aug 2025 13:07:50 -0700 (PDT)
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
Subject: [PATCH RFC 16/35] mm/pagewalk: drop nth_page() usage within folio in
 folio_walk_start()
Date: Thu, 21 Aug 2025 22:06:42 +0200
Message-ID: <20250821200701.1329277-17-david@redhat.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250821200701.1329277-1-david@redhat.com>
References: <20250821200701.1329277-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: fsP9hpw25CguObhxK2-ee5RyLbJ56ntmshvoyWAOKXU_1755806872
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

It's no longer required to use nth_page() within a folio, so let's just
drop the nth_page() in folio_walk_start().

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/pagewalk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/pagewalk.c b/mm/pagewalk.c
index c6753d370ff4e..9e4225e5fcf5c 100644
--- a/mm/pagewalk.c
+++ b/mm/pagewalk.c
@@ -1004,7 +1004,7 @@ struct folio *folio_walk_start(struct folio_walk *fw,
 found:
 	if (expose_page)
 		/* Note: Offset from the mapped page, not the folio start. */
-		fw->page = nth_page(page, (addr & (entry_size - 1)) >> PAGE_SHIFT);
+		fw->page = page + ((addr & (entry_size - 1)) >> PAGE_SHIFT);
 	else
 		fw->page = NULL;
 	fw->ptl = ptl;
-- 
2.50.1

