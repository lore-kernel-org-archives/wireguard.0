Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B780CF34AE
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 19 Nov 2025 12:56:24 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b8f602cc;
	Tue, 18 Nov 2025 17:31:58 +0000 (UTC)
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id d05c2315
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 5 Sep 2025 10:53:59 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-45dd7b15a64so5114825e9.0
 for <wireguard@lists.zx2c4.com>; Fri, 05 Sep 2025 03:53:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757069639; x=1757674439; darn=lists.zx2c4.com;
 h=content-transfer-encoding:mime-version:user-agent:references
 :message-id:date:in-reply-to:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to;
 bh=qe6k7HrKevPOy+Fuc/eg6BRsGGYgcRijxn+OCI6UvLg=;
 b=Yw2a06NQmrznPtsgqo764FA7gWCvA8MPf7AZxTKqBn+Qe8+1cFIgkVfISA2jevgAX7
 1LpZP8XsfHOgluuI8Ppywcmp8IUJ4COt/LE83/gg8P0NRCNSyFig9+dl8latbn7JFY81
 NU+QA0iHox3eu289KCvQY/Y/r/lhaxzNP9HnaO91ozVVqqWqmH37A3npY2OLhiFBam7g
 602TjJ37Aj6ggVhGlRXQSa9t0a7JR3TLaKB3X9osygOQglp9UHgU8fQqGpAbT3WsJaRL
 vQ/aR1TkYBIvdPb8krWtdj0OyCnhxqWK7CwVXp+KjqZZrQuenU7qPiDeBDmURIS2dCmS
 oq8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757069639; x=1757674439;
 h=content-transfer-encoding:mime-version:user-agent:references
 :message-id:date:in-reply-to:subject:cc:to:from:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qe6k7HrKevPOy+Fuc/eg6BRsGGYgcRijxn+OCI6UvLg=;
 b=L22ZNKcoaPmI10luAHEun4+zouL+W1JuIMjIT3S0RxAYGcvwb0jmph6gN0j0uqyfFL
 JkSclNIIjCLkrcpzsDcGBP/edHRJstOsbD306V6XpROh387493YcNpXoNHQQIyuJ2PwW
 EmomnBAZTTqghA9Tz9Gke5lLEjULrQfbEWODHL0SQ84glkF/2eMtRoB13+uU9x6XqGcF
 uqiD4h0c8T58LPwr0t5zbuyDPiZGIEPd/oTtgG8ZkTRsedLRm/7imdh/rsGBtVlUlVn1
 i/1IvpZnA2Jh8V7gyinGB9tyLLoprqyCalPIVyw8BNJNhIJUB+rSKoN536hS1rVN910l
 1oXA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUmcmrkfxhHqNL2EN6x6n9kaMaaxTmnOpYErM0RUdcLojNdTn6N37BIFTAWm3N/xcacxpcs4uUYdRo=@lists.zx2c4.com
X-Gm-Message-State: AOJu0Yw2XXpv1plQn9Lu4DsbvIliU797eCwis2t2RMCxRkA6oVHnJ7Qi
 9MSZpmVxd/Xv9vgUNZ/Wi/ig63YpIROdqPfNIyRWAolo/gBrIB0k57Vo
X-Gm-Gg: ASbGnctYWa1jPUF2NWoL1w6UEzuur4quZn6jl5RzPVOu6DkhALLWFaOGqPPzpHkXkB3
 7WqLPyfVGcMBBvP86FKhmQDbsgWhIvq7Z7dslBqEO7xicHtFEEw6OaBw7tobRg8e/bWh0KnwHPw
 GDWCESIrJrPGQh9TfsK5eeaZ3HxLueh+sMthKte7bgG1w75ggFv2CcHctv/vSYuEAgN3PibSGWx
 KbtoTvdup7nzEu17tMTrb3wCbWEZzwTQ5UW+uXKx6CwHDkb2wEkDiBut+QrDVMIet0CWNQHVL35
 ZdUTpOhBIt5Ja+pvRaDJ2jyQddobqyROozf9HiDqWxabTTVtq2eR9BeZR8rWtb+rwHkvKvjEY/p
 FIMY/W2a0Jd6UPocCn1B2OlYVE0BCrckQUd49aFFx7lwvlw==
X-Google-Smtp-Source: AGHT+IFwZemLia3fBC9WTFtYFzzmZ2EYNkHjIJg3nuIvaX8gzaby28MJzWDoGnTtZqxxFj9K0r8Bmg==
X-Received: by 2002:a05:600c:4695:b0:45d:5c71:769d with SMTP id
 5b1f17b1804b1-45dd5b3c3bfmr25763005e9.8.1757069638998; 
 Fri, 05 Sep 2025 03:53:58 -0700 (PDT)
Received: from imac ([2a02:8010:60a0:0:8157:959d:adbf:6d52])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3d1007c0dc8sm29503005f8f.53.2025.09.05.03.53.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Sep 2025 03:53:58 -0700 (PDT)
From: Donald Hunter <donald.hunter@gmail.com>
To: =?utf-8?Q?Asbj=C3=B8rn?= Sloth =?utf-8?Q?T=C3=B8nnesen?= <ast@fiberby.net>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>,  "David S. Miller"
 <davem@davemloft.net>,  Eric Dumazet <edumazet@google.com>,  Jakub
 Kicinski <kuba@kernel.org>,  Paolo Abeni <pabeni@redhat.com>,  Simon
 Horman <horms@kernel.org>,  Jacob Keller <jacob.e.keller@intel.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>,  wireguard@lists.zx2c4.com,
 netdev@vger.kernel.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 03/11] tools: ynl-gen: add sub-type check
In-Reply-To: <20250904220156.1006541-3-ast@fiberby.net>
Date: Fri, 05 Sep 2025 11:37:37 +0100
Message-ID: <m27bydyyku.fsf@gmail.com>
References: <20250904-wg-ynl-prep@fiberby.net>
 <20250904220156.1006541-3-ast@fiberby.net>
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

> Add a check to verify that the sub-type is "nest", and throw an
> exception if no policy could be generated, as a guard to prevent
> against generating a bad policy.
>
> This is a trivial patch with no behavioural changes intended.
>
> Signed-off-by: Asbj=C3=B8rn Sloth T=C3=B8nnesen <ast@fiberby.net>

Reviewed-by: Donald Hunter <donald.hunter@gmail.com>
