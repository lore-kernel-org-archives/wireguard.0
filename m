Return-Path: <SRS0=DDek=NQ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66D2FC0044C
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  5 Nov 2018 21:49:10 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D025820825
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  5 Nov 2018 21:49:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D025820825
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=wolff.to
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d20dcbf0;
	Mon, 5 Nov 2018 21:44:52 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c8e81f81
 for <wireguard@lists.zx2c4.com>; Mon, 5 Nov 2018 21:44:49 +0000 (UTC)
Received: from wolff.to (wolff.to [98.103.208.27])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with SMTP id 02a8f98c
 for <wireguard@lists.zx2c4.com>; Mon, 5 Nov 2018 21:44:49 +0000 (UTC)
Received: (qmail 4552 invoked by uid 500); 5 Nov 2018 21:44:06 -0000
Date: Mon, 5 Nov 2018 15:44:06 -0600
From: Bruno Wolff III <bruno@wolff.to>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: WireGuard for iOS - TestFlight
Message-ID: <20181105214406.GA4520@wolff.to>
References: <CAHmME9p5bjmP8qSapvf1vmiMAk3BAkONjwXev3O_QtGYM=k3QQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHmME9p5bjmP8qSapvf1vmiMAk3BAkONjwXev3O_QtGYM=k3QQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

On Mon, Nov 05, 2018 at 22:27:24 +0100,
  "Jason A. Donenfeld" <Jason@zx2c4.com> wrote:
>Hey folks,
>
>For the last few weeks, Roopesh and I have been hard at work on the
>WireGuard for iOS app. Today we're happy to share a

I thought you went on vacation, as it was so quite since V8 got posted.
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
