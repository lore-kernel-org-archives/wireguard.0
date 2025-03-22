Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E30FC2D0CD
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 21 May 2025 11:12:42 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 09d52f14;
	Tue, 20 May 2025 19:43:21 +0000 (UTC)
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [2607:f8b0:4864:20::62a])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id fdfbeabe
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 22 Mar 2025 09:25:28 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-22349bb8605so63624555ad.0
 for <wireguard@lists.zx2c4.com>; Sat, 22 Mar 2025 02:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742635526; x=1743240326; darn=lists.zx2c4.com;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=CAxmjD+4ShrH2qVul5h8U6ZQKpv0SeH27W7krvXTAuY=;
 b=nKB7s8fegdrAvwqWiV2W5mkWAtpCv+spZ8z8mv/6P5olIveJM06vkeHHZcLf4hu68a
 U6xXG64rUaWIBMKgN8aE+oiVevtVHs7M6rK5vC8ww6HQNbdFqA3HX6ynLXl+VkFmlk2W
 mVgyKm9agHo/rurThWvRthusm6ptx5JoRFNNDW7b9lMTSd0yYhbJW8NZHyOArW2bXExg
 eFspgTxVOEu7LBCIutFnuBdYurT3sfahbR3as2YHS6QbFAC5RsD6W8geKWsKUwWHYY8L
 puPpHYeSDhn48VeL5yQ4k+F71vExgpjhSG0R2L2ez4UgIrn2b4flEvinb2UTHB+Eh5T4
 6+cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742635526; x=1743240326;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CAxmjD+4ShrH2qVul5h8U6ZQKpv0SeH27W7krvXTAuY=;
 b=iEn7E/Pb0OK63dCqkCdAQnxacgD4khvvL/9Jfk4QWbenndzq5OeGrzI6iUlmaranHr
 dGXbsUSE7gWrN22EIPrF7yCOrprYrGd6E+4ZOxAsOc/hfNKDbsGwTq+r+pjTN5uhCnl6
 rpMGISYrSNQ1DDZoQmnSxEcKxy0gpVVKelrxWyw6vDkEH0E6fHBt6cJBhb5eEqkR1BC5
 n/8Pb8oU5gM+pqbii2hRkuao7ibO+6r9PgzyR/aBKVVzgHiYNMqQjabQYK8Wi2A/KcZ6
 8D2vtDU2e0abGfo3NR//Z27njWarxi9vDYndN7V8FiRC2PGE/ZdkI+FhV4ki4CNDuSJ+
 Wa1Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVcV1XsCNRIGFPmwD/3cmGAL6vkCZT999btwsT1jPHV4y/2GD4ifEim3NN2QjFS5Ivyf6oHdyIblp4=@lists.zx2c4.com
X-Gm-Message-State: AOJu0YxVXyFMBifKi2dr7LAKIxQ64RE10FKbUn2sWQMc6hWcW2HN+tUU
 4penKiCswINuskp9VoYv1HbWDT/yianm5+z2oPiH3chMm4qhFPlx
X-Gm-Gg: ASbGncv2Qof6OKNaWyY/Un5ihelwimYDVfohecQtNUWFoThvuOJ7U7a8bSGHO+QV7g5
 8XVNkaPSpX83EZmlBRJh3a7eGJ3GfVJVbItXj8sxOEfEmzUX7IndnTwQW6aqhqylwzXue1ynVp7
 e2dly82SU2amaO2TAnEk5f99Dn3NCfIYL9YAvCCM4cNS0a5fpwBtZJY41DEx6l/ZiLEIKwT0DaJ
 6jVrXsb/rd6RDePSQ9wRm34jM4JK5aHxURqwLR+gaZ8MOFKkKqZyUz6vCgJrUlYYm5lzw26B65Y
 xvm29XTJdUpxGhFKx7HWp9OMdjt0pn1FjfTv6MnqYXkk58UeOg==
