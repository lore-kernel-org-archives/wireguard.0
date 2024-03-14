Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53222D49227
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 18 Nov 2024 13:47:43 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7e1e1b8b;
	Mon, 18 Nov 2024 12:39:31 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id d455e761
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 14 Mar 2024 09:25:01 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id
 4fb4d7f45d1cf-563cb3ba9daso784094a12.3
 for <wireguard@lists.zx2c4.com>; Thu, 14 Mar 2024 02:25:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710408301; x=1711013101;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=R2AMCKa8xjuFJ/+y6Cct9NYQEH6LHnnZ4GOl/QZE6sI=;
 b=W5s+vmPgyIz71y9d6GsRbv72QKfOnPK+IWSRNXwf3uE63w3Ao0Sl7RiDKzKfQ5rruG
 KBUNczameTwulJHw8OxVqZx5h8d60Zt+qweqZ3lZzQ3KNxV6iY//Ej9y5CQo+j3lcc59
 fHpmPzBNrtp5nt2q8Kr7EPU6iN7NmX3WcH1GgrdlPAqw9OeMzfdZjCfhWdJ80YAF5GpG
 Y7a8jlbUqo+lyjDQYV5pPPk+dOkS0gGF8KXUinBwe0Mcw7w7m2xjNqHo14RhkDQGwr6a
 rvd6PYPl2tcyrpiLXV1TYP2qxDwtgJ1tXCYgaPjUqX4x3K/g9x4xoLzZoR6Obza746Oj
 GP4g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXs4Lo9ZRnXIPL21JuwKAf0+8QdJpEHjNqjbh2B95n+QQQ1TafmqqI1l5Bpa4KaFP5+YiBurvpVHKHBp//4cvKAz26xosF3/hgb
X-Gm-Message-State: AOJu0YxGEwR50hVM0AuqnrX/pGrLIa5GQ61JUPbmcT4dgd1gGpQibBCF
 6dwlWlvwG+GbfyBpjaFE3z3gA2sOxCygelkPmoO2jod9DZj/d/tW
X-Google-Smtp-Source: AGHT+IEV2+DZzFGZ2aBVjsYtF46Z5Pf8Bzv2uM+4A3+8sU8bu/aI8ncLBomTP3kDjPXWSerq/6lTaQ==
X-Received: by 2002:a05:6402:4494:b0:568:3362:cccf with SMTP id
 er20-20020a056402449400b005683362cccfmr808747edb.7.1710408300966; 
 Thu, 14 Mar 2024 02:25:00 -0700 (PDT)
Received: from gmail.com (fwdproxy-lla-008.fbsv.net.
 [2a03:2880:30ff:8::face:b00c]) by smtp.gmail.com with ESMTPSA id
 m24-20020aa7d358000000b0056729e902f7sm521951edr.56.2024.03.14.02.25.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Mar 2024 02:25:00 -0700 (PDT)
Date: Thu, 14 Mar 2024 02:24:58 -0700
From: Breno Leitao <leitao@debian.org>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 horms@kernel.org, dsahern@kernel.org,
 "open list:WIREGUARD SECURE NETWORK TUNNEL" <wireguard@lists.zx2c4.com>
Subject: Re: [PATCH net-next v2 1/2] wireguard: Leverage core stats allocator
Message-ID: <ZfLCakKfDmC/JNPV@gmail.com>
References: <20240308112746.2290505-1-leitao@debian.org>
 <ZfJtzhKJV4yo3LRF@zx2c4.com>
 <CAHmME9prrtWu8jkj20WKvTZV6mjQE2Vt_mFWGOuy9St1FOrEOg@mail.gmail.com>
 <CAHmME9oPPtJXd8DsA+xXvbdN7T0PbAM5kYpQj32KZXv9bKP1ng@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHmME9oPPtJXd8DsA+xXvbdN7T0PbAM5kYpQj32KZXv9bKP1ng@mail.gmail.com>
X-Mailman-Approved-At: Mon, 18 Nov 2024 12:39:22 +0000
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

On Wed, Mar 13, 2024 at 09:35:43PM -0600, Jason A. Donenfeld wrote:
> On Wed, Mar 13, 2024 at 9:27 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> >
> > On Wed, Mar 13, 2024 at 9:24 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> > >
> > > I applied this series to the wireguard tree. Thanks for the patches.
> >
> > Actually, sorry, nevermind. 1/2 is fine, but 2/2 results in `ip -stats
> > link ...` returning all zeros.
> 
> Ahh, okay, required some more commits from 6.8. Okay, seems to be
> working. I'll let this cook a bit and then push it up in a while.

Right, it requires the following commit, which is already in net-next
and 6.9 by now.

3e2f544dd8a33b2f6 ("net: get stats64 if device if driver is configured")

Thanks Jason!
