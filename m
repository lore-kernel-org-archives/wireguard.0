Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C93EDC54E90
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 20 May 2025 20:19:21 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e9b1802c;
	Tue, 20 May 2025 19:43:02 +0000 (UTC)
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [2607:f8b0:4864:20::631])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id dfef868f
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 20 Mar 2025 07:41:05 +0000 (UTC)
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-2240b4de12bso9575545ad.2
 for <wireguard@lists.zx2c4.com>; Thu, 20 Mar 2025 00:41:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742456464; x=1743061264; darn=lists.zx2c4.com;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=S+9rATyUbEgbSLtbUz3EQuHc/4v8uBGhvmxcbw9HTp0=;
 b=G432TrZ4JrktsCdWrOHG9n8Lwq6zTubKGC4cwwHa/A0wnTzs9GF5wEDrucYztMl+rz
 PC8BVvVA9EVcZQUUeYKBZlQ0w87l6JM5kiOMBDhyCjolBovQkU4FWx2VnRuVcLj52am+
 16H96OzTucgYSQSb78045/zfcm3mIBj92s4WAfDoBUIW/GmwzEG6Tad7OMo/a+pKkeYT
 uCyteepF4WdON1Gi1xZlX1K/cj9pXXbYf8+2O3v+63x+oONcTTOccDIY16ASqhSNlKTH
 vKdeNCNoH55Uj11PbPJAIcV4n5uYeOfKvS5WHlrKucjC2vdQ/9K9kq5zJnuOoudQR6hS
 T9nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742456464; x=1743061264;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=S+9rATyUbEgbSLtbUz3EQuHc/4v8uBGhvmxcbw9HTp0=;
 b=XdTZi5OT1Zka5iqK7D6+svZdd1IkU1CwvwNE/7UJyoCzH/bpmha1De0EX57bsTaN32
 8TMBJZeRlQiehJUxSiaEVEDRV5cPC1QrJ7rxHIF/8MQt6Rg46FsGA9VkJ2CMr/b9z7cR
 C31YXNXrQdaJUZsOnaX6pdl/x2MHDXD7Qatw0yEUEzXC2tS2NS7bmqfgnJ48LVydkckb
 WA9j7RhpXtijZqfRLN1hKdN2sTP7s/m0dql+cd+fmlGwMFqv4WtXCWK6ggkqtTzlAUYb
 hgA7o1z+LiCiC5R+QXaTDROqbcQpMYGdFF9ELSICRHWad1dOh1EPnHTgIgoDcNXozFxZ
 P+GQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVVeDdfN4GZHWUeXZhm3qqoPhJfDveDPamfUR+biJcAKnvfF64RUIRxBbr9zv7JbEGpj3o6T/GLsB8=@lists.zx2c4.com
X-Gm-Message-State: AOJu0Ywq/u5vHq5WCzuOO+LRNLFbjwaSnUl4xH9O5J/j6bkPMg6xSQjf
 /P/xGgzVbpqPm9Wn8BdD1+18vKFujnWgTV//reYyhkWYPKh10WbS
X-Gm-Gg: ASbGncshs0taF1+mLRpiBQLOeczyVZFa4gzlGOemnOlaXUnTfAHuan/raXovVVzZa/L
 sK19EXTpmZJUGiNkcHejADTH1vHCSXzbmPwsYsp59o3whq0o+EFmEHVYNGf1NpexNNHWHq4HVCM
 Th4FGhG93MKUAz1PcgbFphSmg4P12E9/Dx+wnxl+MLDnUGGGmoX2vSR/5Jul8rHoUgRceNphX+v
 q8AwDFWHaDZ1smLN6vPPO/ZvvWg5VBq1zgfKNZIY8/onFt7P0vSdy8rQIUui8yULuZ8k1TR3HOn
 IKBTUbiHTMfD5q+aFcpjugZr8kH19sJq8G1PfROb9HT5mXPofBMkcCcsO+qAd3bR5A==
X-Google-Smtp-Source: AGHT+IFEvvOq/4NLQ23MHF6FNa/FiH21cHYco1EVNW+1BRuvD/pJTZLz+96cxRxci0zjnwX0L+gRcQ==
X-Received: by 2002:a05:6a21:3a4a:b0:1f3:47d6:aa05 with SMTP id
 adf61e73a8af0-1fbe87272d0mr11208399637.0.1742456463841; 
 Thu, 20 Mar 2025 00:41:03 -0700 (PDT)
Received: from fedora ([43.228.180.230]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-af56e9fe51asm12244697a12.36.2025.03.20.00.40.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Mar 2025 00:41:03 -0700 (PDT)
Date: Thu, 20 Mar 2025 07:40:56 +0000
From: Hangbin Liu <liuhangbin@gmail.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: netdev@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 Shuah Khan <shuah@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Simon Horman <horms@kernel.org>, Phil Sutter <phil@nwl.cc>,
 Florian Westphal <fw@strlen.de>, Petr Mladek <pmladek@suse.com>,
 Yoann Congal <yoann.congal@smile.fr>, wireguard@lists.zx2c4.com,
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCHv4 RESEND net-next 0/2] selftests: wireguards: use
 nftables for testing
Message-ID: <Z9vGiL1KkO5x8I-j@fedora>
References: <20250106081043.2073169-1-liuhangbin@gmail.com>
 <Z9lJ6PXHeL7tfhUf@fedora> <Z9rso2MXYBFGnJYl@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z9rso2MXYBFGnJYl@zx2c4.com>
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

On Wed, Mar 19, 2025 at 05:11:15PM +0100, Jason A. Donenfeld wrote:
> On Tue, Mar 18, 2025 at 10:24:40AM +0000, Hangbin Liu wrote:
> > I saw the patch status[1] is still "Awaiting Upstream".
> > Is there anything I need to do?
> 
> I'm looking at it now, but the subject line of your series says,
> "selftests: wireguards: " which is really not the same as all the other
> patches that touch these files.

Oh, I will fix the name in next patch.

Hangbin
