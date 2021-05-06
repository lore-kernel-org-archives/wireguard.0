Return-Path: <SRS0=FUvr=KB=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_40,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3EF7C433B4
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  6 May 2021 12:10:25 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 87892613D6
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  6 May 2021 12:10:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 87892613D6
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5c729816;
	Thu, 6 May 2021 12:10:22 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [104.131.123.232])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 045ab0c9
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 6 May 2021 12:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1620303017;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YtIkUFwd4ZwR94Xqxz9xf6mI06j/qZ5pMkdFn0pxTso=;
 b=O+aFsLEPRraJHJRwGOY3cAPNAWEXVRy1QK1d3tZsZi5AFuYpPYlTy0+QMmnzr/4O0pxeUh
 xhQo7g6zEE+0RSlVeP2nxnjbo9uhzsCo3y3ro812BHcZidQbGgWbwN3U6tHPaXtPrhKwkF
 9cf7ReHPe/61pYVwYJRs/xqcaiLjNXc=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id d9ee267e
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 6 May 2021 12:10:17 +0000 (UTC)
Received: by mail-yb1-f182.google.com with SMTP id g38so7021177ybi.12
 for <wireguard@lists.zx2c4.com>; Thu, 06 May 2021 05:10:17 -0700 (PDT)
X-Gm-Message-State: AOAM533ry7yI4/+9O6HZXNQF3HM5mUz1PYXjPTAB7cyL02fOr+XYt5sZ
 nZI0CvouUY4L6/tkEInB2lNhamgVr/h6oVmaRzg=
X-Google-Smtp-Source: ABdhPJzXUqV0X02f+cAo1C5RbFOiAiFaPcZZbwLc6hYvl7DUIqmzbWZ5WrE3uWrq53Gnif0ia4y6DFqzZkka+/kkQLo=
X-Received: by 2002:a5b:5c6:: with SMTP id w6mr5216594ybp.279.1620303016710;
 Thu, 06 May 2021 05:10:16 -0700 (PDT)
MIME-Version: 1.0
References: <CAGaAVNVPhaXnRyS8TaNddNEGJqGBcW=5cWyb1c=vV0yeOovwqQ@mail.gmail.com>
 <CAHmME9o+aSX5f_KZ9UKWNdKUwpjnMU3iKn1e8bBdTvsDCqfceg@mail.gmail.com>
 <CAHmME9pVOKrLPqD-g1LTe-62_0boi=jQ16WFe6-7deCUJPgyMQ@mail.gmail.com>
 <CAGaAVNWDMLAP3FdBPUh33iyVpMSBLTzVEH8_LGXKsS8ebzwjQA@mail.gmail.com>
 <CAHmME9rLSSaaREtMPh9OYuO-oe363KF-VJcpQQHr8=54oDiAiA@mail.gmail.com>
 <CAGaAVNUyrQEppHMmTZe_WyohDPEopyupB2iaTj45peeq5qU9vg@mail.gmail.com>
 <CAGaAVNUQ1+R7MtUYm2Not1J+pWkkKxQw384RYxAkjCsAuiigFg@mail.gmail.com>
 <CAHmME9rMv2PDQL-SWUX0x6QENSMgmonooS8vvdjerBDsmXQSDQ@mail.gmail.com>
 <CAGaAVNUMaRjvpPXqJaSm7JNq=PoxzfTkXgftvXrCVOkkNx0NUw@mail.gmail.com>
 <CAHmME9oTyAAbEmu1-7Mv-tx6UxnXTa3-i6=+fro84U286h+RMg@mail.gmail.com>
 <CAGaAVNXqqvdxWOO7Yr4Zrjh_Z-O8kCkbGJguhs=bD04CA=n_eQ@mail.gmail.com>
In-Reply-To: <CAGaAVNXqqvdxWOO7Yr4Zrjh_Z-O8kCkbGJguhs=bD04CA=n_eQ@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 6 May 2021 14:10:06 +0200
X-Gmail-Original-Message-ID: <CAHmME9pfFUrzAcT26OUnWPvTUgD=PtNc2fV6bz6+N1rOYiyCVg@mail.gmail.com>
Message-ID: <CAHmME9pfFUrzAcT26OUnWPvTUgD=PtNc2fV6bz6+N1rOYiyCVg@mail.gmail.com>
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

Hi Manojav,

0.0.20210503 is now in ports, which contains these fixes.

Jason
