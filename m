Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF728CF2564
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 19 Nov 2025 01:06:03 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 32a7d068;
	Tue, 18 Nov 2025 17:27:43 +0000 (UTC)
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 73107912
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 28 Aug 2025 08:18:32 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-afcb7a7bad8so85056666b.3
 for <wireguard@lists.zx2c4.com>; Thu, 28 Aug 2025 01:18:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756369112; x=1756973912; darn=lists.zx2c4.com;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CFlTc2o50xP7q9jUUn86Cat3HkUhlqoaXfvof6seHm8=;
 b=CjhXz4rn+iAtdqDqmRqTzDKhRysFOmQ8NmgKULwpUz8YLvHHbmTu9+Dg/YuIO+puBC
 ac3aHMIWSH479Mx0Rzhyq7t2vYjU4L+EZVLXeXFo2wTPE8pYLvio/33uKk4Sg350u0eP
 Jcp1/AXgboG5DV3olTJciehqNJfl8KQSCfOW6iQkq2LmYxIiEBBpK3VGVlsBBl7IVuoC
 8f/3ZEpKse80WEZYm6hASx34HvZz0ygvg5dVKf2yDilRF23fBwkRZA0EC/vdQS4opwFF
 XxvVI7IPHaR5skikDqp4BHVO7EWdABCM7V/NcetfaNzHspYyxGtgZwJnU74oMkMOTnsv
 LW/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756369112; x=1756973912;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :reply-to:message-id:subject:cc:to:from:date:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=CFlTc2o50xP7q9jUUn86Cat3HkUhlqoaXfvof6seHm8=;
 b=A4fSBf6PoO/RKOLKXsG4jMeCshGSCPvYsKwHf/IcqQAYZYv0+M6Tcd1+9RYhCdWqCa
 lBkstygFvHog2qtj/LhdM3NnlcOPDnex0njFnq0S3aKtW+U8/WzJdgxIr90W47TqcWrP
 XnpvUsxZaTtzHMCwGFWn37Ec4CKHxWufvognl+IjAHGmfh9xyLTIpoZ8kLAmrJBMm5eB
 JA3NqPmQcV07wZGSTdXa6k5BLwbqPj3MKpL5oOU6lvnb1aORiYK+n/SiZj4tzqHWD0Xx
 LGoXF/moHxvzKTJlNY8Zgs4Y++puZHlcRyLrconTVlirQ+dvTFSc3B04r3Dpuz+xwCS1
 xhxw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVW6AzpSRok4FdXcrkZ0u/fzZNWMm0E7hRbwQsNwJIISpLAGOeFKWEzgPM0VSL+XCIOP9zV5zrKtkI=@lists.zx2c4.com
X-Gm-Message-State: AOJu0Yxolq/cXERz5REV8eQsu6d8x2MBa1vBEY92WQ/SprhHogVoSQgI
 lbCSkHpe/qQgbWCilI/fHhA3FZnEJwZWjCY4o2XMTgZkp3/7yKBz0ku4
X-Gm-Gg: ASbGncu43F/YzEByKd5nARJl111qvAeB1epgiDhula9kFmxXx6L0HT50U0kcC3A3c5c
 OowI0TM9fAA1RqmkHXDgWdTeAyjB+TLFLHa70gx5RovilhEV9vQrI37mnyJQdHeKDLVIv0KTlIj
 7PWj0xxEE/HoclfgEcIml5VT/7dlLGMzfzkz0AhTiv7lZJ/hcGZLxS391Zqd7HpRz0YCqAavfQ8
 MqZjz7OcDBIirb5iRsqO/DEmfFHsy5Hx4vDBDO7dX8hLQnYxCVQZ/0RU9g/Nd3nb9/7OmSFK1zD
 JpAWyV/cO6lUoDFXxfRD5+Mf8RInHOHOy2untxhwg76VM8aHc9qgpVNZy5EWt+ILZ85SyVhYSPV
 3LUYfz4iDmo/22arS+k9DtfZbDUqZImLEk4g0
X-Google-Smtp-Source: AGHT+IFrqyfe7g2Zl+sLgEHASy1+ip6WVy4aEpiIRxktJ8PetprRYIIgoW+xQR/WhySTtvxcEvhJTw==
X-Received: by 2002:a17:907:1c27:b0:afe:b878:a164 with SMTP id
 a640c23a62f3a-afeb878abecmr620398166b.50.1756369112172; 
 Thu, 28 Aug 2025 01:18:32 -0700 (PDT)
Received: from localhost ([185.92.221.13]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afe80daceb5sm811531866b.68.2025.08.28.01.18.31
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 28 Aug 2025 01:18:31 -0700 (PDT)
Date: Thu, 28 Aug 2025 08:18:31 +0000
From: Wei Yang <richard.weiyang@gmail.com>
To: David Hildenbrand <david@redhat.com>
Cc: Wei Yang <richard.weiyang@gmail.com>, linux-kernel@vger.kernel.org,
 Zi Yan <ziy@nvidia.com>, Alexander Potapenko <glider@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Brendan Jackman <jackmanb@google.com>,
 Christoph Lameter <cl@gentwo.org>, Dennis Zhou <dennis@kernel.org>,
 Dmitry Vyukov <dvyukov@google.com>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, iommu@lists.linux.dev,
 io-uring@vger.kernel.org, Jason Gunthorpe <jgg@nvidia.com>,
 Jens Axboe <axboe@kernel.dk>, Johannes Weiner <hannes@cmpxchg.org>,
 John Hubbard <jhubbard@nvidia.com>, kasan-dev@googlegroups.com,
 kvm@vger.kernel.org, "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 linux-arm-kernel@axis.com, linux-arm-kernel@lists.infradead.org,
 linux-crypto@vger.kernel.org, linux-ide@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-mm@kvack.org,
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
 wireguard@lists.zx2c4.com, x86@kernel.org
Subject: Re: [PATCH v1 12/36] mm: simplify folio_page() and folio_page_idx()
Message-ID: <20250828081831.fv4bs77kihwbffdi@master>
References: <20250827220141.262669-1-david@redhat.com>
 <20250827220141.262669-13-david@redhat.com>
 <20250828074356.3xiuqugokg36yuxw@master>
 <0e1c0fe1-4dd1-46dc-8ce8-a6bf6e4c3e80@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0e1c0fe1-4dd1-46dc-8ce8-a6bf6e4c3e80@redhat.com>
User-Agent: NeoMutt/20170113 (1.7.2)
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
Reply-To: Wei Yang <richard.weiyang@gmail.com>
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

On Thu, Aug 28, 2025 at 09:46:25AM +0200, David Hildenbrand wrote:
>> 
>> Curious about why it is in page-flags.h. It seems not related to page-flags.
>
>Likely because we have the page_folio() in there as well.
>

Hmm... sorry for this silly question.

>-- 
>Cheers
>
>David / dhildenb

-- 
Wei Yang
Help you, Help me
