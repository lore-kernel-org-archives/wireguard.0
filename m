Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B4B5CF34B0
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 19 Nov 2025 12:56:26 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id da879987;
	Tue, 18 Nov 2025 17:32:01 +0000 (UTC)
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 05426df7
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 5 Sep 2025 10:54:02 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3cdc54cabb1so784819f8f.0
 for <wireguard@lists.zx2c4.com>; Fri, 05 Sep 2025 03:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757069642; x=1757674442; darn=lists.zx2c4.com;
 h=content-transfer-encoding:mime-version:user-agent:references
 :message-id:date:in-reply-to:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to;
 bh=yHvBVisMHGwoNSzTgNpM46X/q8q2/6v8Wpisu1xjvm4=;
 b=dM8wNi0cgESbZjRpajhl2K0K6aRMhahCGH7Guifv81Efs2vrFOhZf1/GcYv62aGxFz
 Ivkei8LFSGDCQkLW1f9Tpqe58uFOzQncBcdW3i5BL04gJBr2DVQdqUOVtVHeaezHu5gL
 yOEKDyGDZK/dHQVZeSdzNXw3pK0F1/iVxc0tM7+cma0VFn5C1YJ1CmbMmqgIFDnrO+/v
 rsFFTZKsccT/50wd0s6mEUigggBNlQEpWoGR0Fw4NXpgyGwUD7onpMcVOw6ccl72YBkq
 6l2X9/xZNHJq2rCtAjGQoNNvCM1tUoJilNxldEp3ipg6YuAgNzbO1z9bHRhZVOAzZ2ZQ
 gs7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757069642; x=1757674442;
 h=content-transfer-encoding:mime-version:user-agent:references
 :message-id:date:in-reply-to:subject:cc:to:from:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=yHvBVisMHGwoNSzTgNpM46X/q8q2/6v8Wpisu1xjvm4=;
 b=gPRZXPPA5/mEKmmR+34z/fTky24kXJhUm1M2e2a9yT0EpHQR8LkIpEsaDdpLVUUK39
 HohhwDjgyjVeuRnobhZJA/gZSpfyNqpC35DQCWv+wLFo/VDePrFVUx4vfOfJ5e9GjSxQ
 rUyL86QBE5umBuxPd6ChiRW7x+WOZ8H3i0PxKhOY/LMKp2UbZlDUeHdPxT4VQ69nFHdo
 BglVHfqMDWKbBlDdHzsPRKQJnBE5RiwfzCpXplXGCR+l2K+iXj8KjmUX5aXS2y6I2LsU
 P/brJ3pdHJtc1CwPUKOR15Qs4f1uTEKjMbw2jckyI4MPY/xRFfiCsyRMcQ33+9w07AGD
 AjUA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUrvlWLksO5rxmiimpd7Hv21ABgvInPWpfTHCR5BO1ol9IYIEMQvopt9FGveQNqzu4qLBK7040avCY=@lists.zx2c4.com
X-Gm-Message-State: AOJu0YwobBQCVvX4ILzPrX2VmMbpq+Wur78QTpo/25ScZlrDCmg0QWCH
 FM1gN1YTpEBZbum4ETaqkaUwz268ei8fAcbINMLK5NQTO1pwboP3L61P
X-Gm-Gg: ASbGncu7M0FuH8As0MVp3mGg30qH3PVlBnMyRisA0w4RXeJgNZgZwx8+ASohWhgVfZS
 Ef1XOwqjEFVMMxRI8wvFmpfcDN/sjCAhQfsM5JRnmeXsL3U9hdTcDzMSTJlETywMzErdg9aFFc+
 kH8u6T5UHAUDUoHBRac5QQ51/lbWXWKcB62V2j6xt3DkmJ44Yrm+dbexy72X3l9AKIPbbH51B/o
 uZYudL06zKKKWFbFvMm9OApIXcE2SI5PC5N4gVmVvabmPdhCvRLeNwZR8cwApNDdRpRruyP5R9c
 fPEL7Xfeq5QpedUz5UccjGMGDvi9Zp4tLdjsu50fNcLQj5IQIh88rdkxaytZPhBFkp3luMt7k+M
 ML26icEixCPxEtAoVJm5MjwD1rTsCaSHaSCsdyESFCQoxLw==
X-Google-Smtp-Source: AGHT+IH/w4mCntnKqWpCCaG9P6GZVl+kuBsFJzbpXmpVyVNp+5zxdFKxJOMhWfm4Gma6EHo1BLzpCA==
X-Received: by 2002:a05:6000:2313:b0:3e4:e4e:344e with SMTP id
 ffacd0b85a97d-3e40e4e3be5mr1294346f8f.29.1757069641867; 
 Fri, 05 Sep 2025 03:54:01 -0700 (PDT)
Received: from imac ([2a02:8010:60a0:0:8157:959d:adbf:6d52])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3e237646de6sm4362640f8f.42.2025.09.05.03.54.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Sep 2025 03:54:01 -0700 (PDT)
From: Donald Hunter <donald.hunter@gmail.com>
To: =?utf-8?Q?Asbj=C3=B8rn?= Sloth =?utf-8?Q?T=C3=B8nnesen?= <ast@fiberby.net>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>,  "David S. Miller"
 <davem@davemloft.net>,  Eric Dumazet <edumazet@google.com>,  Jakub
 Kicinski <kuba@kernel.org>,  Paolo Abeni <pabeni@redhat.com>,  Simon
 Horman <horms@kernel.org>,  Jacob Keller <jacob.e.keller@intel.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>,  wireguard@lists.zx2c4.com,
 netdev@vger.kernel.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 05/11] tools: ynl-gen: define nlattr *array in
 a block scope
In-Reply-To: <20250904220156.1006541-5-ast@fiberby.net>
Date: Fri, 05 Sep 2025 11:44:13 +0100
Message-ID: <m2y0qtxjpe.fsf@gmail.com>
References: <20250904-wg-ynl-prep@fiberby.net>
 <20250904220156.1006541-5-ast@fiberby.net>
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

> Instead of trying to define "struct nlattr *array;" in the all
> the right places, then simply define it in a block scope,
> as it's only used here.
>
> Before this patch it was generated for attribute set _put()
> functions, like wireguard_wgpeer_put(), but missing and caused a
> compile error for the command function wireguard_set_device().
>
> $ make -C tools/net/ynl/generated wireguard-user.o
> -e      CC wireguard-user.o
> wireguard-user.c: In function =E2=80=98wireguard_set_device=E2=80=99:
> wireguard-user.c:548:9: error: =E2=80=98array=E2=80=99 undeclared (first =
use in ..)
>   548 |         array =3D ynl_attr_nest_start(nlh, WGDEVICE_A_PEERS);
>       |         ^~~~~
>
> Signed-off-by: Asbj=C3=B8rn Sloth T=C3=B8nnesen <ast@fiberby.net>

Reviewed-by: Donald Hunter <donald.hunter@gmail.com>
