Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79B57CA0FE2
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 21 Aug 2025 23:17:03 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5e73c376;
	Thu, 21 Aug 2025 20:32:47 +0000 (UTC)
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com
 [2607:f8b0:4864:20::82b])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 636a79ef
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 21 Aug 2025 20:32:44 +0000 (UTC)
Received: by mail-qt1-x82b.google.com with SMTP id
 d75a77b69052e-4b109c6532fso17237581cf.3
 for <wireguard@lists.zx2c4.com>; Thu, 21 Aug 2025 13:32:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1755808363; x=1756413163;
 darn=lists.zx2c4.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=6aeG3+zXNcZH2d1Z1/su6zkQOg7Uc4j3Xw+oqie+iPw=;
 b=HcJaVzJ2FguKWP6XI9tnXCVXO78dbXqpUK56IYY3wchjL6tS7qG1AOeatWOYhQXOBC
 LYtQU5JbEcNjTNIXY2+0aPhAVNnuX5IqCROr0dCT8AfR8nfEdtCrxU0YTrjGC/Zx6rtY
 zzrTGPned8VpJslzoJrxDcVroiBapUhjsCjfg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755808363; x=1756413163;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6aeG3+zXNcZH2d1Z1/su6zkQOg7Uc4j3Xw+oqie+iPw=;
 b=j96GXmvHg5Y2bcV84UdhE+ImOP4Clq21kHTZr+iSP9djqJBSpoXUiq7KjHxqRiIhjo
 A0VdNB3Csl7SKuOyygluEG/dzzm7aRkhBEvp7aKGJvOsoKI3r1/DBFZ5gQsCCMtGUyxq
 ohlQ3/vMBYYSYJ5WsQ1qlpR8GH99xg+2r5VQxFjMfHFjIxE3XJolrVaYXSBUIr33ltub
 /nCJ3O5rdNDTbr4sS8KOZE44vYuff8oQW+RyBBhP+KtqwBV9U8zce6MgHYKi/8w+Wbhp
 e6VnMhrrAWsi2D4v7kwcxSPHLqnxiaunULfFm4zLug9u5FbsspZ8mf9bfr07GFL2ej9t
 wrKg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX9ceXyJiEqfnDkQBs+jKG5vjJWoHCdns4l4xvufMrmi1Dpy7KYMmzfOxQlYp3ZL8UR3at7nOKtx38=@lists.zx2c4.com
X-Gm-Message-State: AOJu0YzvzPLOLF4Ac1esh4RISbJpb4xd8M08Ck8M3Td7/S17+AhW1lIY
 h3WlzRAus8fnCOZzKrFWDA2JQbdCDja/LlelVkTkSfsk9aAxYHC1rmg2R9aFVlMnriRgWQT+MQH
 QPLDq4RI=
X-Gm-Gg: ASbGncuve5AC40Hq2Cjzsw/v73WxGvS7W8Uf3KE9c+kM0CEaTAp36/NaACwpaD9cmXJ
 hfZpt6edZDjyrrpn0fmxiGO63SO5iU2H97wJnCiyzj140GsxnFE1RFQojpjJGd9pSSkX2pQfSxu
 JV6KRdQJXOIUehAy2qA/hEHH1XB5tQTEh69qc5eBukF6I5ZEraIGhXRPvfWUvPoHh+cnbgBMZaR
 Lwd2NeDpoeIM+GbvcPJfQG9IZfUjfBDhytaWb82sNAHnGOKUZwmsGi6AKKJJrnkUbJfs7+SDbFx
 g0jG7R6TDfJJwAEqLb6zLe4AbhSmRwQirvSsoutoRjDNNgtP7qfjL94EtLazD4ctcHp8SSQ/fv5
 NRK4ldzKtklz3kN3x8bJ+QRs1aCLmXovS2Rh8bbxfN2EZjDf0ttUrG7ojA856Rk+oeAGY/R+Ywn
 Rk
