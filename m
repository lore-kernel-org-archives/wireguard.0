Return-Path: <SRS0=Lifx=KD=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=BAYES_50,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C858DC433ED
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  8 May 2021 14:27:27 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D15F061001
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  8 May 2021 14:27:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D15F061001
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8af3e268;
	Sat, 8 May 2021 14:25:04 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [104.131.123.232])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 9a58738e
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sat, 8 May 2021 14:25:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1620483899;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZDpNL9EdGQzM+v/kuGuvRHPdj3dIHv0M8wh+tbirZhk=;
 b=PRteF4AwEd/BMN5fA+4+o7VSnix9rmc1P3oTB3VPPLG/NFZEmYj5iw3uRyImiL+z29kFc4
 Pj5aP4fKV0TnM6sdxCBFmkMCg7zx5XjhOq25HKrcYnP2yYvKzLnK8uf5R7PXzNFc2ZpSo1
 Q4dpiXcbzraa1p5rQC+wATJXdgCJUSU=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 394e927d
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sat, 8 May 2021 14:24:58 +0000 (UTC)
Received: by mail-yb1-f180.google.com with SMTP id v39so15696322ybd.4
 for <wireguard@lists.zx2c4.com>; Sat, 08 May 2021 07:24:58 -0700 (PDT)
X-Gm-Message-State: AOAM532zRqyy8Ovk760Mrn3sP3fA4BeTtSVJbqdzKEaO47uAka+20sHE
 /k1avr6RbkSPvgLvL+o/Rk93OmPSHI/hPuFpN0Q=
X-Google-Smtp-Source: ABdhPJwSLL+Nt3Q/sR1Xw1RY1KfAmgeKVqeN3XFp699xUtmLRBcgFiT9x5ol9On2H1AWPerohbAIiz/HuWLBWcBs9yQ=
X-Received: by 2002:a25:be09:: with SMTP id h9mr21728349ybk.239.1620483898129; 
 Sat, 08 May 2021 07:24:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7110:3487:b029:b9:f0fb:fa53 with HTTP; Sat, 8 May 2021
 07:24:57 -0700 (PDT)
In-Reply-To: <000b01d743f5$815d8fc0$8418af40$@glosol.com>
References: <000b01d743f5$815d8fc0$8418af40$@glosol.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sat, 8 May 2021 16:24:57 +0200
X-Gmail-Original-Message-ID: <CAHmME9pb=1Qh4=0cOj6cm-4L0tfSTj7FknyXduh53i=NySbJVw@mail.gmail.com>
Message-ID: <CAHmME9pb=1Qh4=0cOj6cm-4L0tfSTj7FknyXduh53i=NySbJVw@mail.gmail.com>
Subject: Re: Wintun - Requested GUID is already in use error on Windows 10
To: Piotr Sobczak <piotrs@glosol.com>
Cc: wireguard@lists.zx2c4.com
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

Hi Piotr,

Thanks for the report. I'm curious to know: do you have any other
network adapters of the Wintun or WireGuard variety? What Windows
version are you running? Would you mind sending a complete log?

Thanks,
Jason
