Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D4DCCF2561
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 19 Nov 2025 00:44:14 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c86be402;
	Tue, 18 Nov 2025 17:27:38 +0000 (UTC)
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 4ca2d646
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 28 Aug 2025 07:37:57 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-61c26f3cf0dso1069318a12.1
 for <wireguard@lists.zx2c4.com>; Thu, 28 Aug 2025 00:37:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756366677; x=1756971477; darn=lists.zx2c4.com;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TVrt2ctwbXgHbo+Hn2TZ0gCxiv/sLljbJFjbqAY/TQU=;
 b=XlPg7cK9iidHV3Au8uD7G3QqnVIetWFE6hd5kYvkQkZdmdbGAUPQ+ViUa7VwVol/es
 cG3rRsC7WJizYUrnUYUOfzQBqAvhOzLhugavUHmK/H5G/PpH8kPz/s6QxcMUhaDMMXhg
 I8z/F5lI6iyVwcVQGeg1now/A3tgFZe7DuO6tCAZ698a8EIR5RGDSLzRBfayA4Motac3
 u7Oypm5vTRXTNhdjvmdqF1NaqoYZjuVi/iJ00EJeq56eZGfzp3lS+ZfxjeEc+u0cDcFl
 sbFDwAgNFYvoLzhDasFyjNj9D0AYLczFq7eexNCX5mP84uE+gj2eZmj/Fi9xyTWcFaYh
 3LIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756366677; x=1756971477;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :reply-to:message-id:subject:cc:to:from:date:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=TVrt2ctwbXgHbo+Hn2TZ0gCxiv/sLljbJFjbqAY/TQU=;
 b=PRqXvWc+H6qwMdGOGJ8hIMOcJXFiXEjta+8nrzofvreqfzqLz3XD/WAsiBUyxAK4DP
 gwZYIuhY7h8X1Q0ETNYRDBf1MxSSKrwoXG6itJVvUNUhpsHknt6EVVf5gd9OFzn6catk
 K1HzEJOHQ7+LqgKP2RoUPh0Y+ABhkRlsEb6uKhHAV56vKBZpIwt0Md99F1ZatJG4A7rS
 PiMPbyEYmYdpEM1u+bBDlJ/iYHmrdY92W8YZygV7mGFMyrDiBoJhht2FYazpj8wnXW3L
 LYWULgH2jiYFENVjJYhtXizk7dcwS0gF9LxXvLz5vy4IaBupMlo9KNTKmYWK8rSF/NSd
 SLjQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVM15GI53N4wwtCFfw8WfKQXltD6JVsCyQnxiaY6tDILXy5fLyCrRY0UQnE/UpFlSXzfm8n+n/osFE=@lists.zx2c4.com
X-Gm-Message-State: AOJu0YwZ8+YJkVqWjDNI2ASNdJY2jHveaYzFdxoeRt7diMO83TwkfQ5U
 m3baD0D4wdcbyC2UPqzGatVZc/v6FsA7ivP/pKVqly3Nr2nHGfcEeERN
X-Gm-Gg: ASbGncvmo3tjX1mUVfjLfdjB0kYjVdczLyBLoof+ixZDewCgpLfiPJvTz+mq4qB/mce
 jd2elqePFlY8grRf4OLhI2sNfjqQnH7kJFb7sNFSw0g4homROqfpDRkPfjLgWanX+/OOxKfKyL8
 Jw2mmI3Q3pwwlUWrH3QZFrpy6NLJVBCPiIbeJw0yx5zN0t7D1ZieZJxc7eIHNX3nqahgIcEqsul
 GGcDp38B2/cRdrht1vWqOBNMlWh6KhahHidiDqvV52OBVRZqedq90/UBjOtEyQSa6N/71OX+Jlx
 L9r3MSCAEzvlNoF6OYCQmH5BEULAvANlE9NA0v7aQxwyEDCF5B+HIgivjNoa5uWuXakjy/Nt7kj
 FyhErt51Ma8AGSeHsdQuJvN1g1zHo4WB2nTXBQDwSpXH66ao=
X-Google-Smtp-Source: AGHT+IHzpXzU7IRYTRL9u8s1GDWZ3U5CYmUtBakw/pIBZX/rgdseIwaMMauanPlQhlJ9DDnzYy2q2w==
X-Received: by 2002:a05:6402:52c4:b0:607:28c9:c3c9 with SMTP id
 4fb4d7f45d1cf-61c1b453182mr20154119a12.6.1756366676733; 
 Thu, 28 Aug 2025 00:37:56 -0700 (PDT)
Received: from localhost ([185.92.221.13]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-61cdb00baf9sm715248a12.33.2025.08.28.00.37.56
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 28 Aug 2025 00:37:56 -0700 (PDT)
Date: Thu, 28 Aug 2025 07:37:56 +0000
From: Wei Yang <richard.weiyang@gmail.com>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, Zi Yan <ziy@nvidia.com>,
 "Mike Rapoport (Microsoft)" <rppt@kernel.org>,
 Alexander Potapenko <glider@google.com>,
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
 Michal Hocko <mhocko@suse.com>, Muchun Song <muchun.song@linux.dev>,
 netdev@vger.kernel.org, Oscar Salvador <osalvador@suse.de>,
 Peter Xu <peterx@redhat.com>, Robin Murphy <robin.murphy@arm.com>,
 Suren Baghdasaryan <surenb@google.com>, Tejun Heo <tj@kernel.org>,
 virtualization@lists.linux.dev, Vlastimil Babka <vbabka@suse.cz>,
 wireguard@lists.zx2c4.com, x86@kernel.org
Subject: Re: [PATCH v1 11/36] mm: limit folio/compound page sizes in
 problematic kernel configs
Message-ID: <20250828073755.gyq5cyafrxb7lnw2@master>
References: <20250827220141.262669-1-david@redhat.com>
 <20250827220141.262669-12-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250827220141.262669-12-david@redhat.com>
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

On Thu, Aug 28, 2025 at 12:01:15AM +0200, David Hildenbrand wrote:
>Let's limit the maximum folio size in problematic kernel config where
>the memmap is allocated per memory section (SPARSEMEM without
>SPARSEMEM_VMEMMAP) to a single memory section.
>
>Currently, only a single architectures supports ARCH_HAS_GIGANTIC_PAGE
>but not SPARSEMEM_VMEMMAP: sh.
>
>Fortunately, the biggest hugetlb size sh supports is 64 MiB
>(HUGETLB_PAGE_SIZE_64MB) and the section size is at least 64 MiB
>(SECTION_SIZE_BITS == 26), so their use case is not degraded.
>
>As folios and memory sections are naturally aligned to their order-2 size
>in memory, consequently a single folio can no longer span multiple memory
>sections on these problematic kernel configs.
>
>nth_page() is no longer required when operating within a single compound
>page / folio.
>
>Reviewed-by: Zi Yan <ziy@nvidia.com>
>Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
>Signed-off-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Wei Yang <richard.weiyang@gmail.com>

-- 
Wei Yang
Help you, Help me
