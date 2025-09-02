Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E14ACEE353
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 18 Nov 2025 19:42:59 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 10ad0208;
	Tue, 18 Nov 2025 17:25:06 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id b1a62331
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 2 Sep 2025 09:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1756806159;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=asWSuLH6iU8nN8yxFqi4dFvgrrSedS75Z/J4pSraBcc=;
 b=amhEq1GEBMAOUyRo7ZqCOuEyXTB6No1qJLMom890IeSwgxmxB1iuPJylvS3qCP2/TfsivG
 UesLyX4PjU+1NoAM49T/hdbHM/XD+bMDh9Yq7iUbFD4iDwSl8HFaZDDmphke76H2fUPZ5r
 6MKdvwq/IH1pHYz8iygwPumsc8+4dxE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-455-uevg9q_mPcSSGzp3DqLt2Q-1; Tue, 02 Sep 2025 05:42:36 -0400
X-MC-Unique: uevg9q_mPcSSGzp3DqLt2Q-1
X-Mimecast-MFC-AGG-ID: uevg9q_mPcSSGzp3DqLt2Q_1756806155
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-45b9635bcc7so3249635e9.2
 for <wireguard@lists.zx2c4.com>; Tue, 02 Sep 2025 02:42:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756806155; x=1757410955;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=asWSuLH6iU8nN8yxFqi4dFvgrrSedS75Z/J4pSraBcc=;
 b=qm+8jjNW87KbzqDlR/VotcqxyRBDYNX5tkkF7WCPZurLLwoYVPHIgPJfFYkSay54EM
 iTVBm3/JUwt5lnv/dRf9Qdgnc4UqVWPmaL75cKRvC9xL+o1nL84giQ9lIzo73acktW0W
 Rk0LcpIb57girB2oGLYfzehMK3W86W5+4JKcQO52Xfat1KDwyal/wE7forYL7+RTI0Qe
 Jp1IQIsViNCov9ZaS1JwHGMquwkmwfIfBrowBOQc8JsE18MTqJOeeJkopK932wU+Wa7z
 NTgl763TsuZWjttpdUe55BNYk7Ukw3xEz2EcRvJ0VTAb2oXlAOhFi22o5fkFVuSw4yMK
 3yZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVzpfMwZbaqtLYjaRurGOZKOUTFcxv6oI8WZGwWYcsXoaKxd/mrDYXsU4PAB5AmE/XTvUMj6NeQitA=@lists.zx2c4.com
X-Gm-Message-State: AOJu0YxB/qDsOgl1LWfEjB8q5yyJBdrfrTAAal1enTqKoZBVSvY+rXeB
 +rqciI182tXszBOIIE31CWdurNk3ibhmqoGY6pQ54JM7JkV/qhjn6HdrOW3Kv5UHjEw0Mq2m/ws
 qBwOhGcxm3Terid27cfEOfvtdIV0yTEEt51pOP7jGK6rz6X/HHa5DHjsB5ZTJ9g==
X-Gm-Gg: ASbGncuKc7Uf92rx7bZXY+5xj+1ZrBXUUeuLa/7hTU/mPA6K+CtKi/15Qi33vXFj7U+
 UnFwRVOwZhvqehwwxUmHQS83m9pXd3gdFWW+FgtLJt4jeal2k+JcKlPTN0DB48CYlQNwhuOpXMf
 lG/uDRm/didwAq7zE8YagHGF2OMJOV+5kdUDzoFnejlQpM784nV7F355XEclS9fIm3ZVTwgGBLb
 leaRsOFToZvKnCasOXuEbDVOrQUDKyBkEbsYfF9xCZoYOjFYrmKEaEsjQTwvbYu3xQbiiUTOWYh
 QgpyVTpAwiRPPzOL/LVggMs9LzoMay0Ut/Z37HsuvkiehomB+FcN1ObDixa42xvmImd4Babnp/G
 jvgCh0IIJe2/OxeOADFCe/2imwVsc0rcOku9IFTVgtM8Rs6NJ0YO21LvWmRtHvBiS5Vc=
X-Received: by 2002:a05:600c:1ca4:b0:43c:ec4c:25b4 with SMTP id
 5b1f17b1804b1-45b8554e2ffmr100852665e9.10.1756806154844; 
 Tue, 02 Sep 2025 02:42:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEDiNU8UZPL8aTl3qS6g7/9CMF4yIxtcwFaCcDzAuhGVy5bNnLkv/vvSAEHWB2EXNvzk4IR6w==
X-Received: by 2002:a05:600c:1ca4:b0:43c:ec4c:25b4 with SMTP id
 5b1f17b1804b1-45b8554e2ffmr100852105e9.10.1756806154215; 
 Tue, 02 Sep 2025 02:42:34 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f1f:3f00:731a:f5e5:774e:d40c?
 (p200300d82f1f3f00731af5e5774ed40c.dip0.t-ipconnect.de.
 [2003:d8:2f1f:3f00:731a:f5e5:774e:d40c])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b8acbe982sm57017205e9.6.2025.09.02.02.42.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Sep 2025 02:42:33 -0700 (PDT)
Message-ID: <22019944-2ef2-4463-9b3f-23c9e7c70b2f@redhat.com>
Date: Tue, 2 Sep 2025 11:42:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 26/37] drm/i915/gem: drop nth_page() usage within SG
 entry
To: Tvrtko Ursulin <tursulin@ursulin.net>, linux-kernel@vger.kernel.org
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
 <4bbf5590-7591-4dfc-a23e-0bda6cb31a80@ursulin.net>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <4bbf5590-7591-4dfc-a23e-0bda6cb31a80@ursulin.net>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: -mZ3B_2XX1Vm-I_nU-Xd7DFbZRPFfqNSpQpMy_5EUdo_1756806155
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Tue, 18 Nov 2025 17:23:14 +0000
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

On 02.09.25 11:22, Tvrtko Ursulin wrote:
> 
> On 01/09/2025 16:03, David Hildenbrand wrote:
>> It's no longer required to use nth_page() when iterating pages within a
>> single SG entry, so let's drop the nth_page() usage.
>>
>> Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
>> Cc: Jani Nikula <jani.nikula@linux.intel.com>
>> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Cc: Tvrtko Ursulin <tursulin@ursulin.net>
>> Cc: David Airlie <airlied@gmail.com>
>> Cc: Simona Vetter <simona@ffwll.ch>
>> Signed-off-by: David Hildenbrand <david@redhat.com>
>> ---
>>    drivers/gpu/drm/i915/gem/i915_gem_pages.c | 2 +-
>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_pages.c b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
>> index c16a57160b262..031d7acc16142 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_pages.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
>> @@ -779,7 +779,7 @@ __i915_gem_object_get_page(struct drm_i915_gem_object *obj, pgoff_t n)
>>    	GEM_BUG_ON(!i915_gem_object_has_struct_page(obj));
>>    
>>    	sg = i915_gem_object_get_sg(obj, n, &offset);
>> -	return nth_page(sg_page(sg), offset);
>> +	return sg_page(sg) + offset;
>>    }
>>    
>>    /* Like i915_gem_object_get_page(), but mark the returned page dirty */
> 
> LGTM. If you want an ack to merge via a tree other than i915 you have
> it. I suspect it might be easier to coordinate like that.

Yeah, it would be best to route all of that through the MM tree. Thanks!

-- 
Cheers

David / dhildenb

