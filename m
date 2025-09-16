Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2CE8CAC598
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 16 Sep 2025 15:54:36 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2779c19b;
	Tue, 16 Sep 2025 15:53:20 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id af38fa31
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 16 Sep 2025 15:53:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id EFFF64169B
 for <wireguard@lists.zx2c4.com>; Tue, 16 Sep 2025 15:53:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90167C4CEF0
 for <wireguard@lists.zx2c4.com>; Tue, 16 Sep 2025 15:53:15 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="H55oyeaW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1758037993;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QdhsLLTi6x2P00SOdHfDzgBCCPRrEZ2OxxiHXGo3X0U=;
 b=H55oyeaWjML93nNQVTWuh7rT6YX1P61S2Dhz77e91JuQjlzvZTw1SqL1oOhgOnbzbXVzjf
 lBepXGG5uizyEm2OggZsooXC5KUCOjngNwQd9jwbXDCQAiEYsjJC8lxG7qLao1O1JK8IXv
 2doy5ngRPBcWsrqAj+QeNQy9rhXLzls=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 67d9c8e4
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 16 Sep 2025 15:53:13 +0000 (UTC)
Received: by mail-oo1-f53.google.com with SMTP id
 006d021491bc7-6219e33ba2dso1657875eaf.1
 for <wireguard@lists.zx2c4.com>; Tue, 16 Sep 2025 08:53:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVdq/Y98fDxT7BH+yttqWn783lM4AA/SzdVXZ6C/D/TFlWJpA4Al+uwpZp63FAUhsXXKCl5+jFmyGw=@lists.zx2c4.com
X-Gm-Message-State: AOJu0YyHg1ZVs/LlG0b7rStQPjJMHtiorDkEDI4Z9UfpX+kxV7gk2wQM
 NEUXDOrfISQ49tieCGvac4lqjvEMXC7OhGhrKIL1cKjQL5JdW7KOkDeiml7/mO3oYfXCrDx1+HD
 edqtbs5pZ8zsaGCfqiTeMrMtJqpWm98U=
X-Google-Smtp-Source: AGHT+IHIsWlCqXP6w2ex+u5oDjE8Qk5JpGJiSn5HO81iROUQUIe3rwbuy+iUOnTAxJz5JFUcLFFDPdjI0OFKgCB57WE=
X-Received: by 2002:a05:6870:15c3:b0:318:70e5:3ce with SMTP id
 586e51a60fabf-33453569978mr1595607fac.21.1758037992013; Tue, 16 Sep 2025
 08:53:12 -0700 (PDT)
MIME-Version: 1.0
References: <20250915144301.725949-1-ast@fiberby.net>
In-Reply-To: <20250915144301.725949-1-ast@fiberby.net>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 16 Sep 2025 17:53:00 +0200
X-Gmail-Original-Message-ID: <CAHmME9rf9NGRVtJBnjUJVPraGKL6dk0nRxzXmSi-7X6Y1zjmsA@mail.gmail.com>
X-Gm-Features: AS18NWDjjoLajNux7GbGPgbtVGxD8CQj2DjICrmFvFsHsH0-lOTbkqsL1kkKnR4
Message-ID: <CAHmME9rf9NGRVtJBnjUJVPraGKL6dk0nRxzXmSi-7X6Y1zjmsA@mail.gmail.com>
Subject: Re: [PATCH net-next v5 00/11] tools: ynl: prepare for wireguard
To: =?UTF-8?B?QXNiasO4cm4gU2xvdGggVMO4bm5lc2Vu?= <ast@fiberby.net>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Donald Hunter <donald.hunter@gmail.com>, Simon Horman <horms@kernel.org>, 
 Jacob Keller <jacob.e.keller@intel.com>, Sabrina Dubroca <sd@queasysnail.net>,
 wireguard@lists.zx2c4.com, 
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Hi Asbjorn,

On Mon, Sep 15, 2025 at 4:47=E2=80=AFPM Asbj=C3=B8rn Sloth T=C3=B8nnesen <a=
st@fiberby.net> wrote:
>
> This series contains the last batch of YNL changes to support
> the wireguard YNL conversion.

"the wireguard YNL conversion"

Did I miss some conversation about this? I figure I must have. I must
say I'm not too keen on wireguard (and apparently only wireguard?)
being a guinea pig for this.

Jason
