Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06D56CF34C1
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 19 Nov 2025 14:47:45 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 49f78831;
	Tue, 18 Nov 2025 17:32:16 +0000 (UTC)
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 8c51942b
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 12 Sep 2025 12:08:50 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3c68ac7e18aso1254039f8f.2
 for <wireguard@lists.zx2c4.com>; Fri, 12 Sep 2025 05:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757678930; x=1758283730; darn=lists.zx2c4.com;
 h=content-transfer-encoding:mime-version:user-agent:references
 :message-id:date:in-reply-to:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to;
 bh=eyXwEntkUq/1IvyuiiJejzbrGCs0SwPC/bonUwQtC/g=;
 b=k1uu80lcCz3G/kDrT+rnD13c0tdum+7mUjDQPoQirXHPel+1DuSLHq+LrQkcczzmhu
 eUM9k//rxfVDlxKLjMK3WX9NlTxUfYAi7ktQMLgQMmP4Nvtuw+HzYRPhmZbaQtcTfbhn
 2hUNzk4/rrGq8odUZO9tUzhu0ue1ttmFMud42bvQtIK5Y1gBw0xfk9Geoax5KsjINNiH
 dDRWAaRhwvtuO+FbtpywyxUVHtIN5NEXPBCC7toMK+/3Ic9muKSrIe9DVvBTspsLs49I
 3s0SmhCGoBpLSYselOACQ4Jxt8Fmwuua/Ts5v2nKT5fXvB6hwT8rGzDo3GWX/xGIfDec
 uZpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757678930; x=1758283730;
 h=content-transfer-encoding:mime-version:user-agent:references
 :message-id:date:in-reply-to:subject:cc:to:from:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=eyXwEntkUq/1IvyuiiJejzbrGCs0SwPC/bonUwQtC/g=;
 b=bjKx0cZO6K4PYLajFYD6ns/uPXCx43rtXS+FAoWZvI1wZ8q/JTtKszGgphYq5v4d/b
 U2puvo0pNWqEJYF4he5YTq3SSUy02ntgQ4sqn72MpUBbswrWJ7N+Mt9RkIB/KRbtrQGQ
 Fcuw6UADMhU14sm1fqjcvWAMavfLb+ncs5mJQt1ifgXlzD1hI7TekzHmtBbG9o4HBmpY
 itRudOPzxbhvT3xY/UFSaQ2QI824GiocuK2MMoUuNJt67kt7HvtqURISNEWoMXn9Lmla
 PRYGtFL3t+tFs0aeyNyDN6WANet3WdW6Flb23VSxH7ffIEutoM0etXE/DxAR51Gl3qgE
 qMCQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUszHCVe+uVL+YScYmaYeVZ8xIjJTI9O53mXM32ePEl/vcz7o8uT4tQ79UDhdIDHHqktBExc3xn6wc=@lists.zx2c4.com
X-Gm-Message-State: AOJu0YyyUTKpvzyQgyEinJYA7sgVKm/KlB3ZJaRA89JY8L5VZvIcHael
 sGqMuzGtAOHp5YHmMfOzBMS1SR61VuL1d7qNK8diUhv4Acccl5gZdlHD
X-Gm-Gg: ASbGnctXmdV6faQoR7Vh9PEbWiE2k8NXorDgNLMFkWwyVPTMz9N7IbNAFDsQHXS3/tE
 pcMaTeTUomsxq30l0u+oCK5hOk8P9FFO7mO8QQ/VRvM3tuXVBxokXY9xJUCX9uXfqhE4zqG7mCt
 WD709QteqPAfOak3ylMOWJpU4zFhlR2mULljb3Dmco3GBz3a/rD4sMnjXiG4H4g9Z7OzQy0VaXm
 MJt4jPIVNEfYw7uYQ2N1iRilmVLQ3eOJlI6mXSMyI608u9GwCpnZj3dKEEq67+vzYRmXU0wugfW
 a7c6HVcDJ9JBmH5mBEHkKsJDxCCedFmdaPcV2yBfof+WJVuTp1vdgdUls0PmlQLKZb3VkIj7ph7
 kmHlL5OHnu2oiM35MFZXjnzq+ZXul9smWDw==
