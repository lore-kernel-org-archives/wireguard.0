Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08B69CF34AD
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 19 Nov 2025 12:56:21 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0171c33d;
	Tue, 18 Nov 2025 17:31:55 +0000 (UTC)
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 388ceb13
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 2 Sep 2025 09:22:11 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-45b873a2092so23014405e9.1
 for <wireguard@lists.zx2c4.com>; Tue, 02 Sep 2025 02:22:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1756804931; x=1757409731;
 darn=lists.zx2c4.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0Be300C9M54HN2j6qqn3KzILYOn0Dm/rUn/s4aJntRQ=;
 b=hymifbiyMTuokLUShuYorSG7BuavenMWqqM1tjzXEzDDDZKpPSJPX4Yj6e+4PvTCWr
 Tict73AHJcaLc/UWGWE1p5qc4Dnv4CXZBzpZeMWfmiAMWlLn09LYEjXBvcyJzPh2Ru0M
 n38Ia9I/XrE1yk0Ya3Ud4jlOYO4rBHUB9kfVPgmuOB//ODV7GVhPVNzF5E3qO8ByiXGn
 uRgIwsx/vGH7q2wpK/z6jbVPd3tO1y3HmKez7J+ldvLfsf7j1Uifu8mCp4ZyE9CI7qkx
 nJ92LkduQRRPZnM/u/zkWd03aYKU98QyGxTbELJoo7VWYn4T/++i1++sJQB6XCDcHg2Q
 k0OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756804931; x=1757409731;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0Be300C9M54HN2j6qqn3KzILYOn0Dm/rUn/s4aJntRQ=;
 b=O54of0BJhJG+FXf0kjWwBmIxcWt40GxRnZpfy+UBFyOM2L6zwzYQmaVZ1KJRTsed4i
 Pwef4iwBmSoyWUSZVJVMFZRvoWOGz96+8bQOXGw6kJbO3S3TXu65Gxu1UMk+Vyg5TYQ9
 +JhsB3FdX9kTw8K+QCVsPjKTyGtMf66QQiMd8qldg0PWh3JXBL/oeUnwXlQnQLDrko2T
 0lOcE+9VYxJfT4TnNAzl97lnV21meYIMVofBpAEij+dHfVK3s/yC7pbISREw9NLKAs2R
 fVcwWsg1nr2hhwCEYbA83JJ2c5KJsXYJdBwulpUrsM1yBwETj6fXTTNB8HpwvP2kYcHh
 WwLg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV28KW9QaBtsL+LljoZa7sS7B2brq7TQwYxeqKwESx9nFy13T3P5QLf4dxGidGO5YZH+hBnkMHQX3o=@lists.zx2c4.com
X-Gm-Message-State: AOJu0YyCzNxRC0qZu9jsZR0YUTx+0qOMNPqAfGWnVLXPunjnXoq2kN1u
 gHWrnEk4GQWuo/OBniGtORPO4VfgrXQSrKxG/RpBVCoOa+Kp4fQR5p5Tc7z4xnCEsec=
X-Gm-Gg: ASbGncu92pXTyLwd250eulZTXW9wpRnEkAQA57m0E2GMBrVfP+5CNm0/JXqbDiSF7w+
 EHi5kDlpD8XmjJ+HyKvloqVNSuZ6SKY7C804YXLBjlP7GY7hCn10UleTJmwr0+6paoG1Hnpc8Tu
 SIk46JcOw2CaskzvSGG9okPZj1exS5Mlk/qXphhCL37W4fmzE3pObw8pms0DfSHs9iDy4zWlAfZ
 lGBaUtYmvrJ8Du8ziU9bWHouPhG4cqEt3X466dL7qnH83D3HH8BbW+0kHo5odjePKEdLze7jnMo
 IuicVPxQubjwOBpIWlCZCArHOn2qN6BSzDFLPJYTN6cy6Tu+0OEcuf0w8OtP/c41aSRLh4cxHy7
 4Ey4OSwvDSrAUu0+G+oqztyzkRA9pS9MIg2Q=
X-Google-Smtp-Source: AGHT+IFjGWdM7r4OC2xPYq10JBW42QzIVS9ISDbv655toZnOdc57tKWSkMByc2ni755H7QY3mBnVYA==
X-Received: by 2002:a05:600c:a04:b0:45b:7d24:beac with SMTP id
 5b1f17b1804b1-45b8553335amr94619035e9.10.1756804930815; 
 Tue, 02 Sep 2025 02:22:10 -0700 (PDT)
Received: from [192.168.0.101] ([84.66.36.92])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3d0b9402299sm17994846f8f.18.2025.09.02.02.22.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Sep 2025 02:22:10 -0700 (PDT)
Message-ID: <4bbf5590-7591-4dfc-a23e-0bda6cb31a80@ursulin.net>
Date: Tue, 2 Sep 2025 10:22:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 26/37] drm/i915/gem: drop nth_page() usage within SG
 entry
To: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Alexander Potapenko <glider@google.com>,
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
References: <20250901150359.867252-1-david@redhat.com>
 <20250901150359.867252-27-david@redhat.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20250901150359.867252-27-david@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>


On 01/09/2025 16:03, David Hildenbrand wrote:
> It's no longer required to use nth_page() when iterating pages within a
> single SG entry, so let's drop the nth_page() usage.
> 
> Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Tvrtko Ursulin <tursulin@ursulin.net>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Simona Vetter <simona@ffwll.ch>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>   drivers/gpu/drm/i915/gem/i915_gem_pages.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_pages.c b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
> index c16a57160b262..031d7acc16142 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_pages.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
> @@ -779,7 +779,7 @@ __i915_gem_object_get_page(struct drm_i915_gem_object *obj, pgoff_t n)
>   	GEM_BUG_ON(!i915_gem_object_has_struct_page(obj));
>   
>   	sg = i915_gem_object_get_sg(obj, n, &offset);
> -	return nth_page(sg_page(sg), offset);
> +	return sg_page(sg) + offset;
>   }
>   
>   /* Like i915_gem_object_get_page(), but mark the returned page dirty */

LGTM. If you want an ack to merge via a tree other than i915 you have 
it. I suspect it might be easier to coordinate like that.

Regards,

Tvrtko

