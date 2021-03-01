Return-Path: <SRS0=cL7X=H7=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39E28C433DB
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  1 Mar 2021 06:08:24 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 40CA064DA3
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  1 Mar 2021 06:08:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 40CA064DA3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8da96435;
	Mon, 1 Mar 2021 06:08:20 +0000 (UTC)
Received: from mail-oo1-xc2b.google.com (mail-oo1-xc2b.google.com
 [2607:f8b0:4864:20::c2b])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 6566a20c
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 1 Mar 2021 06:08:19 +0000 (UTC)
Received: by mail-oo1-xc2b.google.com with SMTP id x19so3693243ooj.10
 for <wireguard@lists.zx2c4.com>; Sun, 28 Feb 2021 22:08:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+JFLnIJZ7f4SOY29qag6zUiNI2F2Q1T6ozeEMP4zPDE=;
 b=ljG5I0dkaaLS3/GryB+VGZHBgeeBm7n88YBgZ6N+yR8hTModPBTOKCAksDcN5sL97Q
 TetEkMn559eu/tpGG6I9/zMHfYW2yFu5bXVO8GT+O8SqM/DUnmHkmtUYbcM69ofIeJ/i
 sOdHdUS7MA3Zsp7xB0plRBOH9Q+tx8MWRiXzMiJOgX+w/xixy0cLigdEwpwfWpqsE+e0
 20W7hfNQa2h+hKSoLVANWzOx2YWnzhcdrSlpMsF3uaPjqGe5WXb/YFMzOe47A+nL4r51
 ZnRu9bOROsi7XMBNPHxYvNTQAKC/fygX7bjxWx8XGzjRQbJvWVLXMhPTXe39uIlfpmBb
 xkfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+JFLnIJZ7f4SOY29qag6zUiNI2F2Q1T6ozeEMP4zPDE=;
 b=TnIWR81nS7Pk47vB5dm8YFk1U8PXv1Wh6M+qUo0qSKT24LRwuJhIVqS/bPXznl8lqf
 lyZihnOwJqgAT8CvN+z64o4RzsgMZMlcCZuDkVgJeMWwXz2ib9BPCa7c/P7vSF/tAPJg
 eWCsak2wD5ahB4u8RZFwfrXQQgw0leW3GAx8/k2LHEcITpw2Yov87EyV1+FJ8iQzTyFK
 19p/awgNJpxAlcHhwQ5GBL88yRXY5FD0BtZcCHgrOChYuT1Z63KgRutux3VFVNqOXkeB
 qWIYzY2fAkMLGk06WdNNx4jBIzZSKkAfc/sWuS5TWc9jkUHT2qq+NhctBxTwPhft9M44
 Z2AA==
X-Gm-Message-State: AOAM533S1i2d7F/c/kR7gP87uEEYE8LV0EIopyZU+AZUbFqQKoxJvQC1
 vdJevV3EV0qdOiE4STsiSRuwdRUXyT3zDRD8Mi4=
X-Google-Smtp-Source: ABdhPJwPR+UBlUO93HHPSM/29tPJRmLR0Gtq2HANRZdxzvh9elE+eh2qoRJDTu4bjZ+xeygEWuCarEKoMt9EnNAxpBY=
X-Received: by 2002:a4a:4e44:: with SMTP id r65mr11592124ooa.52.1614578898173; 
 Sun, 28 Feb 2021 22:08:18 -0800 (PST)
MIME-Version: 1.0
References: <CAMS0tn2Pq65UAVWqjV6mNd1hGqvUxVhVgmR3s2h+kh=XF8jyKA@mail.gmail.com>
 <E8F8664E-3C8A-45B9-B9B8-1A1E2873289B@carmickle.com>
 <65365aa6-cdd0-f9dc-f894-3a040ca596ae@aaronmdjones.net>
In-Reply-To: <65365aa6-cdd0-f9dc-f894-3a040ca596ae@aaronmdjones.net>
From: i iordanov <iiordanov@gmail.com>
Date: Mon, 1 Mar 2021 01:07:42 -0500
Message-ID: <CAMS0tn0k=7aVstO7Nnn1zZDUypuE2sWidS3uT+04=7rs6+YjGQ@mail.gmail.com>
Subject: Re: Nested Wireguard tunnels not working on Android and Windows
To: Aaron Jones <me@aaronmdjones.net>
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

Hi Aaron, Frank,

Thanks for your replies. For some reason, gmail had decided Frank's
original reply was spam, I apologize for missing it. The first message
in response to mine I received was Aaron's. Frank, after retrieving
your message, yes you understanding is correct.

Yes, I have done packet capture and indeed, the setup works correctly
on Linux and Mac, whereas it does not work under Android and Windows.
What can I do to help diagnose, debug and/or resolve this issue?

Cheers and thanks!
iordan


On Sun, Feb 28, 2021 at 5:17 PM Aaron Jones <me@aaronmdjones.net> wrote:
>
> On 27/02/2021 17:16, Frank Carmickle wrote:
> > Iordan,
> >
> > You say that it's possible to run a nested configuration on
> > Linux and Macos with just a single interface each. Have you
> > done a packet capture to prove that that is in fact what is
> > happening? That doesn't seem like how it would act given the
> > design goals.
>
> Nesting (Using one of Peer A's AllowedIPs as Peer B's Endpoint) does
> work within the same WireGuard interface, at least on Linux.
>
>


--
The conscious mind has only one thread of execution.
