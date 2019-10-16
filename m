Return-Path: <SRS0=F87Q=YJ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60F63ECE599
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 16 Oct 2019 20:18:54 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F1AFA2168B
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 16 Oct 2019 20:18:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="ClS6OKHr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F1AFA2168B
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ed867070;
	Wed, 16 Oct 2019 20:18:11 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2b4ffb50
 for <wireguard@lists.zx2c4.com>;
 Wed, 16 Oct 2019 20:18:11 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d18acc2c
 for <wireguard@lists.zx2c4.com>;
 Wed, 16 Oct 2019 20:18:09 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 27e89a67
 for <wireguard@lists.zx2c4.com>;
 Wed, 16 Oct 2019 19:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=aI/PbT5exeWOrYC+OkFtrKIwdbQ=; b=ClS6OK
 HrgHBDnMBEDgyc+F0v1JhPIqWgqIr2xt0phSHeG4tMclyqkcbXVCDCJuNpz4h/DL
 lhC+ND9s2HPw7ZCA5+ujBEW/r9gQqg9GW4YMJ9atjwsIql/9gG+Jo1mwEIWjogpY
 tIZlUonxv62LOqd3F0cZQuoICX2NA8BYIj43n/Nm7IDwxXqepm0ZGOCTXfYi0OOw
 p+KZyFS3WW+Vz+QHIwTkV8mZHhah1odsHDf4AA88wma62YHgv9gewETv66UP/ruY
 qQLlrl+tMrtY9LFQtVmYVaZwcE5LKK6RCJED6D0MDwO0MlqPjB6YaNvADpfiRASe
 X4FGij6910V4tzjw==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id f3441c69
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 16 Oct 2019 19:29:40 +0000 (UTC)
Received: by mail-ot1-f49.google.com with SMTP id 89so21299992oth.13
 for <wireguard@lists.zx2c4.com>; Wed, 16 Oct 2019 13:18:09 -0700 (PDT)
X-Gm-Message-State: APjAAAVbe94TiySdedS1UHg7pRAxCIokrSpNJ84xWbzU64fXDvscaHyu
 9Os5/AVBCL01sRTWw8p22a+UrIXYYF9PQ1eO1ow=
X-Google-Smtp-Source: APXvYqy+SMzU/UKD4eD9YaTtTCHEuCFqlNJGvdLBGT4yg3E5w4yf+v9UwNxCSpos9LRtp7EZ+QgX9ef+IkpRQumZ8nY=
X-Received: by 2002:a05:6830:1bd9:: with SMTP id
 v25mr99308ota.52.1571257088582; 
 Wed, 16 Oct 2019 13:18:08 -0700 (PDT)
MIME-Version: 1.0
References: <D053CD7B-3542-4979-B175-51B497E55D9B@mac.com>
In-Reply-To: <D053CD7B-3542-4979-B175-51B497E55D9B@mac.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 16 Oct 2019 22:17:56 +0200
X-Gmail-Original-Message-ID: <CAHmME9qaEUMhTBU9K_h8SAtO3KEpWB3z+GjV2HiYDHOHQhkfhg@mail.gmail.com>
Message-ID: <CAHmME9qaEUMhTBU9K_h8SAtO3KEpWB3z+GjV2HiYDHOHQhkfhg@mail.gmail.com>
Subject: Re: WireGuard on macOS: config self-deletes
To: Chase Lau <chase9@mac.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

This appears to be a bug in macOS 10.15. I've informed Apple, and
they're looking into it.

Jason
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
