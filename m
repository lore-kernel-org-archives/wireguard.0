Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08880D591D4
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 19 Nov 2024 07:22:55 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1f32c92d;
	Tue, 19 Nov 2024 07:22:33 +0000 (UTC)
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [2607:f8b0:4864:20::52e])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id e461bde4
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 19 Nov 2024 07:22:31 +0000 (UTC)
Received: by mail-pg1-x52e.google.com with SMTP id
 41be03b00d2f7-7f8c7ca7f3cso3017554a12.2
 for <wireguard@lists.zx2c4.com>; Mon, 18 Nov 2024 23:22:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1732000949; x=1732605749; darn=lists.zx2c4.com;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=R2hYIOgm2Uff4u1jweT3m4e9LzzXMUoAloHgshXGR88=;
 b=JPTRlu2nbGYYGWTXlp0KPf/sryn5/orXFM+/7QRM/MSPfZ2K+lYvTATSXJCNBnwpk2
 WxX0Jtm+NmGOLHeEnFdRqd7EBEAA/t/I0URRJbgIiQfM5HEDyKfy5GdGwn68GH/wOqxU
 IGOslDUowS7ytfuZpWvyJJLvPFCKr9EdQOMYsZlL+NIfRnyH6fVeI4aFgNqZPFQ2BaU6
 E8pWhrEajvLm4AWID1z20CHfHNBYe39mvX3NqSIRpoioJfZ3xauJgXL69JE6rt03Sszh
 CeLkbWTlvzIksID4++OZ6VhG8Rths+GjE9bg8DPSyQyA0/Biso+ddjYIywZ4XatgWaIv
 CHQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732000949; x=1732605749;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=R2hYIOgm2Uff4u1jweT3m4e9LzzXMUoAloHgshXGR88=;
 b=JCYGuaiDZUPOp7AaFGTN3SqHwPRkYH2AhsMfyrCyht1xfQiAsWGrZQ4AbCCEMsm5Be
 HqrYt9lk7DsTNGVrJtiQ1+QZQKzQNRl8k69wyAPtXnMeBLfa3k48tmWKrCsaoPCRT6MB
 LtO29NDU6EwOVUJdJlJsXgvPD55pCxZyRGwT9kwvceUlDqHOW+aIBJhdAV/6cqFSrtlj
 +3PSnBIwFjuhtK4LtWWq9IIV+wuQ69pDlhvqlf0ByfP/TKMGoOr/nQdE6C3j9596WEDD
 he7dqtnGDFrSjrtLOJTJniAInCZysIlDiHoyIaya56gWDpNnIeEn9//VVP06/ei3ShDj
 h+kw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUxSo+J+VtBI/byaDht2v/ePG5lQZuES9KOxESWZky4/D14MkNJK//CmUW/9zbRuin3ThyNqF8JWeY=@lists.zx2c4.com
X-Gm-Message-State: AOJu0Yw2kBMMhcOofg3/YzH8VK+VqHIulEKrNj5MZQBE67XebNqTstq/
 Hr6Tb1gSKZa4aCjzNrxhAo9Ahi9SzMomWVshOTN+kEywzxn6OUv/
X-Google-Smtp-Source: AGHT+IHpjvOJ/TXR1vPPwp8b3+0f5TCsPpSfNMW9tcKmYwoCx3JQ4QjniS/QesuBZjjSmzoHklC+3A==
X-Received: by 2002:a05:6a20:918b:b0:1dc:c19a:3a08 with SMTP id
 adf61e73a8af0-1dcc19a3e8emr2133510637.17.1732000949359; 
 Mon, 18 Nov 2024 23:22:29 -0800 (PST)
Received: from fedora ([43.228.180.230]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2ea28300b26sm6257086a91.16.2024.11.18.23.22.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Nov 2024 23:22:28 -0800 (PST)
Date: Tue, 19 Nov 2024 07:22:21 +0000
From: Hangbin Liu <liuhangbin@gmail.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: netdev@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 "David S. Miller" <davem@davemloft.net>,
 Florian Westphal <fw@strlen.de>, Phil Sutter <phil@nwl.cc>,
 wireguard@lists.zx2c4.com, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCHv2 net-next] selftests: wireguards: use nft by default
Message-ID: <Zzw8rb202R6FWVHs@fedora>
References: <20241111041902.25814-1-liuhangbin@gmail.com>
 <ZzpNXM17NX3nVzMl@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZzpNXM17NX3nVzMl@zx2c4.com>
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

On Sun, Nov 17, 2024 at 09:09:00PM +0100, Jason A. Donenfeld wrote:
> On Mon, Nov 11, 2024 at 04:19:02AM +0000, Hangbin Liu wrote:
> > Use nft by default if it's supported, as nft is the replacement for iptables,
> > which is used by default in some releases. Additionally, iptables is dropped
> > in some releases.
>  
> Rather than having this optionality, I'd rather just do everything in
> one way or the other. So if you're adamant that we need to use nft, just
> convert the whole thing. And then subsequently, make sure that the qemu
> test harness supports it. That should probably be a series.

Hmm, try build nft but got error

# make -C tools/testing/selftests/wireguard/qemu/
make: Entering directory '/home/net/tools/testing/selftests/wireguard/qemu'
Building for x86_64-linux-musl using x86_64-redhat-linux
cd /home/net/tools/testing/selftests/wireguard/qemu/build/x86_64/nftables-1.0.9 && ./configure --prefix=/ --build=x86_64-redhat-linux --host=x86_64-linux-musl --enable-static --disable-shared
checking for a BSD-compatible install... /usr/bin/install -c
checking whether build environment is sane... yes
...
checking for pkg-config... /usr/bin/pkg-config
configure: WARNING: using cross tools not prefixed with host triplet
checking pkg-config is at least version 0.9.0... yes
checking for libmnl >= 1.0.4... yes
checking for libnftnl >= 1.2.6... yes
checking for __gmpz_init in -lgmp... no
configure: error: No suitable version of libgmp found

But I can config it manually like: ./configure --prefix=/ --build=x86_64-redhat-linux --host=x86_64-linux-musl --enable-static
--disable-shared correctly

Do you have any idea?

Thanks
Hangbin
