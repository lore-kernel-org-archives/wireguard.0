Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81D86606A31C
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 10 Nov 2026 18:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20261015.g header.b=jD6gOgPR
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 531a0581;
	Tue, 10 Nov 2026 18:06:38 +0000 (UTC)
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 0bb4f38d
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 10 Nov 2026 18:06:36 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-6b7221c0f2cso1513419a12.3
 for <wireguard@lists.zx2c4.com>; Tue, 10 Nov 2026 10:06:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794333996; cv=none;
 d=google.com; s=arc-20260327;
 b=gTV8bOEMtOlytPNb0UV4Z/y7YlvVJGA9oMx9mMTQSMI8fWPlAGTtxW803b0eh+PZgl
 cYGoR6phChB5x44TafCblLznmc4QvbbA9ERJozhadP9SJJ65IDnqOXT/b1JnBLLmvVFK
 HTEeZ2Izmqw0aInSUm+54Pr72lLfzaK6JAqnkDcBaRZc1xb65eQwjDr/RKjJHzrEfh/r
 XfJruxMsq2SfninQd/cky6Dz9rPDvgLHlwiDpfNFro8JeH4jCA2VK/ocYu+vTn9Q1+WS
 kYEl2TJD6vE18r4dusSy48gBWSfi/yd9YCSGFDxE/+n2uVKFIReayUe4JpBiOhdPNOyg
 4c8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=GzOxYTq7EHxh8VUxt5+RHjpcCv/SzSEIP5xLxXIbEDA=;
 fh=KugVhX4pgYBEQg6sUwuTW6QlhDuPt40bIJAIGl5+8TM=;
 b=QkiRdSDQM1ZVNsNZGGGO5PU83lw1msMPha/CnGdx9MXe/EZ0xC3fW40CZctHHlrVEM
 HKaVIkIJuTA+oYBX8H3+p3FlmrN4gXnAkZogrweHtfwXNT9i5qk1Id8ykoL4onAVbZIt
 zORF8Nx4/fN9OZzOYsATOC09FHKdMYXM1Y1AF6xprZlrqC6tFXw5OljP43uMdOMQ7CwR
 K9OfGukXCXeiiilG0jwswc04mJ70GoxSdCHofGJd00RAabRqd+pzLZ37klTLFSndb9n8
 rV/u4IlK+aaFzTtS1JZ2vbXoWXqLaZ4KHjvv7PNOmHB7icw/Az/zJF+SZ+zVuqLA9kQC
 injg==; darn=lists.zx2c4.com
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=zx2c4.com; s=20261015.g; t=1794333996; x=1794938796; darn=lists.zx2c4.com;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=GzOxYTq7EHxh8VUxt5+RHjpcCv/SzSEIP5xLxXIbEDA=;
 b=jD6gOgPRSiaHGCp7ubRNqtRUQCHyzcSh5TpM9ncxNPdfDJwDz/7W1Ou3RzkLBdvztR
 MLWk69TnqqV4nUFjeH9ENSOCeUtOgI87ujVxjb0nXnlk5IBw2COViK1H5AM9tRR9Tcac
 Felzz7Q+KB0PipbQjWg25/DfAlPGHNbfU0qfWejue3flCSnM3ZEv/6Hd3ffdCqqNjFId
 MK/kaaCu+czdsnkizrqS3kfGpk3Oo01h0M/hSNUfGiGc7thaF1G5Lea5It08Hq8Xf9V3
 qJ9pV9kdLn7BOfs8K29N/kpI/FrgsbFPhciRM3PxRlKGBGOe/Qr39N/zPw0Rd0TZsfDL
 vBUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794333996; x=1794938796;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=GzOxYTq7EHxh8VUxt5+RHjpcCv/SzSEIP5xLxXIbEDA=;
 b=OhvWiAMlySGFMXHSGuzcKkLk0bVMQmNHXjj8jzE8IuFuGK38yOH4qq63NCc2Yj9RtD
 ++t9JEppnp8MxMH3lbaAoHNahMH8SV0GR02UPYEBZ3R7SLdh+IVhpKW6Rr+4rKAoIOYA
 QHD6+zG3+1MU9rp37KmOndvoZM4sK3acDPutLkDQTZphZbbbdCzfxI+7y8tAVqtnmZT4
 HOIVvMZSbQU7aIGUFB0lizLJZIsAtCg1mLwx+6SLV246lCP0/FCzTn4NtUGiPzNpLQSO
 40v/8UIIBZKIhiq23wIv0Z9By3xThNI4wwWBnldSMk0L+mljJbh3OjLLoLZXgY8Tj+FL
 fp1A==
