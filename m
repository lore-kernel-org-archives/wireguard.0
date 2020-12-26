Return-Path: <SRS0=HI6M=F6=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBC88C433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 26 Dec 2020 08:10:34 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DA22E20809
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 26 Dec 2020 08:10:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DA22E20809
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=ungleich.ch
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3adac726;
	Sat, 26 Dec 2020 08:00:12 +0000 (UTC)
Received: from smtp.ungleich.ch (mx.ungleich.ch [185.203.112.16])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 93f676e1
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 26 Dec 2020 08:00:10 +0000 (UTC)
Received: from bridge.localdomain (localhost [IPv6:::1])
 by smtp.ungleich.ch (Postfix) with ESMTP id 2FE4520E0B;
 Sat, 26 Dec 2020 09:09:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ungleich.ch; s=mail;
 t=1608970188; bh=qZYt4jHlYcLEj091O4wOyb0ZVVErNx/HdVxBKqeE/Yc=;
 h=References:From:To:Cc:Subject:In-reply-to:Date:From;
 b=EytfrHR8a1mhoQRVUkGIVyu9RUwujmpuXn84ktJv8t3a7H4mukknycPcAbrbAEhlT
 ZJGE0rg030+4ecfJsabKdWynqYUrkP/kjK3P1OhHgTqeIrRwrhnPfShCpuwrQQvtea
 sIjBOPOEEt2WwNAdt5xUTHRwHwKF5+yYzUGKkSMSAyNtbS+Wghn03N/rGfKvNzRUZK
 p2MGUoWCwj5Gqee82txf/Xf8C7z+3bzD9kINGmOry0+8LznXzT6qG9obBEre9lvHJK
 uFxtGbHBWs1mh2i/11xrzKEljqgwlBe3zqohHRpyYmONNNG/JxT19ySOHCUBnz8tp7
 1BifMK34hYyfA==
Received: by bridge.localdomain (Postfix, from userid 1000)
 id A0D331A6EA51; Sat, 26 Dec 2020 09:09:56 +0100 (CET)
References: <87k0t75h3e.fsf@ungleich.ch>
 <CAB5G8p9nCdxkikyubjfjJ4bB4+9LXNrEbCN+ONfZn28g26WE0Q@mail.gmail.com>
 <dfec7de6-8f7d-4e89-4e90-3865aa6b7d04@urlichs.de>
User-agent: mu4e 1.4.13; emacs 27.1
From: Nico Schottelius <nico.schottelius@ungleich.ch>
To: Matthias Urlichs <matthias@urlichs.de>
Cc: wireguard@lists.zx2c4.com
Subject: Re: How to verify a wireguard public key?
In-reply-to: <dfec7de6-8f7d-4e89-4e90-3865aa6b7d04@urlichs.de>
Date: Sat, 26 Dec 2020 09:09:56 +0100
Message-ID: <875z4p56p7.fsf@ungleich.ch>
MIME-Version: 1.0
Content-Type: text/plain
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


Matthias Urlichs <matthias@urlichs.de> writes:

> On 25.12.20 00:42, Adam Stiles wrote:
>> "How do I validate Curve25519 public keys?"
>
> You send a handshake packet to the owner of the corresponding private
> key and observe whether it accepted it.
>
> The question is, why do you think you need a different/additional way
> of verifying the public key?

That answer is easy: if you add an incorrect key to your wgX.conf, wg
setconf will complain and not apply it. And if you are providing
automated VPNs... well, then this is something you do want to prevent.

Cheers,

Nico

--
Modern, affordable, Swiss Virtual Machines. Visit www.datacenterlight.ch
