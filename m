Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C1B7CF34AD
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 19 Nov 2025 12:56:25 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7f0b57be;
	Tue, 18 Nov 2025 17:32:00 +0000 (UTC)
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 2ea9c4c3
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 5 Sep 2025 10:54:01 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3d19699240dso1849430f8f.1
 for <wireguard@lists.zx2c4.com>; Fri, 05 Sep 2025 03:54:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757069641; x=1757674441; darn=lists.zx2c4.com;
 h=content-transfer-encoding:mime-version:user-agent:references
 :message-id:date:in-reply-to:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to;
 bh=3PE2H9c4PU9mZ+3SQGTV677ZdVh4m7lyinNpMQnj4Uo=;
 b=EyJ9uOsw82VIaMi+jNe/64vK42rd8Zz0oWD9HeRn9c++F3uNgZal4Y6MmxddExVv/B
 HS9vzsgeLIZ6brh6pAbLEX6e3+sUnWUSbT/smMMrQF2wkC67FOEWID1bx8I/DzFzYtCB
 dAa6HdsKtgS37Vy9kJXuzMUNbrPBRcAXLIsjao1q0taB0tmGRRJtdg2KvyNIK0vnHIEY
 NfDIxi8TUI+22xvo6DauAq/4P2lzT17ARHn5MZ+X1qREoL3I/ZdQXBcxweeTNiqEAa8z
 AbxiT3RbBHYwijQ3vEFmGXduQiLgS6HVW4imkMel/wISoVOWGOLlLNaSAfUbTlwOQa20
 x0SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757069641; x=1757674441;
 h=content-transfer-encoding:mime-version:user-agent:references
 :message-id:date:in-reply-to:subject:cc:to:from:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3PE2H9c4PU9mZ+3SQGTV677ZdVh4m7lyinNpMQnj4Uo=;
 b=GkKQJyy3lsqUqdlxMZGQF6vWHJY3ZvGwR2flAtaVIsAcsctV42+WGcrrOoS7cP+i+z
 cyy+CT7U2njDkRa5DQpc1/dyzIydb+g7Dt8su0fNvX1mYe/B6MIOXZKSxwO7yiCYMJFS
 kE5meH0adNWjs2ELzidsXunko+po7G2lQ8oVpiidFUawA5jtpl4cWBdksd+xGIXJQSBN
 OwgWbDzbrzJ0RXp3LmYGnquEr1bBMU5QO9B5TDZA33bj8qtEtQxLhRsaEGDjp8j52Bg2
 OCIouJV7BOFa0qeume/W4QzGA1DBZ2bLHQ1Edy8yM2IQlxpFim/7a5GOm8mi/ju2QXOI
 a5DA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWKEogcmZSzt1zxJWRZOPiF0x5AQTk9qnKDfh7YTy2sF6oghPmgng4YhnmZmrZL6cGRNLBive3Qf9U=@lists.zx2c4.com
X-Gm-Message-State: AOJu0Yxfd2C+RBdoRNwpoGLStLZOJKMhLxMO7mlVuFyrRdUsp2PF8yU1
 k5LD53pbp2wE2v+w3ChpiO8VAtifvFSlUMtD9ozdw+VzwE5LfwCNiG7v
X-Gm-Gg: ASbGncvATLI64g+vFQjZ9m8Ws2twIAibrSKVjoQV/5pPfr8QoWEVno7P+2Tiikzo9ry
 EQhdI0OSgKiSeXacGUQTvNVdByGHfPJtOtQTSw7i0aOy7SMZG4Zq9OTPEiAcz8i3oizQ8jk24SC
 H271rG3gb+gdbFDbT/RXheujXKXlabAUnixDpWTfYrZXHdqjF2Df/iPtwehwv5TD6B2nsOZqy+6
 6gO7qK4fHY1yEip6ZMqw8BbzNE65lUQOmnQ7IqgGFROx4rbmiJPSDb2HuUguI4fLTbPeh6h3RJK
 SSHM7eN2wypQuxhtrQNBDff68hWZQBAX33tOekxa97vC/+hKBz2X8XUbYWVUzW6Nup82PeAGmvc
 Z1FZIi0q8WjKbDoJNEunNhCu3l1/FqyWWWvWv0oDnPatkmw==
X-Google-Smtp-Source: AGHT+IGH0k2jiW81eo+bdHP+jTd9GYQqAP7UqoTgWM33icxIe688vEVyRB0t11dPEBCY6nUUQ6kJ1A==
X-Received: by 2002:a05:6000:22c4:b0:3ce:7673:bb30 with SMTP id
 ffacd0b85a97d-3e3048266c8mr2409575f8f.14.1757069640448; 
 Fri, 05 Sep 2025 03:54:00 -0700 (PDT)
Received: from imac ([2a02:8010:60a0:0:8157:959d:adbf:6d52])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b7e8ab14esm355347405e9.21.2025.09.05.03.53.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Sep 2025 03:54:00 -0700 (PDT)
From: Donald Hunter <donald.hunter@gmail.com>
To: =?utf-8?Q?Asbj=C3=B8rn?= Sloth =?utf-8?Q?T=C3=B8nnesen?= <ast@fiberby.net>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>,  "David S. Miller"
 <davem@davemloft.net>,  Eric Dumazet <edumazet@google.com>,  Jakub
 Kicinski <kuba@kernel.org>,  Paolo Abeni <pabeni@redhat.com>,  Simon
 Horman <horms@kernel.org>,  Jacob Keller <jacob.e.keller@intel.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>,  wireguard@lists.zx2c4.com,
 netdev@vger.kernel.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 04/11] tools: ynl-gen: define count iterator in
 print_dump()
In-Reply-To: <20250904220156.1006541-4-ast@fiberby.net>
Date: Fri, 05 Sep 2025 11:37:58 +0100
Message-ID: <m23491yyk9.fsf@gmail.com>
References: <20250904-wg-ynl-prep@fiberby.net>
 <20250904220156.1006541-4-ast@fiberby.net>
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

> In wireguard_get_device_dump(), as generated by print_dump(),
> it didn't generate a declaration of `unsigned int i`:
>
> $ make -C tools/net/ynl/generated wireguard-user.o
> -e      CC wireguard-user.o
> wireguard-user.c: In function =E2=80=98wireguard_get_device_dump=E2=80=99:
> wireguard-user.c:502:22: error: =E2=80=98i=E2=80=99 undeclared (first use=
 in this fn)
>   502 |                 for (i =3D 0; i < req->_count.peers; i++)
>       |                      ^
>
> Copy the logic from print_req() as it correctly generated the
> iterator in wireguard_set_device().
>
> Signed-off-by: Asbj=C3=B8rn Sloth T=C3=B8nnesen <ast@fiberby.net>

Reviewed-by: Donald Hunter <donald.hunter@gmail.com>
