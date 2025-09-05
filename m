Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC68BCF34A9
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 19 Nov 2025 12:56:23 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1cc8b34b;
	Tue, 18 Nov 2025 17:31:57 +0000 (UTC)
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 73fe8bb7
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 5 Sep 2025 10:53:58 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-45b9a856dc2so13205295e9.0
 for <wireguard@lists.zx2c4.com>; Fri, 05 Sep 2025 03:53:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757069637; x=1757674437; darn=lists.zx2c4.com;
 h=content-transfer-encoding:mime-version:user-agent:references
 :message-id:date:in-reply-to:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to;
 bh=z41bjByaFM60LnQEd6Oew9k8K6jjJWYfgMsisJ7Td+Y=;
 b=TWf4dyFvJyFJYlGqjsDXLcTyQK9r7eeiZMUYTawMIfHjqqaKGFB0KjAe/JYSJijHHN
 rwRcoZgohOPDICxn0Z5AmK95v7R2hT8nxuqD8LMVbIQnsYkqUaR7owvb9noMY1ytoyap
 jQxRhhWtfC+n8jK4g24UQQVEM7VAcJM3GFVdpruetItXdLBYbK256JH5t6C58AE3Jm0M
 QeP1nlLThY6hIjYDNAIfaq//1NnKWvcFYN8182L1BdzrdBZIGeXnmYyM7InRyeY9vnRZ
 svbg4Czk6qXeZnOZEO6YWmJ/iDKBlIJ8gg2H6/ZNm35MO1yVkXtp3jPPZsu7lPFEFQUB
 YT+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757069637; x=1757674437;
 h=content-transfer-encoding:mime-version:user-agent:references
 :message-id:date:in-reply-to:subject:cc:to:from:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=z41bjByaFM60LnQEd6Oew9k8K6jjJWYfgMsisJ7Td+Y=;
 b=dOYrxLUiDftVfQCPho3kMJg55xWns0bdevuGHzZ9AJ8X1+EMtXmznNmq65JC3wiegm
 3eytGFez+6fajqQKIVKYVdHPbQMNL16zurbnlgQnJorZsUk0Ula5giWMtahjdVuvsvTI
 qZQgQTJosW6CnRrhvjwkOM8+XOpWEkdfBEGI2Ur7/VfvIMkY1Zl7FPkAJzdoaas/0/+x
 mDlTOr7zF8rJkBm8Bd7BAyiE3k2H7M+Fm8YGJ6NXrsmscQWlWZdyLIaAAXZTQaXiNasR
 89qdIaJwHdkHRpXR+tmgyM0P1zQqERCt8AAqihPaRCY1cwOk5BUcZAUycYqKWqG2JYzq
 /1qw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVUZFQr8jG9IvsdlJsKBWItNWiQVGJMXSM2Te0ubU9iN1DDWrux+i2gPLmIbAfC/Wxq90Z2uzIPnko=@lists.zx2c4.com
X-Gm-Message-State: AOJu0Yz+c6aVia9d2NhyimPqIg1vDb3AEe07IcMRwx6M3oxpdeJOqhBI
 S+U9053DmjxwQzzZI75OyfVwNRCzumbofFLLxgWKZho0QEwxZcojJaE3
X-Gm-Gg: ASbGncszsT2sMDuPE1nTbNLZQ2RfrfEdYjTF8sSDtMvXlLV/1cesws8uM+sK9+IXLrz
 3uyK+VhD+pq6DIIT1pM58cF7KX2Vgz/O5akYX97cAIhAeEspOMf+vGk0hZFhmB6jNIllPXkbRDX
 Im/K141z9iVhnSmO/eB8HJHePpOJoQ35SO75UcLZudde0I1yIn2MlEJ6Rxu4kuus1muM3AN+aox
 CR4xkWlzFObL2rm7faEI3y9Z7EobKccz8kYr0U+iKbBWw+2WElqOSnC4m++ZN3gkBA2iKFF2E/L
 RYMB8h5nh4JzYrLYqqt/AWNYa6pDGAPbKxHvcr+i7j3pkzWrNbhQ/4jyQdkG4z6ar+B7C/PHQSR
 fapIncMeGJ4jxH5XYH/lyRinhNsbHQ3yxpfhSXbtTLSJaNw==
X-Google-Smtp-Source: AGHT+IGOY4bwB+izuGnbd5LE84YducDA7sGQmtMlij3Az404K/MZ+AIoA8ONqCveaO1sAzbVbdxh4Q==
X-Received: by 2002:a05:600c:35ca:b0:45c:b5eb:b0bd with SMTP id
 5b1f17b1804b1-45cb5ebb156mr92165805e9.8.1757069637272; 
 Fri, 05 Sep 2025 03:53:57 -0700 (PDT)
Received: from imac ([2a02:8010:60a0:0:8157:959d:adbf:6d52])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45dd3aadbcesm51030585e9.17.2025.09.05.03.53.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Sep 2025 03:53:56 -0700 (PDT)
From: Donald Hunter <donald.hunter@gmail.com>
To: =?utf-8?Q?Asbj=C3=B8rn?= Sloth =?utf-8?Q?T=C3=B8nnesen?= <ast@fiberby.net>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>,  "David S. Miller"
 <davem@davemloft.net>,  Eric Dumazet <edumazet@google.com>,  Jakub
 Kicinski <kuba@kernel.org>,  Paolo Abeni <pabeni@redhat.com>,  Simon
 Horman <horms@kernel.org>,  Jacob Keller <jacob.e.keller@intel.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>,  wireguard@lists.zx2c4.com,
 netdev@vger.kernel.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 02/11] tools: ynl-gen: generate nested array
 policies
In-Reply-To: <20250904220156.1006541-2-ast@fiberby.net>
Date: Fri, 05 Sep 2025 11:37:24 +0100
Message-ID: <m2bjnpyyl7.fsf@gmail.com>
References: <20250904-wg-ynl-prep@fiberby.net>
 <20250904220156.1006541-2-ast@fiberby.net>
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

> This patch adds support for NLA_POLICY_NESTED_ARRAY() policies.
>
> Example spec (from future wireguard.yaml):
> -
>   name: wgpeer
>   attributes:
>     -
>       name: allowedips
>       type: indexed-array
>       sub-type: nest
>       nested-attributes: wgallowedip
>
> yields NLA_POLICY_NESTED_ARRAY(wireguard_wgallowedip_nl_policy).
>
> This doesn't change any currently generated code, as it isn't
> used in any specs currently used for generating code.
>
> Signed-off-by: Asbj=C3=B8rn Sloth T=C3=B8nnesen <ast@fiberby.net>

Reviewed-by: Donald Hunter <donald.hunter@gmail.com>
