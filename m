Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EAE9CCA476
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  7 Oct 2025 12:55:20 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b1b2694a;
	Tue, 7 Oct 2025 12:55:18 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 3515550e
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 7 Oct 2025 12:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1759841713;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JObPDM43kbrRGTVx2qicxdWSHWXv4jr/i/WMIAB1AqU=;
 b=f92m7TRvsmsOaLaj8aLn2SSZn+jI/HY0VZMIBszP3P0GA9ngyaTPlJaMnsZ+cpveKZKzmG
 xppQstZxK9NOXjoGl1icku4eLjr+2t6+A+kMfSST1lmIgbb0TqUwP8Pbe1LX5w6nu5gbmt
 E+3lLIC+pjvFLAYsJyYotJH6a6S/Rf0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-177-hUoU9Av9PlmttY46clzrVw-1; Tue, 07 Oct 2025 08:55:10 -0400
X-MC-Unique: hUoU9Av9PlmttY46clzrVw-1
X-Mimecast-MFC-AGG-ID: hUoU9Av9PlmttY46clzrVw_1759841709
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-46e4d34ff05so29897075e9.2
 for <wireguard@lists.zx2c4.com>; Tue, 07 Oct 2025 05:55:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759841709; x=1760446509;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JObPDM43kbrRGTVx2qicxdWSHWXv4jr/i/WMIAB1AqU=;
 b=b+sxMZkFNYe2wiShq2HYs7uKb4mJON3+5DVtggqZy+ijVQBegNlFhbv6j0LPAX3WF6
 BL1qWdPD+ZEIC/nyqiUmHLO+Qdpr0bREh+j4RCEje6Ic7LRHkaLpVNy0Go0dDfbInEPM
 kBb5tpqKH0kDm/Tg8b6808iTJU80xT3Rd5zqioHmk2iwgH5SqEfSGb4qIMhdOoh6Gzv0
 +qjPTdz3RU+TFT+z/NUFfv6N7cuiLp+H49FO/BW7FKsPC4vZXq+CN3F1Cwi2nvq82Z4W
 es1Mn3AfmjqSz2055aaS3UeE6fV1ytfzKcE0rGgOZOcj6RZ3JWqcNoEKPsbApgkPEktA
 E/Cw==
X-Gm-Message-State: AOJu0Ywl75DUWvMJdoXqNHPW7B/7L9KrMa2FqNvRAo/cffzPoB+4UGF7
 eoVKw8YunwKQgEGMF/3u1SgrEYSdy1KYoAq1xJ/vSCB+bHEEincgmpzkGraHKLIHzZJVCxHAJ2v
 zF6bgBHuSxTcliIfXKLHMBeCBna5tFDCGAQx1aZYIHg4iiB+tyYtSJlYgKEdHUw==
X-Gm-Gg: ASbGnct7YGFwIzCAt62nc4UUA8OXT+Da1Xq7xvrB1A1uHWHJV16dMbrFIrGIYvuHBvM
 uWRjXx6QfM2AUZvCd9X5Ws8N7GYIWVA4PPknqa1mVPXxxFxJ/6r1ji03LQcsHlVXctgBmfuwsPA
 vHTxGm4qy9jxspwkHUKp+PNMC6OjSF9iXF0xfQTDd3681m6tnPcF8heeDzjAVdPPg/5/hIPCyhi
 oi9+E2/ojyAmLcAAdHF0WAbDWNiZ2bKLOCGc6MKtGR/gym4Mf8rKSLus2ad6FZzVFzWqqHiz+ZB
 TS5wZsrlhCvqoyc7OUxSoIquXmf5g75NXVsXpfGHLLoeMY8aRpQRZun6x1wJNg+4HHU9bllaUbc
 FBRtLehbM7v/jADIqRA==
X-Received: by 2002:a05:600c:83cf:b0:46e:38f7:625f with SMTP id
 5b1f17b1804b1-46e7110e4edmr114208205e9.10.1759841709264; 
 Tue, 07 Oct 2025 05:55:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEf+yr0C4xLuJM/GLkBC+pknfkcsjQX8ZNgouB/KZMa7StJI4sxuc/r62BoMnwYLfDYtvHz+g==
X-Received: by 2002:a05:600c:83cf:b0:46e:38f7:625f with SMTP id
 5b1f17b1804b1-46e7110e4edmr114207955e9.10.1759841708852; 
 Tue, 07 Oct 2025 05:55:08 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:2712:7e10:4d59:d956:544f:d65c?
 ([2a0d:3344:2712:7e10:4d59:d956:544f:d65c])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4255d8e9703sm25776462f8f.30.2025.10.07.05.55.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Oct 2025 05:55:08 -0700 (PDT)
Message-ID: <af6253a8-5b21-4e32-84bf-62d11c7ce251@redhat.com>
Date: Tue, 7 Oct 2025 14:55:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] wireguard: allowedips: Use kfree_rcu() instead of
 call_rcu()
To: Fushuai Wang <wangfushuai@baidu.com>, Jason@zx2c4.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org
Cc: wireguard@lists.zx2c4.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251005133936.32667-1-wangfushuai@baidu.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20251005133936.32667-1-wangfushuai@baidu.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 6Nq2Zdsv1wLuzdv397wIFVtadLCjpq7xRQi6mI63awQ_1759841709
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 10/5/25 3:39 PM, Fushuai Wang wrote:
> Replace call_rcu() + kmem_cache_free() with kfree_rcu() to simplify
> the code and reduce function size.
> 
> Signed-off-by: Fushuai Wang <wangfushuai@baidu.com>
> ---
>  drivers/net/wireguard/allowedips.c | 9 ++-------
>  1 file changed, 2 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/net/wireguard/allowedips.c b/drivers/net/wireguard/allowedips.c
> index 09f7fcd7da78..5ece9acad64d 100644
> --- a/drivers/net/wireguard/allowedips.c
> +++ b/drivers/net/wireguard/allowedips.c
> @@ -48,11 +48,6 @@ static void push_rcu(struct allowedips_node **stack,
>  	}
>  }
>  
> -static void node_free_rcu(struct rcu_head *rcu)
> -{
> -	kmem_cache_free(node_cache, container_of(rcu, struct allowedips_node, rcu));
> -}
> -
>  static void root_free_rcu(struct rcu_head *rcu)
>  {
>  	struct allowedips_node *node, *stack[MAX_ALLOWEDIPS_DEPTH] = {
> @@ -271,13 +266,13 @@ static void remove_node(struct allowedips_node *node, struct mutex *lock)
>  	if (free_parent)
>  		child = rcu_dereference_protected(parent->bit[!(node->parent_bit_packed & 1)],
>  						  lockdep_is_held(lock));
> -	call_rcu(&node->rcu, node_free_rcu);
> +	kfree_rcu(node, rcu);
>  	if (!free_parent)
>  		return;
>  	if (child)
>  		child->parent_bit_packed = parent->parent_bit_packed;
>  	*(struct allowedips_node **)(parent->parent_bit_packed & ~3UL) = child;
> -	call_rcu(&parent->rcu, node_free_rcu);
> +	kfree_rcu(parent, rcu);
>  }
>  
>  static int remove(struct allowedips_node __rcu **trie, u8 bits, const u8 *key,

This is net-next material, and net-next is currently closed for the
merge window, but I guess Jason will take this patch in his tree.

Cheers,

Paolo

