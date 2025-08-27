Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE183CF2563
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 19 Nov 2025 00:02:30 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 882cf154;
	Tue, 18 Nov 2025 17:27:20 +0000 (UTC)
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 1af923f5
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 27 Aug 2025 09:42:40 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3c98b309804so2574279f8f.1
 for <wireguard@lists.zx2c4.com>; Wed, 27 Aug 2025 02:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756287759; x=1756892559; darn=lists.zx2c4.com;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=s4gNirUawo/2N73RGh/VZFmiZovBEw6Zvsz5pkyBSog=;
 b=csGkeej1Rq+kwKBPZNEYazegUgU2FRfSSL+Pg5pJOTs+nviW2bPpSoVGrBK9m92i2x
 7OSm8nm7OE0Gath0lArGnxMIUPfQSHJdyD0K/sB97zbgO5euF0ItHBqZGiC/Jou+uLlh
 2O1oxqzvjQleGu03IObrS1wk1aMFBp26ZMIKrXKHL5eYOCxPoOzDzA5TYIgJG7pbcCBo
 GSutcbfBSWnUIQAiNdldQDck6LL5NVssc3wK1YiFh51mFIyi2su9FBo8o9lfRI+7FmOz
 Zj0e5Zfz/iQP1B+sULa8R6PIwE6lcxetzL8lVD02hfV3NwvyihjYz+be1DcnaX7HUwcK
 sJew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756287759; x=1756892559;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=s4gNirUawo/2N73RGh/VZFmiZovBEw6Zvsz5pkyBSog=;
 b=jrAJ9qrUh7G82paUzPyrUHD0qVkv9wt+Jv/HBcGsm50Zvlgr4tuh1Rww93E5Q4AF5/
 IdHkdJ6fvySkiMExnQG9lIVgKenZyn0tbuC4PZ+VxRCx2esPI/en8/RqvKbkRpKcvcg+
 /TvMwSHX+bG8RgjyB9EfY0mVprkEge1zuHKPSnhY2lmHId6Zajs4MVaPf1n0BIlylbY/
 N9FOrOHI3/fRkUnvabF3N4kxgHqbC25TUVnS1/Rca0Bx6Zp7K6gNs3oWEgJ4sVqhGx8r
 oMmstk4QagpC2zbq3WNfNM+itRMxHLaUu9PojW3Fc15W+HLGoYnBVv4CMsbPiKwln0C8
 7NSQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW5E6Tkqx29WaNfSW80dPMfKsEWOkJaavRBqeYiTfpRmowCMdzCLsdxd83H7amPDSaN42HaCC4B4XQ=@lists.zx2c4.com
X-Gm-Message-State: AOJu0Yz7frkmxXoJcJFubzBsNwlJaSfhv8fB41NGdkjEwua0IcDtN3Sr
 VohkhsnND7leNjBhbVBYFFM/x/6azm40J3bJoaVOayWOPPObJYmUdMPb
X-Gm-Gg: ASbGncs6677oGjEyFB55TVLr3TzCgjNhaYaNykibqzZHxn+yE6GFXjmCfRAeaPMP1ov
 VB1q9bhjZrR4N6oi9FI3x4i1/ay5E3GPiPxl+B5I6jGg6oUz4ipysSz8Wgs0hleY5GxLoGZWjJU
 EOLdUuoxtXgmQrX4TALu6CSkAoO8ZvOP6YIfnvrWRsYNut0H3na7daSJcvK3LG4WfVKPAoJXmHo
 RkEqACZLczpchvMxLZ6xM9YVevP7deo7GxSeOIwvonKTmfQWSAe/w2tyTvNUzycskWS5T4qpeL0
 g0ibswb+LUTE/A3/jEZXheFJ9W20KCg182ZtTGMw6LAVgPpXS6mi1/lKdt5gZe48qgyjimr53nZ
 oLbYz4jFePjDw6k/o/+y/p2NkZnX4FWaGIkPjBFayU1UGFnACxVzAtJAPYfeeuk34IA==
X-Google-Smtp-Source: AGHT+IFkjO5GHbU1+2MUuKQvNL0fwH2etmLb7S57NgBpdq01aCYpWSgROxwdQQpXxfO8aoPZevSNpQ==
X-Received: by 2002:a05:6000:3105:b0:3b8:d672:3cf8 with SMTP id
 ffacd0b85a97d-3c5dcb10b6amr14770182f8f.43.1756287759105; 
 Wed, 27 Aug 2025 02:42:39 -0700 (PDT)
Received: from ?IPV6:2620:10d:c096:325:77fd:1068:74c8:af87?
 ([2620:10d:c092:600::1:4a1a]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3cc4b102889sm3363615f8f.51.2025.08.27.02.42.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Aug 2025 02:42:38 -0700 (PDT)
Message-ID: <46d09557-1873-4d97-b073-ce0c7296b954@gmail.com>
Date: Wed, 27 Aug 2025 10:43:59 +0100
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
 <b5b08ad3-d8cd-45ff-9767-7cf1b22b5e03@gmail.com>
 <473f3576-ddf3-4388-aeec-d486f639950a@redhat.com>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <473f3576-ddf3-4388-aeec-d486f639950a@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 8/22/25 14:59, David Hildenbrand wrote:
> On 22.08.25 13:32, Pavel Begunkov wrote:
>> On 8/21/25 21:06, David Hildenbrand wrote:
>>> We always provide a single dst page, it's unclear why the io_copy_cache
>>> complexity is required.
>>
>> Because it'll need to be pulled outside the loop to reuse the page for
>> multiple copies, i.e. packing multiple fragments of the same skb into
>> it. Not finished, and currently it's wasting memory.
> 
> Okay, so what you're saying is that there will be follow-up work that will actually make this structure useful.

Exactly

>> Why not do as below? Pages there never cross boundaries of their folios. > Do you want it to be taken into the io_uring tree?
> 
> This should better all go through the MM tree where we actually guarantee contiguous pages within a folio. (see the cover letter)

Makes sense. No objection, hopefully it won't cause too many conflicts.

>> diff --git a/io_uring/zcrx.c b/io_uring/zcrx.c
>> index e5ff49f3425e..18c12f4b56b6 100644
>> --- a/io_uring/zcrx.c
>> +++ b/io_uring/zcrx.c
>> @@ -975,9 +975,9 @@ static ssize_t io_copy_page(struct io_copy_cache *cc, struct page *src_page,
>>            if (folio_test_partial_kmap(page_folio(dst_page)) ||
>>                folio_test_partial_kmap(page_folio(src_page))) {
>> -            dst_page = nth_page(dst_page, dst_offset / PAGE_SIZE);
>> +            dst_page += dst_offset / PAGE_SIZE;
>>                dst_offset = offset_in_page(dst_offset);
>> -            src_page = nth_page(src_page, src_offset / PAGE_SIZE);
>> +            src_page += src_offset / PAGE_SIZE;
> 
> Yeah, I can do that in the next version given that you have plans on extending that code soon.

If we go with this version:

Reviewed-by: Pavel Begunkov <asml.silence@gmail.com>

-- 
Pavel Begunkov

