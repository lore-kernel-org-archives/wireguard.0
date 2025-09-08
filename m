Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8D74CAC581
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  8 Sep 2025 16:47:30 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 480649b6;
	Mon, 8 Sep 2025 16:47:28 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 8a01cf92
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 8 Sep 2025 16:47:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 0C00C4178A
 for <wireguard@lists.zx2c4.com>; Mon,  8 Sep 2025 16:47:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0B38C4CEF7
 for <wireguard@lists.zx2c4.com>; Mon,  8 Sep 2025 16:47:24 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="aRSmTrDx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1757350043;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lHuXjtnGIwA8Zzr3bT7RPQh03xIe4TvMRJ0gk9Qtcas=;
 b=aRSmTrDxIs6NpeGo93fkReDvlHN1nyKT78wEVvyAxjkAXAC2k2c3mxuz/bJ82L8IZW1yN6
 pwkX2HXRtMpvSadVNNy+vTEk636HAjXuttfeyulU58v4gROvgN5dbku8+cv8xe9AeoEtRt
 vJnlgruF24VRNpNpSmzpwMaYauNKy6E=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 4b1c514c
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 8 Sep 2025 16:47:22 +0000 (UTC)
Received: by mail-ot1-f53.google.com with SMTP id
 46e09a7af769-74ed00220f6so431249a34.2
 for <wireguard@lists.zx2c4.com>; Mon, 08 Sep 2025 09:47:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVx9J5EETjS9M1wXdC4gzdDai+B1J8hVHVNNp0waEEmcdNZo0I4x3GqIHk8ObAzObjG4XjYDpvAFPY=@lists.zx2c4.com
X-Gm-Message-State: AOJu0YzyJ1iiXY9zXeXzo62H6WW3K3BNFD9Vm5f060oB3VVQxNa+euXi
 6F9pOicYBse2a5JlFSToLNb0MRpHWpAY3eb9EASX7v0cgzgU2UM3f8kqj2LNp31XWlk6bNGxgfc
 iEHn4owyOHiSzqS9p9j3XlMGzW9A9aRo=
X-Google-Smtp-Source: AGHT+IG1lksSpt4e4b7wpOLuoBOgU4CtzIVFITSYKRy7vIMNnTgG60R226zI8so9rVaf/KD14awSBHuCM8l64s4kZfU=
X-Received: by 2002:a05:6808:2e4b:b0:438:37eb:62b2 with SMTP id
 5614622812f47-43b29b952ffmr4287499b6e.44.1757350039548; Mon, 08 Sep 2025
 09:47:19 -0700 (PDT)
MIME-Version: 1.0
References: <20250821200701.1329277-1-david@redhat.com>
 <20250821200701.1329277-6-david@redhat.com>
In-Reply-To: <20250821200701.1329277-6-david@redhat.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 8 Sep 2025 18:47:08 +0200
X-Gmail-Original-Message-ID: <CAHmME9pO-g4qUUsbF+XZqcPcwfP3-N7AxR+MX6G73adc2-NAkA@mail.gmail.com>
X-Gm-Features: AS18NWDayNVnEOpkO7Cmy5o2hUWkz6cio8gfE7ZsOxyaASSZD8l09i-KslFVPvE
Message-ID: <CAHmME9pO-g4qUUsbF+XZqcPcwfP3-N7AxR+MX6G73adc2-NAkA@mail.gmail.com>
Subject: Re: [PATCH RFC 05/35] wireguard: selftests: remove
 CONFIG_SPARSEMEM_VMEMMAP=y from qemu kernel config
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, Shuah Khan <shuah@kernel.org>, 
 Alexander Potapenko <glider@google.com>,
 Andrew Morton <akpm@linux-foundation.org>, 
 Brendan Jackman <jackmanb@google.com>, Christoph Lameter <cl@gentwo.org>,
 Dennis Zhou <dennis@kernel.org>, 
 Dmitry Vyukov <dvyukov@google.com>, dri-devel@lists.freedesktop.org, 
 intel-gfx@lists.freedesktop.org, iommu@lists.linux.dev, 
 io-uring@vger.kernel.org, Jason Gunthorpe <jgg@nvidia.com>,
 Jens Axboe <axboe@kernel.dk>, 
 Johannes Weiner <hannes@cmpxchg.org>, John Hubbard <jhubbard@nvidia.com>,
 kasan-dev@googlegroups.com, 
 kvm@vger.kernel.org, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Linus Torvalds <torvalds@linux-foundation.org>, linux-arm-kernel@axis.com, 
 linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org, 
 linux-ide@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-mips@vger.kernel.org, linux-mmc@vger.kernel.org, linux-mm@kvack.org, 
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
 linux-scsi@vger.kernel.org, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 Marco Elver <elver@google.com>, Marek Szyprowski <m.szyprowski@samsung.com>, 
 Michal Hocko <mhocko@suse.com>, Mike Rapoport <rppt@kernel.org>,
 Muchun Song <muchun.song@linux.dev>, 
 netdev@vger.kernel.org, Oscar Salvador <osalvador@suse.de>,
 Peter Xu <peterx@redhat.com>, 
 Robin Murphy <robin.murphy@arm.com>, Suren Baghdasaryan <surenb@google.com>,
 Tejun Heo <tj@kernel.org>, 
 virtualization@lists.linux.dev, Vlastimil Babka <vbabka@suse.cz>,
 wireguard@lists.zx2c4.com, x86@kernel.org, Zi Yan <ziy@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
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

Applied, thanks.
