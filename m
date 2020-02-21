Return-Path: <SRS0=cn6I=4J=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A58B1C35646
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 21 Feb 2020 12:22:52 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0FE4F24656
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 21 Feb 2020 12:22:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="W2LUF+cv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0FE4F24656
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 723dbcff;
	Fri, 21 Feb 2020 12:19:50 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1a50e4e0
 for <wireguard@lists.zx2c4.com>;
 Fri, 21 Feb 2020 12:19:47 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c59b77ff
 for <wireguard@lists.zx2c4.com>;
 Fri, 21 Feb 2020 12:19:47 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b1acad32
 for <wireguard@lists.zx2c4.com>;
 Fri, 21 Feb 2020 12:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=uhQCAVDb4364mtjJv6SpTB65UHI=; b=W2LUF+
 cv8YS3So0N9HhPcAaDjEC3yO7K9nXdhN3Ra/LCX6BzXlputceFhbmqhbowO4pJOs
 U7RIWQ06Vd+4ZFxaiDK/l/0YLbLnLsw+dFMbDEVmg5nR0ykQ1/urB+d2CbyL00IM
 pIEozkJikuT+7Rl0LzFG7iPs6KCJK1MJ50iGFNvucQAyTRpsjVly428cVeeAcv6i
 pznknhVrmpUhCPXjyd9VlF9oBrgGJDDcqErvQ7U6cb09Y3Eep0lHLoHNHtWeHtNW
 SjLbFgMGjfNngCv+fr7AkCCh6cHU6cwlEaGZ1BazexiFn+TCcfEIJLbNwtWBYfsj
 W5qK8D4XQhEMAxag==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 17c7cd61
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 21 Feb 2020 12:19:46 +0000 (UTC)
Received: by mail-oi1-f178.google.com with SMTP id b18so1385144oie.2
 for <wireguard@lists.zx2c4.com>; Fri, 21 Feb 2020 04:22:46 -0800 (PST)
X-Gm-Message-State: APjAAAV0JClx9lggbSu9dKDfKJicP5HLVmllsjzMc/8WdoqV0glPi88R
 9fap+neZblMMX8w7Hm9YSPmLwqA2hBtE+rIXUP4=
X-Google-Smtp-Source: APXvYqx/gekI9G4Z55x1wRyYB/MJ/2qeEFf/kPEOn+vk71fqK0y/SAfYdl5pBHlDGpLivFV6vx8dxGdDCMMxdyIgJ28=
X-Received: by 2002:aca:815:: with SMTP id 21mr1815304oii.52.1582287766123;
 Fri, 21 Feb 2020 04:22:46 -0800 (PST)
MIME-Version: 1.0
References: <20200221072209.10612-1-yuehaibing@huawei.com>
In-Reply-To: <20200221072209.10612-1-yuehaibing@huawei.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 21 Feb 2020 13:22:35 +0100
X-Gmail-Original-Message-ID: <CAHmME9po5q_EYiy0yX0VxcnTdiQe1Aa74WLXsYMmxepasUHtww@mail.gmail.com>
Message-ID: <CAHmME9po5q_EYiy0yX0VxcnTdiQe1Aa74WLXsYMmxepasUHtww@mail.gmail.com>
Subject: Re: [PATCH net-next] wireguard: selftests: remove duplicated include
 <sys/types.h>
To: YueHaibing <yuehaibing@huawei.com>
Cc: Netdev <netdev@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 linux-kselftest@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 David Miller <davem@davemloft.net>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
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

On Fri, Feb 21, 2020 at 8:23 AM YueHaibing <yuehaibing@huawei.com> wrote:
>
> Remove duplicated include.

Thanks. Applied to the wireguard-linux tree.
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
