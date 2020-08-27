Return-Path: <SRS0=D3OD=CF=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C93DC433DF
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 27 Aug 2020 19:21:08 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 69F87207CD
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 27 Aug 2020 19:21:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="axBCT03k"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 69F87207CD
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id aa89431c;
	Thu, 27 Aug 2020 18:53:43 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id cc1f3cfe
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 27 Aug 2020 18:53:40 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 118bfc06
 for <wireguard@lists.zx2c4.com>;
 Thu, 27 Aug 2020 18:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=aZXTJJf8IBNbsP+c5VGlLD2vJA0=; b=axBCT0
 3k20yr3H86qplW4jTGx8O8msrKxpDcVj/P8riwSckId7QBrJvuk2xTWUOnAoqrR2
 LJrqvIgG8IQPrzMjCie1pRA51odfAVMsc2tqkzSUNhd2pCZbI4GSfGXGi44KtMKq
 hTjfnh/EYTjoukyeWLmUICF01+ggJX+eBLNiuJMmkBwKNyhGhXkGH7SUnbmGaCJO
 p0Ig9mFpaYnpm/uzv5E4Q+w5ISZF+T5UcKa2cF0mZyNlqlHt296qQT9RDq7N+tNq
 +4NTfpRuM+9GqnDCXQAUfe6PFTRRvGipj+jum34QoQ2O6VWjpU16MtOpcHrxMnOS
 QSK5dWTNK0Wao1EQ==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id b53dcfa2
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 27 Aug 2020 18:53:40 +0000 (UTC)
Received: by mail-il1-f182.google.com with SMTP id v2so5857437ilq.4
 for <wireguard@lists.zx2c4.com>; Thu, 27 Aug 2020 12:21:02 -0700 (PDT)
X-Gm-Message-State: AOAM532k/NH6X2RyYynLK9tPiLaBcVb4Rg6LQz2hN6ZgQCrp6m4My2MH
 EGdoWubxbqNSVdrlP6y+1vNVMb7UzStoSbAQGYU=
X-Google-Smtp-Source: ABdhPJxGV5V3vBy/ipncFR7SoSe9JNvyabu6yuC1/NyrNSNoOM1IWWfC8GXznExJ7kUDFE5RToXOv+onfX+lzSRKVuA=
X-Received: by 2002:a92:b74a:: with SMTP id c10mr18839176ilm.231.1598556061986; 
 Thu, 27 Aug 2020 12:21:01 -0700 (PDT)
MIME-Version: 1.0
References: <69672027-558a-7ae4-484f-8d7573b3cf1b@gmail.com>
In-Reply-To: <69672027-558a-7ae4-484f-8d7573b3cf1b@gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 27 Aug 2020 21:20:51 +0200
X-Gmail-Original-Message-ID: <CAHmME9rZnXAZ9LmQBbegaS=h-05=utUWkKNEzDDJxnzUo6pYUQ@mail.gmail.com>
Message-ID: <CAHmME9rZnXAZ9LmQBbegaS=h-05=utUWkKNEzDDJxnzUo6pYUQ@mail.gmail.com>
Subject: Re: Problems with Windows client
To: Peter Whisker <peter.whisker@gmail.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
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

On Thu, Aug 27, 2020 at 3:35 PM Peter Whisker <peter.whisker@gmail.com> wrote:
>
>
> Hi
>
> The Windows client does not work over my work VPN (Juniper Pulse). I
> have project servers behind a firewall. I can use Wireguard over the
> office LAN but not over the VPN.
>
> What proves to me that it is a Wireguard client problem is that the
> TunSafe Wireguard client works perfectly and connects to my project
> servers over the VPN with the identical configuration.
>
> I get an error "Object already exists" from the real Wireguard client.
> None of the tunnel routes which are being created are there before.
>
> This is a longstanding Wireguard Client problem.
>
> I can send logs if requested.

Yes, please.
