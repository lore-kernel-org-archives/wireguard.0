Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2B49C6FD18
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 22 Apr 2023 12:11:15 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b28be821;
	Sat, 22 Apr 2023 12:03:53 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 79863c61
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 22 Apr 2023 12:03:49 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B19EF60C78
 for <wireguard@lists.zx2c4.com>; Sat, 22 Apr 2023 12:03:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD01EC433D2
 for <wireguard@lists.zx2c4.com>; Sat, 22 Apr 2023 12:03:46 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="D0IgICDv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1682165024;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VsSKUocff+ly5u/th0tvOFoSoCyTkKtC2vjGNEmrQK8=;
 b=D0IgICDvEzUuSKmX3DfmGsGicuLUkkQnBA7Uwn4idQL3QZ8z1G5Oxi/zmB9S9YxyjsBY1I
 rbibAr/gayuThRvs0deA0IK/wHc0P8QCwaM1+v1D/q2rT6M4KQ4n1dWkppS8hNUEDw6rt5
 akqZ2oDHXxAW/wtzLSyqlxGfmUOnzfM=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id dcf16ef1
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 22 Apr 2023 12:03:43 +0000 (UTC)
Received: by mail-ua1-f41.google.com with SMTP id
 a1e0cc1a2514c-77858d8dcb5so11280865241.1
 for <wireguard@lists.zx2c4.com>; Sat, 22 Apr 2023 05:03:43 -0700 (PDT)
X-Gm-Message-State: AAQBX9caf1iW8aergaBhFz4mNvlHqAJf/1nkaqqm8Kuo1Glv2pyWVvnp
 uPq9qT6XIO72P/JMtacrI7PlIKDVnRdfRViOoog=
X-Google-Smtp-Source: AKy350aCm+uTDm6YiahVqrg+nwssvEOT7m8DCsXqQ3tnsPMrbwDM+S05ckl6CqlvAmsEHzL5reDjv3R+v+qTHUvVbsQ=
X-Received: by 2002:a05:6122:d02:b0:440:54e1:5bf7 with SMTP id
 az2-20020a0561220d0200b0044054e15bf7mr2773691vkb.4.1682165022869; Sat, 22 Apr
 2023 05:03:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:7656:0:b0:75c:e750:ab with HTTP; Sat, 22 Apr 2023
 05:03:42 -0700 (PDT)
In-Reply-To: <CAMjhiJimUHUVjTybh0kfMUWHgVv0n7qJKQU+Ac3kabdtdRMt3Q@mail.gmail.com>
References: <CAMjhiJimUHUVjTybh0kfMUWHgVv0n7qJKQU+Ac3kabdtdRMt3Q@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sat, 22 Apr 2023 14:03:42 +0200
X-Gmail-Original-Message-ID: <CAHmME9ruzmKH=u-kS0b0rXJx1zXppGS32zCsOUrqSgMtiNsPUA@mail.gmail.com>
Message-ID: <CAHmME9ruzmKH=u-kS0b0rXJx1zXppGS32zCsOUrqSgMtiNsPUA@mail.gmail.com>
Subject: Re: Linux counter_validate() RFC6479 replay detection modifies bitmap
 before authentication?
To: Leon Woestenberg <leon@sidebranch.com>
Cc: wireguard@lists.zx2c4.com
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

On 4/20/23, Leon Woestenberg <leon@sidebranch.com> wrote:
> Hello all,
>
> I am trying to understand a few details in WireGuard protocol, looking
> at the Linux kernel WireGuard implementation if I am unsure about the
> description from the paper. One question I have:
>
> Does counter_validate() in the receive path update the bitmap from the
> Type 4 counter (their_counter) before the received Type 4 packet was
> authenticated?

No, it happens after authentication. Otherwise that'd be a real DoS vector.
