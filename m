Return-Path: <SRS0=ghx5=TR=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06B60C04AB4
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 17 May 2019 11:12:23 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5C87820879
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 17 May 2019 11:12:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="JLxcmm/c"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5C87820879
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5decfd6a;
	Fri, 17 May 2019 11:12:21 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e252ed1b
 for <wireguard@lists.zx2c4.com>;
 Fri, 17 May 2019 11:12:19 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ade55842
 for <wireguard@lists.zx2c4.com>;
 Fri, 17 May 2019 11:12:19 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5f06a47d
 for <wireguard@lists.zx2c4.com>;
 Fri, 17 May 2019 10:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=FyxWNVnZzl4gsy2Xd+8ttoHMgQs=; b=JLxcmm
 /cVPg/zEDJWgEbg73sbY6RVkin8+n/5wS0AVaBFl/fNlEF7xpXw1CTl0bXtc/D84
 v8XXuuVWsdcyN7mky6yoM2mTO/ssEG2AXWqyF+NekNjW5VqJhtihB4a6ip0WQIZq
 gOP3okM1C+fwumSCgygZHRbmqvHgiPZZ1qFkfMDPyTIjI8Zz2GSFbAP91vFV0sCf
 X5YA7s4fiK5lkT1ybaiZE16ICUD9bqww0MwWQJQP8Vd8uObPO4DvcZmc8zqzBfQ1
 PLdIKF7D4rQMYKHqArlrnpZIQSEHy+011p2wXjWpGgd9SWDjaH6RI3rlijmGMRcR
 zh6gzuJWpNSyU6GQ==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id c043dd4d
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 17 May 2019 10:43:24 +0000 (UTC)
Received: by mail-ot1-f45.google.com with SMTP id u11so6352741otq.7
 for <wireguard@lists.zx2c4.com>; Fri, 17 May 2019 04:12:19 -0700 (PDT)
X-Gm-Message-State: APjAAAWKHDfTLeR8Y5siqwO3N96kU8EUo2cjENqP5T2iSmxUr/PAq4oA
 kSv+qjFRsH8IhS/829+n34lUDH/g1S9RKpTefrQ=
X-Google-Smtp-Source: APXvYqyXSaB9p8vnYGr1xhzM/iby6JhbmUleMlu3YxbIBT2PK83BFXzp+3JqeKEUIprUkLsdHIlQop3z/HnL9CcYSRU=
X-Received: by 2002:a9d:6c89:: with SMTP id c9mr4488969otr.52.1558091538392;
 Fri, 17 May 2019 04:12:18 -0700 (PDT)
MIME-Version: 1.0
References: <20190513195213.GA30315@wolff.to> <20190513202453.GA30656@wolff.to>
 <20190513212110.GA31106@wolff.to> <20190514205016.GA920@wolff.to>
 <20190515105014.GA12390@wolff.to> <20190515110636.GA12769@wolff.to>
 <20190515111830.GB12769@wolff.to> <20190515113325.GA13034@wolff.to>
In-Reply-To: <20190515113325.GA13034@wolff.to>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 17 May 2019 13:12:07 +0200
X-Gmail-Original-Message-ID: <CAHmME9qBF_NaThCCA-Q62mV=qGXzirzO7yVvVOEYg9w_gfRJSw@mail.gmail.com>
Message-ID: <CAHmME9qBF_NaThCCA-Q62mV=qGXzirzO7yVvVOEYg9w_gfRJSw@mail.gmail.com>
Subject: Re: Working on change for: genetlink: make policy common to family
To: Bruno Wolff III <bruno@wolff.to>
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

Thanks for getting this started. This commit should take care of it:

https://git.zx2c4.com/WireGuard/commit/?id=7a83d1e6da8aa27da8fd4d06e6b7d11198c7c049
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
