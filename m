Return-Path: <SRS0=esD3=P7=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A705AC282C0
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 23 Jan 2019 21:44:57 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D2A4A21855
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 23 Jan 2019 21:44:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D2A4A21855
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=wolff.to
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 89a5cf54;
	Wed, 23 Jan 2019 21:39:32 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id dedcaf11
 for <wireguard@lists.zx2c4.com>;
 Wed, 23 Jan 2019 21:39:30 +0000 (UTC)
Received: from wolff.to (wolff.to [98.103.208.27])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with SMTP id 4a657255
 for <wireguard@lists.zx2c4.com>;
 Wed, 23 Jan 2019 21:39:30 +0000 (UTC)
Received: (qmail 1516 invoked by uid 500); 23 Jan 2019 21:37:27 -0000
Date: Wed, 23 Jan 2019 15:37:27 -0600
From: Bruno Wolff III <bruno@wolff.to>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: [ANNOUNCE] WireGuard Snapshot `0.0.20190123` Available
Message-ID: <20190123213727.GA1486@wolff.to>
References: <71390d502a8c6962@frisell.zx2c4.com>
 <CAHmME9oFiv+TSRoQ8zkVWsqT57B_nYdMM5ufDjshi_23Ep2BUQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHmME9oFiv+TSRoQ8zkVWsqT57B_nYdMM5ufDjshi_23Ep2BUQ@mail.gmail.com>
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

On Wed, Jan 23, 2019 at 21:32:20 +0100,
  "Jason A. Donenfeld" <Jason@zx2c4.com> wrote:
>On Wed, Jan 23, 2019 at 2:40 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>>   * netlink: use __kernel_timespec for handshake time
>>
>>   This readies us for Y2038. See https://lwn.net/Articles/776435/ for more info.
>
>Sorry, I didn't realize that link was still paywalled. Have a
>subscriber link instead:

It will probably unlock in just over 3 hours.
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
