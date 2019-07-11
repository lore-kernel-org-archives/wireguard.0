Return-Path: <SRS0=bDLL=VI=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0577DC74A35
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 11 Jul 2019 15:38:07 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 34EAF21537
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 11 Jul 2019 15:38:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="h5Z57dFo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 34EAF21537
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4ed8cfb3;
	Thu, 11 Jul 2019 15:38:04 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b5d4bf0d
 for <wireguard@lists.zx2c4.com>;
 Thu, 11 Jul 2019 15:38:03 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0d39e317
 for <wireguard@lists.zx2c4.com>;
 Thu, 11 Jul 2019 15:38:03 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 62a38075
 for <wireguard@lists.zx2c4.com>;
 Thu, 11 Jul 2019 15:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=IwoDxZrUUcinuWRLA5ESGjsoPOE=; b=h5Z57d
 Foji618B8LyRH0JRBeAMjIch/SKTOulPFbqNb+05D+w1X8VkHqX00rGPtGZLC5IA
 9ad1IHmvGDB9Y5VjAd3NKiutlZ5ia5K+EpmtmZrjBurH5KqlLLqFvtZD0T/6o873
 UnS3bacHb2rziFlZARoF+1kqXC2mMsjCibc90+YsdYqEYjUnkiU/cEs1HXZ5HQV4
 4gCbhZFyZ7pIZqbtZI9GKWSUhqcZwAi+IqvNJ+5OLWJ230RUHDaX24Rg+1cjSOTg
 MO7IBhYk11uek6vhuO9yNASvGYEbmK3Mud9kEBcY+9/2o7aYMEQ7YM2TS6m9zOOe
 J3f+/dnWJKOq0WxA==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id a4652054
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 11 Jul 2019 15:02:03 +0000 (UTC)
Received: by mail-ot1-f49.google.com with SMTP id q20so6304166otl.0
 for <wireguard@lists.zx2c4.com>; Thu, 11 Jul 2019 08:38:02 -0700 (PDT)
X-Gm-Message-State: APjAAAWNSaNV5FYoWbYF36/eieP+SLyRsczPOopLdSrtA3rWCcH/femm
 iMEcQWfNosapBZPOte9pFg/FRyndfeeWx33ln9E=
X-Google-Smtp-Source: APXvYqw2XGz2jK1YCKBVR9zhr3WyFAngBh9I/QlHsvpA1NK1om9kKpMoQiRXlM3zCoeoymJDvh59HB89u76/YvYCX5Y=
X-Received: by 2002:a9d:4f0f:: with SMTP id d15mr4046487otl.52.1562859482196; 
 Thu, 11 Jul 2019 08:38:02 -0700 (PDT)
MIME-Version: 1.0
References: <20190125015339.27684-1-derrick@pallas.us>
 <20190125015339.27684-2-derrick@pallas.us>
In-Reply-To: <20190125015339.27684-2-derrick@pallas.us>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 11 Jul 2019 17:37:50 +0200
X-Gmail-Original-Message-ID: <CAHmME9ojt0rmJQ8xMBYMax0ZeZ2N9juBOkFhP2-gczAZ9ck5FA@mail.gmail.com>
Message-ID: <CAHmME9ojt0rmJQ8xMBYMax0ZeZ2N9juBOkFhP2-gczAZ9ck5FA@mail.gmail.com>
Subject: Re: [PATCH 2/2] netdev: reset peer keys when changing private key
To: Derrick Pallas <derrick@pallas.us>
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

Can you let me know if these work for you?

https://git.zx2c4.com/WireGuard/commit/?id=fffe613427d70a7470d34b6dedcab9ffb8b6b667
https://git.zx2c4.com/wireguard-go/commit/?id=a961aacc9f4dff9e617197c6433f8c9628928132
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
