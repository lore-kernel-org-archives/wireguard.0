Return-Path: <SRS0=aU6O=J6=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF767C43460
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  3 May 2021 15:31:25 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CAAA161073
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  3 May 2021 15:31:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CAAA161073
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=manojav.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 47146a99;
	Mon, 3 May 2021 15:31:24 +0000 (UTC)
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 1b7b1a3c
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 3 May 2021 15:27:45 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id z13so8663445lft.1
 for <wireguard@lists.zx2c4.com>; Mon, 03 May 2021 08:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manojav.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uvfdUOGxEuRxh7P01lfwsgcbtvilyMmMcG/4Ek7vjWc=;
 b=Yzeam6hpeQ/9pHIDuhQN08/W4cJnYmQvE7rcJmOf0WYwWXF6rYLEyMqq0ot2OH4/3u
 lG5iHuVla+lSK654C5EGkkPQ2S9obegPEgx7kzT/CTjna1wgbZ1ItVTgbHOvtYXQ65A4
 ZvOymQs5ef3ztCqcZU0PDaGNbpjz/abmgomts=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uvfdUOGxEuRxh7P01lfwsgcbtvilyMmMcG/4Ek7vjWc=;
 b=hSdThpjf1c9Omb8AmvBp9EEZJvbkiUK0ua3Nv8XUCRHGrFpwTQ8+rUvI1nzPna0wKG
 WwQsjcrliDVp0mOFq6MAhlvQEPfKj5t14esNgnEaXhwMEHZ4ZHno31Ak8gRc/1RBURwW
 GWh2+BtrVSMlTVgWvvV3x2TZIEky8qZLIf8aDK9G3fkM11EUQlT+uxYy3tyXUKBViBCG
 /AgbyUf8B66qgmh4m4/m9RscQgNf7OK+qaV19bOkDFbKIGsZt2MBjEEFZzW8JLLWIrem
 BbMrrPHad/+RtbuSwr64Bz6e8EzA/unFumDa2lGur+K0hTRef0plwsIRRc50b1Qg297v
 BfQQ==
X-Gm-Message-State: AOAM533U6dGtsWXWrcbFQgAQIQLL/p9tVIvbfA7yv4n8fItuIOAEIs54
 ff/GD4dybiDXcX6zYm8im2R1nQPAC3CBlx1HvnJL8w==
X-Google-Smtp-Source: ABdhPJxcBdSwnk8NF8VSj8aNYJ82HYSg6hRJQJVLWxkoMwC6w5o76vkH4UX+pKc4K3++nI0K93fz4qMWqd/prywoz20=
X-Received: by 2002:a05:6512:3130:: with SMTP id
 p16mr13291091lfd.83.1620055664814; 
 Mon, 03 May 2021 08:27:44 -0700 (PDT)
MIME-Version: 1.0
References: <CAGaAVNVPhaXnRyS8TaNddNEGJqGBcW=5cWyb1c=vV0yeOovwqQ@mail.gmail.com>
 <CAHmME9o+aSX5f_KZ9UKWNdKUwpjnMU3iKn1e8bBdTvsDCqfceg@mail.gmail.com>
 <CAHmME9pVOKrLPqD-g1LTe-62_0boi=jQ16WFe6-7deCUJPgyMQ@mail.gmail.com>
In-Reply-To: <CAHmME9pVOKrLPqD-g1LTe-62_0boi=jQ16WFe6-7deCUJPgyMQ@mail.gmail.com>
From: Manojav Sridhar <manojav@manojav.com>
Date: Mon, 3 May 2021 11:27:18 -0400
Message-ID: <CAGaAVNWDMLAP3FdBPUh33iyVpMSBLTzVEH8_LGXKsS8ebzwjQA@mail.gmail.com>
Subject: Re: kp's and mem corruption?
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>,
 Christian McDonald <rcmcdonald91@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Mon, 03 May 2021 15:31:21 +0000
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

Jason,

Thanks for the follow up and bash to script to ensure help re-pro it.
I am guessing my constant restarting of the tunnels when testing the
pfSense based UI we are building triggered the scenario your bash
script creates.

I tried the bash script on both bare metal box and virtualbox pfsense
box. both ran for a few minutes okay. How long does it take to happen?
I am testing with the 0428 snapshot.


Manoj

On Mon, May 3, 2021 at 11:08 AM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> Hey again,
>
> Thanks for the .ko you sent me. That was helpful in tracking down the
> bug, which Matt and I have now fixed here:
>
> https://git.zx2c4.com/wireguard-freebsd/commit/?id=c69fb61b94341027ea3c539bcf96d9fe03f65fa5
>
> The commit message includes a little bash reproducer that hit the same
> crash in my tests, making me somewhat confident we squashed the right
> one.
>
> Jason
