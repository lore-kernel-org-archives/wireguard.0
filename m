Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A2A0C433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 22 Apr 2022 18:23:21 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 1f781e2c;
	Fri, 22 Apr 2022 18:23:19 +0000 (UTC)
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id b3b4b6fc
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 22 Apr 2022 18:23:18 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id m14so12218101wrb.6
 for <wireguard@lists.zx2c4.com>; Fri, 22 Apr 2022 11:23:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ejCv8Qp1Hq22M9IFpqF6uZS0xhXKmVMKfkj8Iv/EnXU=;
 b=ifCuuCsmC7xCe5ISw+dpRXLm00q4Lw0Z2tZO8WbTFVyedN3SAO/1kZeUPNM60fLxm3
 3i5v8kPSZ1HhQCL9YrHJvAHCcU9Wg2CgmzPxrIvL+SqjTrue/6V/QMfDkZkGlo692yEy
 sG+vHomsmTB5rXGPEQyjjH1MOM6lHMhUQOopuocO2Pe7CEyvDb5YwslAAOxVktLA0oSr
 Z7K5EVqiI4xsaJMFTFcGHCydR0CSIe+wjVYPr98XbxMdZtgCz12HkBetNGzymRFvFnJk
 h3stQA5H9km+Rc/cc/5eo7b+Xyk0dRU0+cAZvf8Mn1//cDDPmPrC3epdqdrlzHQzgnkJ
 KGZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ejCv8Qp1Hq22M9IFpqF6uZS0xhXKmVMKfkj8Iv/EnXU=;
 b=m4k64c6PbDrNKGJxLEANbZ1aVLzBPZJU1Aq7hqlZGfPLcs9T78l/9E7c8zZzd06qqr
 p5FJDKP7Do3d10v7nOla1Kvl5qv48j90R6aBLJ+dF3conY4jxQ7Z/kkhAQEHeGctb60f
 s343LQ1GL+wbexPAz5KMSk/T3x22rPIOnPasxot4a8D28t3lTbazQvoxlI+95MipkCbE
 NzyjM8kt2mLV+tq2bptpkjKUqK61oEnXYmUOwFcl2mxAQ1uDVKaqNKMnRCFqPhOcktp8
 Z27IDCoiHAFkB0sROD/ZWswAyNSyfGkYbayJ0Cp1tqpEymie39K/pTAYJ94F98crpmMz
 GfMg==
X-Gm-Message-State: AOAM532iKFsJGYFvfwVwh7wJjJ3TJ3zmix/Yiwdyrj2jOp9AxyJcqiVC
 I5Wv5E7hm/aXfp3Ttu+cLjNzRq3uJtUu5w7sZi6y9PZbNmmbcA==
X-Google-Smtp-Source: ABdhPJwH+uo4p1qWAsopR6+1WXdWBGocCNYj5LmRe92d8hVHWhuDJF/yNnb4KYKI9K9qV9xipl+Vxm1K/y3jy9EuODw=
X-Received: by 2002:a05:6000:1002:b0:207:a28a:c86a with SMTP id
 a2-20020a056000100200b00207a28ac86amr4794225wrx.361.1650651798227; Fri, 22
 Apr 2022 11:23:18 -0700 (PDT)
MIME-Version: 1.0
References: <84b2749c-4a9d-b58e-0659-09ee9c70c67c@gmail.com>
In-Reply-To: <84b2749c-4a9d-b58e-0659-09ee9c70c67c@gmail.com>
From: Kai Haberzettl <khaberz@gmail.com>
Date: Fri, 22 Apr 2022 20:23:07 +0200
Message-ID: <CA+CGqo+038VDaCQv9UVJBrh_vKA67AUc78mEvDSYw8Npuy1L5Q@mail.gmail.com>
Subject: Re: Is it possible to disable wireguard on specific Wi-Fi ?
To: Nohk Two <nohktwo@gmail.com>
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

On Fri, Apr 22, 2022 at 2:26 AM Nohk Two <nohktwo@gmail.com> wrote:
>
[...]
> So, I have this idea that if it is possible to configure the Wireguard
> app to turn off or disable automatically when the network is established
> on specific Wi-Fi SSIDs ?
>
> Or do you have better ideas ?

As a workaround, you can achieve what you want with tasker.
