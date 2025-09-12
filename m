Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBB0DCF34C0
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 19 Nov 2025 14:47:46 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 301a4255;
	Tue, 18 Nov 2025 17:32:17 +0000 (UTC)
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id a1290f17
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 12 Sep 2025 12:08:51 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-45df7cb7f6bso9793325e9.3
 for <wireguard@lists.zx2c4.com>; Fri, 12 Sep 2025 05:08:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757678931; x=1758283731; darn=lists.zx2c4.com;
 h=content-transfer-encoding:mime-version:user-agent:references
 :message-id:date:in-reply-to:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to;
 bh=PqPZ8RULX7eu8BAG8aFIfDKASv+ULLACp+JE+crY35g=;
 b=jl2JAvNAVqdGXNnTxsX1+eTQ/s0FiMwS4ZmP5OpTdeZ9iW2jcHPUpx3T/ALUXGA1EM
 4cVtkGut5HOI46VQ5SJ30ewWq7V1IS6k6Z7mw1SEuybmv8MDUfHLMoDAv7+1BdGDNUSd
 mhXAan3yXTiycnvHCnm5h5ukWbqjylsv1OI4yfZgVBJIl0yWUQwN4zqZPgI9UH98dY6p
 tQ0T5eBMrJisaNirkRwe8/5GpPzsJ5P1m9CMhgIqszFV/XP7gtNluA4oV/wt+AJCrdpF
 2Zs6JdvYCCIyecBEcydJWA5m4YOC2pjHzoBM1SeuGVoWE9LEnFlWSGtBEDrTzh+iP8e0
 V6+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757678931; x=1758283731;
 h=content-transfer-encoding:mime-version:user-agent:references
 :message-id:date:in-reply-to:subject:cc:to:from:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PqPZ8RULX7eu8BAG8aFIfDKASv+ULLACp+JE+crY35g=;
 b=gdWqWxMo7pT1xBWrA0Y/inbMftS7ScO2gxvbYg0eeO8j73MJc7nPB2QGRFLCue3pZj
 Tn2mKTK5m5ghyhsV+gcW++O+Z+wBfCzEj0z7MuBWinKZaNPKzxwnwe0Qiavg7YKmkZ1H
 CZkC5d3lgxBfAcrbAG3VgHuR6zB0GlqjbQqnrO3DtDy6S38AdJCRHczdc00UBgfhbV93
 3QQ+WISaHl7k6MAIrxbt8N1DGKCRLzHx8bSgi4SbdbrSA+zVvEHDz93F5Wo6uy1ohScR
 f/mXZ12q9yHV4lTLcRkI8iRZ48stzRM+2/vS6L4AI3sRTataRq8ZEJqAFTr6mYAlOiHX
 W2pQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXGpe5DEOfq7BKTc9yD2eje1djgpgSs+kwkBfaRjvrYkjyfnC3i9DgBnmqxuXen3pw0J13DzB10tDM=@lists.zx2c4.com
X-Gm-Message-State: AOJu0Yy6XMe70QHMNRR7VdOCH/nOYz2B4HleDlOY+Zj0Rv5oed8HfXV4
 pJ/S04vDi5aHF0HwVn4NgfvwRMuuWuLru5ckbnsTAHbxcxUTWDPsrFPu
X-Gm-Gg: ASbGnctdWUDcF6EaMteSuLtnGhpfoXq8MsZIErBWPE+px2RicFlrc2cSMvGxKqsr46L
 FjLBUEYHhkewkPXbYx69U2BrzW81BJaFTPcREwqLFX+G2cpKDFZOJedvKL2GIuvVnHFlu/wKlqb
 KrePVQLYM/49AiEDzX57XDLLcaBCk5+bBGkd5XQscvEmUNEVOty7zaoshAFVbCH86ySOJ6MNXcl
 F5xySG2Od0uqDWmKm121evW40ezxUR8ykp7MAdevUjWYiXmdrjp1H1uoPXgFIdUKkEH4q86M9Lm
 AxAm1gknA9q2l1HrRsJG9G+ChwFkr55eACDxm9/8b1Gm8JA3PB4ELQGStEz+zvasBBeT6Mk8jlp
 c2xWX0M8kfEhiq0J10SD36RUot+L9R0oIwCBm/CnDXFl0
X-Google-Smtp-Source: AGHT+IFcON1v4F5KgBV9t7GPfhbJioy7Wd6FGUuDsb9CuUxnRc9simG96y0fBd2RO2HzmYnS97o6Tw==
X-Received: by 2002:a7b:c84d:0:b0:45d:da7c:b36 with SMTP id
 5b1f17b1804b1-45f211f67camr17284045e9.19.1757678930584; 
 Fri, 12 Sep 2025 05:08:50 -0700 (PDT)
Received: from imac ([2a02:8010:60a0:0:18f9:fa9:c12a:ac60])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45e037d7595sm59573645e9.24.2025.09.12.05.08.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Sep 2025 05:08:50 -0700 (PDT)
From: Donald Hunter <donald.hunter@gmail.com>
To: =?utf-8?Q?Asbj=C3=B8rn?= Sloth =?utf-8?Q?T=C3=B8nnesen?= <ast@fiberby.net>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>,  "David S. Miller"
 <davem@davemloft.net>,  Eric Dumazet <edumazet@google.com>,  Jakub
 Kicinski <kuba@kernel.org>,  Paolo Abeni <pabeni@redhat.com>,  Simon
 Horman <horms@kernel.org>,  Jacob Keller <jacob.e.keller@intel.com>,
 Sabrina Dubroca <sd@queasysnail.net>,  wireguard@lists.zx2c4.com,
 netdev@vger.kernel.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v3 06/13] tools: ynl-gen: deduplicate
 fixed_header handling
In-Reply-To: <20250911200508.79341-7-ast@fiberby.net>
Date: Fri, 12 Sep 2025 12:24:32 +0100
Message-ID: <m25xdnvrpr.fsf@gmail.com>
References: <20250911200508.79341-1-ast@fiberby.net>
 <20250911200508.79341-7-ast@fiberby.net>
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

> Fixed headers are handled nearly identical in print_dump(),
> print_req() and put_req_nested(), generalize them and use a
> common function to generate them.
>
> This only causes cosmetic changes to tc_netem_attrs_put() in
> tc-user.c.
>
> Signed-off-by: Asbj=C3=B8rn Sloth T=C3=B8nnesen <ast@fiberby.net>

Reviewed-by: Donald Hunter <donald.hunter@gmail.com>
