Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D08DEC6FD1C
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 24 Mar 2023 13:47:16 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 63da50a9;
	Fri, 24 Mar 2023 13:44:34 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 2bc2dda5
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 24 Mar 2023 13:44:32 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EC31362AC3
 for <wireguard@lists.zx2c4.com>; Fri, 24 Mar 2023 13:44:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1213EC433EF
 for <wireguard@lists.zx2c4.com>; Fri, 24 Mar 2023 13:44:29 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="Pb5zMNQe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1679665468;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=v2jUEAkOYY54V02pzKSvznaz0c6YpEW/gIMe3GfF3+U=;
 b=Pb5zMNQeRJxo6OiAPmSFcN/xHC8SXWSWzimiJJXJp9AfNm6EO8zhaesr+SPZw5Os2Cx0SS
 zIL7ZHVBxIZP+Y5fu7qiIkCFS3ByXMhhRq+rSv9gynEENRE3XLhVTvWwDBtu88jibq2pPV
 Rs/hokP7jt+uETfERTR1k/yu8c4UXbI=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 76051cb0
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 24 Mar 2023 13:44:28 +0000 (UTC)
Received: by mail-vs1-f43.google.com with SMTP id cu36so1542813vsb.7
 for <wireguard@lists.zx2c4.com>; Fri, 24 Mar 2023 06:44:28 -0700 (PDT)
X-Gm-Message-State: AAQBX9ei1aRKDNljggsEIZWwV40zXhgWc6hDRY9CZjaMbXejGl0SXP+4
 0by8oo3mS/7kD4JEjepFKN3kMBIzGasgs9gnKpA=
X-Google-Smtp-Source: AKy350ZgOdvi8GQPMfgQuSrtH0WT/+hP5Zj2mH3YEfB+3HYWoo4FAHaBtapYAvvQGbTyXaTjXD/NZk6anv5qiIcAetc=
X-Received: by 2002:a67:c283:0:b0:425:e5e6:d1d9 with SMTP id
 k3-20020a67c283000000b00425e5e6d1d9mr1587923vsj.2.1679665467832; Fri, 24 Mar
 2023 06:44:27 -0700 (PDT)
MIME-Version: 1.0
References: <ac87f86f-6837-4e0e-ec34-1df35f52540e@lv6.tw>
 <CABprzAaZC86FosOK7A__LB7LzULLYv=-y539y5VHacttYJwSmg@mail.gmail.com>
 <18b4903b-0835-ac5e-49ca-ae6bea08a268@lv6.tw>
In-Reply-To: <18b4903b-0835-ac5e-49ca-ae6bea08a268@lv6.tw>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 24 Mar 2023 14:44:16 +0100
X-Gmail-Original-Message-ID: <CAHmME9pbN4b115-dnqsMaqGMYq+xzLxDYyAv7xFTPZT6AU_39Q@mail.gmail.com>
Message-ID: <CAHmME9pbN4b115-dnqsMaqGMYq+xzLxDYyAv7xFTPZT6AU_39Q@mail.gmail.com>
Subject: Re: wireguard-go: data race introduced in recent commit 9e2f386
To: lsc <lsc@lv6.tw>
Cc: Jordan Whited <jordan@tailscale.com>, wireguard@lists.zx2c4.com,
 james@tailscale.com
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

Thanks for the panic trace. That indeed looks like the same issue as
the race. Jordan has a stop-gap patch prepared, which I'll send to the
list.

Jason
