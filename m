Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB6B7CA0FE7
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 25 Aug 2025 15:42:47 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c67524db;
	Mon, 25 Aug 2025 15:42:45 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 8ad13464
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 25 Aug 2025 15:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1756136561;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=5rvZAalDayw76mXlaVcK2G8fQoANSfCHvdaqQVOogfc=;
 b=X3McIJNDyiwC/khtPVqSX+x9CfNLCr/ucY3WiKZKgScv9wPTdjuvtYKOkX/GbNo7U/rGyB
 w2F/QRfYIY7g6sUlJmE/0PAh3cKTmnkvC0SXqB6woh2Q0hyQdBsa4x3ayEa5erz10cvVk2
 uFIiM25gqEyp3hRpbI0223wh8ZbEQJY=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-433-fyivoo3_Nfi7N8M8XJSUAQ-1; Mon, 25 Aug 2025 11:42:39 -0400
X-MC-Unique: fyivoo3_Nfi7N8M8XJSUAQ-1
X-Mimecast-MFC-AGG-ID: fyivoo3_Nfi7N8M8XJSUAQ_1756136558
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-45a1b0071c1so23793255e9.0
 for <wireguard@lists.zx2c4.com>; Mon, 25 Aug 2025 08:42:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756136558; x=1756741358;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5rvZAalDayw76mXlaVcK2G8fQoANSfCHvdaqQVOogfc=;
 b=nvolhMj0psS5qrXhW0LD3unWiahad3EnE0QGpZJsfK2o60CcMPY8FsxUhqrgFZhBFu
 1pf1eDArHqBQONNP/7pPN4GIRi8UL+XE5eJ1BNnDwzMGHwKAV0p/Kj1Vg50O09vtI9bS
 0LuSvpzcEUDzEcOUlHQEcf2jqV06tisRwi2ewrhpD839awUG/sC2KceWcjTtJtZSqFPr
 hUxjWPL7NHym8k3+mbbScxk7ON7+AqtCJRJDbtzyH1jvvKJPTOZOk7nVHJfI/JFG08tf
 x7m3BpQAwOO3n4zMWjLdwrYYKMtpmC8pV1QJqKTYNRaTj4A7WkULdw5BKw6QEtOJ1NTd
 E/3g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXE0fibu4juF+yn57hCFeFK662PtbZ1Aqc0npp7LV593SUF4tlLQLF5DUKZrImXR3WMJ6aqcGjWrxs=@lists.zx2c4.com
X-Gm-Message-State: AOJu0YwWn4ezbT7ABY1NVWsmRG8vWOCzrHollmjFbPgEruKLy1y5FqFL
 2EqQzsclAmDxJX9qEZ+BaYDQjGt0o4C0uWslrCE3Pb989/yYsi+J8RpsP0YauKWlSbE8Qy7Jj4O
 lp3481/Hk9jW5T0e2YcYsOQiIUjR8384qF38xlkgSqpZOBblH5VDwnX3RFqTpcA==
X-Gm-Gg: ASbGncts/oMkYUiPVzkAFHOIx1T+bL3n2WsvOgeN5D7A8mTOggDAAqGw737MSsXC0mI
 hpyc2CVJYnX5iMeR0lSkbxk0oaalFW0kWu+V2S8UgUm47KvvT06mEtUwoCUkvXSjfq3ggO1bsey
 AkBp576ZemZaIC4QiyhGYaL85zTznQEubBRZ20j/SzGheLfo97hZkYKZg3D11P1k6iHnnubvCPr
 DnmDt/cxvt+U2m6bUTeQ3C30/eOGjWeBsIaMlgnnHIBZpHeXDA1bXTm2gk3FRusg1AHMBFPyFuF
 eNNDrpwhfjeYf4RAzNEbNrNIuyzbFmFSHNY+rV3bRI89MwHm72hCisfNSImuNVD+6i38lux3U8l
 8/94hM/CUXz2OFgYQTCPBTFbXwiinyICGsSfp03nrnMlRG9ugXCUfoEQ/xkDmrXtKuy8=
X-Received: by 2002:a05:600c:a344:b0:459:443e:b180 with SMTP id
 5b1f17b1804b1-45b51f30f97mr116842415e9.8.1756136557855; 
 Mon, 25 Aug 2025 08:42:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEGzUl9/0T2mWXVZgblyhy3uP4lA/MNqA3E39+SzULqMR3WsGlHrWnWezXsHsIiYJtRmIOh8A==
X-Received: by 2002:a05:600c:a344:b0:459:443e:b180 with SMTP id
 5b1f17b1804b1-45b51f30f97mr116841885e9.8.1756136557395; 
 Mon, 25 Aug 2025 08:42:37 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f4f:1300:42f1:98e5:ddf8:3a76?
 (p200300d82f4f130042f198e5ddf83a76.dip0.t-ipconnect.de.
 [2003:d8:2f4f:1300:42f1:98e5:ddf8:3a76])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b57444958sm113196675e9.2.2025.08.25.08.42.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Aug 2025 08:42:36 -0700 (PDT)
Message-ID: <f8140a17-c4ec-489b-b314-d45abe48bf36@redhat.com>
Date: Mon, 25 Aug 2025 17:42:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 10/35] mm/hugetlb: cleanup
 hugetlb_folio_init_tail_vmemmap()
