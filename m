Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC32DCA0EFA
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 21 Aug 2025 21:33:46 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0475cbe8;
	Thu, 21 Aug 2025 20:08:51 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 1ff9a193
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 21 Aug 2025 20:08:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1755806925;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z7iPpUiW3LrFM0W3XrB+Z82uodwKTsefoCzXwhLbLUo=;
 b=UonbbPABs/WAVZJ+kINp2q/lhGgM2bobix8GHDf7b+5l8wT6zS1EEwQKVIipjhp7kANz1G
 6qN0HXc1f3tA5YdI62e4WfebyfFYLgR0INJwDIY+GOce3ZnZNdU9OpuLKm5ORDZ9vPb7NW
 kx5CHPOcDKoq6F21zkgReSDFBMZc1Mw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-644-RUL2EOZpNsmbScyjoSuUBg-1; Thu, 21 Aug 2025 16:08:44 -0400
X-MC-Unique: RUL2EOZpNsmbScyjoSuUBg-1
X-Mimecast-MFC-AGG-ID: RUL2EOZpNsmbScyjoSuUBg_1755806923
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-3b9edf80ddcso517659f8f.3
 for <wireguard@lists.zx2c4.com>; Thu, 21 Aug 2025 13:08:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755806923; x=1756411723;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Z7iPpUiW3LrFM0W3XrB+Z82uodwKTsefoCzXwhLbLUo=;
 b=oc41Z16mZZ6LMEl2VnzlWJxtX9Nyud5xW2bh0mh339J18lATA53PPLFnagWbMbijik
 eau2deCA5T7iJAOnQPz2+x9AA0g6Gt+5BKKWnHtoG4jfiWxmxVg4FANohQmuHb3pJRn7
 5Oy0LpFWJo5TtFpUiBK11r4J/q3kFwuI4LfrnD7Fs1YmyzOj2kNLlESCxOPOKMMAsIdZ
 GO2w4CvJ1rIRV0nzuji/z+jHdN+Xi0oSBNSOkpqsMz4B6tv5Jli5FXgNrjafaOT3qi5r
 3aBrLwiuRW4j8YaahxEI3TNxXV1iRyYW4iczb+mDbCx9PWFHcL84ye/enib2cyWJpIj2
 kPUQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVg7cY15S0oahHgpVhuvAKM6NYh3sQyXQoDnoIrdN28brMmY2E6CW9Rx8WJ3O0dBa8CKGCV0Iqj9Oo=@lists.zx2c4.com
X-Gm-Message-State: AOJu0YwkvYQy5LkQ000KA98K5qwBzhPQz49od+5XDAs0Mng30jcRaBk6
 /S9XaG6IiF56Yeq2oHGiQGZLK84/hHxksAMXD8rEFyYDoGvpWUeBcazcOcBQU0hy8na2BqS4YA6
 0q2WkWzzpgHcNerkud4fZo3KMdlcb2S+n8s9PN09ISlsa2CCxcJU4by0qgFEAFw==
X-Gm-Gg: ASbGncv54u+eF7aaCstzeJdV+tmj6hg9UkvOk5ldZsReuN7IYkBh8NBf1+QgrA3D7WR
 DgQqomyPAfBUC8MzDLaU7XmXzFH41Yx8q5wMXOMy1uxQd34yC9bQaNnrhI9pqAXsQLYioGfOIXQ
 b0ComkASdBPt1S224ySTONRotILZnb27Y5PDVxofo9JZpFNg/zVSKeo4FCQoyVEkBIA4ONknZvh
 FyJotzdVud/WhOsbABhWVdZOxzs/2oPekL5dWeRgionzMmIv6/7eafL4xKtYqpAikL+GwDAQ8Wo
 8QY6hzOz9bSfBRUbVvkZfBkBWs/0rOxVDyU8gOqWffVpgwQ33cbivl+1CNplcrMm3qGVSgbPkez
 gGgU8RKGpjIYXkIgOUw1n4Q==
X-Received: by 2002:a5d:64ed:0:b0:3b5:dafc:1525 with SMTP id
 ffacd0b85a97d-3c5dc7313famr204669f8f.33.1755806922945; 
 Thu, 21 Aug 2025 13:08:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHnHzRKC08dohUKQD/XdldMc6IWYVddiLtTh8Yidep5vx+5++gzVG23SiimMwYZ+HldR36Zkg==
X-Received: by 2002:a5d:64ed:0:b0:3b5:dafc:1525 with SMTP id
 ffacd0b85a97d-3c5dc7313famr204645f8f.33.1755806922505; 
 Thu, 21 Aug 2025 13:08:42 -0700 (PDT)
Received: from localhost
 (p200300d82f26ba0008036ec5991806fd.dip0.t-ipconnect.de.
 [2003:d8:2f26:ba00:803:6ec5:9918:6fd])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-45b50e3a587sm10028205e9.18.2025.08.21.13.08.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Aug 2025 13:08:42 -0700 (PDT)
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
Subject: [PATCH RFC 34/35] block: update comment of "struct bio_vec" regarding
 nth_page()
Date: Thu, 21 Aug 2025 22:07:00 +0200
Message-ID: <20250821200701.1329277-35-david@redhat.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250821200701.1329277-1-david@redhat.com>
References: <20250821200701.1329277-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 5NlrsU9SN25HdxxDOECLhAbGRQw25uo4iQH1Nk5PeBs_1755806923
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

Ever since commit 858c708d9efb ("block: move the bi_size update out of
__bio_try_merge_page"), page_is_mergeable() no longer exists, and the
logic in bvec_try_merge_page() is now a simple page pointer
comparison.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/linux/bvec.h | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/include/linux/bvec.h b/include/linux/bvec.h
index 0a80e1f9aa201..3fc0efa0825b1 100644
--- a/include/linux/bvec.h
+++ b/include/linux/bvec.h
@@ -22,11 +22,8 @@ struct page;
  * @bv_len:    Number of bytes in the address range.
  * @bv_offset: Start of the address range relative to the start of @bv_page.
  *
- * The following holds for a bvec if n * PAGE_SIZE < bv_offset + bv_len:
- *
- *   nth_page(@bv_page, n) == @bv_page + n
- *
- * This holds because page_is_mergeable() checks the above property.
+ * All pages within a bio_vec starting from @bv_page are contiguous and
+ * can simply be iterated (see bvec_advance()).
  */
 struct bio_vec {
 	struct page	*bv_page;
-- 
2.50.1

