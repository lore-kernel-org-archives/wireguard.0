Return-Path: <SRS0=LfNZ=6Z=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9758BC47255
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 11 May 2020 21:25:43 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 29AB0206F5
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 11 May 2020 21:25:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="2oONm79H"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 29AB0206F5
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c73e012b;
	Mon, 11 May 2020 21:09:59 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id fa61ba7c
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 11 May 2020 21:09:56 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 28516082
 for <wireguard@lists.zx2c4.com>;
 Mon, 11 May 2020 21:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=WIYYq0SsS5bZPA8ZucaUeldogHA=; b=2oONm7
 9H2d8wUMcc3RzZl74G5sk3qsx7hCQkmUDonaRJSr4FdNqRr3xVg53+sJ2R174Plp
 FwKOLMrkEvnBhJRsYMoxUZ19t8shyM0U7F3BzBa6X9tvdy6h/v9I81NbarqYWsfh
 TxMGBJ4vK9lo+zFo2VQqO3szioDXtI6tzM4/VfvqNHQo0NrcTmiVUeZKHr3ydtOc
 yqDREtXq5FthUAkWd0C07mDXAOcQVsml0pBP8PS+TOclpTlw51Vsk9acMsK5+5Aa
 0nHUVg+l4KpcgbBBSsW3Jw8h0Gt8B73jNa12o/v/R+dInJE/JgTSbP1EqZKQgac8
 1o5GYH4wPd0Bzrmw==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id dfbe64f0
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 11 May 2020 21:09:56 +0000 (UTC)
Received: by mail-io1-f44.google.com with SMTP id f3so11555428ioj.1
 for <wireguard@lists.zx2c4.com>; Mon, 11 May 2020 14:23:18 -0700 (PDT)
X-Gm-Message-State: AGi0PuaxrhigF4fAY/rKc3z8TGN7cuvm9zpLr9b5an6XXNYtayZFmiZi
 EsazEFqQsJ9JjXdMfm35uMSqXu3uZcAvsp+fATI=
X-Google-Smtp-Source: APiQypInCSnhpTyS6NmYTi26Tvevx7dcDXVfhF09hs+MBG9fMaE2DXccz1zCHv6CsjR3inLpYdTYUWHCURhohIp42oE=
X-Received: by 2002:a02:b88e:: with SMTP id p14mr16742221jam.36.1589232197327; 
 Mon, 11 May 2020 14:23:17 -0700 (PDT)
MIME-Version: 1.0
References: <f27176e3fc6ede8d04682a9b504df177@rfraile.eu>
 <CAHmME9ovg+BBhVkKoNDd2LD-C9ChuBW5VXgj4n4V-Cp_-g0uiw@mail.gmail.com>
 <CABtXGiAP6SvNrsTArCe2fNLqTUEeBEOy9Osx+uCinfm6q9Yz1Q@mail.gmail.com>
In-Reply-To: <CABtXGiAP6SvNrsTArCe2fNLqTUEeBEOy9Osx+uCinfm6q9Yz1Q@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 11 May 2020 15:23:06 -0600
X-Gmail-Original-Message-ID: <CAHmME9oaWsnghkXhWfSqSS0f52nWfpjNRoBQ7EF-58joPG2z6w@mail.gmail.com>
Message-ID: <CAHmME9oaWsnghkXhWfSqSS0f52nWfpjNRoBQ7EF-58joPG2z6w@mail.gmail.com>
Subject: Re: Search Domain/DNS Suffix
To: Phillip McMahon <phillip.mcmahon@gmail.com>
Cc: Ricardo Fraile <rfraile@rfraile.eu>, Simon Rozman <simon@rozman.si>,
 virtualdxs@gmail.com, WireGuard mailing list <wireguard@lists.zx2c4.com>
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

On Mon, May 11, 2020 at 3:17 PM Phillip McMahon
<phillip.mcmahon@gmail.com> wrote:
>
> Wireguard site is showing fedora wireguard-tools as up to date. It has
> not been released yet, still marked as pending testing
>
> https://bodhi.fedoraproject.org/updates/?packages=wireguard-tools

Fine by me. This means there is no further action for Joe, the Fedora
maintainer, to take on this matter.
