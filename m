Return-Path: <SRS0=aU6O=J6=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF2DEC433ED
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  3 May 2021 15:08:42 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D613461166
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  3 May 2021 15:08:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D613461166
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e58a59a5;
	Mon, 3 May 2021 15:08:39 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [104.131.123.232])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 5fd11820
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 3 May 2021 15:08:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1620054513;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JTGweozy4+yxxErFygJA5R6G/JX+AGnug7WgaaCaIU0=;
 b=NyxQXXKi51LbWZKNNpi8KpEun4bj5DYbkt4uxPlbM0RbzQ3IGJ3/1yheYFmoOh3Bc01kf9
 1mg0cRCIPh64M/kraijvkT1CLDWhzDgnw4OHH/6ipbeXzGCgitSVoZKjsPmE2fV33v3h+H
 NWtoPFG3a3emTNieOxkAe4MrHgxaKJM=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 7a1f6a9d
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 3 May 2021 15:08:33 +0000 (UTC)
Received: by mail-yb1-f172.google.com with SMTP id b131so7943668ybg.5
 for <wireguard@lists.zx2c4.com>; Mon, 03 May 2021 08:08:33 -0700 (PDT)
X-Gm-Message-State: AOAM532mLdNlpwBuWR2cN4oLsHG7Lf+vkmnFBrlcuX8hDtb2Oc/nyR8E
 oi4KbSI8lSX/cuXhfIiweyLfQLp1lVd79PMdXqs=
X-Google-Smtp-Source: ABdhPJwHVE2TBmfasBEbGI13fx4BO5G+SkRxzmy21uyDxkeerIJjV6cx5khDissEIuWGtb/v8Xjw/Pifh26Bp9vD4wU=
X-Received: by 2002:a25:be09:: with SMTP id h9mr27920668ybk.239.1620054512778; 
 Mon, 03 May 2021 08:08:32 -0700 (PDT)
MIME-Version: 1.0
References: <CAGaAVNVPhaXnRyS8TaNddNEGJqGBcW=5cWyb1c=vV0yeOovwqQ@mail.gmail.com>
 <CAHmME9o+aSX5f_KZ9UKWNdKUwpjnMU3iKn1e8bBdTvsDCqfceg@mail.gmail.com>
In-Reply-To: <CAHmME9o+aSX5f_KZ9UKWNdKUwpjnMU3iKn1e8bBdTvsDCqfceg@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 3 May 2021 17:08:22 +0200
X-Gmail-Original-Message-ID: <CAHmME9pVOKrLPqD-g1LTe-62_0boi=jQ16WFe6-7deCUJPgyMQ@mail.gmail.com>
Message-ID: <CAHmME9pVOKrLPqD-g1LTe-62_0boi=jQ16WFe6-7deCUJPgyMQ@mail.gmail.com>
Subject: Re: kp's and mem corruption?
To: Manojav Sridhar <manojav@manojav.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>,
 Christian McDonald <rcmcdonald91@gmail.com>
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

Hey again,

Thanks for the .ko you sent me. That was helpful in tracking down the
bug, which Matt and I have now fixed here:

https://git.zx2c4.com/wireguard-freebsd/commit/?id=c69fb61b94341027ea3c539bcf96d9fe03f65fa5

The commit message includes a little bash reproducer that hit the same
crash in my tests, making me somewhat confident we squashed the right
one.

Jason
