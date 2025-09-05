Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7639CF34AB
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 19 Nov 2025 12:56:30 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1b1f8369;
	Tue, 18 Nov 2025 17:32:07 +0000 (UTC)
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id d0387c8c
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 5 Sep 2025 10:54:09 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3df35a67434so1133144f8f.3
 for <wireguard@lists.zx2c4.com>; Fri, 05 Sep 2025 03:54:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757069649; x=1757674449; darn=lists.zx2c4.com;
 h=content-transfer-encoding:mime-version:user-agent:references
 :message-id:date:in-reply-to:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to;
 bh=HfX44cCVxvlSHiCbNobCW//1cotLxhGdfKz5wHzdISw=;
 b=Znp7cBSYc0rOR2l9e2p1HmAdXWXRcj+xm6lBV0WePCe2oLKRJQxT9z20cEOsKeWclc
 QkaSWuWD+oppCd2Is9KAQIBWdlHKz0F4iDssA/G49YLLNL368uV06XEn5NBG4yS1si7i
 yae2H0yu8IDJi4uH6q6Z1+cEInCtNKLZjp3IeLcv8IIPxA3QcsjjbryoiAIc3nwNx1uv
 hxytoMWyR48NNaYn046Q1xbQxv+V5MtCtMzaAmgA+fz8WrDRJrLohyBwIxR+imRzVmwL
 QkF73pi7ri6QSYlZVaj8pdYM23zR/iherLALF5BdDC1GuFzhAixvzYaCeJFX3r083Ice
 t4zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757069649; x=1757674449;
 h=content-transfer-encoding:mime-version:user-agent:references
 :message-id:date:in-reply-to:subject:cc:to:from:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HfX44cCVxvlSHiCbNobCW//1cotLxhGdfKz5wHzdISw=;
 b=fdLZAVkFI4CcPFIqJ+l0DSqIuO4RXMtDKR0nmbEaKnTSviBTjaN7HWg/aNyRo3k3SZ
 yMEnWxhXeaJxXLfroMKY2gCpLMcxZeV+eBo2J3tXJYKa9DpCJ0sKFZEaz4/M/b+lcmio
 daBW6e8JRWfhoQ+7Cia9UR1OtxVLZMKkA5CQjfE1o/v4HkkJ1EPibP5p67mvjZ8aGXtO
 FPXuBrXgGbonhcwYKzIHrwjgLGFpUfejA7PRqt/JnxJbQVVeaSa4Az5ZKui4bLT7S62I
 f87kKEGUt7+BVQJvc7t28oWPmkgQgs1WmkLlswoVgw2b840Z6AeCiEyCYBmSCLAh91Ws
 R+Mg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV/K1ZgzLV3jiWKvruAGYFpsXPRMt+MLjMFfWbVstb5PL/h92QjLwXep6jZmRUMjrgPardIPhp5fIM=@lists.zx2c4.com
X-Gm-Message-State: AOJu0Yw1f0NTk7ooHIsVeFklmmYquveJuNOXdH9I0wXvv90XBaylvrsG
 VeXXMeVszGQw/FnHwKWlZyhm54KXlk9e9w5acc4/QXbD13LNqbfg6ips
X-Gm-Gg: ASbGnct9LiDkva84PhK4ECXC7J9BDlDok+ozbXerQvWRMiSV1AmZCNAbFwq8/4Up85/
 RdBNGG572JHMDMKaIrkYYtyQfma6fzv2sfgpbCA402UHTAI0p+NKXByRBrZi9SnvRKG82FvlU+P
 lNXEOfjFhGPu5dXRSNMd4h8YAjmpq8DvHIVqFRKD5oWmdYNFqnEnq8g9k2Mv4sfKvX+5fU7IPp9
 /GGrKdwEaqCpVsgRwLoWYYB17NrHS5vQcCKnXVYFXp9YFk8BfMVJ4qAb1Emm01aPN+KqTvmDPNd
 GDSzyTqLGUFEjBBc+l9/VD43QI7A6mUrbTKwHCPnzdLp8NgeQVvO6wBJS7CYE5pB6d7+eVW650s
 8d15Ai6ItyN25SI+31L0p1wuMdAdI5u/tHbkNymyC2QtKtg==
X-Google-Smtp-Source: AGHT+IFr36RJW7E2yGF/wK6VOECemQL0w3KvaSXVwzVEKkJL8YL3TLKGhXqDsUzljxD7JqPtJ74H6A==
X-Received: by 2002:a05:6000:250e:b0:3c8:c89d:6b5b with SMTP id
 ffacd0b85a97d-3d1e01d2f18mr17441129f8f.48.1757069649105; 
 Fri, 05 Sep 2025 03:54:09 -0700 (PDT)
Received: from imac ([2a02:8010:60a0:0:8157:959d:adbf:6d52])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3d9f3c36a78sm15388611f8f.48.2025.09.05.03.54.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Sep 2025 03:54:08 -0700 (PDT)
From: Donald Hunter <donald.hunter@gmail.com>
To: =?utf-8?Q?Asbj=C3=B8rn?= Sloth =?utf-8?Q?T=C3=B8nnesen?= <ast@fiberby.net>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>,  "David S. Miller"
 <davem@davemloft.net>,  Eric Dumazet <edumazet@google.com>,  Jakub
 Kicinski <kuba@kernel.org>,  Paolo Abeni <pabeni@redhat.com>,  Simon
 Horman <horms@kernel.org>,  Jacob Keller <jacob.e.keller@intel.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>,  wireguard@lists.zx2c4.com,
 netdev@vger.kernel.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 11/11] tools: ynl: add ipv4-or-v6 display hint
In-Reply-To: <20250904220156.1006541-11-ast@fiberby.net>
Date: Fri, 05 Sep 2025 11:53:46 +0100
Message-ID: <m2cy85xj9h.fsf@gmail.com>
References: <20250904-wg-ynl-prep@fiberby.net>
 <20250904220156.1006541-11-ast@fiberby.net>
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

> The attribute WGALLOWEDIP_A_IPADDR can contain either an IPv4
> or an IPv6 address depending on WGALLOWEDIP_A_FAMILY, however
> in practice it is enough to look at the attribute length.
>
> This patch implements an ipv4-or-v6 display hint, that can
> deal with this kind of attribute.
>
> It only implements this display hint for genetlink-legacy, it
> can be added to other protocol variants if needed, but we don't
> want to encourage it's use.
>
> Signed-off-by: Asbj=C3=B8rn Sloth T=C3=B8nnesen <ast@fiberby.net>

Reviewed-by: Donald Hunter <donald.hunter@gmail.com>

I suspect there are occurrences of ipv4 or ipv6 in the existing specs
that really should be ipv4-or-ipv6 but the python code doesn't care.
