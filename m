Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ADA4CF34A9
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 19 Nov 2025 12:56:27 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 25c17af5;
	Tue, 18 Nov 2025 17:32:03 +0000 (UTC)
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id f0198aae
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 5 Sep 2025 10:54:05 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3d118d8fa91so552135f8f.1
 for <wireguard@lists.zx2c4.com>; Fri, 05 Sep 2025 03:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757069645; x=1757674445; darn=lists.zx2c4.com;
 h=content-transfer-encoding:mime-version:user-agent:references
 :message-id:date:in-reply-to:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to;
 bh=kKIEovFREh+RMQK1agLNyNMEj8+i63lgwl8odv/dpPw=;
 b=kKa2UG11H7eCcRQRtMTJzL3TkLW/lrsKug4JH0BWCJl8JnepoOJ9ZFq+MF2Uz7uFpf
 YGR9qiRZJ5s9FgAZRU9XNq1TkQDtO+BG3DaAk636knU+wvxMaJ98+MDdn+meUWMGlqg4
 ZDyBZXb5uFNoLtIndOXRh3X8vKEj+nH4u0meptxfMjS0B+91L1X0n6BND5dSluW3YDPe
 tezm4tGw+D7WdOfJ37xPR/HZQ2fKOquaNsgtK18WU7f/P/ItLCtRayrikSG4B1MJ1Gx2
 rhE7x9erd9ReouFwYiFNTXoarOpRN1kYMowEK8r8ZDwYcSNXlEC3YmYKqFA9j5/Fd9eI
 Mwpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757069645; x=1757674445;
 h=content-transfer-encoding:mime-version:user-agent:references
 :message-id:date:in-reply-to:subject:cc:to:from:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kKIEovFREh+RMQK1agLNyNMEj8+i63lgwl8odv/dpPw=;
 b=eLL94MJMYlzE42zHBX7j08hLuOoRfDw4SPeSYynBavtYkXPu4Q/OWQFH5nuQxP9iAz
 6LxQ/8vp6aOIbzhMANohGHhWLG9z2hvTJN1uMVo/aW4u2DJDTuYyj4niK5fHeVcEFYEF
 5wqH+Tx/84VITpqEBlHV6KrTveKU/lLZ/HFgKpdWJIhGZ8xgP0wYyntFCyfq2GP5YZoo
 qlmBcCjdajmRUfvjoBKn1coox7t2Hpm1Iv5bB8a9zVdFHap1QGUdte8DUPYz0YiX66Rh
 1jgGdL5F3rr6d6cRoMGeYV5kJDxTW1PVvmcM4pUnNvCyOBGmAhGYPj45IR90qqsO4qZN
 HLpg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUH8VTePFD7vAeBPImnt1UboOF92dx4kyZi1cGcS272HH8GXXYzHlsEsHtGb/P1l824jL1/mkU5yfA=@lists.zx2c4.com
X-Gm-Message-State: AOJu0YyuuBdS2Icu1KrchSFvLdRIITidPZdOSQLcq333bsgCRZUeElzN
 Jj3v/JfMaxHenPGMoFYa5GuCyeYh06G6q+HRaPDV4kL1FEBO5rZpiLKH
X-Gm-Gg: ASbGncvCPey2Dp7UrRe4+Vsmpgx++Uc9iWlYtNi3NJcXILYSZLhJun+2q9BI8qnkVPl
 /kNiFBAQ2moW3kCQ4+zMCSORbVsJgSW7loOqnHorhQx70cfCH3PZSVo++Qbu+KmkRBn83tPUV8A
 7TqFl0aZlO0mJ12+HPichUo4V54EZu4RGdiTznvGRCzOYxk60X0TYDjI8aFJJnV4BHqSgYqnmb2
 lvhOgFZo/tUSTEuNU9TaRaDXWEK8N5Ov6d8PWmRU+28mM4Sh0liOvM7Uccno5HruekeY5DnKo/f
 KD5nf4Cs0JlHLG7lOk7bV0DmDgJxhM8uXJbqrLHfMVnua2QufWpcZQfWN/5PGte+dKc4KBERnUQ
 wvsft66wi5egRIy2sKtdYKW8ENlI8doTTHqJjnQElWyzSvg==
X-Google-Smtp-Source: AGHT+IHxGOCnDwrLnrDrI91qnSsK6syMZ9DOdu1bcAn2K/11lIA4Xxelsfj+qwKYrbNR8DYfn66WCw==
X-Received: by 2002:a05:6000:26c1:b0:3c2:502:d944 with SMTP id
 ffacd0b85a97d-3e2faa20867mr2786820f8f.0.1757069644718; 
 Fri, 05 Sep 2025 03:54:04 -0700 (PDT)
Received: from imac ([2a02:8010:60a0:0:8157:959d:adbf:6d52])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3d21a32dbc5sm28607491f8f.11.2025.09.05.03.54.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Sep 2025 03:54:04 -0700 (PDT)
From: Donald Hunter <donald.hunter@gmail.com>
To: =?utf-8?Q?Asbj=C3=B8rn?= Sloth =?utf-8?Q?T=C3=B8nnesen?= <ast@fiberby.net>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>,  "David S. Miller"
 <davem@davemloft.net>,  Eric Dumazet <edumazet@google.com>,  Jakub
 Kicinski <kuba@kernel.org>,  Paolo Abeni <pabeni@redhat.com>,  Simon
 Horman <horms@kernel.org>,  Jacob Keller <jacob.e.keller@intel.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>,  wireguard@lists.zx2c4.com,
 netdev@vger.kernel.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 08/11] tools: ynl: move nest packing to a
 helper function
In-Reply-To: <20250904220156.1006541-8-ast@fiberby.net>
Date: Fri, 05 Sep 2025 11:45:23 +0100
Message-ID: <m2plc5xjng.fsf@gmail.com>
References: <20250904-wg-ynl-prep@fiberby.net>
 <20250904220156.1006541-8-ast@fiberby.net>
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

> This patch moves nest packing into a helper function,
> that can also be used for packing indexed arrays.
>
> No behavioural changes intended.
>
> Signed-off-by: Asbj=C3=B8rn Sloth T=C3=B8nnesen <ast@fiberby.net>

Reviewed-by: Donald Hunter <donald.hunter@gmail.com>
