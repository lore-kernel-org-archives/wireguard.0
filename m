Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14F61C47DD9
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 23 Mar 2024 00:20:01 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 490820a5;
	Sat, 23 Mar 2024 00:19:03 +0000 (UTC)
Received: from gandalf.ozlabs.org (mail.ozlabs.org [2404:9400:2221:ea00::3])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id f60803e3
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 23 Mar 2024 00:19:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1711153137;
 bh=eNSZ3J4h9JLdPBKY4LazE6G9kzUQQlpJcfX+tZUCkaE=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=TVio18lCfxydqx3yzcNv2bxclUkvz2zxdnrNks8sBmuS1vLyQbjFpTb8RD2Zvuvmy
 VbwsQzY/Y3qjMUJ1LOKJGNIffIwJScZ0mMudGFP/o0AKMYke7YbYsh9GFDXfISMCM8
 DLDnGWFKQ9rQ03k6yscoCM74459SzQrbcuG4IvVDWMGNwo2ELh7+SxZmjwSY/wUBcu
 th+iW6lhKnQLegxNyN/lIUuNl1l0Rv9RxSsHmxPBtQlcmBJqY0i8cUhiel3Lvwvt4y
 SnnqGwgvrK0RDR9nOJ6Js9q26sazD9zIqaX2jt6ADesvZrzkIeH4BI/ZXof1bPSNkf
 KIvHphQKRLLYg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4V1fv36YRbz4wcq;
 Sat, 23 Mar 2024 11:18:55 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Michal =?utf-8?Q?Such=C3=A1nek?= <msuchanek@suse.de>,
 netdev@vger.kernel.org, "Jason A.
 Donenfeld" <Jason@zx2c4.com>, linuxppc-dev@lists.ozlabs.org,
 wireguard@lists.zx2c4.com, dtsen@linux.ibm.com
Subject: Re: Cannot load wireguard module
In-Reply-To: <Zf1sjAgBYCnJ7JEp@gondor.apana.org.au>
References: <20240315122005.GG20665@kitsune.suse.cz>
 <87jzm32h7q.fsf@mail.lhotse> <87r0g7zrl2.fsf@mail.lhotse>
 <20240318170855.GK20665@kitsune.suse.cz>
 <20240319124742.GM20665@kitsune.suse.cz> <87le6dyt1f.fsf@mail.lhotse>
 <Zf1sjAgBYCnJ7JEp@gondor.apana.org.au>
Date: Sat, 23 Mar 2024 11:18:54 +1100
Message-ID: <8734shkdg1.fsf@mail.lhotse>
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

Herbert Xu <herbert@gondor.apana.org.au> writes:
> On Wed, Mar 20, 2024 at 11:41:32PM +1100, Michael Ellerman wrote:
>>
>> This diff fixes it for me:
>
> Yes I think this is the correct fix.

Thanks, I'll send a proper patch next week.

cheers