To: Mike Rapoport <rppt@kernel.org>
Cc: =?UTF-8?Q?Mika_Penttil=C3=A4?= <mpenttil@redhat.com>,
 linux-kernel@vger.kernel.org, Alexander Potapenko <glider@google.com>,
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
 Marco Elver <elver@google.com>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Michal Hocko <mhocko@suse.com>, Muchun Song <muchun.song@linux.dev>,
 netdev@vger.kernel.org, Oscar Salvador <osalvador@suse.de>,
 Peter Xu <peterx@redhat.com>, Robin Murphy <robin.murphy@arm.com>,
 Suren Baghdasaryan <surenb@google.com>, Tejun Heo <tj@kernel.org>,
 virtualization@lists.linux.dev, Vlastimil Babka <vbabka@suse.cz>,
 wireguard@lists.zx2c4.com, x86@kernel.org, Zi Yan <ziy@nvidia.com>
References: <20250821200701.1329277-1-david@redhat.com>
 <20250821200701.1329277-11-david@redhat.com>
 <9156d191-9ec4-4422-bae9-2e8ce66f9d5e@redhat.com>
 <7077e09f-6ce9-43ba-8f87-47a290680141@redhat.com>
 <aKmDBobyvEX7ZUWL@kernel.org>
 <a90cf9a3-d662-4239-ad54-7ea917c802a5@redhat.com>
 <aKxz9HLQTflFNYEu@kernel.org>
 <a72080b4-5156-4add-ac7c-1160b44e0dfe@redhat.com>
 <aKx6SlYrj_hiPXBB@kernel.org>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <aKx6SlYrj_hiPXBB@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ZNe12Iav2xbdWq4d9AXNMkXIfrquydlHHpDQpUdB8oQ_1756136558
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 25.08.25 16:59, Mike Rapoport wrote:
> On Mon, Aug 25, 2025 at 04:38:03PM +0200, David Hildenbrand wrote:
>> On 25.08.25 16:32, Mike Rapoport wrote:
>>> On Mon, Aug 25, 2025 at 02:48:58PM +0200, David Hildenbrand wrote:
>>>> On 23.08.25 10:59, Mike Rapoport wrote:
>>>>> On Fri, Aug 22, 2025 at 08:24:31AM +0200, David Hildenbrand wrote:
>>>>>> On 22.08.25 06:09, Mika Penttilä wrote:
>>>>>>>
>>>>>>> On 8/21/25 23:06, David Hildenbrand wrote:
>>>>>>>
>>>>>>>> All pages were already initialized and set to PageReserved() with a
>>>>>>>> refcount of 1 by MM init code.
>>>>>>>
>>>>>>> Just to be sure, how is this working with MEMBLOCK_RSRV_NOINIT, where MM is supposed not to
>>>>>>> initialize struct pages?
>>>>>>
>>>>>> Excellent point, I did not know about that one.
>>>>>>
>>>>>> Spotting that we don't do the same for the head page made me assume that
>>>>>> it's just a misuse of __init_single_page().
>>>>>>
>>>>>> But the nasty thing is that we use memblock_reserved_mark_noinit() to only
>>>>>> mark the tail pages ...
>>>>>
>>>>> And even nastier thing is that when CONFIG_DEFERRED_STRUCT_PAGE_INIT is
>>>>> disabled struct pages are initialized regardless of
>>>>> memblock_reserved_mark_noinit().
>>>>>
>>>>> I think this patch should go in before your updates:
>>>>
>>>> Shouldn't we fix this in memblock code?
>>>>
>>>> Hacking around that in the memblock_reserved_mark_noinit() user sound wrong
>>>> -- and nothing in the doc of memblock_reserved_mark_noinit() spells that
>>>> behavior out.
>>>
>>> We can surely update the docs, but unfortunately I don't see how to avoid
>>> hacking around it in hugetlb.
>>> Since it's used to optimise HVO even further to the point hugetlb open
>>> codes memmap initialization, I think it's fair that it should deal with all
>>> possible configurations.
>>
>> Remind me, why can't we support memblock_reserved_mark_noinit() when
>> CONFIG_DEFERRED_STRUCT_PAGE_INIT is disabled?
> 
> When CONFIG_DEFERRED_STRUCT_PAGE_INIT is disabled we initialize the entire
> memmap early (setup_arch()->free_area_init()), and we may have a bunch of
> memblock_reserved_mark_noinit() afterwards

Oh, you mean that we get effective memblock modifications after already
initializing the memmap.

That sounds ... interesting :)

So yeah, we have to document this for memblock_reserved_mark_noinit().

Is it also a problem for kexec_handover?

We should do something like:

diff --git a/mm/memblock.c b/mm/memblock.c
index 154f1d73b61f2..ed4c563d72c32 100644
--- a/mm/memblock.c
+++ b/mm/memblock.c
@@ -1091,13 +1091,16 @@ int __init_memblock memblock_clear_nomap(phys_addr_t base, phys_addr_t size)
  
  /**
   * memblock_reserved_mark_noinit - Mark a reserved memory region with flag
- * MEMBLOCK_RSRV_NOINIT which results in the struct pages not being initialized
- * for this region.
+ * MEMBLOCK_RSRV_NOINIT which allows for the "struct pages" corresponding
+ * to this region not getting initialized, because the caller will take
+ * care of it.
   * @base: the base phys addr of the region
   * @size: the size of the region
   *
- * struct pages will not be initialized for reserved memory regions marked with
- * %MEMBLOCK_RSRV_NOINIT.
+ * "struct pages" will not be initialized for reserved memory regions marked
+ * with %MEMBLOCK_RSRV_NOINIT if this function is called before initialization
+ * code runs. Without CONFIG_DEFERRED_STRUCT_PAGE_INIT, it is more likely
+ * that this function is not effective.
   *
   * Return: 0 on success, -errno on failure.
   */


Optimizing the hugetlb code could be done, but I am not sure how high
the priority is (nobody complained so far about the double init).

-- 
Cheers

David / dhildenb

