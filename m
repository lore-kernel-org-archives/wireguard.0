Return-Path: <SRS0=RTrd=57=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C11C3C2BA19
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 15 Apr 2020 21:40:29 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 27136206E9
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 15 Apr 2020 21:40:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="x7/0PYvT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 27136206E9
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 738e3665;
	Wed, 15 Apr 2020 21:30:01 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id fc890526
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 15 Apr 2020 21:29:59 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1fff9846
 for <wireguard@lists.zx2c4.com>;
 Wed, 15 Apr 2020 21:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=iNxgFrW0LxNDmGAsoLv23ZeQLd8=; b=x7/0PY
 vTcuAFyRtj93svfJE/prFMTlmRKPTZY+E/WWuNWF0oMI6sZVG6yEtjB1+ZSPQZIB
 y82+D9X51+dtfYp0VylwnlU2jtB57h2cgCkbVTYfR6oVxlQ7BjUhhkYfl4CI/oY3
 C0zWVYyDuDo3PQnew17U+6zyGs7SpwjkHDpK2XxSuGZXFAmpSQSec+O2iFf6RtK6
 9pxhC9Ut2TTOI0ZRGluB4dGolZGDU/4pdt8V2ycM4WtMahfwU4QxHVpVE7OmbwY+
 v7ozszbIyFvW4daYFDA1I19NYeE8wVjnQWfwx8cyrG1EalM3qmbig9wbiu5s7WtI
 NeFaI08ZdffxV0aQ==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id c6cac043
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 15 Apr 2020 21:29:59 +0000 (UTC)
Received: by mail-io1-f42.google.com with SMTP id y17so18791164iow.9
 for <wireguard@lists.zx2c4.com>; Wed, 15 Apr 2020 14:39:59 -0700 (PDT)
X-Gm-Message-State: AGi0PuYgzxDun2w6JJYRA75qxb0tq9DISpufjFzjBNK3Ysj6dPW2IejY
 WEW8F/GyBtLfo7s1eWNyE+opRf78DWwl0DvR/gY=
X-Google-Smtp-Source: APiQypL2swLrl7oYtVwwZOFeF8B98m6foWdbrBOm583QIg8yTxWV6VvOs8khqxDxU/AiZfdULhlk3RZTTh9pv+0f+js=
X-Received: by 2002:a5d:9c02:: with SMTP id 2mr4363376ioe.67.1586986798805;
 Wed, 15 Apr 2020 14:39:58 -0700 (PDT)
MIME-Version: 1.0
References: <50d9516e-9546-07ce-d0f4-434e5893f2a9@attglobal.net>
In-Reply-To: <50d9516e-9546-07ce-d0f4-434e5893f2a9@attglobal.net>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 15 Apr 2020 15:39:47 -0600
X-Gmail-Original-Message-ID: <CAHmME9qRQGQLbuDcfcf8zvsW9twzCkCNqkdMd8kMgEABF=kBYw@mail.gmail.com>
Message-ID: <CAHmME9qRQGQLbuDcfcf8zvsW9twzCkCNqkdMd8kMgEABF=kBYw@mail.gmail.com>
Subject: Re: kmod-wireguard 20200413 fails transaction check
To: Eddie <stunnel@attglobal.net>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
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

This is because ELRepo is a crumbling mess held together by bubble gum
and scotch tape. Run this:

$ sudo yum install yum-plugins-elrepo

And then try again.
