Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04C6CCA0FE2
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 21 Aug 2025 20:07:37 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 988995e6;
	Thu, 21 Aug 2025 20:07:37 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 5e61e713
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 21 Aug 2025 20:07:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1755806852;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=A9Znt0atqEjtEUkbTSfKRsvBJ9rEcbnqI7Kn1XkJSrA=;
 b=ITLO/1J6W1DJKSfaKtRf06Ot+s9ohvdWvDpizjU2cvmrr4sGCrYfwaIORAQjCFcgOYMMoV
 wOrzYt8vDNcFokA/hnukRSSXVgMroYh7wkGw2kcY0IiZYu37GO0F2to9QtKhn7uo8rTU5A
 w2TNG2pR+567D24FAMyh8j/jvBts4VU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-178-EJFJEWmFNVWs0K7hoI2t2g-1; Thu, 21 Aug 2025 16:07:28 -0400
X-MC-Unique: EJFJEWmFNVWs0K7hoI2t2g-1
X-Mimecast-MFC-AGG-ID: EJFJEWmFNVWs0K7hoI2t2g_1755806847
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-45a1b0b2b5cso10135945e9.2
 for <wireguard@lists.zx2c4.com>; Thu, 21 Aug 2025 13:07:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755806847; x=1756411647;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=A9Znt0atqEjtEUkbTSfKRsvBJ9rEcbnqI7Kn1XkJSrA=;
 b=xVmxdxmE3W0hFd97YHcwxIBJcxLltB1VQFUUA2u/C3WldgXRQuy+Vgw/wLs1tI/KTZ
 uBhu36ShKnbxo/i+/2zOzpOzjGyAywXw0QTg0s+4XrUCJ0q7YNhgaOs3UeyoTAh+3n3w
 HQj+mVNFujEHPsmbgaubRBHc5gnsiEMSRag0t6ogZK2xUs0YM6REEAl/VxQgC3w59lzd
 EFB38YOXLJGjGrXGqtH/16nUllDtHT8CJwoG60ZsmpMQsr/STrDinu3G1muYzLgNTxZa
 7wW2zxR/LE4G/r0+5E6KFs6aniZwkpi5/abTrrsC1S3qoAZh2K71aQSyT1+rljhwiKfO
 9hCQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUG0n5iy+9jWKAVdA1VmQ5ve0uD5lJr/VKigipi32apHS7wNRhUnUJqKggdtRXTl1eI/SscH3FAbwY=@lists.zx2c4.com
X-Gm-Message-State: AOJu0Yzs3nF8i4odH6Oz/DOFmHpd0lnUUzevXYp8fBLUOus0Z316vBWJ
 b5y4gX/+kmmpd2buT3v69RZYsRzhIc4Pm4p1k7hae0LPiM4+fEBx0v+ZWECzmQACFtEwHM2ByBd
 YBLloRQ0XcnH5ogU0AN9J93xsJRfod8V042PpUjPs/CmyiFlft4aJy1WXaZZeBw==
X-Gm-Gg: ASbGncuChr1sM2V5at3cQo9OEnYq1tV5dtH+CoTlZnhEzknV1J4MtvN+M36Cx4FAGB2
 FNovKRmmepO2VfGBbM51rV1PujGyWjdvUEySW/MipVGQxTh2FsalZ874f4NSveyNlLj8EAyeGT9
 rsr40WuZhw4/c3H74VRcgjP8XL09s5ezOhKIv0GpJEYUlq/zcYf4BRmcoUG9y7uOgn36KwLheI5
 cxc4AgLtcaZO5cYnCv68oBiCgucgQ0MPOERtnI9gPVyGCWe3zlgnouVnwNQfe7qRG/zuiwpp4GE
 AsSOtfqrNmGIr9dm78aItpYZiaAamK+v+M0//ETcLyBkjp2+NYrzQgthV48MX2diveAbu9rrJiJ
 qnv9zSf8krnAcPfpZiovApQ==
X-Received: by 2002:a05:600c:3552:b0:459:dde3:1a33 with SMTP id
 5b1f17b1804b1-45b517d26d4mr2922165e9.26.1755806847219; 
 Thu, 21 Aug 2025 13:07:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGUeapMM5JkcwJNJXC+LM6ICHu4lGUEF2ir46AAuHXhYXAFzTcPIdec/q/lplZD/isU7mGEgg==
X-Received: by 2002:a05:600c:3552:b0:459:dde3:1a33 with SMTP id
 5b1f17b1804b1-45b517d26d4mr2921795e9.26.1755806846742; 
 Thu, 21 Aug 2025 13:07:26 -0700 (PDT)
Received: from localhost
 (p200300d82f26ba0008036ec5991806fd.dip0.t-ipconnect.de.
 [2003:d8:2f26:ba00:803:6ec5:9918:6fd])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-45b50d62991sm9535385e9.0.2025.08.21.13.07.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Aug 2025 13:07:26 -0700 (PDT)
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
Subject: [PATCH RFC 07/35] mm/memremap: reject unreasonable folio/compound
 page sizes in memremap_pages()
Date: Thu, 21 Aug 2025 22:06:33 +0200
Message-ID: <20250821200701.1329277-8-david@redhat.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250821200701.1329277-1-david@redhat.com>
References: <20250821200701.1329277-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: xZGTi7SCzfEdoEOH6vfMOxhmpnotCWmmeE24PQEKdmM_1755806847
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

Let's reject unreasonable folio sizes early, where we can still fail.
We'll add sanity checks to prepare_compound_head/prepare_compound_page
next.

Is there a way to configure a system such that unreasonable folio sizes
would be possible? It would already be rather questionable.

If so, we'd probably want to bail out earlier, where we can avoid a
WARN and just report a proper error message that indicates where
something went wrong such that we messed up.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/memremap.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/mm/memremap.c b/mm/memremap.c
index b0ce0d8254bd8..a2d4bb88f64b6 100644
--- a/mm/memremap.c
+++ b/mm/memremap.c
@@ -275,6 +275,9 @@ void *memremap_pages(struct dev_pagemap *pgmap, int nid)
 
 	if (WARN_ONCE(!nr_range, "nr_range must be specified\n"))
 		return ERR_PTR(-EINVAL);
+	if (WARN_ONCE(pgmap->vmemmap_shift > MAX_FOLIO_ORDER,
+		      "requested folio size unsupported\n"))
+		return ERR_PTR(-EINVAL);
 
 	switch (pgmap->type) {
 	case MEMORY_DEVICE_PRIVATE:
-- 
2.50.1

