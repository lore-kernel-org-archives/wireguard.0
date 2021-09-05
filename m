Return-Path: <SRS0=TPXl=N3=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8285BC433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  5 Sep 2021 13:26:11 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CA8E3600D0
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  5 Sep 2021 13:26:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CA8E3600D0
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0f1abb0c;
	Sun, 5 Sep 2021 13:25:03 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [104.131.123.232])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 194fb8a8
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sun, 5 Sep 2021 13:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1630848300;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3qhFJcNGQYMVftXkCyeKcyQJP9Hh3eC8egdx+RE70GE=;
 b=m6+9vBE/KdzIwEiFF+cf3EJud9hMcCVznOgeKLhrL/NreUS+up+kfbG/3P4yr+tg3JbqzB
 YBd66HxrkFWcgWi8vswBwAccf/5fdJmF1n76H7zqkF/TApU9A+v2CzIxl7BeTgyhMYalv+
 pygQnfIxvrjO9lcdbcK7OECZi16RvCo=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 56fdf805
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sun, 5 Sep 2021 13:25:00 +0000 (UTC)
Received: by mail-yb1-f180.google.com with SMTP id c206so7975603ybb.12
 for <wireguard@lists.zx2c4.com>; Sun, 05 Sep 2021 06:24:59 -0700 (PDT)
X-Gm-Message-State: AOAM532JGBHTIPKsMg7F7WZekSjymtdkFiK1NN9rW13QOs7QD6TcftZr
 yjHU4ga9yjanUOx47eE+lu8RJcofPw/KwwgaLnk=
X-Google-Smtp-Source: ABdhPJwlijbL1oeQtjWc/LpLTRnTzXzvvtEiwBXC3ekVRdoC69Zcyc/peAeyLZ/3Gqa+pgADnv2XKYdwE5v/xYfws+I=
X-Received: by 2002:a5b:d48:: with SMTP id f8mr5835721ybr.449.1630848299129;
 Sun, 05 Sep 2021 06:24:59 -0700 (PDT)
MIME-Version: 1.0
References: <c538301f-980c-99c9-4857-65867127aba3@gmail.com>
In-Reply-To: <c538301f-980c-99c9-4857-65867127aba3@gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 5 Sep 2021 15:24:47 +0200
X-Gmail-Original-Message-ID: <CAHmME9p0hTuYXar6LN2GyjF64k62z9vcokOE6La6eW-H06NVow@mail.gmail.com>
Message-ID: <CAHmME9p0hTuYXar6LN2GyjF64k62z9vcokOE6La6eW-H06NVow@mail.gmail.com>
Subject: Re: Strange behavior when a peer has the same key as the interface
To: =?UTF-8?B?Vm9qdMSbY2ggS8OhbsSb?= <vojtech.kane@gmail.com>
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

This is by design across all implementations, so that multiple peers
can share the same stanzas after the [Interface] section. We don't
allow peers talking to themselves simply because it made the formal
analysis of the crypto slightly more complicated.
