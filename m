Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9E97ECAAD5
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 29 Aug 2022 16:10:57 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 20fb7cd3;
	Mon, 29 Aug 2022 16:05:09 +0000 (UTC)
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [2607:f8b0:4864:20::433])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 8d719f49
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 29 Aug 2022 16:05:08 +0000 (UTC)
Received: by mail-pf1-x433.google.com with SMTP id q15so3249731pfn.11
 for <wireguard@lists.zx2c4.com>; Mon, 29 Aug 2022 09:05:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zhsj.me; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=pyhIy21y9CtaWv0tJ4CuERIyb96z72WN+3mCiHOUHz0=;
 b=DsjNNvJhPEVuDY4BKKNRrxI/MrQLK5eFZsqSUWqNzShy1KQMWTiGk7vT6k9VL9LenF
 Ih2yOJasqDfANJH93NdmCTiWRKjlwJ75mbW5z3JCk9o8jsHeCPIFRngipD1vGr83BbNC
 dZR/9GORuNpgYP0G5MGbo140U7MUyc0P83ZUE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=pyhIy21y9CtaWv0tJ4CuERIyb96z72WN+3mCiHOUHz0=;
 b=Y1HYMmdXpHLS1Q+y5fLch6pNJFhnR7gMCZUL2++V/FxBkK8/gKbbad1qV+NnGXUvXd
 5WUvBQSG8t6q1YB7JaAcCpocAfPnf0rpoH8zluBSFbyPlAgjEmVQ/Tva10LYNJN5qLvq
 TZ3P+rJMeHBAkYcvcJGsR/NEU+MdHdAxC01ZLhLwkSyroou6lwyBK82cJZix9L1fS+Tg
 OyctztxgysUkqvLoO2lOMrGwnxUiikjnWijvvy6mibknZKAG2Q84g7YDzC4wh+q2XdGO
 zPk7Kg4ehx/y35LrYv4DZ3aGMrQ56puRKIFwi//hLbG0gjVnZ+9ImhoM8B7hEs5Daqq9
 +6UA==
X-Gm-Message-State: ACgBeo1TRh4lEHG31XtLGMemZTy1GnlS7XYPtEYdhTkgwLoe0CiWEfrp
 ZK3yXq/OY1hafk9fdOIW6mlWutLD89Areg==
X-Google-Smtp-Source: AA6agR52CgDQs14tljNFIKzSrcRsKBqsp9sQ/wp5XYjzJuEA1OPywu3Fd8wN3ffB3cYdeT/DxOuRKg==
X-Received: by 2002:a05:6a00:810:b0:52e:7dc8:c868 with SMTP id
 m16-20020a056a00081000b0052e7dc8c868mr17040971pfk.36.1661789106721; 
 Mon, 29 Aug 2022 09:05:06 -0700 (PDT)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com.
 [209.85.214.181]) by smtp.gmail.com with ESMTPSA id
 c9-20020a170903234900b00174e5fe9ce1sm1854215plh.159.2022.08.29.09.05.05
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Aug 2022 09:05:05 -0700 (PDT)
Received: by mail-pl1-f181.google.com with SMTP id p18so8431397plr.8
 for <wireguard@lists.zx2c4.com>; Mon, 29 Aug 2022 09:05:05 -0700 (PDT)
X-Received: by 2002:a17:902:f60f:b0:172:86f6:241b with SMTP id
 n15-20020a170902f60f00b0017286f6241bmr17262633plg.162.1661789104986; Mon, 29
 Aug 2022 09:05:04 -0700 (PDT)
MIME-Version: 1.0
References: <Yv52gBY0uZadNNzs@local.zhsj.me> <Ywzia/T9qQIATX0J@zx2c4.com>
In-Reply-To: <Ywzia/T9qQIATX0J@zx2c4.com>
From: Shengjing Zhu <i@zhsj.me>
Date: Tue, 30 Aug 2022 00:04:48 +0800
X-Gmail-Original-Message-ID: <CAG+qr1ENbpPACPSfzAwHGxgksiMFZpHx-HTLnA+Ab3Zkfcu4xA@mail.gmail.com>
Message-ID: <CAG+qr1ENbpPACPSfzAwHGxgksiMFZpHx-HTLnA+Ab3Zkfcu4xA@mail.gmail.com>
Subject: Re: [PATCH wireguard-go] tun/netstack: bump to latest gvisor
To: wireguard@lists.zx2c4.com
Cc: "Jason A. Donenfeld" <jason@zx2c4.com>
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

Hi,

On Mon, Aug 29, 2022 at 11:59 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> Hi Shengjing,
>
> Thanks for the patch. I'll apply this. But one question:
>
> On Fri, Aug 19, 2022 at 01:27:28AM +0800, Shengjing Zhu wrote:
> >       dev := &netTun{
> > +             ep:             channel.New(1024, uint32(mtu), ""),
>
> How did you come up with 1024 here?
>

I simply copied from gvisor,
https://github.com/google/gvisor/blob/c8f981f9/pkg/tcpip/link/tun/device.go#L38

> And more generally, how's performance of this compare to what was there
> before?

Sorry, I didn't take a performance test.

-- 
Best regards,
Shengjing Zhu
