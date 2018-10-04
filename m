Return-Path: <SRS0=SlID=MQ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C97EC64EBC
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  4 Oct 2018 15:54:19 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C300020652
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  4 Oct 2018 15:54:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="DfU6ji+y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C300020652
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 22a3c71a;
	Thu, 4 Oct 2018 15:53:47 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7817fb8a
 for <wireguard@lists.zx2c4.com>; Thu, 4 Oct 2018 15:53:44 +0000 (UTC)
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com
 [IPv6:2607:f8b0:4864:20::82f])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fdebadb4
 for <wireguard@lists.zx2c4.com>; Thu, 4 Oct 2018 15:53:44 +0000 (UTC)
Received: by mail-qt1-x82f.google.com with SMTP id q40-v6so10438561qte.0
 for <wireguard@lists.zx2c4.com>; Thu, 04 Oct 2018 08:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google;
 h=date:from:to:subject:message-id:mail-followup-to:mime-version
 :content-disposition:user-agent;
 bh=SAmTJeQXxtn8ByjFWtoyEPZAcJk0HwzY/A7kY/szN8c=;
 b=DfU6ji+yfj26VHGPWTywBvbvlkaGcETCY+W0ZsIDANZrRFGQZK285usnjVXIbRGJA6
 iI2P/78yObJCMaJkgtWm68kRr0M9796UEdXVarBnCda7MvqjYSt2xzW0IcmzC5s6zjlD
 7KkwR4NFGS7eDkZH3DLFeU4MDe1AqPJwJC6qo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:mail-followup-to
 :mime-version:content-disposition:user-agent;
 bh=SAmTJeQXxtn8ByjFWtoyEPZAcJk0HwzY/A7kY/szN8c=;
 b=c0T+eaHd1ytiuNlXWJuz9Nrk4IKqTsuDv9II/kAhwaxuXZq2pOXVHJyFK5wUQFG9k4
 xWWtaMakq2vUeJ3CmAGX8aoWheELbZMoZnmAKaIU1iw14ESL7Bi2kMj+Abj8S7qNts9J
 gxD7fi+IuyZr3js+P6Cn/sfBG49PV2zvihfBQkKCIiJE4KDh6E7TQgELcWdsS9MgbkF1
 MM5cuAYLKeWf/yEmxAdAx3iKb1FZOJp9qVI7MoLZIyusznz2WURX0HoWXFJg2VN7rmAQ
 SUb2YAvsEdRLqKJr4vROrREGA7bTfF7fy8+ewMqmKABHImUTDNRY32raTUbIx3qOQ3RQ
 YINw==
X-Gm-Message-State: ABuFfohN5Wm3PwTJSMX+pX1j1th1O979qHU6CQlH0gTxi9JrGmhUiUTm
 /lchSFHn79+F0RWzoo9jMnHgD8gA85bKpA==
X-Google-Smtp-Source: ACcGV61ujsAJHrazfvdUChxMqzkOueuan8/2rjYbDYfDlhdBwmTjJtZwHyvODJ9s/TjS3APHdrWT5Q==
X-Received: by 2002:a0c:d8ba:: with SMTP id
 q55-v6mr5973144qvj.80.1538668442183; 
 Thu, 04 Oct 2018 08:54:02 -0700 (PDT)
Received: from puremoods (192-0-230-179.cpe.teksavvy.com. [192.0.230.179])
 by smtp.gmail.com with ESMTPSA id h4-v6sm2270077qkg.95.2018.10.04.08.54.01
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 04 Oct 2018 08:54:01 -0700 (PDT)
Date: Thu, 4 Oct 2018 11:53:59 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: wireguard@lists.zx2c4.com
Subject: Sending just ssh traffic via wg
Message-ID: <20181004155359.GA5957@puremoods>
Mail-Followup-To: wireguard@lists.zx2c4.com
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
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

Hi, all:

I'm trying to figure out the right PostUP/PostDown incantations to send
just ssh traffic (on port tcp/22) via the wg tunnel, but I'm having a
bit of a hard time. I should be able to do this with --set-mark for
iptables/PREROUTING and a fwmark ip route rule, but it doesn't appear to
be working as described in many guides I've consulted.

Has anyone done something like this before?

-K
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
