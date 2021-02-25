Return-Path: <SRS0=9XF/=H3=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,TVD_SPACE_RATIO,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD6BAC433E6
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 25 Feb 2021 11:33:19 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ADDA864EBD
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 25 Feb 2021 11:33:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ADDA864EBD
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9d1b9aa2;
	Thu, 25 Feb 2021 11:30:11 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [104.131.123.232])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 24b7f54f
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 25 Feb 2021 11:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1614252606;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=v6Dqdy8iUsdbrdEmeON+8+43rAZWtYEnLZQkEASltI0=;
 b=gpL+eKl975+kJ48qxZu5zA/fyQVKkUEcZMzi6A4nkN17YK1B7neYrFefwGtyIWxkJlYJHL
 IDnxDwKvC/In6kxnO4bXRnBuaJGgAuwmm2wAcVp8rXeLFBC+v8TZQYjcPo4l5iEW1xCZOp
 Xz1nVTSqDlbadgMR1npYEsQpFPLNXAM=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 78c90dc1
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 25 Feb 2021 11:30:06 +0000 (UTC)
Received: by mail-yb1-f180.google.com with SMTP id c131so5065163ybf.7
 for <wireguard@lists.zx2c4.com>; Thu, 25 Feb 2021 03:30:06 -0800 (PST)
X-Gm-Message-State: AOAM532w8f5y0L/O0zALu1x2g8odnG9JjEW34L3T8Wt6XBveFPOB2D/B
 acZ/h2vNWX7tTgFeeKHZ2EXK/CEe6D19nIO33Yw=
X-Google-Smtp-Source: ABdhPJw7R3EJ372xZN/13kcVprfyNM7R8ZkrssUTmUfiStKw21wr0R7o0RLp25VghAklUPinQEq+R1gQs0tkYmzVQxY=
X-Received: by 2002:a25:5289:: with SMTP id g131mr3441938ybb.178.1614252606147; 
 Thu, 25 Feb 2021 03:30:06 -0800 (PST)
MIME-Version: 1.0
References: <F332C4E6-0559-4BE0-8AF6-3AD942C01FAC@wandera.com>
 <CAHmME9qyD4ZDoT9dyb-cdQ319jjTHYXhhXbcdFphU8+pSKdWiw@mail.gmail.com>
In-Reply-To: <CAHmME9qyD4ZDoT9dyb-cdQ319jjTHYXhhXbcdFphU8+pSKdWiw@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 25 Feb 2021 12:29:55 +0100
X-Gmail-Original-Message-ID: <CAHmME9rJo5BzJDJubvVr_+0ra=hVkYv9Cvd_p_+TBcrr92KstQ@mail.gmail.com>
Message-ID: <CAHmME9rJo5BzJDJubvVr_+0ra=hVkYv9Cvd_p_+TBcrr92KstQ@mail.gmail.com>
Subject: Re: Patch: initialise device.peers.empty
To: Laura Zelenku <laura.zelenku@wandera.com>
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

Fixed differently here:
https://git.zx2c4.com/wireguard-go/commit/?id=355fed440bd066b8aa32e63e04c7f92e7a097d88
