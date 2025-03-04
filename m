Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3ED5C54ED0
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 21 May 2025 09:18:36 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e2a3af25;
	Tue, 20 May 2025 19:42:19 +0000 (UTC)
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id dfa39032
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 4 Mar 2025 17:46:34 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5e05ac70b61so20a12.1
 for <wireguard@lists.zx2c4.com>; Tue, 04 Mar 2025 09:46:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1741110394; x=1741715194; darn=lists.zx2c4.com;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=O6VWdWUqnMGN0+Vi1iLYH/MfWU6VCuSN6uPKJvHH6d0=;
 b=ifwBt3M8lUzyR17mX/vwSFzmBoFuyTG3YT5OveQA7WC4AcviQCzc9GAHBh4ETaSdL7
 dy7XbepSPFthghSXI9WVmz68OjcYeKBHmwwTnVXfEqAFVv7UULlzp5FORJkW0QC11yxL
 BgG6je7nXdG8YbsMKlMViDIMKyEBCGLuOz2NoZ5WiYtN4WvMTGtCQ1jzXUhcrz8IXGKl
 S6Bfp3t6SY8zfYl7c0W5Cr599U86Szqo3axylTMrYU8IedDqF7jZrz9meI4qOQz/s4JF
 01sbD7UUdmo5ZlYT2ndN0IXOU3qJ6eDju3q+BVLYT3v6tWFMH/P0jcYnK5LBFGu3Lkne
 5oyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741110394; x=1741715194;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=O6VWdWUqnMGN0+Vi1iLYH/MfWU6VCuSN6uPKJvHH6d0=;
 b=DJAAB41QMsU8LNft6ZXQmGFQRzmevu1yDhJEapM0yWGoeLKyleKvCS+qspE8uRPeiC
 aGHYBTejCKZ8eW3r8IxY3KCXvXx885y1+b0aEzVEpe1vg2xc+h2gBhFN6uf7bOIM/TLr
 9XyKiy7ATGgUtB+bJ7jPq7L6sc/cy+KSVPe9MFeHbGR1bM8NnAK0cd1Fei2474F2eGvL
 OCyk6Ne1ZRh9TQAlUcxj61TmXJhEo6ZVutvJpDgqWE7H8lGZ171i+X4XJzlo0WDT4slj
 S2tlyDEL8IBwu48IIumH6GbW2A2kxv73Ca4Hf46I/IidfTGasa15ILTbFzY2uQN2tkCf
 IYfw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWrXRbDziaSj8PumV10KYHWxn70uiHFhaXwJq0j9ytb7kRln5jRvGwTWDyZPy9VqqYiPr61tIa9KRY=@lists.zx2c4.com
X-Gm-Message-State: AOJu0YxKnImllt2G6TeYDDLu7/2BZKlLpDjDKhoCpYdydKbVvo1S9Fu/
 kyQtpWBpDlEgiiWNW8XX5I0Es57YpDh3TdOb0ZVNmFPBOnrFQm6O0sySOh9OUPtAtuyrh0ofml5
 vSefl2g9cCJbQ9fUznUrI7En8b+cU6IU+lv07
X-Gm-Gg: ASbGncuh3M+fIf6WPROHioyhKsQgV1mKtwqfZzGDzB99XFqjxO1gYNEy+U8WEEerbPh
 A9yIV7ewTLFzdZQYyGbZQbhc+ROGhdJll118YjiFc8bwjnZVvznkCB7TIBt/6+O3wV9dyRsRwYF
 hYMfG6NCbw4nlsb8iZHRw+sselEs4=
X-Google-Smtp-Source: AGHT+IFhjmXfe3o60QbooVrEm5ZuppKWnkQOLLdUm2uN4anQ0HTxa6deTSHczhLhYsD63cOvc9es12sJy1YDHLhCRuE=
X-Received: by 2002:a50:ed8f:0:b0:5e4:9ee2:afe1 with SMTP id
 4fb4d7f45d1cf-5e59d467c7emr18157a12.2.1741110393684; Tue, 04 Mar 2025
 09:46:33 -0800 (PST)
MIME-Version: 1.0
References: <20250304003900.1416866-1-jrife@google.com>
 <Z8Z1uxRd_kNO6Ibv@zx2c4.com>
In-Reply-To: <Z8Z1uxRd_kNO6Ibv@zx2c4.com>
From: Jordan Rife <jrife@google.com>
Date: Tue, 4 Mar 2025 09:46:20 -0800
X-Gm-Features: AQ5f1Jo1LJgzL6fz2qBW6KRM9L5CK-Rmzx7CwCzqkl3m0m68Z_iCROdej4lA7zo
Message-ID: <CADKFtnT1vTsbh3saFfeWkCL8ZnjL1-BRkcp40D-L8+DVd8G1AA@mail.gmail.com>
Subject: Re: [PATCH v4 net-next] wireguard: allowedips: Add
 WGALLOWEDIP_F_REMOVE_ME flag
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, 
 wireguard@lists.zx2c4.com, Daniel Borkmann <daniel@iogearbox.net>
Content-Type: text/plain; charset="UTF-8"
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

Hi Jason,

> No. I'll take this through the wireguard tree like usual. This patch and
> the wg(8) patches ARE going in; I like them a lot. I've been very behind
> as of late but am catching up.

Sounds good, that would be my preference as well. I assume you're
referring to v3 with the wg-based self tests and everything?

-Jordan
