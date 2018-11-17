Return-Path: <SRS0=0dHh=N4=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FE13C43441
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 17 Nov 2018 11:49:40 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B472020825
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 17 Nov 2018 11:49:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="bmL01U7v"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B472020825
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 43523c94;
	Sat, 17 Nov 2018 11:43:54 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 453a7569
 for <wireguard@lists.zx2c4.com>;
 Sat, 17 Nov 2018 11:43:52 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6a08c4b5
 for <wireguard@lists.zx2c4.com>;
 Sat, 17 Nov 2018 11:43:52 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a4fa47e7
 for <wireguard@lists.zx2c4.com>;
 Sat, 17 Nov 2018 11:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=xjDFyhiXzvlk6++3MAWHl6CbNHY=; b=bmL01U
 7vm/GIKvNJNwg0hi8E3ZIjxSK9FAL5CtCAOAcZVO2D/tEarUMewxR8JtkNzDLuvv
 m+OONisqvl9/o9p1iqxqiUJlFOBNPwTow0rcZI2pJbYdSSEqxZY4mu4glJEhVcUW
 /e0TGMG+sVdosZ4s0ljRAT8Ar4frf9j1eA1FjYTSalgluKs6C7qLfWP+pdZDmUax
 0/UYV6Yl24zE1wKRQU0kFphKv3DbQQTcJVUPCHCOgSFZcObGNf95cr3rsTLnY4k5
 uPy0FdzRC545XxX2AIGyxDRjklG5vBTM4YbElmJ3pWnGX4+YwMZpgj+bZ5HL8xvX
 BFQIaKLooRd2OJHg==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id be1e6932
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 17 Nov 2018 11:43:52 +0000 (UTC)
Received: by mail-oi1-f171.google.com with SMTP id j21so246409oii.8
 for <wireguard@lists.zx2c4.com>; Sat, 17 Nov 2018 03:49:35 -0800 (PST)
X-Gm-Message-State: AA+aEWYyX5kk33Udm2PxVsU55YljHn/jiX5l9/8P8MFsIusD315Vyedw
 naQlR5K5F2CRxDyiyEFpKSthGdVxOTBafDeAU8A=
X-Google-Smtp-Source: AJdET5eV9tToXUQJYUfoZVAV8fupIKplHnEqbE5X0hc7ROVt2M5ryoANZR/X1XiHlczEiyPo+apsqshF6Jzm/+faRNo=
X-Received: by 2002:aca:40c1:: with SMTP id
 n184-v6mr2783394oia.119.1542455375251; 
 Sat, 17 Nov 2018 03:49:35 -0800 (PST)
MIME-Version: 1.0
References: <c54ebbf7-2cca-b1e7-4079-565a2bc5b3fa@solidadmin.com>
In-Reply-To: <c54ebbf7-2cca-b1e7-4079-565a2bc5b3fa@solidadmin.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sat, 17 Nov 2018 12:49:23 +0100
X-Gmail-Original-Message-ID: <CAHmME9okdiovWYOd2GxXc_QZA-rp_h0soa0nAj27aKYdTsaTHg@mail.gmail.com>
Message-ID: <CAHmME9okdiovWYOd2GxXc_QZA-rp_h0soa0nAj27aKYdTsaTHg@mail.gmail.com>
Subject: Re: RHEL 8 Beta Install Documentation
To: Joe Doss <joe@solidadmin.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Hi Joe,

Thanks for the instructions.

Any idea where I can find the RHEL8 kernel sources / .config file, so
I can verify the compat stuff is still working as intended there? 4.18
is pretty new so hopefully everything just works.

Jason
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