X-Google-Smtp-Source: AGHT+IGrPhMBp6GuaPq0wxjpFhNWXqcAEvg0ats210AmO2YrMj5yxfhfipC1GHiYP5KrwliKQotJCg==
X-Received: by 2002:a5d:5d86:0:b0:3d6:1610:1b6a with SMTP id
 ffacd0b85a97d-3e765798581mr2392936f8f.22.1757678929127; 
 Fri, 12 Sep 2025 05:08:49 -0700 (PDT)
Received: from imac ([2a02:8010:60a0:0:18f9:fa9:c12a:ac60])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3e7607e2d43sm6364880f8f.59.2025.09.12.05.08.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Sep 2025 05:08:48 -0700 (PDT)
From: Donald Hunter <donald.hunter@gmail.com>
To: =?utf-8?Q?Asbj=C3=B8rn?= Sloth =?utf-8?Q?T=C3=B8nnesen?= <ast@fiberby.net>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>,  "David S. Miller"
 <davem@davemloft.net>,  Eric Dumazet <edumazet@google.com>,  Jakub
 Kicinski <kuba@kernel.org>,  Paolo Abeni <pabeni@redhat.com>,  Simon
 Horman <horms@kernel.org>,  Jacob Keller <jacob.e.keller@intel.com>,
 Sabrina Dubroca <sd@queasysnail.net>,  wireguard@lists.zx2c4.com,
 netdev@vger.kernel.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v3 04/13] tools: ynl-gen: refactor local vars
 for .attr_put() callers
In-Reply-To: <20250911200508.79341-5-ast@fiberby.net>
Date: Fri, 12 Sep 2025 12:23:37 +0100
Message-ID: <m2a52zvrra.fsf@gmail.com>
References: <20250911200508.79341-1-ast@fiberby.net>
 <20250911200508.79341-5-ast@fiberby.net>
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

> Refactor the generation of local variables needed when building
> requests, by moving the logic into the Type classes, and use the
> same helper in all places where .attr_put() is called.
>
> If any attributes requests identical local_vars, then they will
> be deduplicated, attributes are assumed to only use their local
> variables transiently.
>
> This patch fixes the build errors below:
> $ make -C tools/net/ynl/generated/
> [...]
> -e      GEN wireguard-user.c
> -e      GEN wireguard-user.h
> -e      CC wireguard-user.o
> wireguard-user.c: In function =E2=80=98wireguard_get_device_dump=E2=80=99:
> wireguard-user.c:480:9: error: =E2=80=98array=E2=80=99 undeclared (first =
use in func)
>   480 |         array =3D ynl_attr_nest_start(nlh, WGDEVICE_A_PEERS);
>       |         ^~~~~
> wireguard-user.c:480:9: note: each undeclared identifier is reported
>                         only once for each function it appears in
> wireguard-user.c:481:14: error: =E2=80=98i=E2=80=99 undeclared (first use=
 in func)
>   481 |         for (i =3D 0; i < req->_count.peers; i++)
>       |              ^
> wireguard-user.c: In function =E2=80=98wireguard_set_device=E2=80=99:
> wireguard-user.c:533:9: error: =E2=80=98array=E2=80=99 undeclared (first =
use in func)
>   533 |         array =3D ynl_attr_nest_start(nlh, WGDEVICE_A_PEERS);
>       |         ^~~~~
> make: *** [Makefile:52: wireguard-user.o] Error 1
> make: Leaving directory '/usr/src/linux/tools/net/ynl/generated'
>
> Signed-off-by: Asbj=C3=B8rn Sloth T=C3=B8nnesen <ast@fiberby.net>

Reviewed-by: Donald Hunter <donald.hunter@gmail.com>
