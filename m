Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46250CF2564
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 18 Nov 2025 23:34:55 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a2224a19;
	Tue, 18 Nov 2025 17:26:57 +0000 (UTC)
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 13bf8f08
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 22 Aug 2025 11:31:28 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-45b4d89217aso9434365e9.2
 for <wireguard@lists.zx2c4.com>; Fri, 22 Aug 2025 04:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755862288; x=1756467088; darn=lists.zx2c4.com;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SfbHPH5Jjp8Rpz5+ZFUkvP8crb1ywqdy8VPh1hjPgaM=;
 b=GAFzUbu/KjjEK2p887uMsurCkigik+wbMCkgsmqwb9w40XncZ+2jR46HRk4f1qiKNF
 +/zk5Wholiq8oV0OyEjZ7LTfRlk7iho615jBfV6lXbyjiVddV41ip229M9xIDkJQt4+6
 vXlRmL/+OQa3n03q0Q+MUMVtFDetOXobddJr6bYnYgBLtxBzIxRIPFwOWNZiaBT80ov4
 RlQyL+BsIymgjZ/CEZFY6F9YfugPyTUdjun7lGw/Wa2+7SFHZLcyPOMkGld/0JephPnU
 EsdL+kNirGT22r6xUPTAq5rnkuFxkF44y8j6hPlQFSZTOANu7DJ+TN3kbA4CU4Zho7xP
 79qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755862288; x=1756467088;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SfbHPH5Jjp8Rpz5+ZFUkvP8crb1ywqdy8VPh1hjPgaM=;
 b=DvWA0cj5dT3qjb+ixe1YQkAi2DOr1suIz5/tpMA+0Z5fUE4m3cjYfniLXP0nEqOr6k
 YG5BnTwMW0kVBcY726qRt9nnspC7+fu21BsZ3u0IG/wrEORWS98rIZVK6+oJjof760wa
 541In1DF7qzKA1z6jSYEFP2PQwD5EqvRjn9u9TNNgPJS0QObdb+6qCX4HHWRO2n2XEHZ
 ONaR9AB15z+++rNxA6jQ9oGTHiN8B+7rjKJBsyxyvWT9cIn96LTfALy7+7wPbTw4Rb7g
 TjGc8F9WIWn7009RJglkgMRlO7AL7I6SVR5bLYHfIdIyrJ+KlhyD/lfhvT9czQrk1Xxj
 X7Qw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWwbXcCE2vzsvV1W7n9dm9aJkKfsIMJuNw6nJbrZ7iCYpHFiAbw17ozSNmjruM9WSASiW9Vk8MUBZc=@lists.zx2c4.com
X-Gm-Message-State: AOJu0YyZcQqHIgZXLaVdMMG2bCx0dEmwJ6Nbj/sSng8AfDRIcdhyo1tg
 ZwoD6txi4t/WNdx8BgTE4Xu3hs1U3KL8bbe1AUT75tTIsQIQUU+0Bkuy
X-Gm-Gg: ASbGnctehOpZsExVCtdFqLPJJHkm3EJI/fP0c6vV//nQlz/wBtVRAS5uaaTpVu4MszP
 KxLSOCGXYXIJ+kVaKuf6i3k+zyUIDfa1ELfDiYFGYSkeZla/kdBZueH3pXcl8NVPBZhQcy5f+gD
 JDkN4DttEtg3AzzAgC9beUkC2kHwq5qV/UUHDhggprb/dOSld5M5O6M1YcTpJYg/v4/S9CjmDEJ
 JJIDwaakYilbzexypiXyTuPhk6rC+q2JqBuU539htS+nbrAK9nBcY6Ce7/o1l88zfWTpj73f5H/
 r8KTHiqbarR6Kim6G94MvrhpghqlLw0N87AMS1Z8e6cyenvdRUWbZeoVKbLJBLHzY3q6+j9gPfM
 LDIW97hQc0lC6V/FRKRUPED5nPQw3hmTuBRde9t30KxTJDIUy7x2xqmc=
X-Google-Smtp-Source: AGHT+IGRxFKrTZ5eDvBkmi1zEgN6s0gJ3t3AoyWptSyZJnQ5Bb32czELomyx9FMDxkr1p0nFemiRbQ==
X-Received: by 2002:a05:600c:4747:b0:459:e094:92cb with SMTP id
 5b1f17b1804b1-45b517ad81bmr24844685e9.12.1755862287996; 
 Fri, 22 Aug 2025 04:31:27 -0700 (PDT)
Received: from ?IPV6:2620:10d:c096:325:77fd:1068:74c8:af87?
 ([2620:10d:c092:600::1:1b93]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b50e4241dsm35921185e9.24.2025.08.22.04.31.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Aug 2025 04:31:27 -0700 (PDT)
Message-ID: <b5b08ad3-d8cd-45ff-9767-7cf1b22b5e03@gmail.com>
Date: Fri, 22 Aug 2025 12:32:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 18/35] io_uring/zcrx: remove "struct io_copy_cache"
 and one nth_page() usage
To: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org
Cc: Jens Axboe <axboe@kernel.dk>, Alexander Potapenko <glider@google.com>,
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
 Marco Elver <elver@google.com>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Michal Hocko <mhocko@suse.com>, Mike Rapoport <rppt@kernel.org>,
 Muchun Song <muchun.song@linux.dev>, netdev@vger.kernel.org,
 Oscar Salvador <osalvador@suse.de>, Peter Xu <peterx@redhat.com>,
 Robin Murphy <robin.murphy@arm.com>, Suren Baghdasaryan <surenb@google.com>,
 Tejun Heo <tj@kernel.org>, virtualization@lists.linux.dev,
 Vlastimil Babka <vbabka@suse.cz>, wireguard@lists.zx2c4.com, x86@kernel.org,
 Zi Yan <ziy@nvidia.com>
References: <20250821200701.1329277-1-david@redhat.com>
 <20250821200701.1329277-19-david@redhat.com>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <20250821200701.1329277-19-david@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Tue, 18 Nov 2025 17:23:16 +0000
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

On 8/21/25 21:06, David Hildenbrand wrote:
> We always provide a single dst page, it's unclear why the io_copy_cache
> complexity is required.

Because it'll need to be pulled outside the loop to reuse the page for
multiple copies, i.e. packing multiple fragments of the same skb into
it. Not finished, and currently it's wasting memory.

Why not do as below? Pages there never cross boundaries of their folios.

Do you want it to be taken into the io_uring tree?

diff --git a/io_uring/zcrx.c b/io_uring/zcrx.c
index e5ff49f3425e..18c12f4b56b6 100644
--- a/io_uring/zcrx.c
+++ b/io_uring/zcrx.c
@@ -975,9 +975,9 @@ static ssize_t io_copy_page(struct io_copy_cache *cc, struct page *src_page,
  
  		if (folio_test_partial_kmap(page_folio(dst_page)) ||
  		    folio_test_partial_kmap(page_folio(src_page))) {
-			dst_page = nth_page(dst_page, dst_offset / PAGE_SIZE);
+			dst_page += dst_offset / PAGE_SIZE;
  			dst_offset = offset_in_page(dst_offset);
-			src_page = nth_page(src_page, src_offset / PAGE_SIZE);
+			src_page += src_offset / PAGE_SIZE;
  			src_offset = offset_in_page(src_offset);
  			n = min(PAGE_SIZE - src_offset, PAGE_SIZE - dst_offset);
  			n = min(n, len);

-- 
Pavel Begunkov

