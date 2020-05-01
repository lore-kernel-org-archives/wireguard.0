Return-Path: <SRS0=vxWX=6P=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 623B9C35280
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  1 May 2020 21:29:55 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B369E216FD
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  1 May 2020 21:29:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=gmx.net header.i=@gmx.net header.b="fN7lCkWB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B369E216FD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=gmx.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9969f507;
	Fri, 1 May 2020 21:17:49 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 6cac3671
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 1 May 2020 21:17:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1588368589;
 bh=sYc72r7Lu4qApI6F1jDK0fDIw94mwXi8T9qYvTdkJzc=;
 h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
 b=fN7lCkWB+pN4hXeI/zkFEfyxszuCtfURi/GQX2aGbDrUs5sOF3ZHKWDMrZ6Dpsk5x
 BEyyplLTHxEhKgxwk8G+79MYkwf2LiKqqA9jyaYuTkXAi7o3DLLmapKUFY/CIlzDDF
 h3NywzMYEHdd2rwQuYJNbpxXAhkdewEJTmRMiENA=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.200.2] ([87.166.110.18]) by mail.gmx.com (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MnakR-1ilhdZ3h8X-00jYjx; Fri, 01
 May 2020 23:29:48 +0200
Subject: Re: [PATCH] systemd: add file wireguard.target
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
References: <20200430135551.9911-1-mardnh@gmx.de>
 <CAHmME9p0u2=i1+ApzsHicFy4VrGKOcE0sD_e5Yk5b-y9UrZBow@mail.gmail.com>
From: Martin Hauke <mardnh@gmx.de>
Autocrypt: addr=mardnh@gmx.de; prefer-encrypt=mutual; keydata=
 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
Message-ID: <9d644025-9b85-51a1-58f8-07e445c61492@gmx.de>
Date: Fri, 1 May 2020 23:29:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CAHmME9p0u2=i1+ApzsHicFy4VrGKOcE0sD_e5Yk5b-y9UrZBow@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:mIiv0KQhYZF33bPICkZ+Ii3e8mI1twX6IQt42kop2dkUT96zbBr
 +yondX8ZnMVp9R4XPOdjFUDkOZujeZNXVPJY4vq7T0yEn5nicYQYUJdCxY0oLmRi1Wak1Z0
 BW0eE8rKVclRU7xX1dJIeJSkaOyCnf8/9q1VwUcfkVk7BJEk3/cyKac0Bm+2fokgTy4GyJ8
 9LU61yd5/6V+7/pfvuV3Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:WUg6my0u0lc=:4+Y6oHFawxQyr1NOnoW3tC
 nKt5DIu4aaxGMuKs0FNvLszkF+B6O5FngrYXC+zwRndUj+K4ZQZdMkiSK6ceF9qprZyGuRL1N
 SLR0YCI1L2+kEdGWTgiurspol5MuTXhuE0V43sSB/9aVqG9XO+ywl6uD60DCpuLjmS7Z/bV30
 FGSJR7zy5KJ74VHG/BZ3tUv1zW7jc6FT1kt1VUsMF6kWKIXaSllgwvzQ2REcIsI8ulAEF1l1v
 HpmvBB+R6+fkerD3ylQSAKX9fF4ZrSHTaJWL7fxD+tZoNvUYZ/FWPsb6VsugpX0+pvb4XQwSe
 E212yREDSeFXNbMwvF3Pns2Z/KiJ/vJS8ycHK0cZr56sfCamlq+/XCLpUR6IVri/5u5ZFYA0g
 swOGwEkLMFxZbK9H+2fcUx6V6hmILQeDhThIdtaTF0Y9D/bPDSoyklP9PX9d6wDowzjJfvAc7
 pFkyU0+za1Rs/4Ho439pLUHwPTZn6BOGZZrvQkXodrt0NraqKfrCmpP4Ou6vBPa22YpkG1CKT
 YZ+4mzHVBGL/1x66KHjoVg+duMK8FeNShovgmaTOxdh0jfcgRublpKnyQbmU3ei+Bml4akCro
 eUmQwPefgA6zjN/NouQbikvHrmsfcr+eqT02aKAnWBQTAnKZ8AXcRqAWu3ggCPDe+oIcej2wo
 w4aH4Y/P0j3Po3U/gTtthdBUFlRXqrvy330JrsAzH6UKYhtAfrhXVgx6Rg6/9YqUxOnJ/M3NF
 hf3++d5BY1V4TgFVARusZF/csoL4u+LojkFhx7W9544o85CAFjIgjxY8CgF2Pu7WBBb88ZkP1
 CON41q2P6N8vMwbq29cInvqzZdgbvaxqU+tasw5D3yXBiu630gP2KsN+3lR125G78GhIhUwBw
 fFP8Bhi/u1fl3dQksAKl5SMQNgaTCL8mHwEX8uQ9WaiVvqxaM/arZp693iJT72p4WR3pVVXQ/
 QGMibsUyXeBJ280U9Ok/+C/fLJSvIMvlT0baIDXpz7NNN5+uKhxtFhKdMr4uHjVQsQdDyspSN
 nQzR61i1FhR/r/UI0BngAiuORwl/ErJwKoDUqZQ51msWKwIDtFn1qkToi1YIDokAT+9sNZ8ej
 MIReUqEH2LoNI95bTYHq/iMk8yIHiSGx8ciZtAf86pmJXSQIcDSVClefqikqruRzzobDB7w9i
 /4soPDTUVlEkiQkswQ67Hv6n9c9JN2Slv8yM8NB7tvwE4tyeGRpevbmtnwCpOAGVCYBQxpPHF
 3gQpYaJ6D3wQuZryg
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

Am 01.05.20 um 01:21 schrieb Jason A. Donenfeld:
> On Thu, Apr 30, 2020 at 7:56 AM Martin Hauke <mardnh@gmx.de> wrote:
>> +PartOf=3Dwireguard.target
>
> This won't reset wireguard interfaces configured by systemd-networkd,
> nor interfaces configured manually, right? So maybe it's better to
> call this wg-quick.target?

Correct, then let's call this wg-quick.target .

>> +Description=3DTarget to restart all parts of WireGuard
>
> Is this verbage consistent with other systemd targets? Specifically,
> is the "to restart" part apt? Or should this say something more
> general?

How about "Description=3DWireGuard target allowing to start/stop all
wg-quick@.service instances at once" ?

Martin

