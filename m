Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E5C9CF2561
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 19 Nov 2025 00:43:05 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e8ec9642;
	Tue, 18 Nov 2025 17:27:36 +0000 (UTC)
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id c8cafe76
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 28 Aug 2025 07:35:56 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-61c26f3cf0dso1066083a12.1
 for <wireguard@lists.zx2c4.com>; Thu, 28 Aug 2025 00:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756366555; x=1756971355; darn=lists.zx2c4.com;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Q0BfjvXaX7EhpBrJcO9diF40ujDlSeO28TY40tQufFs=;
 b=nVoOvvM4AJsAQPaEz8eN/ChLIhiD0Vj5sE1VF87BbhazN8pxVJyvZSTpcm8/HHCgtk
 eNAe0XYC/+dz1T3gBLn1PBPnvc4MSgYNdWJk4/WnZECJsLHMnXaV6h7aZbPaD6BEPaAf
 AUfdV6GWCWu7RiSIU3BU6Kh9HRpUDihEXA7kq7T1myhYFyaXpqXjIhFH0QYEAxwVRu60
 ppe8Y73esH9966clvAhDJRuiVcy0wh/ZJ/refctKKpSyzX0yqwlqK+/fn5OZHkROGFXx
 x+bdLwyb5CJx18VbF0BX7X0vGsfV3/QEVPqiCDQZg2runnc3BjEUBQmWW5/AC7s4Zx+8
 Z9ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756366555; x=1756971355;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :reply-to:message-id:subject:cc:to:from:date:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Q0BfjvXaX7EhpBrJcO9diF40ujDlSeO28TY40tQufFs=;
 b=DIvWUcF8jK5VaUo6B6J+Xm1Ont2m65T5+Klt+Npikq3i6takiApgqi3bo9uVIX4dMk
 5SxCldVi6THA/mAqTMlYzP0WJ34pPzAcHNKiYycvp7qwLawWngTUSwLTsiy4zra+DMnF
 9RAmMRIPIddba3qI/bRbJWCCPATsNvjvD/W5c+Agj7+Zhd+8LaJLUF8eow2HRsjmXRv7
 LOKGe5LDnsZhsHWW4zht8R9Y1+XcgRQFCXUF+NHYGShiHxak7CI3XKou+mmCXDsbIW8B
 fGnlKulL9Sh/FevbV0Sw0q6dRjgdbvp+47lbG85w6quhFBTI2rLfFtcHYT7/DxbYaZxj
 KrpQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXrWI4ynCsTKahQaJbf9TLuFGFeoY6OtgjuczmCse+J5NcfPetyU/N9/yBM6hfTydlHEIzyjE//sCc=@lists.zx2c4.com
X-Gm-Message-State: AOJu0YzG2/e0ofYFQv5wLEq7KBLpsIxxLN63neqjH2CiHzZBdv11yJXn
 T3q11gvObmPPli3Y1ECJvBNVs9p3jz1YOtnhyobt+s7qJ8/Q04F9o6cI
X-Gm-Gg: ASbGncudPEIE9qDJVLelr8OW6XzA27ffgXoRroAOM1cuHs0iO48fOSGvtOOjxQLEZaj
 VXhMrNwXMYCJr0ZhqemzeeIYBrCIjuRrsfNm1nznocwgAX/6aNf1pSbNQl1Y1v1b6eB0uDv/E32
 I3ewJnQBQ9CjjHHtMzGU3NlQUHnnP2p24UcwyngjI284f90W/rpYLUp6IVrQQq8k1atJQlYvweG
 WNtlSCcQ9qqaUo/tHQ9eyCy9obxWTPHjeyMkbd9w7pt5oHDXGi6SqF2QGFPQK68DMhCtNvRjeRx
 4kN/ZKvpsudDcuNhg259So8eeeL0TlsD9/JJwp33ss8H/dNjIbAoAky+GzNBzTghSP6XrCOSQob
 vU7LCUcQfYEeruRLNThBNS/AHwQ==
X-Google-Smtp-Source: AGHT+IETTLjGc3PPKg04ncd1zRzcObVAV207MWaWJmOCZt1EmbrBQuEK0aAe9NGL4LI6P2OcE9HkdQ==
X-Received: by 2002:a17:907:fdc1:b0:afc:aa44:bda1 with SMTP id
 a640c23a62f3a-afe296bcae4mr2097332866b.54.1756366555363; 
 Thu, 28 Aug 2025 00:35:55 -0700 (PDT)
Received: from localhost ([185.92.221.13]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afe68891cefsm988052566b.66.2025.08.28.00.35.54
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 28 Aug 2025 00:35:54 -0700 (PDT)
Date: Thu, 28 Aug 2025 07:35:54 +0000
From: Wei Yang <richard.weiyang@gmail.com>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, Zi Yan <ziy@nvidia.com>,
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
 Michal Hocko <mhocko@suse.com>, Mike Rapoport <rppt@kernel.org>,
 Muchun Song <muchun.song@linux.dev>, netdev@vger.kernel.org,
 Oscar Salvador <osalvador@suse.de>, Peter Xu <peterx@redhat.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Suren Baghdasaryan <surenb@google.com>, Tejun Heo <tj@kernel.org>,
 virtualization@lists.linux.dev, Vlastimil Babka <vbabka@suse.cz>,
 wireguard@lists.zx2c4.com, x86@kernel.org
Subject: Re: [PATCH v1 10/36] mm: sanity-check maximum folio size in
 folio_set_order()
Message-ID: <20250828073554.evipmbkxrint3tbs@master>
References: <20250827220141.262669-1-david@redhat.com>
 <20250827220141.262669-11-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250827220141.262669-11-david@redhat.com>
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

On Thu, Aug 28, 2025 at 12:01:14AM +0200, David Hildenbrand wrote:
>Let's sanity-check in folio_set_order() whether we would be trying to
>create a folio with an order that would make it exceed MAX_FOLIO_ORDER.
>
>This will enable the check whenever a folio/compound page is initialized
>through prepare_compound_head() / prepare_compound_page().
>
>Reviewed-by: Zi Yan <ziy@nvidia.com>
>Signed-off-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Wei Yang <richard.weiyang@gmail.com>

-- 
Wei Yang
Help you, Help me
