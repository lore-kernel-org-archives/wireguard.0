Return-Path: <SRS0=Yiz6=SI=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D1FAC10F06
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  6 Apr 2019 10:28:44 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8D38821855
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  6 Apr 2019 10:28:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="t6aTdhbc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8D38821855
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 222896df;
	Sat, 6 Apr 2019 10:26:03 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e71559d7
 for <wireguard@lists.zx2c4.com>; Sat, 6 Apr 2019 10:26:01 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6fff7c2b
 for <wireguard@lists.zx2c4.com>; Sat, 6 Apr 2019 10:26:01 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 44df4776
 for <wireguard@lists.zx2c4.com>; Sat, 6 Apr 2019 10:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=UaR0+u0CCkYpVY3QvSw38AZDSEk=; b=t6aTdh
 bcnYBn3ZbK4nXIzN5hJbZF/yDr7D9XJy8Hslyibc/hELVz7iTyWKxrfDatybo60k
 HjrQOt7mFuGfyKRp90XGTZ7rQdFKJwo19AKA+k4rMuBwJKhhbJgFmNv1GrfDQ/ct
 JNIA3Lqm371y+2M7VYiL4+cWk+/uL/GcxRa8Lf8fmJEYV3E8nogcMFRzUp1maNWD
 ZjiJyTeCKoxHHXlzuJ4/mNIFSKOCUd5GtCkRpvag8if0MoTstNwN4bdoC27XLXYb
 qZ8/e3d0IQW2X3Lyd8NXkLSsuYMUsSs2LBPBQKFyTyBDzb/4MwEgBWJp694riDsX
 0RbgYpm7KZcW+UnQ==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 836b7c95
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sat, 6 Apr 2019 10:04:49 +0000 (UTC)
Received: by mail-ot1-f43.google.com with SMTP id j10so7933447otq.0
 for <wireguard@lists.zx2c4.com>; Sat, 06 Apr 2019 03:28:29 -0700 (PDT)
X-Gm-Message-State: APjAAAXQkb15aCUlxCgS+P3v62pO6uO9+ESL+BqXgXwEsxwEyzcMS4x0
 59d8syOVH2nOxDf6k27P0OD5l8Ihi/EUM7DM3gU=
X-Google-Smtp-Source: APXvYqwlYItw4QY6Z3883nKRt8EzIHO40nsQjbfdilO6QpMZx200LFIyWpDWr9X00zpD8mQbF+10LbM5cVDCNLAa0PE=
X-Received: by 2002:a05:6830:1114:: with SMTP id
 w20mr11634734otq.29.1554546508301; 
 Sat, 06 Apr 2019 03:28:28 -0700 (PDT)
MIME-Version: 1.0
References: <505e458e-4df9-8fbe-9891-83bdc8933260@m7n.se>
 <CAHmME9o=2FVbqH0Sn6oD6ss-edsnJHNMKsXHehEAwDqv1juQEg@mail.gmail.com>
In-Reply-To: <CAHmME9o=2FVbqH0Sn6oD6ss-edsnJHNMKsXHehEAwDqv1juQEg@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sat, 6 Apr 2019 12:28:17 +0200
X-Gmail-Original-Message-ID: <CAHmME9qh7vQuFNmS_QYK=neBPvrOvpSu0O=P86cWoRuVGqONPQ@mail.gmail.com>
Message-ID: <CAHmME9qh7vQuFNmS_QYK=neBPvrOvpSu0O=P86cWoRuVGqONPQ@mail.gmail.com>
Subject: Re: Crashes in wg_allowedips_insert_X
To: mikma.wg@lists.m7n.se
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

Let me know if this fixes it for you:
https://git.zx2c4.com/WireGuard/commit/?id=fdfdd38cceebcd62df60785e8523e068b84f7076

Thanks again for the bug report. I'll have a new snapshot out fairly
soon containing this important fix.
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