X-Google-Smtp-Source: AGHT+IFSu+bGGQRjawLHDtslf0SzwTbnDI1kjP5psSX/njED57/1HtiodD8whtxKMq7t1GftztQyIg==
X-Received: by 2002:a05:6a20:72a0:b0:1f5:889c:3ccc with SMTP id
 adf61e73a8af0-1fe42f74ff5mr11146522637.14.1742635526324; 
 Sat, 22 Mar 2025 02:25:26 -0700 (PDT)
Received: from fedora ([43.228.180.230]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-af8a27dbb2fsm3230302a12.9.2025.03.22.02.25.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Mar 2025 02:25:25 -0700 (PDT)
Date: Sat, 22 Mar 2025 09:25:17 +0000
From: Hangbin Liu <liuhangbin@gmail.com>
To: Phil Sutter <phil@nwl.cc>, "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: netdev@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 Shuah Khan <shuah@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Simon Horman <horms@kernel.org>, Florian Westphal <fw@strlen.de>,
 Petr Mladek <pmladek@suse.com>,
 Yoann Congal <yoann.congal@smile.fr>, wireguard@lists.zx2c4.com,
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCHv4 RESEND net-next 2/2] selftests: wireguard: update to
 using nft for qemu test
Message-ID: <Z96B_VRDHZHPn-2w@fedora>
References: <20250106081043.2073169-1-liuhangbin@gmail.com>
 <20250106081043.2073169-3-liuhangbin@gmail.com>
 <Z9rtrVk-15Ts_BNp@zx2c4.com> <Z91CGRP9QLdZONiZ@fedora>
 <Z91QshzKRlmPdpv7@orbyte.nwl.cc> <Z91fXURX3BQFDaq9@fedora>
 <Z916VMSCEtinZl54@orbyte.nwl.cc>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z916VMSCEtinZl54@orbyte.nwl.cc>
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

On Fri, Mar 21, 2025 at 03:40:20PM +0100, Phil Sutter wrote:
> On Fri, Mar 21, 2025 at 12:45:17PM +0000, Hangbin Liu wrote:
> > On Fri, Mar 21, 2025 at 12:42:42PM +0100, Phil Sutter wrote:
> > > Hi Hangbin,
> > > 
> > > On Fri, Mar 21, 2025 at 10:40:25AM +0000, Hangbin Liu wrote:
> > > > Hi Jason, Phil,
> > > > On Wed, Mar 19, 2025 at 05:15:41PM +0100, Jason A. Donenfeld wrote:
> > > > > On Mon, Jan 06, 2025 at 08:10:43AM +0000, Hangbin Liu wrote:
> > > > > > +	echo "file /bin/nft $(NFTABLES_PATH)/src/nft 755 0 0" >> $@
> > > > > > +	echo "file /lib/libmnl.so.0 $(TOOLCHAIN_PATH)/lib/libmnl.so.0 755 0 0" >> $@
> > > > > > +	echo "file /lib/libnftnl.so.11 $(TOOLCHAIN_PATH)/lib/libnftnl.so.11 755 0 0" >> $@
> > > > > 
> > > > > Can't these be statically linked into the nft binary?
> > > > 
> > > > If I omit these, I will got error like
> > > > 
> > > > mnl_attr_put: symbol not found
> > > > 
> > > > Even though I set `--enable-static` in nft build.
> > > > 
> > > > Do you know what's the reason?
> > > 
> > > I was able to have nft linked statically against built libmnl and
> > > libnftnl by passing '--disable-shared --enable-static' to configure
> > > calls of all three build systems. With --enable-shared in library
> > > configure calls, nftables build preferred to link against the DSOs and I
> > > did not find a way to change this.
> > 
> > The patch is using
> > "./configure --prefix=/ $(CROSS_COMPILE_FLAG) --enable-static \
> > --disable-shared --disable-debug --disable-man-doc --with-mini-gmp --without-cli"
> > to build nft.
> 
> Do you pass that to the configure calls for libnftnl and libmnl, too? I
> didn't find a way to force static linking in nftables build system, so I
> disabled building of shared libmnl/libnftnl libraries.
> 

It works after pass that to libnftnl and libmnl.

Thanks
Hangbin
