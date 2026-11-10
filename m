Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5872C606A327
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 10 Nov 2026 18:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BuEHtDzx
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id f84fd83a;
	Tue, 10 Nov 2026 18:49:25 +0000 (UTC)
Received: from mail-dl1-x122b.google.com (mail-dl1-x122b.google.com
 [2607:f8b0:4864:20::122b])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id b426c524
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 10 Nov 2026 18:49:22 +0000 (UTC)
Received: by mail-dl1-x122b.google.com with SMTP id
 a92af1059eb24-1b3a05f8b5bso3534402c88.1
 for <wireguard@lists.zx2c4.com>; Tue, 10 Nov 2026 10:49:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1794336561; x=1794941361; darn=lists.zx2c4.com;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=dtBB6VJ0vhsudtitif+Mm2Esb958z0jg7VuP7jdP6Fc=;
 b=BuEHtDzx5/Y3bD7Axgg+r9Z5O9ZAL5kIEX1MCfcLObX6pEgMcqif8fCJSMVuoqxp+A
 zhBRfAnL+/0asUKOpYqA6m8QWxUPNU6YoQNjnueIlq9ckin2Ne99YcqJnjmNWU00/he7
 /b2xy8WiFba7qy7NRL/MTlkUK+KMxIM42YzMyafKpoJ/Z2rfbaghD+XV/9l2Kqa/D3Ad
 Vqi3ChYSzGteGdNmCcD77Hrdq+DB6+tuWmCPdUFJ1mrwzN2Bxr0KkOkNdjZKOnUV7BTh
 lYyBPhLxox6HRr9MA2cvHi7Tz5FCsNS1dUlbj97WI83vbvh/2fzcFUx3sk4WD+lv80SN
 pH7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794336561; x=1794941361;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=dtBB6VJ0vhsudtitif+Mm2Esb958z0jg7VuP7jdP6Fc=;
 b=zILsRjPIpSvhG72ADqqurn9BLj3biXTf76S6VwfDm+NblEM1EOo0fkYfRdkiO3ZHXm
 wpjBN1jfJIQiSFDXA1L2THIvO162enRa5srtnx2sZQR5m5t788plnU8F00eoqdkBNFuS
 0toEmqCQPuC7AUpf8fo7eV558DLwT/YG8++z7OU5Ga39h0Q8Zs8gG72QnWy1ZYq7AMVU
 fQ20ZoypN6qYIsQZI3czZXFs4r4q/ggE4DZaYvsKSWFSmcF2K8lZqo6sQJzYDb/2F1Sx
 ibZyE9HUgL/xQwfm52zUn5KsWOnoAVwaGOKKzateop/BDLeA/LuUeNrIdy8fLbpLlmxe
 91HQ==
X-Gm-Message-State: APuU4Z+qIzBFqiZeIRNNEf+dCbo5SM3XnDgBYRKGGmi4o4l1ld4Z/pQl
 x0tGhCaG2xfsV84aTTatA59NRt2S32L8IwDTWp2LYTJyRaYnABX9x2kHAGYh7niW
X-Gm-Gg: AYBFou3a1NSSiZVdU9Hv8xO3GUN9JpfMW714bxwBZIQ8W6wFw/e0/yiPSgmsGynrRRY
 mcXCC9ga9ixaTomZ9YdV9B5x+cmSO2yw1uQ8Ok9KYpgBpqWnfE6UUHIYWKSsBtx0nFFC1Jp6mB/
 rcKgrbVy1rx7FayX6IB5pgLEAKUUFEO0glOCK6QjX+ZyneASMhXH1vfUNWxB97bUwev+aynYyny
 tYAj/FWqoznerkBUa/NgUepvxD0uvyk1CYiQqhgh/x+c3T2/ODcUmYRckEFVNxnJ0EgwxA/BLez
 e7I9XJMADy8lSZnZYYcWRMhxEPTDYTfx7Me9L41LI8+jSetqpM9Fs5NdTMlBxIt2lwjLRsXKQJ3
 caLeVgVCqZIhch8txLe7Pz7G0oDH1JK3bVbIE/Xgdw2q57KgWBvU2lwHQVWyKIeiRrgC5Q3VNDw
 FrQuEJ3fLiVSbM9Qg0Nv1P56nLLHneMivxfSQxi/0MieiPcqJRzeV9DgezxDxuK7b9uNFKq4W3m
 sPzaGbJayNOKQtsHD4rMNM6imDfOKEYDQpJntgeJrzlQxPI6aAL1YWcCTx8VMpzMtF0yzBX97wN
 JsKd62Eb53OvLc2vvxyBwieqz7a6A8fOIbrf+MmAagBScHEgW7EIaLOOQJfTZSjgGb2B2Eavf/O
 Bx+0bB4nUoyVKX8xPd1uFwdCBC+pJw2DVbno=
X-Received: by 2002:a05:701b:2717:b0:14a:8cff:fbb8 with SMTP id
 a92af1059eb24-1b3ba7b2f23mr2707848c88.28.1794336560442; 
 Tue, 10 Nov 2026 10:49:20 -0800 (PST)
Received: from fruitbat.pteropodidae.net (ip70-191-36-30.oc.oc.cox.net.
 [70.191.36.30]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-1b3b5b2ff3bsm10542880c88.11.2026.11.10.10.49.19
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 10 Nov 2026 10:49:19 -0800 (PST)
From: Loren McQuade <loren.mcquade@gmail.com>
To: wireguard@lists.zx2c4.com
Cc: therealgraysky@proton.me
Subject: Re: [PATCH 0/2] iOS 27 build and launch fixes
Date: Tue, 10 Nov 2026 10:49:05 -0800
Message-ID: <20261110184905.26402-1-loren.mcquade@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261010160303.2853-1-loren.mcquade@gmail.com>
References: <20261010160303.2853-1-loren.mcquade@gmail.com>
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

A friendly ping on this series. John Audia built it on top of master
with the iOS 27 SDK, ran it on iOS 27.0.1, and replied with

  Tested-by: John Audia <therealgraysky@proton.me>

https://lists.zx2c4.com/pipermail/wireguard/2026-October/009761.html

Without these two patches master doesn't build with the iOS 27 SDK, and
once it builds the app is killed at launch, so anyone building from
source for iOS 27 is stuck. Is there anything you'd like changed before
the series can be applied? I'm happy to resend it as a v2 with the
"wireguard-apple" tag in the subject and the Tested-by folded in, if
that's easier.

Thanks,
Loren
