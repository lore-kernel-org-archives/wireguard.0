Return-Path: <SRS0=ZlE4=N7=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1902C18DF5
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 20 Nov 2018 14:24:14 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 53F8B206B2
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 20 Nov 2018 14:24:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=archlinux-us.20150623.gappssmtp.com header.i=@archlinux-us.20150623.gappssmtp.com header.b="ZyhruQFK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 53F8B206B2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=archlinux.us
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d90a4f6c;
	Tue, 20 Nov 2018 14:17:54 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0ccec26f
 for <wireguard@lists.zx2c4.com>;
 Tue, 20 Nov 2018 14:17:52 +0000 (UTC)
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [IPv6:2607:f8b0:4864:20::32c])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f28a4d7f
 for <wireguard@lists.zx2c4.com>;
 Tue, 20 Nov 2018 14:17:51 +0000 (UTC)
Received: by mail-ot1-x32c.google.com with SMTP id g27so1787992oth.6
 for <wireguard@lists.zx2c4.com>; Tue, 20 Nov 2018 06:23:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=archlinux-us.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=M/NzfiDt4I7soyzaUSg2lDiWgqGmlwYKoDqCC+bHf88=;
 b=ZyhruQFKyoaqFKWSgIEIJGyl5PbnGgc3l1kwdXVTb/W5ZL0DMhtjL7mCwdG/P/Z+PN
 gRVJ/EHPzOHV94V7qN3CmLnKVXNcJJO2pXlBzA6e5Cb7zhDFZQbv2xyXis3y/NDxcOz4
 y2chCCwSKKQZozFdKE5J25OaEmaIDM+aODS6sEikrxnSP6Djj0Qr6gHcS+bll0wU8BVp
 HqnvcIoJRptD7J+dor9JJ8DfP4iMvuN7Zav3eFzC5A7stbDMhnn0RxCYt5StXBEmjTOF
 KU+N/+f8FFI7nizZ9SyTgXu57ZUW4XjyjiOg9rg/YmJ1P3gacoPXbLBMi6nsLFecLdjg
 7gPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=M/NzfiDt4I7soyzaUSg2lDiWgqGmlwYKoDqCC+bHf88=;
 b=cQUn2g3/vEgr+Pmb2XzyZuo4CXkAyH1zNxdjy36AO7FJB0rX3p8VivptRTQ66FWIxi
 JBqCAi2kZAAR542oPiQ+N6GmJKEK0rW/ndoPw1AbmG+c8q0wSsFcFEqv0Ro6KT7TdG9f
 SqoX83fDsu7AlZLYSEMnbb4ekf8n9uE4PnwmDItTP0n2jncP1fPgQVoyxswo1rA09tmB
 x8NHuRhcVsRi2mZZH8H9kdF7rD/aYDBm8/GXSX9lQ/UarcXakWfucAakl3HhnzqXME17
 KQz647yOWYp917bnqGbdnm+rqJDlIZJdPOoHUYhvCYU97vy23l39rnyfZ/vtIwGep5uw
 zf1Q==
X-Gm-Message-State: AA+aEWbpAFl4YlI8fRS0q3c7IKlR3VfzUWthupqAh55uVpviaAIfulGc
 sIW1cqR6+psqFvzMiCmxGdVUGwjB8I/fOP0AkdKUt0Nz
X-Google-Smtp-Source: AFSGD/VBlGdcdyq2O9hYGnyWfvqI8nr/2+UaXtRmJsxz2YgideyQ7+g/F9KG/gWwABOJke/bvhxbPo7q6SdM68ab/1M=
X-Received: by 2002:a9d:245:: with SMTP id 63mr1218806otb.135.1542723838582;
 Tue, 20 Nov 2018 06:23:58 -0800 (PST)
MIME-Version: 1.0
References: <CAO_nJAZ5fSSFtH1p8Ad=FD22ic9_kDAMkhWpL4vTxDh=4g3J8g@mail.gmail.com>
 <020DC45A-7CA9-49E5-9A14-6300306F5476@lonnie.abelbeck.com>
In-Reply-To: <020DC45A-7CA9-49E5-9A14-6300306F5476@lonnie.abelbeck.com>
From: John <graysky@archlinux.us>
Date: Tue, 20 Nov 2018 09:23:47 -0500
Message-ID: <CAO_nJAZ=yFW9UnRJSpV2fyYOjAC4m+6RKNMY0mgFBV=H8ZcJTw@mail.gmail.com>
Subject: Re: Seeking suggestions for a WG port to use with restrictive public
 wifi networks
To: lists@lonnie.abelbeck.com
Cc: wireguard@lists.zx2c4.com
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

Good call on these ports, Lonnie.  I am able use use either 500 or
4500 get WireGuard connectivity on my public WiFis.  I also tested
4433 and 1701 (suggested by others in reply to my query) but got a
mixed result with some networks allowing traffic on them and others
not.
On Mon, Nov 19, 2018 at 3:53 PM Lonnie Abelbeck
<lists@lonnie.abelbeck.com> wrote:
>
>
> > On Nov 19, 2018, at 2:33 PM, John <graysky@archlinux.us> wrote:
> >
> > Should I stick with the "standard" udp service ports for my
> > trial-and-error based approach?  Wikipedia has an article that lists
> > many of these (List_of_TCP_and_UDP_port_numbers).  Any suggestions are
> > welcomed.
>
> Possibly: UDP/500 (IPSec IKE) or UDP/4500 (IPSec NAT-T)
>
>
> Lonnie
>
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
