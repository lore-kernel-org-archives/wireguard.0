Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4562FCA1016
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  8 Sep 2025 16:49:55 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 615ae2d5;
	Mon, 8 Sep 2025 16:48:28 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org
 [2600:3c0a:e001:78e:0:1991:8:25])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 137311f3
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 8 Sep 2025 16:48:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 5FE3344963
 for <wireguard@lists.zx2c4.com>; Mon,  8 Sep 2025 16:48:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0601BC4CEF1
 for <wireguard@lists.zx2c4.com>; Mon,  8 Sep 2025 16:48:23 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="XK8UCkAO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1757350098;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uSnlDYAkih0wYrWYP/wGKkJTrA/JIOiBaO0koXzi78I=;
 b=XK8UCkAOFuRTAaMghbMkYhV8T2QJaLjrkIRbiSC744iVovTaic60Zp5rZ+bImztc351gHd
 RfVyIShQIvu7iaNMFAfleIQgTZHVZIHMKALN8K7z4nH5u5CE2QvEyp5Ifj4Cu887WIjTUu
 PPaVKxR6lJFHUjNXxFZY/txccNFdWt8=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id b4418a94
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 8 Sep 2025 16:48:18 +0000 (UTC)
Received: by mail-oo1-f42.google.com with SMTP id
 006d021491bc7-621706e28faso553633eaf.2
 for <wireguard@lists.zx2c4.com>; Mon, 08 Sep 2025 09:48:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVCHwuaArn/vq1LUcOGEs7ATTz55DaYBC4fYLehERe0GyQgbQkn4xw8rHzlE5cPStSqtR3TIbdo7+c=@lists.zx2c4.com
X-Gm-Message-State: AOJu0YwgOeWEB+H4qEIhpjX8UpJ+5JCvLlLJMgVVA020JXRXGWjxen1N
 KaJ1KVtDFybnqMpKh0tJ3csnhCUdyeilt+Z/XljE6SWcLLR362mSYjPSHgFSjoWPU90HPvEzpXa
 w5n7m2/NNfKZh6fBR/kG//dnv3Y2ABHA=
X-Google-Smtp-Source: AGHT+IHX8XF6+e0fkSbHw/Gno/Iv8TyBoDNhQdZJKrK/fMw8uizEVVlHqvT1474ZbZbBOA/u0TsCp2SBgWidGOb2gVE=
X-Received: by 2002:a05:6808:3447:b0:43b:2976:6080 with SMTP id
 5614622812f47-43b29b4b108mr4340525b6e.23.1757350096055; Mon, 08 Sep 2025
 09:48:16 -0700 (PDT)
MIME-Version: 1.0
References: <20250901150359.867252-1-david@redhat.com>
 <20250901150359.867252-6-david@redhat.com>
In-Reply-To: <20250901150359.867252-6-david@redhat.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 8 Sep 2025 18:48:04 +0200
X-Gmail-Original-Message-ID: <CAHmME9okig=9NVGS_vSt525C-kR0mAyCnzSn9iypvu8uj0zA_Q@mail.gmail.com>
X-Gm-Features: AS18NWDEbovQfzN2Y035qma21yXmLeYwXyIh1FHAB52eeHDgW6bSgyj_MCTfArc
Message-ID: <CAHmME9okig=9NVGS_vSt525C-kR0mAyCnzSn9iypvu8uj0zA_Q@mail.gmail.com>
Subject: Re: [PATCH v2 05/37] wireguard: selftests: remove
 CONFIG_SPARSEMEM_VMEMMAP=y from qemu kernel config
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, 
 "Mike Rapoport (Microsoft)" <rppt@kernel.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Shuah Khan <shuah@kernel.org>, 
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
 kvm@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>, 
 linux-arm-kernel@axis.com, linux-arm-kernel@lists.infradead.org, 
 linux-crypto@vger.kernel.org, linux-ide@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, linux-mips@vger.kernel.org, 
 linux-mmc@vger.kernel.org, linux-mm@kvack.org, 
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
 linux-scsi@vger.kernel.org, Marco Elver <elver@google.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, Michal Hocko <mhocko@suse.com>, 
 Muchun Song <muchun.song@linux.dev>, netdev@vger.kernel.org, 
 Oscar Salvador <osalvador@suse.de>, Peter Xu <peterx@redhat.com>, 
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

Applied this one, actually. Thank you.
