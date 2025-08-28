Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F4A9CF2566
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 19 Nov 2025 00:43:04 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a704d114;
	Tue, 18 Nov 2025 17:27:34 +0000 (UTC)
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 9c37f6e1
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 28 Aug 2025 07:35:29 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-afeec747e60so37494066b.0
 for <wireguard@lists.zx2c4.com>; Thu, 28 Aug 2025 00:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756366529; x=1756971329; darn=lists.zx2c4.com;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7wdLKdu3gRydbgkaOExgCyxr/LuNr8ANanTK9VurXYA=;
 b=Z/ilyDOLJc9CauIeEDJvYx2hoMiDGV8HoExv17SgfZefqjc287q2AHCMUK2aiTUdLa
 Ar7t+wmltHIqy42s+gqjRu35zIqOhQ9N7YgTSaU8HSM2t1rwNADCCxUZHSx30t+NstuC
 CdKFq+t36m/cq1ZrVyBtiVzRIPxgBH6U54+c3+713zIYB+1DitEYU25BAD+LF7+g1VU1
 e59PsehQQMNvXvnzxtVcoup3IK05fOkVieC59IOO1bfdENmxQ7fdiUIhJyh2sf5gPCau
 tpOLMdzojfnvm9mVcj4KJ2lcV5rhQOa+bg4p7hjE5DnOZqi61uttihka4INdPcNhRZMV
 HDDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756366529; x=1756971329;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :reply-to:message-id:subject:cc:to:from:date:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=7wdLKdu3gRydbgkaOExgCyxr/LuNr8ANanTK9VurXYA=;
 b=WvEpKY5us4CyeRAmtV1MRo9ci4T8SnlkhzX5pDecI6TwGrUPOGEtdNVR+vMNV0CN+v
 puGvQRaBk0JSzUr+Tz0JM5irzR+YaIagOQtV2ZOyvThf3rzK4pqOYOIAUfXvbOqpwPok
 wMRNfpnVc2aInjxV+T+7FNUKo+J3lZx80c3zghgg+RVmi467h+IaQLFtsrFfIJkVI5D/
 0rY1f3hLXDjRFvntU6QfJYgeCOnQBIZzeX64Y4gKfgDVx5eSrYfgGiZHUxGbvUVyizRo
 RO4YnlPX9jPg2LCtqX/Ofh64Dp5Q/PXLl5FUOXLEF1TnwaSqptk2HxbFqOHUGqp1Jh9H
 dYqw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVIh7qXhuOcZ7YncHDeanVLGjYJJ3d6s7IeqJQgeLS5IjwGZWLTQB8t0BDAhfz18MK6PF/1rpwdO9Y=@lists.zx2c4.com
X-Gm-Message-State: AOJu0YxQwRnn/CmPK9qY9TvKxuLzaupro+p7IDsz06mvSbKz4NvXuAcN
 /2YxZmkah+raDpZZv9VkaJl3510ZIJJA1lW6oChWoH6DrsjL65zYWOB1
X-Gm-Gg: ASbGncsDIX2YfhGg9mZyPQMVfK+D3Cyhc9DXpQAZ7LZpQc/67XjwFaT1vj9j3Ir7/Dd
 wN4ut2o1Tsxb81E3tb2d7dszrTxGzCE8nre4FyVd6nfwUxdW6EEYf7iC5Kz7/eodj+cChige6fn
 6Z8WNDsqDej/uzCuQkEeR/+scBtxcahgn89BkKm9nIgAveKJQvSWWwT/dr7TCoO2oJ62gHsLPOQ
 91Nz0xyc/OPXeZjAgqJfowUaaLN9oSDRJ3vXfKiWVmum+O8HK2MHjEiu3t1Ywzp7F1zizvg2CG9
 aEycsSGWmLwZ2Am3PJyNa0K2XPXg2ZFiFfhRqyopWY/2crE29TRiQEetdeV3G7NDijT3tL2VOwJ
 wwqZ6vQILGVMaMUfCKEctozuThg==
X-Google-Smtp-Source: AGHT+IH+/HdQFSXw/W0bPc1NEIz4PAWk+piUx/7dt/vdSor64JcoeKILsFtoJ4Brv3+pRvjO+XdeaA==
X-Received: by 2002:a17:907:3f0a:b0:afe:d590:b6af with SMTP id
 a640c23a62f3a-afed590c109mr310258266b.20.1756366529084; 
 Thu, 28 Aug 2025 00:35:29 -0700 (PDT)
Received: from localhost ([185.92.221.13]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afe77c2b758sm886311466b.84.2025.08.28.00.35.27
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 28 Aug 2025 00:35:28 -0700 (PDT)
Date: Thu, 28 Aug 2025 07:35:27 +0000
From: Wei Yang <richard.weiyang@gmail.com>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org,
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
 wireguard@lists.zx2c4.com, x86@kernel.org, Zi Yan <ziy@nvidia.com>
Subject: Re: [PATCH v1 09/36] mm/mm_init: make memmap_init_compound() look
 more like prep_compound_page()
Message-ID: <20250828073527.u4k47fohaquzf3pg@master>
References: <20250827220141.262669-1-david@redhat.com>
 <20250827220141.262669-10-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250827220141.262669-10-david@redhat.com>
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

On Thu, Aug 28, 2025 at 12:01:13AM +0200, David Hildenbrand wrote:
>Grepping for "prep_compound_page" leaves on clueless how devdax gets its
>compound pages initialized.
>
>Let's add a comment that might help finding this open-coded
>prep_compound_page() initialization more easily.
>
>Further, let's be less smart about the ordering of initialization and just
>perform the prep_compound_head() call after all tail pages were
>initialized: just like prep_compound_page() does.
>
>No need for a comment to describe the initialization order: again,
>just like prep_compound_page().
>
>Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
>Signed-off-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Wei Yang <richard.weiyang@gmail.com>

-- 
Wei Yang
Help you, Help me