X-Gm-Message-State: APuU4Z/nrHCI9C7bAGZMeNMU1xvS6BnitKR3Hwah7bgVIB4F5TzHJhlJ
 Jd/I8PizdXEIDV7Fo+FqhpaKq4KZjja0nBMx2CpCPK1AtS0lNLI8NvFcZ32XgpBylL4hrdCft/c
 zAonKVZyz2Swj1kMFeteNqJswqD0tErU57qrkafMqgXPXtg==
X-Gm-Gg: AYBFou1q4p/fKNCXgz10PmQyma4kC/CsavK6TDoNe7GTAHxxzNa1/e5fu/ca6jn6ojd
 wkT9Ohijw2lzJnC5IGJTqyrDEoXNDdR9r0r0SpO2BmNWgCbYJje3AhOdOQswPU6X1h5SoAdfjNj
 bzKqAqOTQW8ZDpurUBpb6evjVNxvXjlG7L7/DWQspRf2xBCGB0XpySFY2Hmvxk4PpFcxg970VT7
 ZJCyazt4ghJqPXJzyoGISqQuRqA4ZeP7D8PrxZ4N5c3tFi3gKGXFi6N0odFqgH6+UhiG+WQBIZs
 XogVkYTtrAogmdnoH92w9U+vs+xc7rBIy1R/fhU6JXuw1UzUewAQXEPs1q78XTz75lQEj7GR+Ts
 wKt4chF2bWqSXO1rEoOoKO90bQhA66wb2Vy2fn4ygcgZxiyeocVqUd+LnMcLdVuykQBmmj4pKUs
 t2wAKEPDql+y8cJ3TqLHp01E4JL40rLEapk3q9s2W5bz8PZVv6Aj8npwZX5tEXyC+4chB1nu/WB
 05S
X-Received: by 2002:a17:906:1248:b0:c50:4a70:b7f5 with SMTP id
 a640c23a62f3a-c504a70c977mr195279766b.17.1794333995965; Tue, 10 Nov 2026
 10:06:35 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261105141006.95083-1-alex@badcode.im>
 <20261105141006.95083-2-alex@badcode.im>
 <avNM9dfdW1uULJUf@zx2c4.com> <a979d36bb97608275f9f8884764afd41@badcode.im>
In-Reply-To: <a979d36bb97608275f9f8884764afd41@badcode.im>
From: "Jason A. Donenfeld" <jason@zx2c4.com>
Date: Tue, 10 Nov 2026 19:06:25 +0100
X-Gm-Features: AclHuK-z5kRyS093UsqlUbVg9AjVDqYIwR1bFV-l3asgu02YzQT6xz0LvKo0raw
Message-ID: <CAHmME9pMKKw-1dQRG5OEYrGA4K0GGFbpvN3Go8ZuVKLuaNMA1A@mail.gmail.com>
Subject: Re: [PATCH net 1/2] wireguard: account peer and allowedips
 allocations to memcg
To: alex@badcode.im
Cc: wireguard@lists.zx2c4.com, netdev@vger.kernel.org, 
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.30rc1
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Okay, I guess I was just looking for some judgement discussion, not
more output from the LLM. I'll look into this myself on the slow track
for a little bit.
