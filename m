Return-Path: <SRS0=5+V/=5V=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CB7CC2D0E8
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  5 Apr 2020 06:32:45 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6E5A0206F8
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  5 Apr 2020 06:32:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="vc7d5++C"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6E5A0206F8
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6507f1b1;
	Sun, 5 Apr 2020 06:23:38 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 62e58c3f
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sun, 5 Apr 2020 06:23:36 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 56d3f732
 for <wireguard@lists.zx2c4.com>; Sun, 5 Apr 2020 06:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=NisV1kRY+PcF9Ga/TAFAurTHlCg=; b=vc7d5+
 +C3H3g9G0HVlm0T/XIztM2w4+m7CQko0yYu8J/PkF0UJTTgvfLzotcrEA7nEOZX7
 l+g004G+VITTNOob0RY4fQSMoUzPzBS5Z6Q6JXNZpXht1WkivUwl7buNqKXeRbSg
 DEuqWANi3fpHjCHOhZUpXPUWWchN8OQ0EPjjRdm20E2040pHnZhPh0IJHVbLt+x/
 pevRfD/hbTlAqacxN6KneZjI7Csh9oSCHPseikCt1Ze2llq6Mu5R5+AXFIuz7qn1
 7SPDxwPpDQ8Kb11a2pDqgBTaRnIWLDrWVlvtZ2tTEAFA3j4V29a+SKpY/Bii2erc
 eCyWfnswxkzUngJw==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 33aa0de3
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sun, 5 Apr 2020 06:23:35 +0000 (UTC)
Received: by mail-il1-f176.google.com with SMTP id t11so11647497ils.1
 for <wireguard@lists.zx2c4.com>; Sat, 04 Apr 2020 23:32:13 -0700 (PDT)
X-Gm-Message-State: AGi0PuaUNC7oi5dtxiTBOC9VYmscabbTtd9v36id6hF1PI/xySJbx11h
 Zq6J6yPmoWaBWEegLd7wZM8gJlukAcsX0WgPVSQ=
X-Google-Smtp-Source: APiQypJ8/AuqAmlli519P6V/4Vq0b4foZVZqWFwH4TYYyo33fGAGBllIG1QAhQ3iwgoSVKAIpwdYyh8cA5i3LGyOLyM=
X-Received: by 2002:a92:cece:: with SMTP id z14mr16509082ilq.38.1586068332916; 
 Sat, 04 Apr 2020 23:32:12 -0700 (PDT)
MIME-Version: 1.0
References: <CAGGi21Y2pMuHhhCGH10Y44fQKLgTi9pL7-y9Tw3KZm=5R8B9hQ@mail.gmail.com>
In-Reply-To: <CAGGi21Y2pMuHhhCGH10Y44fQKLgTi9pL7-y9Tw3KZm=5R8B9hQ@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 5 Apr 2020 00:32:02 -0600
X-Gmail-Original-Message-ID: <CAHmME9riDvhskz-90g6qc-BuwZLU9JO31XBN=B1yYd6=VSSyBQ@mail.gmail.com>
Message-ID: <CAHmME9riDvhskz-90g6qc-BuwZLU9JO31XBN=B1yYd6=VSSyBQ@mail.gmail.com>
Subject: Re: Automatically updating windows client
To: Elliot Saba <staticfloat@gmail.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>,
 Simon Rozman <simon@rozman.si>
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

Hi Elliot,

I implemented this:
https://git.zx2c4.com/wireguard-windows/commit/?id=d4c4398cf3c1552ff2a253753f222f1d7df8bc74

This will be part of the next release, so long as we don't find
problems with the implementation before.

Jason