X-Google-Smtp-Source: AGHT+IETZxRF+dryemeqBB2Y17MscnDTP0FJALOPRiSRiPJ67qV+Z0BbakQcyTe+ox+cNYeiTA4fdw==
X-Received: by 2002:ac8:5815:0:b0:4b0:be40:d7 with SMTP id
 d75a77b69052e-4b2aaa58196mr9213091cf.11.1755808363156; 
 Thu, 21 Aug 2025 13:32:43 -0700 (PDT)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com.
 [209.85.222.170]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4b11dc851d9sm106979211cf.24.2025.08.21.13.32.42
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Aug 2025 13:32:42 -0700 (PDT)
Received: by mail-qk1-f170.google.com with SMTP id
 af79cd13be357-7e870316b79so165672985a.0
 for <wireguard@lists.zx2c4.com>; Thu, 21 Aug 2025 13:32:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWTAKyeHyJslXl9byX8hCrxXMJ14teJ6o4WmJUp7uFOqwFkvcOxGuipTfVejAHAjBzgcWZmteWRBHc=@lists.zx2c4.com
X-Received: by 2002:a05:6122:1ad2:b0:53c:896e:2870 with SMTP id
 71dfb90a1353d-53c8a40b923mr212315e0c.12.1755807884664; Thu, 21 Aug 2025
 13:24:44 -0700 (PDT)
MIME-Version: 1.0
References: <20250821200701.1329277-1-david@redhat.com>
 <20250821200701.1329277-32-david@redhat.com>
In-Reply-To: <20250821200701.1329277-32-david@redhat.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 21 Aug 2025 16:24:23 -0400
X-Gmail-Original-Message-ID: <CAHk-=wjGzyGPgqKDNXM6_2Puf7OJ+DQAXMg5NgtSASN8De1roQ@mail.gmail.com>
X-Gm-Features: Ac12FXxaZhwn04a0gbwY6rjh9UGLxnRlGOG0Jy0WjRbVAG0UxLDqNy0Wydj0GQk
Message-ID: <CAHk-=wjGzyGPgqKDNXM6_2Puf7OJ+DQAXMg5NgtSASN8De1roQ@mail.gmail.com>
Subject: Re: [PATCH RFC 31/35] crypto: remove nth_page() usage within SG entry
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>, 
 "David S. Miller" <davem@davemloft.net>,
 Alexander Potapenko <glider@google.com>, 
 Andrew Morton <akpm@linux-foundation.org>,
 Brendan Jackman <jackmanb@google.com>, 
 Christoph Lameter <cl@gentwo.org>, Dennis Zhou <dennis@kernel.org>,
 Dmitry Vyukov <dvyukov@google.com>, 
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 iommu@lists.linux.dev, io-uring@vger.kernel.org, 
 Jason Gunthorpe <jgg@nvidia.com>, Jens Axboe <axboe@kernel.dk>,
 Johannes Weiner <hannes@cmpxchg.org>, 
 John Hubbard <jhubbard@nvidia.com>, kasan-dev@googlegroups.com,
 kvm@vger.kernel.org, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, linux-arm-kernel@axis.com, 
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

On Thu, 21 Aug 2025 at 16:08, David Hildenbrand <david@redhat.com> wrote:
>
> -       page = nth_page(page, offset >> PAGE_SHIFT);
> +       page += offset / PAGE_SIZE;

Please keep the " >> PAGE_SHIFT" form.

Is "offset" unsigned? Yes it is, But I had to look at the source code
to make sure, because it wasn't locally obvious from the patch. And
I'd rather we keep a pattern that is "safe", in that it doesn't
generate strange code if the value might be a 's64' (eg loff_t) on
32-bit architectures.

Because doing a 64-bit shift on x86-32 is like three cycles. Doing a
64-bit signed division by a simple constant is something like ten
strange instructions even if the end result is only 32-bit.

And again - not the case *here*, but just a general "let's keep to one
pattern", and the shift pattern is simply the better choice.

             Linus
