Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73258606A31D
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 23 Oct 2026 21:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=PEjBCPWF
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id b5cfc68d;
	Fri, 23 Oct 2026 21:16:30 +0000 (UTC)
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id a284e834
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 23 Oct 2026 21:16:28 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-c169ae1cb26so385008566b.1
 for <wireguard@lists.zx2c4.com>; Fri, 23 Oct 2026 14:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792790188; x=1793394988; darn=lists.zx2c4.com;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=2hVrmr+tVN2+9s8NA71E64tKNtJD7F9d8423pbx0gSs=;
 b=PEjBCPWFql4kc4OwMvQWjSR0YmlpNGeZedP8/qyBtU8IOFE12lpAeaib7PNpRWg80G
 7slhilTMpl/1HMNhzYwfkbb7Cims9tgszy3BuPPLBZNJ1BdV4llFNzhEQrFpcF+v9bRg
 4qaEIiWDRmOjtWhxMHsHeXZEeIF1yLJMALm+AyUj0rda0Se0Kk9z8VBr5p8TXbx1G3kr
 Woa4CtnYm5Ob43iXo2/gJRmWl4ZTywmILNLyk6ucM1cD3ftkc2tqPLisD3zjPJC6q35P
 U+bGfH+bTpYOetGvVXf18EXrz0fCZMnDFmTYbaIWAXh2B2kRuCD5XZSgmKxJv89nsKhZ
 lezQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792790188; x=1793394988;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=2hVrmr+tVN2+9s8NA71E64tKNtJD7F9d8423pbx0gSs=;
 b=fimBdmwSnqVex/wz77npaCdceHadI/3KSj1/2P/nIMu1gijTjkpj1vPaD2YJNXEgh0
 0uktQQhBBew2T4MqOi2qfyasdYPHFlaMLIxivix9mMrsl4EUmoZVRYIEdQ084MA/5AgD
 dt48Z0452ocZdz7L7xKtwlwuafGqgR43QcCLkVLVQDo0BW5KkOkFffzzwfNNWjM+LPpX
 lpdXKVjtWBwe3mMkex03P0FyRL/p2moLTaASTZnN2v+pkzKTk8eyCNZ4wzVA3xzg8vbs
 YOP3mDLgLhwvqlxuxZCWGWeQa2R2yZBPw8HVIdU7Q4+IrKG6v8BQi8rp3MMLNQiyz2Ei
 GcMA==
X-Forwarded-Encrypted: i=1;
 AKwUvBzvele6W6FogYz0zL9LbNTigkeY7lxkNhlq8v5XpBNIzTCHdu9dOQVT912EVk8vCAlZ3Ney6L8i85Q=@lists.zx2c4.com
X-Gm-Message-State: AFq9FYJS8PdANDNAEdw5iKAYNvYEDOUwGR5+VH9xcppNRm53OVi+v9P8
 SZWdcNRUUeDQ0W9EZMLac/kBPrA6sRirRyRH9mpBER3uw4DnerT43jNZ
X-Gm-Gg: AYBFou2dWjWNrR/3K54BapcFOMaGXRDoezE4CwW1brq+X1BVZARbOdQw6gRkdEPbcg/
 iYpRei0aatVd0vKJKICU+I1YFqHa/DI/4wvB5xO6r8aNY4iT5pA55TdCLdYzsXKRr5JoYC4UZuG
 3LkbAINOTpRizuU0JfC2Hvwtn91cX67t1t9cad8l/PTaoNP8+bBi50y8xiGDa/9uoD3LCFQVe5T
 oOlaQlQ6t8LZVDIj35iEanxnTlGOQI2IARmUgHxYANdLre7r7FbzVgAAI/tQSOop6HJQ9Ufi3ic
 /gpjhSzj/88nj5o/LvWnjz9za/ODGnV6EjtDyJuR/DQOlOg4CDm14sSZL5dN71fqB6uUCcSKasF
 FkpQJry9akJ2JVjm1btqdVsNPYPEAbR7xYe49QcjpXDGoT1jJN0GsijBcMQ5zKj+vZxc0r/IoWV
 phGKbmj8KmEjXera0z7OaLcpuK0VJLOHXfBOyR/+dq4zfL0SyLA8jYApDPoerjdZ/YFp28QhkZU
 He2k5sN5c3vkRnylo1H0hZWLof767IQc6M/K/zzHdS3IptMkQnjX1w1WkEd
X-Received: by 2002:a17:907:6088:b0:c41:4512:a3b4 with SMTP id
 a640c23a62f3a-c46bdc5a48fmr13765666b.20.1792790188063; 
 Fri, 23 Oct 2026 14:16:28 -0700 (PDT)
Received: from Mac ([188.163.8.107]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c46bd529b3csm7920066b.37.2026.10.23.14.16.27
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 23 Oct 2026 14:16:27 -0700 (PDT)
From: pasichdev <apasichnik9@gmail.com>
To: "Jason A . Donenfeld" <Jason@zx2c4.com>, netdev@vger.kernel.org,
 wireguard@lists.zx2c4.com
Cc: Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net] wireguard: peer: free packets left on the per-peer
 queues on removal
Date: Sat, 24 Oct 2026 00:16:26 +0300
Message-ID: <20261023211626.99784-1-apasichnik9@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261003201625.4572-1-apasichnik9@gmail.com>
References: <20261003201625.4572-1-apasichnik9@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Andrii Pasichnyk <apasichnik9@gmail.com>

Hi Jason,

Gentle ping on this one. Patchwork shows it as awaiting upstream, so I
assume it should go through your tree. It still applies to net and
net-next unchanged; if you would rather have it taken through net
directly, or want anything changed, please let me know.

Thanks,
Andrii
