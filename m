Return-Path: <SRS0=xHST=JO=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04F3AC433ED
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 17 Apr 2021 15:00:16 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CB6A6611AF
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 17 Apr 2021 15:00:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CB6A6611AF
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 472488a1;
	Sat, 17 Apr 2021 15:00:12 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [104.131.123.232])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id aea676b3
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 17 Apr 2021 15:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1618671603;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yfHvrCQB4NewdCWuu9UadrSdoDWO0x9U0Bo7Z+HYGkY=;
 b=Oolae/djs6bsi8DkalFlVnfEOf8dcptUF1XN8CJyVkaFRlPOeBFHHv8wuF5R62ZoGeac9/
 uiXtz5+fY3bhyT4rxOrgr1KUHz65UXxrIm+U7SbnR6V1tld2/ZPUL1LL9efNfcDjcT79lD
 b9ybZ5BSbyiQXZetzpbqQZHOo1fomsI=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id b8120c0f
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 17 Apr 2021 15:00:03 +0000 (UTC)
Received: by mail-yb1-f179.google.com with SMTP id y2so31374002ybq.13
 for <wireguard@lists.zx2c4.com>; Sat, 17 Apr 2021 08:00:03 -0700 (PDT)
X-Gm-Message-State: AOAM5302dkIS4jfAXFi85+8+l2m6bAL6BCneSHDgzhomtdgwiA7y/i70
 yvvQTs3WR/fPk+fX1+AoN6Co9N00ZQJgDRiJs1s=
X-Google-Smtp-Source: ABdhPJzcfTvwVpfM6eec91KL6vzvQfO8wzcgi04z8Cz9kf0wKwNId3CEXcGj0Y+evMFSThnZJKi40Vg6XsKa1b9mEMY=
X-Received: by 2002:a25:840e:: with SMTP id u14mr3622774ybk.178.1618671602762; 
 Sat, 17 Apr 2021 08:00:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7110:91a3:b029:5b:6127:3eb5 with HTTP; Sat, 17 Apr 2021
 08:00:02 -0700 (PDT)
In-Reply-To: <d5904ed8-ee49-690d-3bc6-b0afc2cb28fc@harz.behrens.de>
References: <6aa0fd33-4c0d-557f-f7f5-5f5406b3a273@harz.behrens.de>
 <CAHmME9q6dO1X+Gt3hY4kQxsQ4DqeaJGxoT8qkaAe-0s_WCrVrA@mail.gmail.com>
 <ee43587f-8e17-add1-6b28-174639d126f8@harz.behrens.de>
 <CAHmME9qaMcd0R1zvFy+ZyW4a1vmX1bE_Rxf4WFgau4UTdEi7hQ@mail.gmail.com>
 <CAHmME9r13tPji0Guw3_Q8k4grh046RkSccPLbEVAasKQ=BNkVw@mail.gmail.com>
 <89952f1f-5296-7f87-9345-0f5c087ee3ae@harz.behrens.de>
 <a5cdf813-3cf6-b5e6-d497-78980c681958@harz.behrens.de>
 <CAHmME9rCzvFGv3=ZwurVMnax0RzKQr2mTCAgqT9EY8MEbJ24Ng@mail.gmail.com>
 <9a60aab2-788e-ba1d-96ac-cf6d08bf4bd1@harz.behrens.de>
 <CAHmME9r9_gykGRebWvw5mAaxqqo1i_ZncfQeR7AxhaR_C4S5vg@mail.gmail.com>
 <d5904ed8-ee49-690d-3bc6-b0afc2cb28fc@harz.behrens.de>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sat, 17 Apr 2021 09:00:02 -0600
X-Gmail-Original-Message-ID: <CAHmME9r=EDav2CmWLXSOcaUadzk-+N89GMCMA6xuqim5EcWDHA@mail.gmail.com>
Message-ID: <CAHmME9r=EDav2CmWLXSOcaUadzk-+N89GMCMA6xuqim5EcWDHA@mail.gmail.com>
Subject: Re: [PATCH] freebsd: Implement selection of FIB (routing table) for
 tunneled packets
To: Frank Behrens <frank@harz.behrens.de>
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

Hi Frank,

On 4/17/21, Frank Behrens <frank@harz.behrens.de> wrote:
> Hi Jason!
>
> Am 13.04.2021 um 04:57 schrieb Jason A. Donenfeld:
>> Can you let me know if this fixes the issue?
>>
>> https://git.zx2c4.com/wireguard-freebsd/commit/?id=cdb18ebf44a5babb57cddccd6b33e9f19cfdf365
>
> It looks better, but a little too much optimized. ;-)
>
> The fix is in https://git.zx2c4.com/wireguard-freebsd/log/?h=fb/fib3

Does this actually fix or change anything? Don't new sockets have
fib==0 right out of the gate already?

Jason
