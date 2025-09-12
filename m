Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDB22CF34C2
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 19 Nov 2025 14:47:47 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f17acbfc;
	Tue, 18 Nov 2025 17:32:18 +0000 (UTC)
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 0dd0f7ed
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 12 Sep 2025 12:08:53 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-45cb6428c46so21829155e9.1
 for <wireguard@lists.zx2c4.com>; Fri, 12 Sep 2025 05:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757678933; x=1758283733; darn=lists.zx2c4.com;
 h=content-transfer-encoding:mime-version:user-agent:references
 :message-id:date:in-reply-to:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to;
 bh=Wz4E5peEWJEuLH5HpKzn2maiOPcV7d/t/JntClDMc3Y=;
 b=nPom/foY/oM7OZXChMNxT+g25EWAvKMBb+H6XhKCFeCPf5WLTdFJqzoeZZ0/K3+PG/
 yUWc83KNHG1/IC+H4HMI/wp5mnMlFluMh/sIDwQRjHI95BxJ2Fb2b65unXhO1gHYqu9P
 0zNLgSf+wOQL/yRQM9BOxWplVWY/9UgWshwndOrLLyuDWR+VAMi3JoqQE5/9zvqQzn1d
 D7fHsPcWpS+yalakXed2To604f2QRcIMQkv6+rV05MacT1De7AmShPVKVEvLrblgVWeG
 aC0pOuh1vTq8V9HJaQVtnnC9beWMsoVEOm3ELLGB0h21JSA2TIE/eH6ng+WeugQEJmvF
 l2Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757678933; x=1758283733;
 h=content-transfer-encoding:mime-version:user-agent:references
 :message-id:date:in-reply-to:subject:cc:to:from:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Wz4E5peEWJEuLH5HpKzn2maiOPcV7d/t/JntClDMc3Y=;
 b=CjqmmP/WpY8hzPiP9HlOfkPnx57gx++sUrrRuKLgBRDPjrjqTJno8ZLDQnJTXoHPEA
 /nCNyg7/vQilWCVtkSK+F7VjQ0HfMmsKiJ1/BGjaqmMGGLjybgLM7y8jgJ4q1kGtXm2h
 vuMr1+ciWGwljam4ixLWgBBYuHvWUka/YSrnI3/FcX9MHxahBazNFMHFbIq/knxzA1kg
 tPFRLJc7QYXnJbrT/WA1SFAiwszS+GnPRz8QEj1saM8XWLiFgOAVQCH17kwQVZC2+TGN
 oTNMsMw1+SoZ8yz5JCbGdESbBQELmNnjJmxa+U5KOr3lvmNJuoQwkw1iLt/39Z4FCzTE
 1ubA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWFQKfJNPkqK9LHwnPO7R3fjVe+7Aam7ZdmjC6uBczChNqbxr2jfi5G9fptkc6caEUpCCYEQDjuAgk=@lists.zx2c4.com
X-Gm-Message-State: AOJu0YxFCQ10PaNZoajqFRYpy9lpbwjkQvIjuFrDN52tHZ3uRkbMBaDU
 7GKikWOGdh6kL1YUnr8iQEhZoUWG9LwmlqLXNUt39iyaCx+9Rf5as4KY
X-Gm-Gg: ASbGncuedk9B7gStGEfRiaR/EQQ2LFANYEt4N8zR+gsnKN/Rlh7Wrcw6TQpzAsGxkGj
 MVVN9tFRsA+lFfPIFbPTMWV+6sbJtiQDD4k5lEZxclRY4XKrAhVcIQZ4bUGkaaueiu3bVif39jc
 wJHi+/Nc7KWvLO4X3nWY8JVYnMK7dr38gruLz0H9IXCOiB+1gfOG8AmNe9GbUv1ArgC0ZOQWdBb
 RVfEOFxCh0FNkC3Ww+buuxI2wz4wFzIgdZVegNxaLq3s/6G4/SFvy6HezG8nu87kzDjFaL8yvo/
 jPnw/a7yfF8OjQ0hgL1F3gK5FvuQrwzdSmjK0NstT8Obkmy+IAMKDdt/htZ+mMtr4JRIANp8pda
 J93npmELlq4ya+7B2ZSwDWmr+k+TY3MHHknrtkRLFltFn
X-Google-Smtp-Source: AGHT+IFBSzBHrD878oYYF5kKGavS67qgNolUi5Ck7EzGdSc891Ykev73AV+0ueAWDKAT71qdNTJHOA==
X-Received: by 2002:a05:600c:1d2a:b0:45b:9c93:d21d with SMTP id
 5b1f17b1804b1-45f24ef20d0mr11997575e9.8.1757678932165; 
 Fri, 12 Sep 2025 05:08:52 -0700 (PDT)
Received: from imac ([2a02:8010:60a0:0:18f9:fa9:c12a:ac60])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45e017b2722sm33750515e9.1.2025.09.12.05.08.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Sep 2025 05:08:51 -0700 (PDT)
From: Donald Hunter <donald.hunter@gmail.com>
To: =?utf-8?Q?Asbj=C3=B8rn?= Sloth =?utf-8?Q?T=C3=B8nnesen?= <ast@fiberby.net>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>,  "David S. Miller"
 <davem@davemloft.net>,  Eric Dumazet <edumazet@google.com>,  Jakub
 Kicinski <kuba@kernel.org>,  Paolo Abeni <pabeni@redhat.com>,  Simon
 Horman <horms@kernel.org>,  Jacob Keller <jacob.e.keller@intel.com>,
 Sabrina Dubroca <sd@queasysnail.net>,  wireguard@lists.zx2c4.com,
 netdev@vger.kernel.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v3 07/13] tools: ynl-gen: avoid repetitive
 variables definitions
In-Reply-To: <20250911200508.79341-8-ast@fiberby.net>
Date: Fri, 12 Sep 2025 12:30:32 +0100
Message-ID: <m21pobvrfr.fsf@gmail.com>
References: <20250911200508.79341-1-ast@fiberby.net>
 <20250911200508.79341-8-ast@fiberby.net>
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

> In the generated attribute parsing code, avoid repetitively
> defining the same variables over and over again, local to
> the conditional block for each attribute.
>
> This patch consolidates the definitions of local variables
> for attribute parsing, so that they are defined at the
> function level, and re-used across attributes, thus making
> the generated code read more natural.
>
> If attributes defines identical local_vars, then they will
> be deduplicated, attributes are assumed to only use their
> local variables transiently.
>
> ...
>
> Suggested-by: Jakub Kicinski <kuba@kernel.org>
> Signed-off-by: Asbj=C3=B8rn Sloth T=C3=B8nnesen <ast@fiberby.net>

Reviewed-by: Donald Hunter <donald.hunter@gmail.com>
