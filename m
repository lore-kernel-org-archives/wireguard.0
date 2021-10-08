Return-Path: <SRS0=9Sn0=O5=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFC26C433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  9 Oct 2021 00:57:21 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 26A2760F90
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  9 Oct 2021 00:57:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 26A2760F90
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 152dceec;
	Sat, 9 Oct 2021 00:57:19 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 8ee2c8cc
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sat, 9 Oct 2021 00:57:17 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7DEF260F57
 for <wireguard@lists.zx2c4.com>; Sat,  9 Oct 2021 00:57:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="KJaxpfHi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1633730470;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=W5qwaBQ2NsPEupK7sv5Ih0yi3j0RtgKUUDPeFDThdIM=;
 b=KJaxpfHiaPQcAmlwHQJ5549EaYzZcbH56Ciar7R34xVdTWM6Qvl2dN4ZW4bl8Uk1IcQ/xu
 5PdTYDiu7+8Ybs8YgPiDsapHmkJPf2De7QrvNJez5at9rBSBdjEU4xkTZPOLvW7/7PrGb7
 PEMXK0ehJPQ7bshL22bOeAvW16X4vMQ=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id dcc8766f
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 8 Oct 2021 22:01:10 +0000 (UTC)
Received: by mail-yb1-f176.google.com with SMTP id r1so24027183ybo.10
 for <wireguard@lists.zx2c4.com>; Fri, 08 Oct 2021 15:01:10 -0700 (PDT)
X-Gm-Message-State: AOAM530PrwtR+r5vu93ztp0K/CRP0/iNERSq69ZmoQVLjHx9y8dYiDdC
 NuGe8qMIh2yd0nh1YukTjpOHEs32SBHSNcMeMwE=
X-Google-Smtp-Source: ABdhPJx68DNu5cBmMxrOg6kflu4iZmaPkg7hHIoIAcvp+7eQaZv1Cvga44LpBis4b9DFFFzGI9+agXXJrZIY86QQi3A=
X-Received: by 2002:a25:bd03:: with SMTP id f3mr6029414ybk.412.1633730469566; 
 Fri, 08 Oct 2021 15:01:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7110:61c1:b0:fa:e5:57f7 with HTTP; Fri, 8 Oct 2021
 15:01:09 -0700 (PDT)
In-Reply-To: <SA1PR05MB79668D58D886BB8D36F558FE99B29@SA1PR05MB7966.namprd05.prod.outlook.com>
References: <SA1PR05MB79668D58D886BB8D36F558FE99B29@SA1PR05MB7966.namprd05.prod.outlook.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 8 Oct 2021 16:01:09 -0600
X-Gmail-Original-Message-ID: <CAHmME9pu=syh5zkig=e1KFQKMvCYfu6e+BhKENdwZARCrpss7Q@mail.gmail.com>
Message-ID: <CAHmME9pu=syh5zkig=e1KFQKMvCYfu6e+BhKENdwZARCrpss7Q@mail.gmail.com>
Subject: Re: Windows Log Output to Event Viewer or Text File
To: Frank Wayne <frank.wayne@northwestern.edu>
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

https://git.zx2c4.com/wireguard-windows/about/docs/enterprise.md#diagnostic-logs
