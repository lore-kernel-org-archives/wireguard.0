Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4410DCA0EEB
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 22 Aug 2025 15:21:45 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c6b78645;
	Fri, 22 Aug 2025 15:14:02 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 5b1d169b
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 22 Aug 2025 15:13:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id DBD4344F53;
 Fri, 22 Aug 2025 15:13:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4A19C4CEED;
 Fri, 22 Aug 2025 15:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755875637;
 bh=p0iPLyXnfNJdu+YoCuoUVSR7eRuOWUAmkwSHtZmbswo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Oq+YiBtzNwt4g95Bu7PV0Fl9ib86q+ONSg37ZzPXpeT67l668lZdZKcDZ17zCgq/+
 NUr9Cggu/NQsNbAf8J5LWQZhrBwU1g/MF3aj/PVZNB0J8PVxbWJVmp+W/+1x83AUZi
 Ksafl3fKhK5d4QzvSbcncq8HLEoFlkjFsSlSh1hzeqF0bChtCL26UZCq78qNfMb29E
 EBeBkg4phSCnNI6fLlpTsGgIlXQA3OAyRkh7ArJn5n6ii54fXevJBkxPUnY9AstAPY
 LmiLofHFtmfQUlmw4ITl2sEhNM7ay49imRJJkphBZ9EWVC8vpCEY5+m+WLFICOjhFU
 VsNUYbhaEIPrw==
Date: Fri, 22 Aug 2025 18:13:39 +0300
From: Mike Rapoport <rppt@kernel.org>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Shuah Khan <shuah@kernel.org>, Alexander Potapenko <glider@google.com>,
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
Subject: Re: [PATCH RFC 05/35] wireguard: selftests: remove
 CONFIG_SPARSEMEM_VMEMMAP=y from qemu kernel config
Message-ID: <aKiJI0jiFEjtLE3l@kernel.org>
References: <20250821200701.1329277-1-david@redhat.com>
 <20250821200701.1329277-6-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250821200701.1329277-6-david@redhat.com>
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

On Thu, Aug 21, 2025 at 10:06:31PM +0200, David Hildenbrand wrote:
> It's no longer user-selectable (and the default was already "y"), so
> let's just drop it.

and it should not matter for wireguard selftest anyway
> 
> Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>
> Cc: Shuah Khan <shuah@kernel.org>
> Signed-off-by: David Hildenbrand <david@redhat.com>

Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

> ---
>  tools/testing/selftests/wireguard/qemu/kernel.config | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/wireguard/qemu/kernel.config b/tools/testing/selftests/wireguard/qemu/kernel.config
> index 0a5381717e9f4..1149289f4b30f 100644
> --- a/tools/testing/selftests/wireguard/qemu/kernel.config
> +++ b/tools/testing/selftests/wireguard/qemu/kernel.config
> @@ -48,7 +48,6 @@ CONFIG_JUMP_LABEL=y
>  CONFIG_FUTEX=y
>  CONFIG_SHMEM=y
>  CONFIG_SLUB=y
> -CONFIG_SPARSEMEM_VMEMMAP=y
>  CONFIG_SMP=y
>  CONFIG_SCHED_SMT=y
>  CONFIG_SCHED_MC=y
> -- 
> 2.50.1
> 

-- 
Sincerely yours,
Mike.
