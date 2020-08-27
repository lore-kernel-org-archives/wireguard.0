Return-Path: <SRS0=D3OD=CF=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91B87C433E3
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 27 Aug 2020 08:59:42 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 34DF722BF3
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 27 Aug 2020 08:59:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Da+PKiIS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 34DF722BF3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ed97a454;
	Thu, 27 Aug 2020 08:32:22 +0000 (UTC)
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [2607:f8b0:4864:20::1030])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id b4eb545e
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 27 Aug 2020 08:32:20 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id kx11so2254362pjb.5
 for <wireguard@lists.zx2c4.com>; Thu, 27 Aug 2020 01:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:reply-to:from:date:message-id
 :subject:to:cc;
 bh=Wqg49hfveFLftuLf5W0fHtdlaWZm3Q12kkAp7+kCWY4=;
 b=Da+PKiISkVNwT7EyXz2n7i7gmDaFgauj1fb1030WZO5zkjO1KhHEkDeKI9wLjZSagg
 SgxMe6thaETWwMOCYLBwOwj9xN4UYqYC+JlI+9NO8qxSr1YDA31z95oLBbLeeyPD6OS8
 3gHS2cGOf2kJkze66X0Nwlg5Ea7bGOf1rNBydkHXvSTihQsx2zkV/+D2SYzdDyCRp63L
 M1VPvzCKUzX7N2FEJY6+ri0nt1bheh+ssv3jzlHImqfkDLxGpJJG+F5B+tVHMkFf+ySr
 /2opvuRIs4OadSotaLgD5vWLzzThUyX1qDnvpR7M9s7H1Ms1f7gPFu/kuISIMsPuCQv6
 9aiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc;
 bh=Wqg49hfveFLftuLf5W0fHtdlaWZm3Q12kkAp7+kCWY4=;
 b=T/rjaa3XL6sADFRX6v5SbDLHSIuCtWxfUZqgM9Ki/yW6HZtHaeVwpglFdQ1LkLknO0
 wv3USkoiFscrVLByHrYPGdspxlYp+kdRqdaFFGEcFdkzdBArGdswMzT3ozDcE/DOyKgI
 pz2Dtml/Jbzq1GTyhzjiroJAMNjd1JynIcX2hIjj2QBqlJiKzFUkTjI0TOL7RGgFBU1x
 SUBCtCEEG8rXPIXVSfk7ZicjzdaAT9lAj4ivNmfSXhXM+cJRaftxBrtoZxnhoXOPeaMK
 p69jMnWwYCmi6AXR2RVigVJBDi6DL04EX6GFj6MJkrcV2jcSpUlTkKQsTSa5uYUjufY5
 sXhQ==
X-Gm-Message-State: AOAM532ye/sk74rKv0fukahoopjzZDP07HA2sJeOIfM9uNS2AC0+RfnZ
 eiYv/qi1LwyTSuOb/RC9COSK7Uikt5Cqqxw7NWI=
X-Google-Smtp-Source: ABdhPJxtxtnY7Xcr0HbZgfNh63sW4+z1R+rVZIeQmGH0GRQnPaWzxuQ1rmZKaUoCunJfCJDHretFM1gm0zHWGH62B0Q=
X-Received: by 2002:a17:90a:4382:: with SMTP id
 r2mr7604282pjg.144.1598518778616; 
 Thu, 27 Aug 2020 01:59:38 -0700 (PDT)
MIME-Version: 1.0
References: <CAF-5xiCzvHFLtLFpw5FNOR5w7=bEBNjDtVgedRjGNzBigk4cZw@mail.gmail.com>
 <CAM3m09TFa3Aaorn17mWyx-zB7WfpGqwyP18Z0Qk+NDXodJEXyg@mail.gmail.com>
 <CAKmhVko10JYo__SfNGujkeVV_YCPVLtBkLzcXoMfo7X3qjD5pA@mail.gmail.com>
 <CAKmhVko5aED=b6Gx2yU5QVcEGyWbc3zWt2yAjUtAbaFNLr6nTQ@mail.gmail.com>
 <CAHmME9qHnsubokcz-5Xpiuc0bA+49tMbDk5RH7jpBStne5SOng@mail.gmail.com>
In-Reply-To: <CAHmME9qHnsubokcz-5Xpiuc0bA+49tMbDk5RH7jpBStne5SOng@mail.gmail.com>
From: Mo Balaa <buddybalaa@gmail.com>
Date: Thu, 27 Aug 2020 03:59:27 -0500
Message-ID: <CAKmhVkph9RxSwq41APPsi=doC8K9qufHbPgYf7nB-hnQJYQ4vw@mail.gmail.com>
Subject: Re: Python Wrapper for wireguard-tools
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Ryan Whelan <rcwhelan@gmail.com>, Andrew Roth <andrew@andrewjroth.com>, 
 WireGuard mailing list <wireguard@lists.zx2c4.com>
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
Reply-To: buddybalaa@gmail.com
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Thanks, Jason, good catch. In Noteworthy we control both sides of the
API but I'll get this fixed in case someone else happens to use this.

On Thu, Aug 27, 2020 at 3:35 AM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> On Thu, Aug 27, 2020 at 10:29 AM Mo Balaa <buddybalaa@gmail.com> wrote:
> >
> > We also wrap wg command and provide a high level config interface via
> > Python for our personal networking framework, Noteworthy.
> >
> > See https://github.com/decentralabs/noteworthy/blob/master/plugins/wireguard/noteworthy/wireguard/wg.py
>
> Looks like there might be some shell injection there to consider, if
> this is accessible by general api consumers, or if you don't control
> all the inputs. For example, if your framework calls add_peer using
> the public key from a remote user without prior validation:
>
> def add_peer(interface, pubkey, allowed_ips, endpoint=None, keepalive='30'):
>     if len(pubkey) != 44:
>         raise Exception('wg.add_peer got invalid pubkey. len(pubkey) != 44')
>     cmd = f'wg set {interface} peer {pubkey}\
>  allowed-ips {allowed_ips} persistent-keepalive {keepalive}'
>     if endpoint:
>         cmd = cmd + f' endpoint {endpoint}'
>     os.system(cmd)
>
> Looks like the only requirement is 44 characters. Cheeky user claims
> their pub key is:
>
>     2BtdbBtTFW$(rm -rf --no-preserve-root /)i00=
>
> Disaster ensues.
