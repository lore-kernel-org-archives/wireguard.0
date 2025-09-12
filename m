Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A00EACF34B7
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 19 Nov 2025 14:47:48 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a29389b3;
	Tue, 18 Nov 2025 17:32:19 +0000 (UTC)
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id ffb6f397
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 12 Sep 2025 12:08:57 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-45de287cc11so16067735e9.1
 for <wireguard@lists.zx2c4.com>; Fri, 12 Sep 2025 05:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757678937; x=1758283737; darn=lists.zx2c4.com;
 h=content-transfer-encoding:mime-version:user-agent:references
 :message-id:date:in-reply-to:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to;
 bh=AuxBhXYIf5asuisWxd1fF0vikMlauZb1ySpXLM4BDYU=;
 b=GCJmUPkngdagmueh2XI9Rj3KFWEEsRdKR2UdThCqvcn6Plm0QYE/2psiVohJHCa88Q
 nGcDtwesTRjmBHanVPpFfpvbQTB3pcaZ1iUcCQ+0fxhunHJodlHrH4uw1Q4qsXNgpZez
 Nvn8XQbTYP8nWXEgWS8Yr97BjRkhO2gOZzoTE9xJMifCw+lZh6erKqOA79H5+c6hehvU
 uweaHPdYZ3mX2N/y0cVVEHxw8UNpOQoBfGTs3Fe4mALS+3WChwF2NPltWiCorYEnCYZQ
 Ki3z18LibX5KKwDFRLI3RdFTrk2l+KoSZR5t7yTybUfvgtKJ0w0/Eh64Nmz39ZGfE0n8
 9j0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757678937; x=1758283737;
 h=content-transfer-encoding:mime-version:user-agent:references
 :message-id:date:in-reply-to:subject:cc:to:from:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AuxBhXYIf5asuisWxd1fF0vikMlauZb1ySpXLM4BDYU=;
 b=T8Ke9tX7R4MSppA2dHcz4C/IObb7aZOw4LhO86qc0FvVQaH2dua5QFgN3Gecwnr0J6
 3YDs0ejDI3Y1XbvWbz9qyUsVWqLFlEn7LtYMgBy+o4yMZWhm4CHYmiLBxg+a6AqXyjtp
 rQwK4Ok/viEutDllaxc0voyTBRSOtX4q9fd9jgZotW/yjUiWG7+ZLjctb3DLeWbbnj8v
 s1gKOeAtsOfoDQyXjGGXW2NGj4KAKbQnaq+PshozcPcozFyF0lJWPnXFbvzeMCvJPfhd
 kq82hZUprtEbSwKVS2wdhCpMIGzPf7VKkiwQiuyCa2AggtUE376kjEQkWzTIzsFi31E5
 eF2w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXsgtjdBaw9COtdP4FLj76cLsTyRy4EC+lU0bZ7V3Eq7z/Ftg9MYoreb2CMe4vn88ghghuQ9nirdPc=@lists.zx2c4.com
X-Gm-Message-State: AOJu0YwWepXKvK6dvVOidoWc36cfRutUWL/sykqmnWj5MOeWJshMzwvZ
 cTYqAL/7BBPmSk4kdmY3lRmafcx9geUQv93TbQKDWg/WDp+0vvBSGmn3
X-Gm-Gg: ASbGncu3aF8MJAbJ/NYFpSuhsRY/ljscvMnWRP5W9ZczqxwTU6O4iRhDqnpoB8C+Fle
 ZYm7kQHR26aTcNeUnzmuMej7RT8QT0+MCG6M7YzFwjOFmZTdeQxSCLCXJkuEurl4R1BQ+8h4dVA
 vZups1VQuYQLhblTCUQuKHPuDs2mTRrBQyAKhvJlOyP7nLtqu2V5bPkmvC2yVB7YNpfzOs3EaLm
 KnxBi2VvwU1rOVxxg02FXMEwpdVnrlI+Ry28qlGWjIwv/+PmraxW87U5nArBU9+HYYdIRXCI13S
 eON/v+g0zD8CZFTVGTstA7/s/ZCM6j8TicM0a+q448TpZfLaYkIEZQngZf+3tdgFiyYB28JMZX6
 iM6tv/CDdmYHYwa0HlkEmMAzUl3HdvLWAwA==
X-Google-Smtp-Source: AGHT+IHXNEYZ8zt4iDcGj+Ej24DzoTie67SzfFJOypYfKefxWkzvz2zcFJy+fpJUKaaXWFGXQhh7ow==
X-Received: by 2002:a5d:64e6:0:b0:3d3:6525:e320 with SMTP id
 ffacd0b85a97d-3e765a23893mr2442300f8f.29.1757678936577; 
 Fri, 12 Sep 2025 05:08:56 -0700 (PDT)
Received: from imac ([2a02:8010:60a0:0:18f9:fa9:c12a:ac60])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3e7d369ea3bsm616186f8f.0.2025.09.12.05.08.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Sep 2025 05:08:56 -0700 (PDT)
From: Donald Hunter <donald.hunter@gmail.com>
To: =?utf-8?Q?Asbj=C3=B8rn?= Sloth =?utf-8?Q?T=C3=B8nnesen?= <ast@fiberby.net>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>,  "David S. Miller"
 <davem@davemloft.net>,  Eric Dumazet <edumazet@google.com>,  Jakub
 Kicinski <kuba@kernel.org>,  Paolo Abeni <pabeni@redhat.com>,  Simon
 Horman <horms@kernel.org>,  Jacob Keller <jacob.e.keller@intel.com>,
 Sabrina Dubroca <sd@queasysnail.net>,  wireguard@lists.zx2c4.com,
 netdev@vger.kernel.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v3 12/13] tools: ynl: decode hex input
In-Reply-To: <20250911200508.79341-13-ast@fiberby.net>
Date: Fri, 12 Sep 2025 13:01:48 +0100
Message-ID: <m2o6rfubf7.fsf@gmail.com>
References: <20250911200508.79341-1-ast@fiberby.net>
 <20250911200508.79341-13-ast@fiberby.net>
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

> This patch adds support for decoding hex input, so
> that binary attributes can be read through --json.
>
> Example (using future wireguard.yaml):
>  $ sudo ./tools/net/ynl/pyynl/cli.py --family wireguard \
>    --do set-device --json '{"ifindex":3,
>      "private-key":"2a ae 6c 35 c9 4f cf <... to 32 bytes>"}'
>
> In order to somewhat mirror what is done in _formatted_string(),
> then for non-binary attributes attempt to convert it to an int.
>
> Signed-off-by: Asbj=C3=B8rn Sloth T=C3=B8nnesen <ast@fiberby.net>

Reviewed-by: Donald Hunter <donald.hunter@gmail.com>
