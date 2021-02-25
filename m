Return-Path: <SRS0=9XF/=H3=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59A6DC433DB
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 25 Feb 2021 12:17:14 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F58564F0C
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 25 Feb 2021 12:17:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6F58564F0C
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7d7bf6f7;
	Thu, 25 Feb 2021 12:17:12 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [104.131.123.232])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id e5412b87
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 25 Feb 2021 12:17:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1614255428;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=w54zRKN+pLvsDhM+sTBfPuK0d7PiY+CNNVlgx6dvUTI=;
 b=XF3stF7+rqzXd+foSfFhc1ijrG9t3pZ0KrLZh4FC7N/wK8RPyOuLrMAJwDq6/GpKGE6OnI
 nBjiYDcOcFVQNPsrVZjVShe/zWKe7lv9StSclR63nb5Zi9bqoS1Fp0g6trD6ME0KixmEfC
 fG8iGEKFzVv9dxdpoOgJjn56msRNyzQ=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 63c41b14
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 25 Feb 2021 12:17:08 +0000 (UTC)
Received: by mail-yb1-f179.google.com with SMTP id 133so5196712ybd.5
 for <wireguard@lists.zx2c4.com>; Thu, 25 Feb 2021 04:17:08 -0800 (PST)
X-Gm-Message-State: AOAM530XBKApynhEyi+WruXbhHVdl7FkdRSLRzHOI/IWI32NhG9OxKuD
 dYE0jCpH5FffO/ViSK/Yiz7eoPURz/CIgKGZ7Gk=
X-Google-Smtp-Source: ABdhPJz+eHsS36qkuJBHFeRlSapIWiMCC2LLVy/j1mHizoZsiCYwyOJOGGc+er/+i2zBlPqd2gfTI9Isr17syPnxGQ8=
X-Received: by 2002:a25:c090:: with SMTP id c138mr3478558ybf.279.1614255427816; 
 Thu, 25 Feb 2021 04:17:07 -0800 (PST)
MIME-Version: 1.0
References: <CAEK8JBCS9gUXFRFpBS5pns_BZ_fKWHPV3+VrxtqEpt4kA0m1Vw@mail.gmail.com>
In-Reply-To: <CAEK8JBCS9gUXFRFpBS5pns_BZ_fKWHPV3+VrxtqEpt4kA0m1Vw@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 25 Feb 2021 13:16:56 +0100
X-Gmail-Original-Message-ID: <CAHmME9oj6v43HtVHFh7fwUT4WO7bpDsAMq-9eLREWStoEJcJRA@mail.gmail.com>
Message-ID: <CAHmME9oj6v43HtVHFh7fwUT4WO7bpDsAMq-9eLREWStoEJcJRA@mail.gmail.com>
Subject: Re: Windows 10 has poor bandwidth when using wireguard
To: Feng Li <lifeng1519@gmail.com>
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

Try out version 0.3.6, just released minutes ago, which should be much
much faster.
