Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EF21CA0FF0
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 29 Aug 2025 14:49:25 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8a3c10a0;
	Fri, 29 Aug 2025 14:37:37 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id f4a9b390
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 29 Aug 2025 14:37:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1756478252;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=FneLljPHDM9XgGJyT12mwKiq6vPBg0z8/AklpfNT7Sc=;
 b=efSQPemrp/EfZsndqVcPvEjCqu8w0hRfa6pwnWs+KmWye8oDIlg1vgksqlv1hcx6ushcFR
 8wQinQ0937WyV+JmIW0uqR5oK7NZVg2wBaGtw5ryzqvE5BCdo6gP5+YHIjVxsCJI2gRLoJ
 /sCD4nd9T27uCze00pYeV4gq9JU8nGM=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-134-OJxHDxiOPcuLkhXJBm3Hmw-1; Fri, 29 Aug 2025 10:37:31 -0400
X-MC-Unique: OJxHDxiOPcuLkhXJBm3Hmw-1
X-Mimecast-MFC-AGG-ID: OJxHDxiOPcuLkhXJBm3Hmw_1756478250
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-3cf48ec9e40so511746f8f.1
 for <wireguard@lists.zx2c4.com>; Fri, 29 Aug 2025 07:37:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756478250; x=1757083050;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FneLljPHDM9XgGJyT12mwKiq6vPBg0z8/AklpfNT7Sc=;
 b=UILybX5kaZWBw5EJMBIzOgRdmpGF7qc1BPahPEz2D1XDS4LTYFTdQJoBK+b9OG17aD
 JoCCXMwHylzos+o6OX196MCgg073z5mrkJJDfhdENZ0Rh1zAWT7FHMFT6RCOadknkQQs
 hx+rkO5FEloK3FdkMhzY5px96uisfXnDeAR+a1vWo+io7k2GzQjfJVt5l34vTq7dTCh0
 5eXnfaj/iEChFo7VIkCqHnCaQxguXldE9B08bDIOmFIHxKKOf2i2O1WDqRjbeCS0RCe0
 mcOmSyPCo9tKCAgsSDzGpmQdgIF6E1vwEO9Xs/wq7/lGJ1n2CQyw2CMWZ6pd9ElTeTN+
 o97Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVMZSJU3DugU11cXzu4fk6wwUlG+inHRT3dCpsVgcrX94cHaWqAvpI7jNcX4M7tuAo0CZAnKkzBJdo=@lists.zx2c4.com
X-Gm-Message-State: AOJu0Yyz5C9UXICsjTWn4KYpoNO1TwVQrC4aOHW/BUF+eya4ahhizCBH
 A7bxYwvx/FkmA4r1TcR4O+6EccQs52iAf2V7fGC1T9ymX7ko0FD0ho8p5S5b2AQ/s2lZo7WfVX6
 RrGDe+RQsHnVY+D3g6FaM0HJAZdPMAtZHfog3lI9BlQVtTJht8ergnif+WciXXQ==
X-Gm-Gg: ASbGncveCtbrmyDdxO4kZWv7QnYUdZGeDgBlzI7AFs/DqZcYF1sT3vHryU1sXhu8KNA
 r+gNDJXiPL6UPI0Mk717irbXhp2vgnJE5MX33y6C5e/x8/k9yFH9z4UGd9lJIZotMGUx3cYcR84
 O4e9+0kozrJukfg08UR5ziqipCRfx1BMDvvn8yWpUR7+VukuN/aUDm108AFK2/TobWnHZPTZ1KY
 Aa0zLKd/ldHhNog9uGrZCgChudVN22lFHG/6kiRcihQWI0eNnbST32q8Hyu94l2oiDyQ3ev/FZg
 46xFe8x0kqV4EioraotbSiJBzbSBezHw9mJehZI3AXJ8ZczpiIU7WTQHfJS8mGUfpXBIViwyNQX
 97DPF8k/MgFNjVkMC2F0HYhlZN0ibgG0mAkARlOhvi7ENOgwRF2eQLgRwl/wpvKl6
X-Received: by 2002:a05:6000:4181:b0:3c6:cb4:e07a with SMTP id
 ffacd0b85a97d-3c60cb4e5f4mr14776371f8f.30.1756478249723; 
 Fri, 29 Aug 2025 07:37:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEHovUImNhvkO1lXs5k4xADHmBMPjxYhr00MTNQwak1+GGWTtZ4Tk7PPjO6gfl53i+oo7PyhA==
X-Received: by 2002:a05:6000:4181:b0:3c6:cb4:e07a with SMTP id
 ffacd0b85a97d-3c60cb4e5f4mr14776347f8f.30.1756478249246; 
 Fri, 29 Aug 2025 07:37:29 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f1d:100:4f8e:bb13:c3c7:f854?
 (p200300d82f1d01004f8ebb13c3c7f854.dip0.t-ipconnect.de.
 [2003:d8:2f1d:100:4f8e:bb13:c3c7:f854])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3cf276cc915sm3557153f8f.21.2025.08.29.07.37.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Aug 2025 07:37:28 -0700 (PDT)
Message-ID: <07b11bc1-ea31-4d9d-b0be-0dd94a7b1c9c@redhat.com>
Date: Fri, 29 Aug 2025 16:37:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 24/36] ata: libata-eh: drop nth_page() usage within SG
 entry
To: Damien Le Moal <dlemoal@kernel.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: linux-kernel@vger.kernel.org, Niklas Cassel <cassel@kernel.org>,
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
 linux-scsi@vger.kernel.org, Marco Elver <elver@google.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Michal Hocko <mhocko@suse.com>,
 Mike Rapoport <rppt@kernel.org>, Muchun Song <muchun.song@linux.dev>,
 netdev@vger.kernel.org, Oscar Salvador <osalvador@suse.de>,
 Peter Xu <peterx@redhat.com>, Robin Murphy <robin.murphy@arm.com>,
 Suren Baghdasaryan <surenb@google.com>, Tejun Heo <tj@kernel.org>,
 virtualization@lists.linux.dev, Vlastimil Babka <vbabka@suse.cz>,
 wireguard@lists.zx2c4.com, x86@kernel.org, Zi Yan <ziy@nvidia.com>
References: <20250827220141.262669-1-david@redhat.com>
 <20250827220141.262669-25-david@redhat.com>
 <7612fdc2-97ff-4b89-a532-90c5de56acdc@lucifer.local>
 <423566a0-5967-488d-a62a-4f825ae6f227@kernel.org>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <423566a0-5967-488d-a62a-4f825ae6f227@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: -05zEyLcTMDbuDm5z9gB2PdBkWO0epKbYOdCMekePW4_1756478250
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 29.08.25 02:22, Damien Le Moal wrote:
> On 8/29/25 2:53 AM, Lorenzo Stoakes wrote:
>> On Thu, Aug 28, 2025 at 12:01:28AM +0200, David Hildenbrand wrote:
>>> It's no longer required to use nth_page() when iterating pages within a
>>> single SG entry, so let's drop the nth_page() usage.
>>>
>>> Cc: Damien Le Moal <dlemoal@kernel.org>
>>> Cc: Niklas Cassel <cassel@kernel.org>
>>> Signed-off-by: David Hildenbrand <david@redhat.com>
>>
>> LGTM, so:
>>
>> Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> 
> Just noticed this:
> 
> s/libata-eh/libata-sff
> 
> in the commit title please.
> 

Sure, I think some quick git-log search mislead me.

Thanks!

-- 
Cheers

David / dhildenb

