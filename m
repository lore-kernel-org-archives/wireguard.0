Return-Path: <SRS0=GgA3=LE=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=BAYES_50,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0BB4C48BDF
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 10 Jun 2021 11:54:38 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 37E67613FF
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 10 Jun 2021 11:54:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 37E67613FF
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4fac993c;
	Thu, 10 Jun 2021 11:51:55 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [104.131.123.232])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 4eee46ff
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 10 Jun 2021 11:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1623325909;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FWOjW3HcIznZY2eLuTvREYhFwfZ1T67AD6AHY9pGSDo=;
 b=qHbQxxu2HAE1+BL2E6EvF3ceSu63V8GkSXCDUtbVZKVdwLJ1366uZYdQAt8Tdk0xUMKuRf
 EDplPf5CTgYZcBfAj5GWF8MsdIqGqq5NxepnNRdWatvmGQhjWdmGlXunIJ0d5WFXLHzOOD
 NnjzIRvb41H8YXrC93GqRu1ITj40h7c=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id a9dd00cb
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 10 Jun 2021 11:51:48 +0000 (UTC)
Received: by mail-yb1-f177.google.com with SMTP id c14so11325209ybk.3
 for <wireguard@lists.zx2c4.com>; Thu, 10 Jun 2021 04:51:48 -0700 (PDT)
X-Gm-Message-State: AOAM533Oe8BcfparbfO4mjCDKQRhDwIJZ+oCtpNzyWzTwKjXELSfib9i
 +9ZvA8logQXCx5Gl9RXGBd1TXkyyYuwCV4fog6E=
X-Google-Smtp-Source: ABdhPJzdjOH0+LARbWmFt5d1MSbyX9Lun0ITd4wqtML+exbe/lQJEam8gb3OKgD3p698kU0N+L1+rA9yOJXqijlmq/E=
X-Received: by 2002:a5b:5c6:: with SMTP id w6mr6923027ybp.279.1623325908536;
 Thu, 10 Jun 2021 04:51:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7110:474d:b029:ce:da65:f582 with HTTP; Thu, 10 Jun 2021
 04:51:47 -0700 (PDT)
In-Reply-To: <760B19F6-17E7-4276-B2E2-DFE07AB19323@mullvad.net>
References: <760B19F6-17E7-4276-B2E2-DFE07AB19323@mullvad.net>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 10 Jun 2021 13:51:47 +0200
X-Gmail-Original-Message-ID: <CAHmME9pKnJouF-Vf20y+1w_TUs1vj1bpOggd+dgm8epfN+8-MA@mail.gmail.com>
Message-ID: <CAHmME9pKnJouF-Vf20y+1w_TUs1vj1bpOggd+dgm8epfN+8-MA@mail.gmail.com>
Subject: Re: WireGuard is broken on iOS 15 beta
To: Andrej Mihajlov <and@mullvad.net>
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

Patches with a proper performance comparison of the two techniques in
the description would be appreciated.

Thanks,
Jason
