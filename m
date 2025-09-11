Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 264C6CF34B7
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 19 Nov 2025 14:47:44 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 618bb680;
	Tue, 18 Nov 2025 17:32:14 +0000 (UTC)
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 7e1d3a60
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 11 Sep 2025 11:20:54 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-45cb6428c46so7573185e9.1
 for <wireguard@lists.zx2c4.com>; Thu, 11 Sep 2025 04:20:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757589654; x=1758194454; darn=lists.zx2c4.com;
 h=content-transfer-encoding:mime-version:user-agent:references
 :message-id:date:in-reply-to:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to;
 bh=zy8valPOq+5TQChc2jB5gUQh6GVTf0ilWXpF+hPVga0=;
 b=fsz/exavduJ0k11gpJplj+jFnKC5tp6JZWQRfy1bNcRwia3kiGcsabh7821PdDRHf0
 t3rsIH/W/rcNRndfC5X8yRfrlDGdm21T+vBhocR0DI+VkyofGvM9NlMIFOsl3BiQfop3
 8BvQ6OV0XRGbT//O5dxiismt21TGGJ2Xlc7OwDyp+koi5/daNH1SkR9yTWCwXw12xQjD
 ZBYm8WFR4SBFd1BbX2g34nNluzbqJ4zomvMLzKSwUKDede9YulFpusuHmLmRODza5Glz
 rfYYqes5368TjO9hrbgBgaRRCnh4aSlMdwyN/plKkitMK82hXaVCRgXaUo1+/6J2Zds4
 32FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757589654; x=1758194454;
 h=content-transfer-encoding:mime-version:user-agent:references
 :message-id:date:in-reply-to:subject:cc:to:from:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zy8valPOq+5TQChc2jB5gUQh6GVTf0ilWXpF+hPVga0=;
 b=ZdwQvOhBm/nSCu3pHtrSzUgSzKFHDPzBxKnPuGLS0QCcQCCkMfB9uHub/Au8QMUP2x
 QFdOWQ+hDr7BVoB70wFdlDozoow9IuuwQbbgDxyiGTXzt3Xd3MB8pTiUhU4lWQrL6D/V
 Jkg2G2mLbuxqNyOzZatF36aBMp4jnD9SPLBvhzhEUFjaWiQvI2uh2NpWePfAkYX228+q
 I6l4RmxKy9VBBI8z/HD3/VLvUKaiKwB5oBVRS25Ma0YJ6knYqP3wVpksWdGepl/l9NRY
 zaN/bG185NknjnvfZdgYLffo+wg6oBYuUYSF3ppDAF2mXCrxYYQWrzSRtWbsBPWBe7he
 B/LA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWGwdj3JQ8cuYpPjd2OdBllqQNNJ/zazxkSAXQdowztNr7hPjYdM9wRh0PEzn8c434GMAebcEr0YD8=@lists.zx2c4.com
X-Gm-Message-State: AOJu0YyHm+UlQzHxT8Cw4nOzBmH2eNjr+dJvkj0M2nE4J0CMK/jUi0aJ
 3/Mb6wVc+IbLvpxZhDGeTMtvVd3pjnCtraKznT94k/KTC16/qIzKuRh0
X-Gm-Gg: ASbGnctY4/U6Z8QI/mw1We7WH8gQLVN8y/6ubyMoM538B4m40DLoZYwXleh2tEPqxCa
 y/QVju89jfzaaHbCKikocG6OpL0dWPXjVX1MoLHUQBjaEq4tTxqRx/tWC85zly3AX5tT8A2ROz/
 SUmVThR5mE8jXCSKtV3f7pCX78LLPD6nijJ+e6zYdLpMJmy++AGiq8i/8hB6qg9HSwyonlF3PMh
 R7mCHrRoUI0xo0EwkBx82SryH2ASVYK6Qh5X8BXvhku23w5Z9HPOjZnZAQkBDdQxANr+oSTFC65
 9L+VrHX07psV4Fw6+oFwphhndSK/8X4/iVhX6FFMCiLf+rek2HQlMX9mQi0aTcd3ygKJTrvPU57
 28LwvovWCuzn/kdgb+qIC3a+juTgkqXDyqiERPhBkvVzIF9Y/++AvmVlmVW0T
X-Google-Smtp-Source: AGHT+IHPRyXDCKOm7qQhOay8cSvONkh1hTjaOIcriGGovjXk8SONeiWwYo/6tBJ9G+d2GC5W46uqTA==
X-Received: by 2002:a05:600c:1390:b0:45d:da7c:b36 with SMTP id
 5b1f17b1804b1-45ddded7614mr164680975e9.19.1757589653499; 
 Thu, 11 Sep 2025 04:20:53 -0700 (PDT)
Received: from imac ([2a02:8010:60a0:0:18f9:fa9:c12a:ac60])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45e037c3ee8sm20447335e9.18.2025.09.11.04.20.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Sep 2025 04:20:53 -0700 (PDT)
From: Donald Hunter <donald.hunter@gmail.com>
To: =?utf-8?Q?Asbj=C3=B8rn?= Sloth =?utf-8?Q?T=C3=B8nnesen?= <ast@fiberby.net>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>,  "David S. Miller"
 <davem@davemloft.net>,  Eric Dumazet <edumazet@google.com>,  Jakub
 Kicinski <kuba@kernel.org>,  Paolo Abeni <pabeni@redhat.com>,  Simon
 Horman <horms@kernel.org>,  Jacob Keller <jacob.e.keller@intel.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>,  Sabrina Dubroca
 <sd@queasysnail.net>,  wireguard@lists.zx2c4.com,  netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v2 05/12] tools: ynl-gen: add
 CodeWriter.p_lines() helper
In-Reply-To: <20250910230841.384545-6-ast@fiberby.net>
Date: Thu, 11 Sep 2025 11:47:10 +0100
Message-ID: <m2qzwduuz5.fsf@gmail.com>
References: <20250910230841.384545-1-ast@fiberby.net>
 <20250910230841.384545-6-ast@fiberby.net>
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

> Add a helper for writing an array of lines, and convert
> all the existing loops doing that, to use the new helper.
>
> This is a trivial patch with no behavioural changes intended,
> there are no changes to the generated code.
>
> Signed-off-by: Asbj=C3=B8rn Sloth T=C3=B8nnesen <ast@fiberby.net>

Reviewed-by: Donald Hunter <donald.hunter@gmail.com>
