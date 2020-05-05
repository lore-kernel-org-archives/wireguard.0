Return-Path: <SRS0=7A+2=6T=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A83AFC47247
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  5 May 2020 20:14:14 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1181620721
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  5 May 2020 20:14:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="RIT+d+kY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1181620721
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1811cf3b;
	Tue, 5 May 2020 20:01:12 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 340844a6
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 5 May 2020 20:01:10 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 064526b0
 for <wireguard@lists.zx2c4.com>; Tue, 5 May 2020 19:54:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=usExkLZzTo+s7Ni/6F6b27S3A0o=; b=RIT+d+
 kYZjKMjN0Oi4werOuJaG/Ue+FahbxZSd+K4iB6REfNMtbDULbKttGBkBUuj+8U/I
 CIaN3DzntxeTeBdx6e0kp58iK3T9tXRn8nwW+IosL25yvQPq2XpQModGLPAJ8zwa
 g5ivRfnGg30rWqlWM+xmdAB9zPzKZS8OzlmHyT6DtebfeNwiNVh05vpoWFwU6jYJ
 m1CTcjnFJbhux60b7r2qs566F53HRbAKzkLoBsyRxjx7A8qRI+1IIy0ugOS1kQRj
 v38yDj73vKsg4yg0qWCgwcuThCbxysy+D4ySjp0/yYnEMSLtaP2QVwxQ+si9Mx34
 2khr5pUpBgmtotzQ==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id a9bf7b03
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 5 May 2020 19:54:30 +0000 (UTC)
Received: by mail-il1-f172.google.com with SMTP id c18so3523983ile.5
 for <wireguard@lists.zx2c4.com>; Tue, 05 May 2020 13:07:04 -0700 (PDT)
X-Gm-Message-State: AGi0PuZTDzT+ZA+EiyH/uDuQl9nfaXTSm3sifigxYlGUUCrpZ2IQnjtI
 ZSzDAGnG8TsuqyGuz5RrA0vMnA8My2Atl06RZoA=
X-Google-Smtp-Source: APiQypIbrq5BimrpgkqS3H4zSchqYRWQJ5afcQiOi4WgV4Z/1/duDp5O8TBtdE54uH7v86Gkyl7M0plAdTTyiC9H8Os=
X-Received: by 2002:a92:5c82:: with SMTP id d2mr5605707ilg.231.1588709223915; 
 Tue, 05 May 2020 13:07:03 -0700 (PDT)
MIME-Version: 1.0
References: <20200505141327.746184-1-arnd@arndb.de>
In-Reply-To: <20200505141327.746184-1-arnd@arndb.de>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 5 May 2020 14:06:52 -0600
X-Gmail-Original-Message-ID: <CAHmME9oTO7DiWCXoeCBjmPOBMoZQ2hUhHjZ4_oi-nVP_9pRpSg@mail.gmail.com>
Message-ID: <CAHmME9oTO7DiWCXoeCBjmPOBMoZQ2hUhHjZ4_oi-nVP_9pRpSg@mail.gmail.com>
Subject: Re: [PATCH] net: wireguard: avoid unused variable warning
To: Arnd Bergmann <arnd@arndb.de>
Cc: "David S. Miller" <davem@davemloft.net>,
 Greg KH <gregkh@linuxfoundation.org>, 
 Herbert Xu <herbert@gondor.apana.org.au>, 
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, Netdev <netdev@vger.kernel.org>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>, 
 clang-built-linux <clang-built-linux@googlegroups.com>
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

On Tue, May 5, 2020 at 8:13 AM Arnd Bergmann <arnd@arndb.de> wrote:
>
> clang points out a harmless use of uninitialized variables that
> get passed into a local function but are ignored there:
>
> In file included from drivers/net/wireguard/ratelimiter.c:223:
> drivers/net/wireguard/selftest/ratelimiter.c:173:34: error: variable 'skb6' is uninitialized when used here [-Werror,-Wuninitialized]
>                 ret = timings_test(skb4, hdr4, skb6, hdr6, &test_count);
>                                                ^~~~
> drivers/net/wireguard/selftest/ratelimiter.c:123:29: note: initialize the variable 'skb6' to silence this warning
>         struct sk_buff *skb4, *skb6;
>                                    ^
>                                     = NULL
> drivers/net/wireguard/selftest/ratelimiter.c:173:40: error: variable 'hdr6' is uninitialized when used here [-Werror,-Wuninitialized]
>                 ret = timings_test(skb4, hdr4, skb6, hdr6, &test_count);
>                                                      ^~~~
> drivers/net/wireguard/selftest/ratelimiter.c:125:22: note: initialize the variable 'hdr6' to silence this warning
>         struct ipv6hdr *hdr6;
>                             ^

Seems like the code is a bit easier to read and is more uniform
looking by just initializing those two variables to NULL, like the
warning suggests. If you don't mind, I'll queue something up in my
tree to this effect.

By the way, I'm having a bit of a hard time reproducing the warning
with either clang-10 or clang-9. Just for my own curiosity, would you
mind sending the .config that results in this?

Jason
