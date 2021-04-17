Return-Path: <SRS0=xHST=JO=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2FFBC433B4
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 17 Apr 2021 16:49:32 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B41B46120F
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 17 Apr 2021 16:49:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B41B46120F
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3034d48c;
	Sat, 17 Apr 2021 16:49:29 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [104.131.123.232])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 2e16d285
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 17 Apr 2021 16:49:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1618678159;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nUJ37Aemkw4Xr87SqbzIBZ7BF2+GsZwoTTXqQESfdO0=;
 b=THfLjzsYviUMNWLjWjLIzAPo4plfcXmaWRrYlpA7hfvrHMZfM+08QgDrtx0jggxmFnW0cg
 Ik9VltcOY+xENlzPyyX7VXfAPyoF9DOV9Ot5Y885Ot486tkBSfDp7us1Qz6kogahae0AaA
 XZPOnhlHlZYhzJz1x1SFcEMDciAtVDU=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 6f01a7a1
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 17 Apr 2021 16:49:19 +0000 (UTC)
Received: by mail-yb1-f176.google.com with SMTP id v72so12958317ybe.11
 for <wireguard@lists.zx2c4.com>; Sat, 17 Apr 2021 09:49:19 -0700 (PDT)
X-Gm-Message-State: AOAM533bgeV10+Q9oDpftm3RgBBVZCQlbHk7CdQUzujAKMoewUyJZ3ZB
 aIZCKwhWxzRJfp3/om445Yuy9FDhQ6Ah1/Gar30=
X-Google-Smtp-Source: ABdhPJxJgfqkQy7FnsxDiEXsQaTDxdHBJQ9hw5S4TNkTe1mxVU1bf9NZD4DN2ETfg+244zIgCm1wf3l1FcMvU9vXS+c=
X-Received: by 2002:a5b:5c6:: with SMTP id w6mr6368181ybp.279.1618678159188;
 Sat, 17 Apr 2021 09:49:19 -0700 (PDT)
MIME-Version: 1.0
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
 <CAHmME9r=EDav2CmWLXSOcaUadzk-+N89GMCMA6xuqim5EcWDHA@mail.gmail.com>
 <3d610bc1-84c9-1ad5-a366-3c8b77efb858@harz.behrens.de>
In-Reply-To: <3d610bc1-84c9-1ad5-a366-3c8b77efb858@harz.behrens.de>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sat, 17 Apr 2021 10:49:08 -0600
X-Gmail-Original-Message-ID: <CAHmME9qu+3GpQtq78kZ4T9LAVAMqvoVjWChCqNT0Pn9BB29adg@mail.gmail.com>
Message-ID: <CAHmME9qu+3GpQtq78kZ4T9LAVAMqvoVjWChCqNT0Pn9BB29adg@mail.gmail.com>
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

On Sat, Apr 17, 2021 at 9:23 AM Frank Behrens <frank@harz.behrens.de> wrote:
>
>
> Am 17.04.2021 um 17:00 schrieb Jason A. Donenfeld:
> > Does this actually fix or change anything? Don't new sockets have
> > fib==0 right out of the gate already?
>
> New sockets inherit the fib from the current process. If you create
> the wg interface from a process with different fib, that fib will also
> be used for this socket. Probably the difference in code is not very
> important for the case of a system default boot. But that may vary
> for jails/vnets with different default fibs.
>
> In my test case the sequence
>  > setfib 1 ifconfig wg0 create ....
>  > ifconfig wg0 tunnelfib 0
> failed.

Ahh, interesting. I applied your patch. Thanks for the persistence in
getting this feature working well.

Jason
