Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC7E4CF34AB
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 19 Nov 2025 12:56:22 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0679256b;
	Tue, 18 Nov 2025 17:31:56 +0000 (UTC)
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 69ade9a2
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 5 Sep 2025 10:53:56 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-45dcff2f313so12368145e9.0
 for <wireguard@lists.zx2c4.com>; Fri, 05 Sep 2025 03:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757069636; x=1757674436; darn=lists.zx2c4.com;
 h=content-transfer-encoding:mime-version:user-agent:references
 :message-id:date:in-reply-to:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to;
 bh=cZ91k52qR45aiWRI11wxOihV1b6M8Vq0BGMkzafS080=;
 b=LVtkRYGxuWewzAa6F+1xg4y7Ytq/l7sRg4NMz8sQLe/x9XOxUxm55rvmKnyoAsQaOp
 PdrDCA4LNvrqlM84VvKG046n22SM6dN6Y0CmUhawqy2AYnx1p9c5CiM4x22WkqGKPCiX
 kmTcXJjhIhQV/HxL8NFT//KgJ2Zs3BR5mDrl2Q1dyu6/uerKxAErmRwACogpxXhwnE89
 2ubETNq9kSUaitEMTBr4pr9VDs5mBJNIuEAtKYlma0HO8tfsUVjrO1S7p1RnT3iX+6Hh
 PUqjhFrIzHw/fIImcQHCNPFJeIGB0kosLqHrsSMAIqoPPD1YDMnWmaD9LrBxb4NRE6pw
 rGSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757069636; x=1757674436;
 h=content-transfer-encoding:mime-version:user-agent:references
 :message-id:date:in-reply-to:subject:cc:to:from:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cZ91k52qR45aiWRI11wxOihV1b6M8Vq0BGMkzafS080=;
 b=Gcwz2FwBfKyGUkMloLkFLdzOb/N4zSDxZTBq6kUMP2exqAF8fExzM0VbkEGKzFbQkb
 B1isiYrtH8J8uaPRRm0jnW9KFlFq+08aHeYaipje3zXvEO79rTTMzpJGP+60Ue/lUBNE
 +pFnvdj+0wGMkJv8WFKlXWBSWHBoeR+1LRt7CXJcfWxkpRF9q+UvFcoCVUgJBrxR+dLa
 xf3iHYiAhdosRE4vTKTIwsOuH16u/yVT/tyi4vvadiWHQUDS1FgTr31I0xSuiOUqUHSm
 mgCaz++EOWh2iKfLkLeCF89JvPSOUA4M780dsRwYCV3B9q5KzNzuNMgLc99D5mkFZZqO
 ZDtA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWfruKaiq03UrWS+lgoxbYR6kZsb7yu7jcc8SbFXr6o4f0m7/RqcoZ9QXgZfnfDTnnkOtZzwvN+SSM=@lists.zx2c4.com
X-Gm-Message-State: AOJu0YwQerTha8bHdlqUtqQNNhUtSbUK+lfAvJ4gS8XJ2pfSuO4Cw0rQ
 9P/8BBiuzZKSUQQ5v+f7FkSlSCWVLPX+LLeFJqOp9vDfrVoO3Rg595TC
X-Gm-Gg: ASbGnctlmvIKMikEXVlOyf+BChWiSgVmvyoskYf5h9c3zhwB/RS7QIeNnhIaSAZqmkI
 cv35gOE51UszyggE7yifkGBhZqVjaAaMe6sa1rdV2ac82VP6GjYWpKvFb7oSjisPgxAIpVuz3Io
 86mcOR/nRdNpDClPcwvUDImQga3zn1fs4QBA8oBYjcarP+qV78zSypDt8mtFnUWmsODesSroJb6
 p7er30m2e0Lq0oRTiJ8cCGV1P3tISNe9L4uxN0HWFSsA8iZeBA7rl3hHvileQyLiEOrDjm/E3t1
 kqc6DM3dgDEJ3iM9dldTB+Hmz4QP7EpZCxuTDT2GwMggoK+Gn+Wlwv26/iAhWrMjgZ9j+ous4yH
 1idctz7PrK8E8XY0XflKm+uJPvEm5ctzUsqc=
X-Google-Smtp-Source: AGHT+IGV0V3oPnun7Z+s99bPB1MIypO1yxi1dOVcuTckULlQHv9YRvW4+4DnaXzlyLC9eUlQ9HNgAw==
X-Received: by 2002:a05:600c:c4ab:b0:45b:47e1:ef6d with SMTP id
 5b1f17b1804b1-45b855b3032mr173294965e9.36.1757069635818; 
 Fri, 05 Sep 2025 03:53:55 -0700 (PDT)
Received: from imac ([2a02:8010:60a0:0:8157:959d:adbf:6d52])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45dd2df4c8dsm54645465e9.15.2025.09.05.03.53.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Sep 2025 03:53:55 -0700 (PDT)
From: Donald Hunter <donald.hunter@gmail.com>
To: =?utf-8?Q?Asbj=C3=B8rn?= Sloth =?utf-8?Q?T=C3=B8nnesen?= <ast@fiberby.net>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>,  "David S. Miller"
 <davem@davemloft.net>,  Eric Dumazet <edumazet@google.com>,  Jakub
 Kicinski <kuba@kernel.org>,  Paolo Abeni <pabeni@redhat.com>,  Simon
 Horman <horms@kernel.org>,  Jacob Keller <jacob.e.keller@intel.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>,  wireguard@lists.zx2c4.com,
 netdev@vger.kernel.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 01/11] tools: ynl-gen: allow overriding
 name-prefix for constants
In-Reply-To: <20250904220156.1006541-1-ast@fiberby.net>
Date: Fri, 05 Sep 2025 11:36:38 +0100
Message-ID: <m2frd1yymh.fsf@gmail.com>
References: <20250904-wg-ynl-prep@fiberby.net>
 <20250904220156.1006541-1-ast@fiberby.net>
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

> Allow using custom name-prefix with constants,
> just like it is for enum and flags declarations.
>
> This is needed for generating WG_KEY_LEN in
> include/uapi/linux/wireguard.h from a spec.
>
> Signed-off-by: Asbj=C3=B8rn Sloth T=C3=B8nnesen <ast@fiberby.net>

Reviewed-by: Donald Hunter <donald.hunter@gmail.com>
