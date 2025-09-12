Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 316A8CF58FE
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 19 Nov 2025 21:44:54 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 84c5cbd6;
	Tue, 18 Nov 2025 17:33:30 +0000 (UTC)
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id f29278fa
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 12 Sep 2025 12:08:54 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3c6abcfd142so852875f8f.2
 for <wireguard@lists.zx2c4.com>; Fri, 12 Sep 2025 05:08:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757678934; x=1758283734; darn=lists.zx2c4.com;
 h=content-transfer-encoding:mime-version:user-agent:references
 :message-id:date:in-reply-to:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to;
 bh=I2XBnZVyAQMrhhSI/DaBzgxF6FwG3l7nrVJBzdS3kY0=;
 b=bHaexxsAIdhFnBfy/dcWOS75U4IlxAoFq2NG6VW1LlLKGBRlT+asAStO7Km8CCfxyl
 XaKXgVLFd9KLwy8vvSPV4/SibUu6D88gFHJpTsma8a95Qqn6Sco8+/IGpv/sJ26jcjiP
 D4xnQnrdkTu8uMULkOsd8Kk2r2QnUQshH/QvpCXkZmtoqI4exT/OXhUmdGZP6yPs+6mC
 /btoiayy3y43W7ex5DNgXZ0A27jd0EE+R4H2h0ZfdcdiCCwZ0CMGS4tXteXYQKYEoVh7
 +uGQBjKCXavaCM7g1y4/hpzhF1Gr8DynEsBXgkY6KsXcFqZGXzIY8xpf8xmraNQ+Zb/3
 A1Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757678934; x=1758283734;
 h=content-transfer-encoding:mime-version:user-agent:references
 :message-id:date:in-reply-to:subject:cc:to:from:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=I2XBnZVyAQMrhhSI/DaBzgxF6FwG3l7nrVJBzdS3kY0=;
 b=s/AXaZdficyu2r7J2pMQ2ZlnOWMBeF1r2r/TNZMEcngdtTjJr2JK8XQdsHZbIMLJQO
 +n6rqhHVoModRl+i0cczB8JOuTu2KxkpOH6WIfG1RflRT3iVcrEWNAJB0AqTVsFr/aJj
 xkTNgcVdKXLWZXa8MmPNj3mAu7oSQ7n+bs/cjVX+8dDMraTlzYIphVmlBcEKLSVprYuy
 uDpjjOKHnJhujbi+rmP/NAND7iqNImgyfP2a9oCJMicsBHabQ3ucHgolLvNu0wXBjTaj
 P/s3ysvpFMp2UMhjE0dS16HkMBFS7ltLq8TxBY0bJX+bDUlmMgIskv1aAbAYyROm0KnH
 HXAw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWDOMKXVhFV/xH34LeE7iY2T7uvYWWEz6EH78wevtlphQetUcqof4mHOMuXvKnZQPiABFlQDhJuR3Q=@lists.zx2c4.com
X-Gm-Message-State: AOJu0YzzKNQBXnZpcB1RDvinA/TWwDM+Wh1MEXU0gF3wKztjZ+P3rXo8
 PWwB4xqQonnlJTksbwl1uQg/bfasLwc3mHt94TqR5TcjgKQKSbOfIa/I
X-Gm-Gg: ASbGncsinBstOwyaUz349bGnjOeFsM9Ogw5gW58VjdhHBnGbKv97mjundPOONAwZJE+
 Q5zJQOkqrbIOPctjSVFZCCtO9+V3dO4tjLLzUWnKfKjyG/gpkh24P1Pq2yVFdf44/8WJpxj1sFm
 SneZ6Hcfg/X0ekFewHS9ZJNyPZ5RCRlAuuH7/iU3hApPX5yq81/1iQpjElHEc1NIGc40KeIgBoG
 UBQKJdRtgFwrjbt7ScWu13o206lCVbCRo8BJ4X8ESOQdbB14SrIoWyvcxB9znc74b1IvKq+kIWU
 K6Mbnp4mHyW9wDxvxxkcY3JWeDbHSpBSKBJ0aR7KbZ3p1tfewuMeAGtEJ/zf5Fx+zF1CShLM8KS
 8hBMuvnUO6qdPOOg/qStS9A41y/lD7GYT0A==
X-Google-Smtp-Source: AGHT+IFHvsX4+WM6Fj66Yc3KV7zMbPnHeT1OHPDmR/usCdny9EBxn21UZKnW27EJ5m4ay8CYAoEFMg==
X-Received: by 2002:a05:6000:18a6:b0:3e7:486b:45cb with SMTP id
 ffacd0b85a97d-3e765594133mr2411503f8f.3.1757678933645; 
 Fri, 12 Sep 2025 05:08:53 -0700 (PDT)
Received: from imac ([2a02:8010:60a0:0:18f9:fa9:c12a:ac60])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45e0157d68esm32967665e9.6.2025.09.12.05.08.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Sep 2025 05:08:53 -0700 (PDT)
From: Donald Hunter <donald.hunter@gmail.com>
To: =?utf-8?Q?Asbj=C3=B8rn?= Sloth =?utf-8?Q?T=C3=B8nnesen?= <ast@fiberby.net>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>,  "David S. Miller"
 <davem@davemloft.net>,  Eric Dumazet <edumazet@google.com>,  Jakub
 Kicinski <kuba@kernel.org>,  Paolo Abeni <pabeni@redhat.com>,  Simon
 Horman <horms@kernel.org>,  Jacob Keller <jacob.e.keller@intel.com>,
 Sabrina Dubroca <sd@queasysnail.net>,  wireguard@lists.zx2c4.com,
 netdev@vger.kernel.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v3 09/13] tools: ynl-gen: rename TypeArrayNest
 to TypeIndexedArray
In-Reply-To: <20250911200508.79341-10-ast@fiberby.net>
Date: Fri, 12 Sep 2025 13:00:54 +0100
Message-ID: <m2wm63ubgp.fsf@gmail.com>
References: <20250911200508.79341-1-ast@fiberby.net>
 <20250911200508.79341-10-ast@fiberby.net>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

Asbj=C3=B8rn Sloth T=C3=B8nnesen <ast@fiberby.net> writes:

> Since TypeArrayNest can now be used with many other sub-types
> than nest, then rename it to TypeIndexedArray, to reduce
> confusion.
>
> This patch continues the rename, that was started in commit
> aa6485d813ad ("ynl: rename array-nest to indexed-array"),
> when the YNL type was renamed.
>
> In order to get rid of all references to the old naming,
> within ynl, then renaming some variables in _multi_parse().
>
> This is a trivial patch with no behavioural changes intended.
>
> Signed-off-by: Asbj=C3=B8rn Sloth T=C3=B8nnesen <ast@fiberby.net>

Reviewed-by: Donald Hunter <donald.hunter@gmail.com>
