Return-Path: <SRS0=qbNG=2Y=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAE99C2D0C2
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  3 Jan 2020 20:23:47 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 01609222C3
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  3 Jan 2020 20:23:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="rr0OAWDx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 01609222C3
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e7ecf41d;
	Fri, 3 Jan 2020 20:23:19 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 84538846
 for <wireguard@lists.zx2c4.com>; Fri, 3 Jan 2020 20:23:17 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 81668238
 for <wireguard@lists.zx2c4.com>; Fri, 3 Jan 2020 20:23:17 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6dd94c20
 for <wireguard@lists.zx2c4.com>; Fri, 3 Jan 2020 19:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=SpJtUm+qed3W3GtDG1zXU1pTVYE=; b=rr0OAW
 DxOBjCfV/OuyOxobu0b8A2IwN86Zj8uedrXQLUKWAVOZXIoFep0zZa9XN5K6oBEq
 p/+4XFAagXcL5RlPhWueDvhzvRG8rXg1Lu/gqJ+wvbOEb5Tbr2UVY05Hg8BPT8dR
 NHkNmSQU/CkGPFzxfxee++NW+dScUI3z8XYbgXoqvkN+dZzYD8KZ4+gz3HWMBcAa
 53DkoTBS3P5o3gnhopC09KXTxwNK3WwXZEVcNYl8VUzh4nRMJKgzJi70mq+xMzc9
 Ww5yUd3VFq2d9UaZ075Y9hlTS48phJWHTaPZRFvTBwZN/e/7cmZwv3lBPLLLiRgw
 YOAEENrDSa4u0RnQ==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 4234b332
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 3 Jan 2020 19:24:37 +0000 (UTC)
Received: by mail-ot1-f41.google.com with SMTP id k8so45359727otl.13
 for <wireguard@lists.zx2c4.com>; Fri, 03 Jan 2020 12:23:17 -0800 (PST)
X-Gm-Message-State: APjAAAX1ZaKe0KtM2MrTxZoitlMUDn6C7UEEEtmxysiKqlEWxZ9gXhRI
 rZvxajC0ez0Bv2NZYlkkZmHdyNEthhUxVFFhYj0=
X-Google-Smtp-Source: APXvYqzMDtI2gWVwhJns6/z3sOiQSt/TzweCtBHKYnZ83qkRxRBIWWFQ1cv4CBu4BpL35zmNcqZDpHH2Qd77SIBjXlc=
X-Received: by 2002:a05:6830:1141:: with SMTP id
 x1mr26660892otq.120.1578082996521; 
 Fri, 03 Jan 2020 12:23:16 -0800 (PST)
MIME-Version: 1.0
References: <20200103180044.GA31181@wolff.to>
In-Reply-To: <20200103180044.GA31181@wolff.to>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 3 Jan 2020 21:23:05 +0100
X-Gmail-Original-Message-ID: <CAHmME9qgtOme=tLFKfseRtOHa8GBQiFpFYTKF_wuTXhKPPvbxQ@mail.gmail.com>
Message-ID: <CAHmME9qgtOme=tLFKfseRtOHa8GBQiFpFYTKF_wuTXhKPPvbxQ@mail.gmail.com>
Subject: Re: wireguard-tools and "make all"
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

Thanks for the suggestion.

https://git.zx2c4.com/wireguard-tools/commit/?id=f59f63f4620e89588eaaadb55280e6ca8d8dba1d
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
