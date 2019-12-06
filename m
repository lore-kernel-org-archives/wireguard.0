Return-Path: <SRS0=ImwE=Z4=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3EC1C47409
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  6 Dec 2019 17:06:22 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 64225205F4
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  6 Dec 2019 17:06:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NybETclI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 64225205F4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 18baef66;
	Fri, 6 Dec 2019 17:05:55 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e8d6f4d6
 for <wireguard@lists.zx2c4.com>; Fri, 6 Dec 2019 17:05:49 +0000 (UTC)
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com
 [IPv6:2607:f8b0:4864:20::832])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a6a807bf
 for <wireguard@lists.zx2c4.com>; Fri, 6 Dec 2019 17:05:49 +0000 (UTC)
Received: by mail-qt1-x832.google.com with SMTP id 14so7773304qtf.5
 for <wireguard@lists.zx2c4.com>; Fri, 06 Dec 2019 09:05:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=yTi5vRw0aWPoUIEbH62TpM+guLaGQobC44oNXUbvCDI=;
 b=NybETclICKg/eht7zvX+wt3h4DgThUfISgW5hVrJsPaoyxtkVo38twVoQzlfcEDc1d
 la/1sRUoa5KXbbLxBCZlns0cVoqRz8P1Fli0qUap0+ZwZPpGhi/1LddOrR2ALqv2pJHy
 xpAOQ9dKJkySOXB3CxfJFD66QvZUf9t310mecPaDhvU6pFpQavLoVJNXYQJXCZaYv1f5
 OE/rYG5ddn2/rGAquosyoCxZ5B3w0H63YbvUS6eRea+j+BpW4PFmubm1xcGFEEFLra7Y
 JS6fEd9VCYRNkVdl5zOGCiVbcfTTnv1fWBDRCKqyulcgu6l2SHtph4DDakPojvqSEzos
 tUFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=yTi5vRw0aWPoUIEbH62TpM+guLaGQobC44oNXUbvCDI=;
 b=hwOSM20WaXZcCYuTbY6ApexEqkGIBShy0hUDcJZs1TIeVPv0yGJ37pesCA0l7rZAJo
 UaUjtkJ0GOZlDKCSz8A0F9Jnz0KL+5kyf+8c5ANdmr1NrKi2LWOaSuxkcxNJ9Uw8VNrp
 HS6fd8mRcvhv4UbnI+TKl0UYDfsVK6q98bit9MQhNn+Xsq22Iq8AEP/aoZnn9pctR999
 CmqRQRZRovBAfRZsI2r7uLIxN6L5WZDnFYOe8x6buODZS4BSiTRmHdpA0C0LURFp3pYO
 i0bMUN64Qaje07Y9jcAVhIlAq+CmmW90diOQK96NGJTC1fm5ueP/qRJlAiUWIj2rHWLf
 vt2A==
X-Gm-Message-State: APjAAAUQLGDihaP7KB4HgT/aK7AmSUxjbGnmqVGuHMnM5FWm7Icrpl4D
 sTiDvCd+bKP7lj0GrWzcz0EWB5n1x5yUZA==
X-Google-Smtp-Source: APXvYqzzwGPhYA9m2qWRIcV7penovAk3QfgmnmnzL4itMPp/iKuoRlFTV1/c/hByB8TItfTECBoHfQ==
X-Received: by 2002:ac8:7357:: with SMTP id q23mr13891933qtp.110.1575651948564; 
 Fri, 06 Dec 2019 09:05:48 -0800 (PST)
Received: from [0.0.0.0] ([167.86.94.107])
 by smtp.gmail.com with ESMTPSA id p126sm6093506qke.108.2019.12.06.09.05.46
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 06 Dec 2019 09:05:47 -0800 (PST)
Subject: Re: Regarding "Inferring and hijacking VPN-tunneled TCP connections"
To: Jordan Glover <Golden_Miller83@protonmail.ch>
References: <20191205191318.GA44156@zx2c4.com>
 <db72ae85-4e68-1745-e11b-0fb81016358e@gmail.com>
 <CAHmME9osDRPQvfYMexRcAhHdAb-x2PjD8Wnf+nrcHyX42ivmqA@mail.gmail.com>
 <51usC7EJy_alaYnTOuLCvYhTzzcKrvAfq01j0Vfu5QVd6OGARQLdDDqQymloKWhWqkp81E09bpwjSRw5mnJDwg5fv8FuAVS-W0CYLuJlpRI=@protonmail.ch>
 <CAHmME9qUWRO76NJrnO5iNoWuauvMT3kf+qM1bY49bVkcBFXY9g@mail.gmail.com>
 <1bcf459c-4c08-33b2-19da-31cb62fd56a1@gmail.com>
 <sZXjoRuWmvBHjZtlb28qeohg4R8BAHjCk5b-I2TWb5-ew1OZJBGYefxuSzTjFP7e5lESacVJMtp4fKIl7wyXJCI1iIznqnStW6OxG-P9YeQ=@protonmail.ch>
From: Vasili Pupkin <diggest@gmail.com>
Message-ID: <860fe8c7-de2a-57c7-e69a-7ae9cbf263ae@gmail.com>
Date: Fri, 6 Dec 2019 20:06:00 +0300
User-Agent: Mozilla/5.0 (Windows NT 5.2; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <sZXjoRuWmvBHjZtlb28qeohg4R8BAHjCk5b-I2TWb5-ew1OZJBGYefxuSzTjFP7e5lESacVJMtp4fKIl7wyXJCI1iIznqnStW6OxG-P9YeQ=@protonmail.ch>
Content-Language: en-US
Cc: "William J. Tolley" <william@breakpointingbad.com>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

On 06.12.2019 19:12, Jordan Glover wrote:
> But nft rule won't be visible from iptables tools like iptables-save,
> right? This may be confusing for people who still use iptables for
> setting up firewall on their systems.
>

Right. And for those using NFT, they will see a strange rule in their 
default inet filter table. Also nft users may delete this table or its 
input chain or alter the chain hook specification before calling 
wg-quick and in this case the magic command will crash. So it should be 
added to wireguard specific table instead of inet filter and this is 
actually the only easy way to revert the ruleset in nft, you should 
delete your table to revert the changes.

nft add table inet $table
nft add chain inet $table input {' type filter hook input priority 0; 
policy accept; '}
nft add rule inet $table input fib daddr . iif type != { local, 
broadcast, multicast } drop

and then:

nft delete table inet $table

when we are done.
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
