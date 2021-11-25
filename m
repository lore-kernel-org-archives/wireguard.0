Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B13DC433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 25 Nov 2021 12:35:51 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id d4e8af3f;
	Thu, 25 Nov 2021 12:34:38 +0000 (UTC)
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [2607:f8b0:4864:20::42a])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 87c743af
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 25 Nov 2021 12:34:36 +0000 (UTC)
Received: by mail-pf1-x42a.google.com with SMTP id b68so5782006pfg.11
 for <wireguard@lists.zx2c4.com>; Thu, 25 Nov 2021 04:34:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=0eAV0QCSYY59EfhYYGwBRd+u8b18m2Ztdaw86lrALGo=;
 b=LbIS6sfQbR7fqoUkZOLPzKEM4vW/6AVOeUj6EtJCuvOGCkevZx04B0ZK5wHKeN5+EO
 jNQ2xJsCyzfwE6iYGIeypC9+6edPYMpDvF1ty1u13S8lgV1HAmPRLWt62UTJyEMr2TPt
 dRwMyHNQwkT6FiEADnEd3k2q13CS7l4MLg+17ZaoargK+4QB8DBvtBHR2j3th/INXGrC
 zhuiWiRkFb6NgeaKCrHfleTOk4LEQuI1jFO4gdU5K3J38H3BM3xZVlQw2AuaDtL9dbjY
 8bqWDCG0AkUDXu2UMsee5uKh1XwQuHZgFlXA5qgBofn7aNe4oHiglbVAzW5mqJSSxT69
 Xq+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=0eAV0QCSYY59EfhYYGwBRd+u8b18m2Ztdaw86lrALGo=;
 b=VAFvwBsmFUbDgvDwS8SInNXz/a7MEurRBvctbpd55qkf6tZaFmSwBzrGBcbHA5zQAC
 uni1kYHKJjyiupBpZb3JdLyzt7x8UMhmiL+zfEOicu3edNkogU1uM3B/Zw51g7HWTIVr
 VnZledm+t2NmLwCJELKQbOKnZb+WHJwDHLcQOebfVxoy2gD4dhcTlI32O/QfrRkTytBA
 Iy5HBAC0Z2/h2QRPiAmW8D9uI7mbd5IUynmPEeGB7+44owl/DWd8xqWsdebhiIfX6zJC
 P5l5Y49pckMmUrkYbLbRs0Fcu2PPL3xotjSB393PQx4xWlYMZr4gBY6j93BBdUVz1Lrb
 rY5g==
X-Gm-Message-State: AOAM531P+dHhy1FhQ8QylUiOys5XZYji6V6YEvT2xzmAjWyyXHkHx27e
 pH0MbgLYHA1UIx3X8Goohfk=
X-Google-Smtp-Source: ABdhPJwJjoRLjGJFIoyzqBMwPXueRu0hLtMHlkWRVw7D9yc9QIuLxqm8pMij0y6F3VMyns6g1SUmQQ==
X-Received: by 2002:a05:6a00:8c6:b0:4a2:d762:8b42 with SMTP id
 s6-20020a056a0008c600b004a2d7628b42mr13732350pfu.28.1637843674170; 
 Thu, 25 Nov 2021 04:34:34 -0800 (PST)
Received: from Laptop-X1 ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id h13sm2373135pgg.16.2021.11.25.04.34.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Nov 2021 04:34:33 -0800 (PST)
Date: Thu, 25 Nov 2021 20:34:28 +0800
From: Hangbin Liu <liuhangbin@gmail.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Shuah Khan <shuah@kernel.org>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>,
 Netdev <netdev@vger.kernel.org>, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH wireguard] wireguard: selftests: refactor the test
 structure
Message-ID: <YZ+C1MWdWQvd66ic@Laptop-X1>
References: <20211116081359.975655-1-liuhangbin@gmail.com>
 <CAHmME9pNFe7grqhW7=YQgRq10g4K5bqVuJrq0HonEVNbQSRuYg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHmME9pNFe7grqhW7=YQgRq10g4K5bqVuJrq0HonEVNbQSRuYg@mail.gmail.com>
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

On Tue, Nov 16, 2021 at 03:35:40PM +0100, Jason A. Donenfeld wrote:
> Hi Hangbin,
> 
> I don't know how interested in this I am. Splitting things into two
> files means more confusing maintenance, and categorizing sections
> strictly into functions means there's more overhead when adding tests
> (e.g. "where do they fit?"), because the categories you've chosen are
> fairly broad, rather than being functions for each specific test. I'd
> be more amenable to something _entirely_ granular, because that'd be
> consistent, or what we have now, which is just linear. Full
> granularity, though, has its own downsides, of increased clutter.
> Alternatively, if you'd like to add some comments around the different
> areas to better document what's happening, perhaps that'd accomplish
> the same thing as this patch.
> 

Hi Jason,

May be my timezone is not very fit for yours. So I will copy my IRC replies
in the mail to moving on our kselftest topic.

The reason I did this patch is because I want to make the test more clear
and able to run each test case separately. My though is to make the
wireguard test looks like tools/testing/selftests/net/fib_tests.sh.(Of course
this could be discussed).

Because the linear structure makes reader hard to find out what test it does.
The function name in my current patch is also a little broad to look, which
could to be updated. After updating, I'd like to make the test has 2 parts,
functional tests and regression test. Functional tests for big part of function
tests and regression test for small specific issues.

BTW, one downside about current linear structure I think is that when someone
want to add a new test, he need to read through the whole test to know that
kind of topology at last. But with function structure, when we want to add a
new test. We can just do like:
1. set up basic topology
2. configure to specific topo for testing, or just skip the first step and
   configure to specific topo directly.
3. Do test
4. Clean up environment or reset to basic topology

I think this would make adding new test case easier. What do you think?

Thanks
Hangbin
