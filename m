Return-Path: <SRS0=9kqO=ON=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17398C04EB9
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  4 Dec 2018 00:47:58 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4C1F72087F
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  4 Dec 2018 00:47:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="OIfCNB/9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4C1F72087F
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cdcbc9d7;
	Tue, 4 Dec 2018 00:40:05 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c9b6afb9
 for <wireguard@lists.zx2c4.com>; Tue, 4 Dec 2018 00:40:02 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2f9f6e86
 for <wireguard@lists.zx2c4.com>; Tue, 4 Dec 2018 00:40:02 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id aad3efa9
 for <wireguard@lists.zx2c4.com>; Tue, 4 Dec 2018 00:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=PHJGXh5cSj05HW+luQVhs5aRboI=; b=OIfCNB
 /9I/0hDqWnd0Bk36FWJtxMio/YaI65tiX1oqjftuCczE+Bs4zO1Mqyb2M7sHMx/F
 YVc4ovV0rUb/XoVfT+9KblS20t8X3IKxb1PoPssMS487dcNrsUzNjsci1giWdWGK
 HpVdlQIBSlYv7bPcvJEvtjtFxL7qR8JuH9KZDgF9ORo9JN435JD0ksQW9J8lRgkK
 +wPacOfYzxWm8ZhvYBRnPNXNrhtzLKRCu/8WdG4itgVd3b4SXhpxZ9IBTneNHjtI
 eOeJDDXScX2mg7NgMwFddKj5WF/OhEeXumBv2vU/3mhaWT5u+OUBeJiNpv9CyN3s
 zMJS4iaKnbRgF94Q==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id ac91ea17
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 4 Dec 2018 00:40:02 +0000 (UTC)
Received: by mail-ot1-f45.google.com with SMTP id k98so13571650otk.3
 for <wireguard@lists.zx2c4.com>; Mon, 03 Dec 2018 16:47:53 -0800 (PST)
X-Gm-Message-State: AA+aEWZQqPoZOpE689PbrTE50tFSJQvGENmZGkn822NqhcX7CL5oln6+
 wGwNKDBpC5NlIw59vgLOVIGSFlNy66C248nkgPs=
X-Google-Smtp-Source: AFSGD/WhqvIz/EgvBMBrkj3hRzCBB2tY7rk3p2lCtoA2+RPgzNaQ1NZawKxMXhwjDfYdCCBUXzNk9jnkRKj8nrVCBC4=
X-Received: by 2002:a9d:14e:: with SMTP id 72mr12078288otu.54.1543884472549;
 Mon, 03 Dec 2018 16:47:52 -0800 (PST)
MIME-Version: 1.0
References: <20181203214637.GA17169@wolff.to>
In-Reply-To: <20181203214637.GA17169@wolff.to>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 4 Dec 2018 01:47:41 +0100
X-Gmail-Original-Message-ID: <CAHmME9ru7_T85oQjaot4e9WzZmo8M361O0hL2XR0_qPEQ92s5w@mail.gmail.com>
Message-ID: <CAHmME9ru7_T85oQjaot4e9WzZmo8M361O0hL2XR0_qPEQ92s5w@mail.gmail.com>
Subject: Re: The Linux Plumbers Conference videos are up
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

Thanks Bruno. I've updated the webpage with these:
https://www.wireguard.com/presentations/
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
