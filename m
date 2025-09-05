Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C1E4CF34AC
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 19 Nov 2025 12:56:27 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 443abdd5;
	Tue, 18 Nov 2025 17:32:02 +0000 (UTC)
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 3fce2b87
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 5 Sep 2025 10:54:03 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-45dd5e24d16so7654995e9.3
 for <wireguard@lists.zx2c4.com>; Fri, 05 Sep 2025 03:54:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757069643; x=1757674443; darn=lists.zx2c4.com;
 h=content-transfer-encoding:mime-version:user-agent:references
 :message-id:date:in-reply-to:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to;
 bh=nWqeEYLMHIq8h3v6YSLMC28H8qUubeFkyVGEl+EW9eI=;
 b=jdiGoL84A2Poz+aAjGZ7giZwNNTMohv3WEIxXoWhyZkYzmvennwVuKb8W6uRoUmHEQ
 J1C3FsnaNpRzqgcz1uBNNaqL1GIKJLV0Dm6fi4tDlT7zWU52IXapY2zqxP8lH715NY+d
 rUA7TTacE9s+qFNMNnpO/Twj6gwiNQXdxElghFsq4BjoJJEnRp09GA8RENOO4QGmMv3B
 mKESPsaCjATe8MCJUDNCZDyLkJloa8tBfVAolrh2lVHFuK2ZitY8ypOBm9n27crxF0+Y
 0dp96E7mxr25HH2UjOczuZJxVJyOHl08TG+Mdnf/7tggKP77Tbw3ENUCogpckhjKfx1G
 EmFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757069643; x=1757674443;
 h=content-transfer-encoding:mime-version:user-agent:references
 :message-id:date:in-reply-to:subject:cc:to:from:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nWqeEYLMHIq8h3v6YSLMC28H8qUubeFkyVGEl+EW9eI=;
 b=mZnEveJv3YHE8KXaNJ6g3oQv2FHk5EJ4/GaVGULGCawx+5H6DOaIEjUx9HMKXsFRDr
 ZbD1g2gOPLsWU4TKBps3OkRXc9DXGZuxg9fFaP0xjknHBX6DuBiWwAOzddD590AcrR7M
 AtiFe6fmCN83GWe5Ex5NEbcZ0AGvEcBxfBJwzZTdwnc1eKj37sEXRCuNA4hBlUGLeabJ
 w43hO2rYKZk6TKEhfdEgbCZlj+Acp0dzLx0/WSzShelUA/HBAckaMjLPu1sDLqP2g0K3
 OjcNzWjEekhTdx83Ul7D2iij+AERUXzGkFEjmtEOKV15vhxvROJ3h62uzB6gVNorUASA
 Unag==
X-Forwarded-Encrypted: i=1;
 AJvYcCUBEkwHiV7JfivtjjeepYvBKVz49/qXmlO+/NNKLeKdcx4oMRlbt9sAduD89YtFnfhlgVkZurD0Y9c=@lists.zx2c4.com
X-Gm-Message-State: AOJu0YxN9glMbUwGmGWopVOMVwcn55tPAf7af7VJArEf7V7R7v+WAboJ
 C686wewigKYsrqRyD7BKyFUyqLnygKU8R9O6rwFt8Qzg++f/5HN/AhnR
X-Gm-Gg: ASbGncvLXpxs0r3YmqkNhYYvnB8h/PJfgt6cG/he6khX73a5V7ZjkIOF4OoSRJNMhs3
 wU0KlbESbDzEA28iAYQ6/3oY7eCBExPe9MI6a27DAVFSpmE7rKN9srW7k9+8kNneS943l88PmuJ
 bbriEmSPsrpO1iZRC8wD6ChQd6x5JNO75Vn7F67ieAKkd1w4FwDJVviBrOt2scuC5W3TuJ+6fDc
 7mKgt2UBy6Guy7UzCS0mehdrGgyFakh8GVp36wPWXNRe71ieYLS+J1r1YDoLdA9uwIcmhTFplKk
 tjN0gH3rdH9qU+qcmVH7ahioEaDMrjKFmHuIclVDhfe0tlL0r/D4Xa6SlqxCSKTuM7DENW9fxf7
 8tmMevnkEv9MRvTRUvko1ZtyMHkj9kuz9F+RPI7AFbPRuCg==
X-Google-Smtp-Source: AGHT+IFre4je9aX0hE0DtE7GN22/+c6dGLc5GGdRk67qwV6Xk/fcd1S/XONZz/Y4orXr60TEmO3k1w==
X-Received: by 2002:a05:600c:4692:b0:45b:5f3d:aa3d with SMTP id
 5b1f17b1804b1-45b85570b4cmr169521185e9.21.1757069643241; 
 Fri, 05 Sep 2025 03:54:03 -0700 (PDT)
Received: from imac ([2a02:8010:60a0:0:8157:959d:adbf:6d52])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b8f2d3c88sm192332845e9.19.2025.09.05.03.54.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Sep 2025 03:54:02 -0700 (PDT)
From: Donald Hunter <donald.hunter@gmail.com>
To: =?utf-8?Q?Asbj=C3=B8rn?= Sloth =?utf-8?Q?T=C3=B8nnesen?= <ast@fiberby.net>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>,  "David S. Miller"
 <davem@davemloft.net>,  Eric Dumazet <edumazet@google.com>,  Jakub
 Kicinski <kuba@kernel.org>,  Paolo Abeni <pabeni@redhat.com>,  Simon
 Horman <horms@kernel.org>,  Jacob Keller <jacob.e.keller@intel.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>,  wireguard@lists.zx2c4.com,
 netdev@vger.kernel.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 07/11] tools: ynl-gen: rename TypeArrayNest to
 TypeIndexedArray
In-Reply-To: <20250904220156.1006541-7-ast@fiberby.net>
Date: Fri, 05 Sep 2025 11:44:48 +0100
Message-ID: <m2tt1hxjof.fsf@gmail.com>
References: <20250904-wg-ynl-prep@fiberby.net>
 <20250904220156.1006541-7-ast@fiberby.net>
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

> As TypeArrayNest can now be used with many other sub-types
> than nest, then rename it to TypeIndexedArray, to reduce
> confusion.
>
> This is a trivial patch with no behavioural changes intended.
>
> Signed-off-by: Asbj=C3=B8rn Sloth T=C3=B8nnesen <ast@fiberby.net>

Reviewed-by: Donald Hunter <donald.hunter@gmail.com>
