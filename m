Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60790C54E92
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 21 May 2025 09:18:16 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ed8a0085;
	Tue, 20 May 2025 19:43:11 +0000 (UTC)
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [2607:f8b0:4864:20::632])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 8b461dc4
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 21 Mar 2025 12:45:27 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-225a28a511eso40704355ad.1
 for <wireguard@lists.zx2c4.com>; Fri, 21 Mar 2025 05:45:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742561125; x=1743165925; darn=lists.zx2c4.com;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ri8DrHl9V+VnfdvMXOIXJllITyYvJjqgNAio1XrDnKs=;
 b=b3IqsROrtG7KdT9i2o4Kyn+pcZCj2k/rHa8XDOu9Ve8ZctssmCmmXyZYWGAAL09vG8
 qKASjbBhZzFTMnd/qlukc6OYg9WzObEAd0i8NYXuezzqLTiOAYmnHIA/6PFWKmpl6wQv
 W6pqA9JyozEIKk2SFvWbgA4Dc1INXXw6gfxJ9/JdZjOGJwG0/DzFVRmrEL4vy0QmU/MZ
 qFe8NEYK3fMrqHMQ7Xy+pg2UK55OdEEzPUvq4PJL/aqQZolONkpScupBTfk4SPQQ0WtP
 KuZQPB/pflDKfibfiDN8PQQL/dNa+MeTHOoADd6bPGGK4CdRIsTOt1C8oGje11LulrPr
 VhFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742561125; x=1743165925;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ri8DrHl9V+VnfdvMXOIXJllITyYvJjqgNAio1XrDnKs=;
 b=cwnCPwSRobPiBe8Pe9I2cTSEJFJZhNV9w5SOluaHrzN6zSiV06cou7E63rPmQPcjVO
 ww4qIoyOCeyCP0pLvB09AUdmwluaNgEAE0hT1QLpQEo5gMxeDx1Udf/mDpT5waWBzxKV
 FsjZWe4C+KiyZsKDrp6rFsUaNyWN4uajReKNXEl7+deizSlNM86BSDhvCoI/rS7Io9uk
 HJ3G5ozmc/KnxkVHzfboqTQF0cyV1e3q0m4QISYuoo1VM4PQNyyA2YxWrC2ZrEjGqBNb
 FAjP7nb0bDy/nQNy7mb02BgsP+qH3qWXvbg3+jeQbfVIFthqIgdBLgit7fWGWZuM7m2L
 GyjA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV2Na/2xPWC/oDvdCAshQaOHQmGxdUdOC7+ZQKqzDP0yb2kstIsbpBYNB5ha44RMi9AOgA1KtNd7p0=@lists.zx2c4.com
X-Gm-Message-State: AOJu0Yw4HqFvzruBEtnk61syQUgPq/pxS21/B6lL/fHbHCg+598JfCeV
 D3FrFWFCrsWfw/LgRqXqxZYBN1IT2zVHeJU5eBdVPEW++bbMEzH5
X-Gm-Gg: ASbGnctZriSkZfAN/lrLRUzYnb1fTfy9ACBAIg6RP5tWCq+vMjVR0MmydzvJprzGT+W
 F5rFY3kE86Jwk6UQdnoVRVGvzLuDX7okcGUEj7x65mtiro9RdaIA3GLOqVFioPCcb94DDSGJqAw
 yCYjp726SpksHf+WZLCCn8e3qCOCp3QUoLb07KQ4ixaqZpy+RyQvzpgXNM+XQBZAcVe+QnPKopY
 Gbhb7NJOFWF5y7v0GtwfOV2VWyunQFgoZxvrjfNB+IdxJ2G5KkcZkUf0aVKAYbge7O/CErg9ViS
 eaSYvHPdbvrKCNcDjbCob3P65BsiWFQ8rxG/WxeZpX2Yqetylg==
X-Google-Smtp-Source: AGHT+IELvK3I72iTUDDcO1O4UKhcvpwpm33sVFuK5wBfJpG1DU5drkzjkeA85Qr9LNOrEFCR0OcThg==
X-Received: by 2002:a17:902:c411:b0:224:1780:c1ec with SMTP id
 d9443c01a7336-22780e07b2dmr52456085ad.35.1742561125406; 
 Fri, 21 Mar 2025 05:45:25 -0700 (PDT)
Received: from fedora ([43.228.180.230]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-227811d9f0dsm15294545ad.165.2025.03.21.05.45.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Mar 2025 05:45:24 -0700 (PDT)
Date: Fri, 21 Mar 2025 12:45:17 +0000
From: Hangbin Liu <liuhangbin@gmail.com>
To: Phil Sutter <phil@nwl.cc>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, netdev@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Shuah Khan <shuah@kernel.org>,
 "David S. Miller" <davem@davemloft.net>,
 Simon Horman <horms@kernel.org>, Florian Westphal <fw@strlen.de>,
 Petr Mladek <pmladek@suse.com>,
 Yoann Congal <yoann.congal@smile.fr>, wireguard@lists.zx2c4.com,
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCHv4 RESEND net-next 2/2] selftests: wireguard: update to
 using nft for qemu test
Message-ID: <Z91fXURX3BQFDaq9@fedora>
References: <20250106081043.2073169-1-liuhangbin@gmail.com>
 <20250106081043.2073169-3-liuhangbin@gmail.com>
 <Z9rtrVk-15Ts_BNp@zx2c4.com> <Z91CGRP9QLdZONiZ@fedora>
 <Z91QshzKRlmPdpv7@orbyte.nwl.cc>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z91QshzKRlmPdpv7@orbyte.nwl.cc>
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

On Fri, Mar 21, 2025 at 12:42:42PM +0100, Phil Sutter wrote:
> Hi Hangbin,
> 
> On Fri, Mar 21, 2025 at 10:40:25AM +0000, Hangbin Liu wrote:
> > Hi Jason, Phil,
> > On Wed, Mar 19, 2025 at 05:15:41PM +0100, Jason A. Donenfeld wrote:
> > > On Mon, Jan 06, 2025 at 08:10:43AM +0000, Hangbin Liu wrote:
> > > > +	echo "file /bin/nft $(NFTABLES_PATH)/src/nft 755 0 0" >> $@
> > > > +	echo "file /lib/libmnl.so.0 $(TOOLCHAIN_PATH)/lib/libmnl.so.0 755 0 0" >> $@
> > > > +	echo "file /lib/libnftnl.so.11 $(TOOLCHAIN_PATH)/lib/libnftnl.so.11 755 0 0" >> $@
> > > 
> > > Can't these be statically linked into the nft binary?
> > 
> > If I omit these, I will got error like
> > 
> > mnl_attr_put: symbol not found
> > 
> > Even though I set `--enable-static` in nft build.
> > 
> > Do you know what's the reason?
> 
> I was able to have nft linked statically against built libmnl and
> libnftnl by passing '--disable-shared --enable-static' to configure
> calls of all three build systems. With --enable-shared in library
> configure calls, nftables build preferred to link against the DSOs and I
> did not find a way to change this.

The patch is using
"./configure --prefix=/ $(CROSS_COMPILE_FLAG) --enable-static \
--disable-shared --disable-debug --disable-man-doc --with-mini-gmp --without-cli"
to build nft.

I don't know why it's not linked static.

Thanks
Hangbin
