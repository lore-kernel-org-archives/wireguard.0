Return-Path: <SRS0=y9CJ=PH=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C0F1C433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 19 Oct 2021 23:51:21 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A4D976103B
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 19 Oct 2021 23:51:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A4D976103B
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 654d7aef;
	Tue, 19 Oct 2021 23:51:19 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id a8c4ece8
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 19 Oct 2021 23:51:16 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8BA6C60F8F
 for <wireguard@lists.zx2c4.com>; Tue, 19 Oct 2021 23:51:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="J9ngBrAY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1634687473;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tnih0ei08YJk4x7SdG8HPxpMXPqIyNWAUtAXCSBpZFY=;
 b=J9ngBrAYoNnesbQLVozXHZQKuaiKAlIKJOre9A/tHdIj+UGANhkI5s3S1TQQEnkvI90Wnf
 IH9ECR7FGq6GsXdr7/j2n/g7TCDPKK1l0/apJp+WMjTDhDnaTcifS0sH7BMPRvahFYkoZI
 JL1Q139x8vpecBRaVYDsqvWkQFlQAZs=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id ab25d78f
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 19 Oct 2021 23:51:13 +0000 (UTC)
Received: by mail-yb1-f180.google.com with SMTP id a7so7896646yba.6
 for <wireguard@lists.zx2c4.com>; Tue, 19 Oct 2021 16:51:12 -0700 (PDT)
X-Gm-Message-State: AOAM5318KOo8+zDJBe8txP0R3jCqnfaDrRyD4RzLY3wPk3uXB3HB9F5g
 vGjbKPmSfESy0iklJgUbMMZMQJ95Sf0faX8Ik3w=
X-Google-Smtp-Source: ABdhPJzoJe8v+0+6XzNHIjI3wEYooyXPgqJSC0bDdok3+026dV3YAEzb/9myyAAQrZmMcRH+BfV6T1kT7tZ+++ldUvg=
X-Received: by 2002:a25:5e86:: with SMTP id s128mr38465724ybb.79.1634687472329; 
 Tue, 19 Oct 2021 16:51:12 -0700 (PDT)
MIME-Version: 1.0
References: <YWFuczOf1dM3B4Pt@falared> <YW6ljZ3yvGsv9Njq@falared>
In-Reply-To: <YW6ljZ3yvGsv9Njq@falared>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 19 Oct 2021 17:51:01 -0600
X-Gmail-Original-Message-ID: <CAHmME9off=sXrL0hjkGvOgJUtJx6oCvhdAycHT=bTQfUtQjO=w@mail.gmail.com>
Message-ID: <CAHmME9off=sXrL0hjkGvOgJUtJx6oCvhdAycHT=bTQfUtQjO=w@mail.gmail.com>
Subject: Re: Build wireguard-linux-compat on SLES15 (s390x)
To: faustin@fala.red
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

Hi Faustin,

Isn't WireGuard already in the SLES kernel?

Jason
