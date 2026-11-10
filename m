Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B2A5606A31C
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 10 Nov 2026 16:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=pGehe2LQ
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id a8d706c9;
	Tue, 10 Nov 2026 16:15:22 +0000 (UTC)
Received: from mail-pg1-x568.google.com (mail-pg1-x568.google.com
 [2607:f8b0:4864:20::568])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id dadb914a
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 10 Nov 2026 16:15:19 +0000 (UTC)
Received: by mail-pg1-x568.google.com with SMTP id
 41be03b00d2f7-cdd89d84521so564289a12.1
 for <wireguard@lists.zx2c4.com>; Tue, 10 Nov 2026 08:15:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794327318; x=1794932118;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:dkim-signature
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=rKe3RLk4JxrierGKbV3bbaeh/9SZFCQAfjUhbK7zB2c=;
 b=WJquCMNlwD5aB89MYbKBFSISj+jhy61n7abuktY4BPdqFT9S/sw6CTjw9T4iIApaV7
 EvzmLP1uGhOwpZOMh8//lBnbu8MoImtBgdui9ecRDTHHdFfKhS79evP/4BCUv881VXpf
 /VJvMJUFlbQAEMiicYdkvhL+8rUqgulXbODABxK39sn2Y8Q5OpYjXinChX2fgL/I173x
 sJ2wzHqwAzc2Y1xVMixBeDMmQp22YD7Jj9BnpNC7qqGDy3YBgfaasxkhBW07mWuPUmpf
 cJUUQn+hMKwQPKx/ZEWLui84f5cl5qqBTL+GY6VrxR5k5TWBEHhmER1x6TcoJMK3Br/n
 uYOA==
X-Gm-Message-State: APuU4Z/BznbsbQ4J7JMQSG5/+RVLTwoVGLsLcfMRaRqgsXCXM/KvwcQk
 ADCEzTNiyG/u6KDC4fg2tJ8dSfEOdQhIkbpp9oN49cjGlQLDGeFhe+WfHuff/ftWoIoUjfk5VGR
 3J3ynGIAJkQyuTWT2uX091ZyZ65TZHXAWF8AYbcKahg==
X-Gm-Gg: AYBFou2O0f+E923pPjFTcI7BmWzBKctpWET2eVOAEuEY8C0pLbNyrFcUoN8v5FMcrKb
 VY+DN537PqiYIcc+o/JBY2f7mzSJAN/abcVACy5CNi1MCOHw5cgy4Z9nEwRvFWzt4WTKBGwqAgg
 QV0iY+qu+gBpJsGDHKkPThU5SD9pjdWzkxsyNn6/qYrNBI3HnLiy15atHtyA/RSImuyNWZfD4uB
 wandzcPsOCtRm+Ynm6kCOOTgvWxCdG+y9UVY6YhIYOs1wugnV8ORLJh9+d8vBS9KJWh9T1D8znD
 lkhaiFZgPe4vj/G5IqXn0tRD71GcsJKEKz8z1SKOAw8wlyry7ynSHwonBiy3CQ9AGo7y0H6O9lc
 0Yg==
X-Received: by 2002:a17:90b:180b:b0:3ab:8288:b8ce with SMTP id
 98e67ed59e1d1-3b1679b47fcmr2244747a91.24.1794327317581; 
 Tue, 10 Nov 2026 08:15:17 -0800 (PST)
Received: from zx2c4.com (mail.zx2c4.com. [104.131.123.232])
 by smtp-relay.gmail.com with ESMTPS id
 98e67ed59e1d1-3b17db39f76sm204939a91.3.2026.11.10.08.15.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2026 08:15:17 -0800 (PST)
X-Relaying-Domain: zx2c4.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1794327316;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rKe3RLk4JxrierGKbV3bbaeh/9SZFCQAfjUhbK7zB2c=;
 b=pGehe2LQg6Cda91vA8zUktAR8xfXFDFUwCr5GYirTyuxbwiy2vsvGDgNB+v/jHa5w5KWM3
 1G4qMC/QGFG8pBjj2njBC+w4MvPftB5/fE5INwMs7K1ySpp+tFGnGXyIfQFKvC24hk0cQ/
 U8GP4v64wQPxht90ZOjLumlZ6DuiIt4=
Received: by mail.zx2c4.com (OpenSMTPD) with ESMTPSA id 9251d1c0
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Tue, 10 Nov 2026 16:15:15 +0000 (UTC)
Date: Tue, 10 Nov 2026 17:15:13 +0100
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Jacob Moody <moody@posixcafe.org>
Cc: wireguard@lists.zx2c4.com
Subject: Re: Implementation for the 9front operating system
Message-ID: <avNDEWFqlEfq1e6Y@zx2c4.com>
References: <0ab57e49-8904-4e4b-bc3a-38e10b214ab3@posixcafe.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <0ab57e49-8904-4e4b-bc3a-38e10b214ab3@posixcafe.org>
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.30rc1
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Moody,

On Tue, Aug 04, 2026 at 04:08:07PM -0500, Jacob Moody wrote:
> All,
> 
> I've been working on an implementation of wireguard for 9front.
> I am starting to get to the point where I feel like the implementation is getting
> pretty close, and its in a good spot to review before I do some tighter integration into 9front.
> 
> I know in the past I've seen some desire from the wg community to ensure that code using the wireguard
> name at least be somewhat decent. So I wanted to share it here and get feedback if people felt inclined.
> 
> Grab the code from your choice of git hosts:
> 	git://shithub.us/moody/wg
> 	https://github.com/majiru/wg
> 
> I am happy to answer any questions regarding plan 9/9front specifics.
> 
> One note is that there's some stubs right now, the dynamic runtime addition
> and subtraction of peers, and likewise the condition under which we send
> cookie's is not implemented, that's pending the more tighter integration.

Cool project! Would be happy to look at it together at some point. Let
me know when you feel like it's "complete" and matches the various
semantics of the Linux implementation, and then maybe we can do a
read through together. I've always wanted to learn more about 9front.

Jason
