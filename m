Return-Path: <SRS0=hzHk=FA=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E133C56202
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 26 Nov 2020 13:11:51 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0C412206B2
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 26 Nov 2020 13:11:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="tNoQ2voG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0C412206B2
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9d069ca0;
	Thu, 26 Nov 2020 13:06:01 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id cb21afb7
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 26 Nov 2020 13:06:00 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 543b93ad
 for <wireguard@lists.zx2c4.com>;
 Thu, 26 Nov 2020 13:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=cyDh2lt/PlMJMpzAph8iged62jc=; b=tNoQ2v
 oGmsmHU8NohW6QJqzwbIoeY93SY4RfH2ozvSYhq68poVU3CsQwAHNO5EMS63rRoA
 n5zCSRzRzw4PBUEPoPDDod0fcnvFdvC7/UYUqS0RcVHY5HsHqBGjOfsunAu7Pdcu
 7cbveL2IpvF7XE2V6tIrx+Xvb8XkdOxLYcMFvi+Fd5lsdyhE77Vy9RuDupJYR3H5
 bDiyXvjQhg8mEcjap947p4EDC5laCpQ/AAk9pE5KensSRVzUL7YvWd+KxepxVbUd
 YcK1TWRHhQBlsbvYIMIrsR9jbiXlJtWxmemxjuu/AG8YtyDE+fXZMgw+vfVDUvp5
 bPR0allVXT/iQwlQ==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id ac2731fd
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 26 Nov 2020 13:06:46 +0000 (UTC)
Received: by mail-yb1-f172.google.com with SMTP id t33so1628344ybd.0
 for <wireguard@lists.zx2c4.com>; Thu, 26 Nov 2020 05:11:46 -0800 (PST)
X-Gm-Message-State: AOAM530JSccu/ajI1+3eKgRBwAZJXGWwf9QciazoSn8Ubfbyq8E7+oBt
 fnOrfuH7ba5kvhu5cbJe2tHAbBVbpU0Zgj4GH1g=
X-Google-Smtp-Source: ABdhPJwlVx0SjIwJEzyPQURhUktsVZbmX6efKvlWBtW33qKsMd8ycb4v3zK3n69BLDTeaFA4Je6oAV+xqOmxdPpeKpo=
X-Received: by 2002:a25:df05:: with SMTP id w5mr5671528ybg.20.1606396306450;
 Thu, 26 Nov 2020 05:11:46 -0800 (PST)
MIME-Version: 1.0
References: <9f621ce6-ec3d-0641-c359-756d0ad36f65@gmail.com>
 <6a01b182-a98f-1736-676f-d0811f6de086@gmail.com>
In-Reply-To: <6a01b182-a98f-1736-676f-d0811f6de086@gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 26 Nov 2020 14:11:35 +0100
X-Gmail-Original-Message-ID: <CAHmME9ojL5JxWh5Vn_RsBB8baLabhFvotAuSoQ61fJeht=2qEA@mail.gmail.com>
Message-ID: <CAHmME9ojL5JxWh5Vn_RsBB8baLabhFvotAuSoQ61fJeht=2qEA@mail.gmail.com>
Subject: Re: Problems with Windows client over PulseSecure VPN
To: Peter Whisker <peter.whisker@gmail.com>
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

Is PulseSecure not setting up a /0 route? If so, then this is a known
issue with the lack of policy routing on Windows.
