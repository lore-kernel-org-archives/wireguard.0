Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2504AC54ED0
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 23 May 2025 18:46:57 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d3ecb80d;
	Fri, 23 May 2025 18:46:56 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 964e16c1
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 23 May 2025 18:46:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 1428EA4F8A1
 for <wireguard@lists.zx2c4.com>; Fri, 23 May 2025 18:46:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B2BBC4CEEF
 for <wireguard@lists.zx2c4.com>; Fri, 23 May 2025 18:46:52 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="P3mOZtgf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1748026010;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8Qq3TsbzT2vKDvhdAercIY2tU24F9Mm5qeOvKEvPcbE=;
 b=P3mOZtgfqQcoDXD1gWTqUPgthRtL33nRbNm6LxUrjY8C5y1Ec1s8oB0G1Suu5JD1mRSf7D
 cqWSjchNHJ9w7KT2nyCFhFWYZ7lyw/QVcLi2GBDSuv0ma1N9hP3u/gFolxswrnJyiQbjk/
 xOixb7jDLkquc2JPZFu28h2XVU6G0kI=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 4a872d77
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 23 May 2025 18:46:49 +0000 (UTC)
Received: by mail-oa1-f49.google.com with SMTP id
 586e51a60fabf-2cc89c59cc0so759553fac.0
 for <wireguard@lists.zx2c4.com>; Fri, 23 May 2025 11:46:49 -0700 (PDT)
X-Gm-Message-State: AOJu0YyQn/ik9k4iLJMJKDa1ANWncGVtal+0i7d122ECIeN8hQKi7BEW
 yeO6HBANJLn5nNo1iP998oBo30C2LslgZzFAz3dudIYaA/FnLGtp1N6zNPQ8Axey/ltH7Ma4ZTX
 Pm38GLfrgKnVJ5T9PNEaAu5ydKJxBtHM=
X-Google-Smtp-Source: AGHT+IGDzVGT1uGbfLIl/XCagnQy2dPRDwSNBntgu/rxZ7RP+IGDLnHP+RYU0Ddl37kxznhwSWopAvpVD9BFYm/c2Mg=
X-Received: by 2002:a05:6870:a508:b0:2d4:e8ce:7bcc with SMTP id
 586e51a60fabf-2e83e2a1e82mr3032852fac.8.1748026008500; Fri, 23 May 2025
 11:46:48 -0700 (PDT)
MIME-Version: 1.0
References: <20250115113349.106339-1-robyn@kosching.me>
In-Reply-To: <20250115113349.106339-1-robyn@kosching.me>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 23 May 2025 20:46:36 +0200
X-Gmail-Original-Message-ID: <CAHmME9rKag+fQkRcnasENaJnYrZ3BfFYa35JiS6nSvnQxaZWnw@mail.gmail.com>
X-Gm-Features: AX0GCFu41g2jqyIxK7WEFy17JtbdBBYVzCTXrKRF0Djse7mwQcRam5sUni36gNM
Message-ID: <CAHmME9rKag+fQkRcnasENaJnYrZ3BfFYa35JiS6nSvnQxaZWnw@mail.gmail.com>
Subject: Re: [PATCH wireguard-tools] wg-quick: escaped # in Pre/PostUp/Down
 recognised
To: robyn@kosching.me
Cc: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
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

Thanks. Applied with some minor changes here:
https://git.zx2c4.com/wireguard-tools/commit/?id=90deacd33da06534ee98d41c6e76e108b35cf077
