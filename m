Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5556DCCD18C
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  9 Oct 2025 01:07:27 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d74b33f3;
	Thu, 9 Oct 2025 01:07:25 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 69696e54
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 9 Oct 2025 01:07:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 34AA9451CB;
 Thu,  9 Oct 2025 01:07:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EFE9C4CEE7;
 Thu,  9 Oct 2025 01:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759972041;
 bh=gOZMzGofq4mPMi4a6FfMrSXrrYqWnEJSEe2U4H+HIxI=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=rIX5UnrQuVtPUja4Kq/zNxiwyTbf5s+hCzHT8aH9/VUdnNlKWh8D4mSKFL/eXwlaD
 7z8+SEmVkcAfo9fmiSSyJ11EAUKKRJcwMVTb9iuWDWBwheam1F4EfrpnDWIzUjmitV
 mpUbtUtSbqOH/UnhpYe9i14SkLmyq3I1gfKlnnkK+sqgEdkc4pLZ6mWhV/a0ryPI+M
 cnqFIsiLX5CDpbNJvCwTuxPNZCjZR+B1mOV2TKr1ssRJwK/PuLD12JWWzuO1dLp+oX
 6de792lhNHw6SaLSFK1kZpeE0QJJFPFLV/HILKfJuySwcXVffLr7XVkoyczsYsHHIo
 /dSAJt7cVsj/Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 ADDA93A41017; Thu,  9 Oct 2025 01:07:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: update kernel-doc for MEMBLOCK_RSRV_NOINIT (was: Re: [PATCH RFC
 10/35] mm/hugetlb: cleanup hugetlb_folio_init_tail_vmemmap())
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <175997202925.3661959.5694356441030280085.git-patchwork-notify@kernel.org>
Date: Thu, 09 Oct 2025 01:07:09 +0000
References: <aKyWIriZ1bmnIrBW@kernel.org>
In-Reply-To: <aKyWIriZ1bmnIrBW@kernel.org>
To: Mike Rapoport <rppt@kernel.org>
Cc: linux-riscv@lists.infradead.org, david@redhat.com, mpenttil@redhat.com,
 linux-kernel@vger.kernel.org, glider@google.com, akpm@linux-foundation.org,
 jackmanb@google.com, cl@gentwo.org, dennis@kernel.org, dvyukov@google.com,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 iommu@lists.linux.dev, io-uring@vger.kernel.org, jgg@nvidia.com,
 axboe@kernel.dk, hannes@cmpxchg.org, jhubbard@nvidia.com,
 kasan-dev@googlegroups.com, kvm@vger.kernel.org, Liam.Howlett@oracle.com,
 torvalds@linux-foundation.org, linux-arm-kernel@axis.com,
 linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org,
 linux-ide@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-mmc@vger.kernel.org, linux-mm@kvack.org,
 linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org,
 lorenzo.stoakes@oracle.com, elver@google.com, m.szyprowski@samsung.com,
 mhocko@suse.com, muchun.song@linux.dev, netdev@vger.kernel.org,
 osalvador@suse.de, peterx@redhat.com, robin.murphy@arm.com,
 surenb@google.com, tj@kernel.org, virtualization@lists.linux.dev,
 vbabka@suse.cz, wireguard@lists.zx2c4.com, x86@kernel.org, ziy@nvidia.com
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

Hello:

This patch was applied to riscv/linux.git (for-next)
by Mike Rapoport (Microsoft) <rppt@kernel.org>:

On Mon, 25 Aug 2025 19:58:10 +0300 you wrote:
> On Mon, Aug 25, 2025 at 06:23:48PM +0200, David Hildenbrand wrote:
> >
> > I don't quite understand the interaction with PG_Reserved and why anybody
> > using this function should care.
> >
> > So maybe you can rephrase in a way that is easier to digest, and rather
> > focuses on what callers of this function are supposed to do vs. have the
> > liberty of not doing?
> 
> [...]

Here is the summary with links:
  - update kernel-doc for MEMBLOCK_RSRV_NOINIT (was: Re: [PATCH RFC 10/35] mm/hugetlb: cleanup hugetlb_folio_init_tail_vmemmap())
    https://git.kernel.org/riscv/c/b3dcc9d1d806

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


