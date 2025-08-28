Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29DCBCF2564
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 19 Nov 2025 00:27:50 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b9de0214;
	Tue, 18 Nov 2025 17:27:32 +0000 (UTC)
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id e379cf86
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 28 Aug 2025 07:31:52 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3cb9268511bso371677f8f.0
 for <wireguard@lists.zx2c4.com>; Thu, 28 Aug 2025 00:31:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756366311; x=1756971111; darn=lists.zx2c4.com;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EuV0vIwmYzbGp0NvCAEdvEWsqc4i4ounAUIZgXtsn78=;
 b=ZksTH0G1aRtnf4ufaL5ro9Sf7BlC2Rwy2KBkq1CdNMTJgBvglgZijUaepScR3bmF9D
 vvssaI6ZSaWo8XRKFQIeDORKa2+Ppg7gi89SMpKRh+slhFu0wQyRwNhxo8+c6eHB4vEq
 LbEEhjNKKWS1LI6m5mCfoFkxgeg8iA0YvJiaJBUOfJfimvXGgg4T/NSzi144Rakf9GKh
 +xf8G8BKtrim7NTmyd5KfqHOBWf7ST76ZkiABKpmLIixr2WnZxMDMOtclAEzDmX+QmvE
 7/CpaPs6CoZR7zOtVEqBWT/xvW83BSYn/c6lHSWAsUC7Zyzogt0IvCPi8RWpLB4n4k3D
 Rjfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756366311; x=1756971111;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :reply-to:message-id:subject:cc:to:from:date:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=EuV0vIwmYzbGp0NvCAEdvEWsqc4i4ounAUIZgXtsn78=;
 b=ZxRiDUNKDuSGDrOYZOOzKrP77+n+L+B8ntekJP/xrDU+LpMhuMR+6roJ0jsJThcipK
 b70SGNk8ljUI1U94gaKFsx12jBF3OPm439D/G+oaUpqvAeVsdC20cHSrOVYsy4gSdGI4
 4xEAv0YKhgtMLGw6CLld5VKXiJk72AW+K6hZbXVhUkR/WNYxYyuPzxphr8LB/fPuQQJ9
 jnJ26xcktPhdvA51N7mH+ynZaYs8o5NYjrnOYQWmadnO9422qgShCp4tDV6nMvk0Qjye
 gkNF1MRP+0RnN2qh5/cSVg+UAMk8kovZioN40RGs4oHQwSZv9xTco1wAInWAxIGn0c/U
 ccUA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW5WF958J7kusxbr3Pu0y6d5KJA+5AVRiQz2f1Eu14hHexo/ghftQX03+3aPiPdhPMI0GWEtwXo/Yg=@lists.zx2c4.com
X-Gm-Message-State: AOJu0Yz41dLebGPh1pVbZHPWIRcY/TnVzSpQcSYhxiKvNC3oTqu3xZUP
 FzMqYoaCnKnkfmjCuM18JHSTUc4P5UatPAHFGFLYcFoFseC98Vb9E5NS
X-Gm-Gg: ASbGnctUhrIdYJjl0pM5GGAQlOmYDEWpzFWVslQnzI4KzjiLWHJckKu8wqdyRrfyJ/W
 5E5/F+oazyVckheGCUZUL71X0jpz+XYStjICmpISC4dTHywWIdbyS93Jjkt7rLezzlQU5ystKO0
 ezzkvaz45BJ+MFEE9eES6ruzc2WHjAExkz8E7jQ7qLxxMyW9047bbWdfBaU6DdAIb6HPv2nwmOH
 p9zB2kXcNdycn5HKdDAJ09a+5uJrk1HGwD7obDJDf/WELc44zvLgCH7qaqLi++wNAn+JVMBKf/R
 kamhlJDLGS3wrc5spGUxpcFUEBOAiBiib78AQHh60wBewYBSiCBGxIqFgcsWJYSQXGtjDY/C3qG
 6uvAiTS1UO06GJn+FI61Bj5OWaluGokNtgx+S
X-Google-Smtp-Source: AGHT+IGYsCTFAB2u+mO+a+/7YQm7WCRYBnf/bqNrDbgJHuGpC+AeSLNYygCiHCIag3yJJPklKDadWQ==
X-Received: by 2002:a05:6000:2891:b0:3cd:96bb:b948 with SMTP id
 ffacd0b85a97d-3cd96bbc28fmr1837267f8f.47.1756366311260; 
 Thu, 28 Aug 2025 00:31:51 -0700 (PDT)
Received: from localhost ([185.92.221.13]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3c9c9324dc9sm14883755f8f.3.2025.08.28.00.31.50
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 28 Aug 2025 00:31:50 -0700 (PDT)
Date: Thu, 28 Aug 2025 07:31:50 +0000
From: Wei Yang <richard.weiyang@gmail.com>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, Zi Yan <ziy@nvidia.com>,
 SeongJae Park <sj@kernel.org>, Alexander Potapenko <glider@google.com>,
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
Subject: Re: [PATCH v1 06/36] mm/page_alloc: reject unreasonable
 folio/compound page sizes in alloc_contig_range_noprof()
Message-ID: <20250828073150.jyafkufvkjfqwp3f@master>
References: <20250827220141.262669-1-david@redhat.com>
 <20250827220141.262669-7-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250827220141.262669-7-david@redhat.com>
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

On Thu, Aug 28, 2025 at 12:01:10AM +0200, David Hildenbrand wrote:
>Let's reject them early, which in turn makes folio_alloc_gigantic() reject
>them properly.
>
>To avoid converting from order to nr_pages, let's just add MAX_FOLIO_ORDER
>and calculate MAX_FOLIO_NR_PAGES based on that.
>
>Reviewed-by: Zi Yan <ziy@nvidia.com>
>Acked-by: SeongJae Park <sj@kernel.org>
>Signed-off-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Wei Yang <richard.weiyang@gmail.com>

-- 
Wei Yang
Help you, Help me
