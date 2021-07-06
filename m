Return-Path: <SRS0=oMkR=L6=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4210C07E96
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  6 Jul 2021 07:01:35 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D446C61973
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  6 Jul 2021 07:01:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D446C61973
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=freenetproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1faf08e6;
	Tue, 6 Jul 2021 07:00:16 +0000 (UTC)
Received: from a4-15.smtp-out.eu-west-1.amazonses.com
 (a4-15.smtp-out.eu-west-1.amazonses.com [54.240.4.15])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 3cdc09c0
 (TLSv1.2:ECDHE-ECDSA-AES256-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 6 Jul 2021 07:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=uku4taia5b5tsbglxyj6zym32efj7xqv; d=amazonses.com; t=1625554814;
 h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:Content-Type:MIME-Version:Content-Transfer-Encoding:Feedback-ID;
 bh=owgb/5vJUCiJmxbtlssLxa87k51zJWEEzt/0YPctqKM=;
 b=igOsoW+G6k08/ydvuCbLIfxa3NAYi1Mm0jxlyu1vLuYmU1N5bdtEU/2UmsAfiT1n
 O8OX95CjzZOnXA6x6KwMbv63vvOXiuhAMk3KdN1Eec3EuTgPkIW4Hq+l/doN7rcwUYg
 sZ0JacLMqpCWrxWfd0On01M702hEM4eRaWdbg1WU=
Message-ID: <0102017a7a9e0329-2cf98ec6-3874-4f0e-80f0-663792b43e3b-000000@eu-west-1.amazonses.com>
Subject: Re: passing-through TOS/DSCP marking
From: Florent Daigniere <nextgens@freenetproject.org>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Date: Tue, 6 Jul 2021 07:00:14 +0000
In-Reply-To: <CAHmME9omR=NXkJj-AJviWhcDDY=X9vQbLxn5WbeamUGhVWHhJw@mail.gmail.com>
References: <YMn7qQ/7s/CciRNy@makrotopia.org>
 <CAHmME9omR=NXkJj-AJviWhcDDY=X9vQbLxn5WbeamUGhVWHhJw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Feedback-ID: 1.eu-west-1.pdg62YgwzwxEqxeEXyLJB4Hk3i4AYkez1He1VuR521Q=:AmazonSES
X-SES-Outgoing: 2021.07.06-54.240.4.15
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

On Wed, 2021-06-16 at 18:28 +0200, Jason A. Donenfeld wrote:
> WireGuard does not copy the inner DSCP mark to the outside, aside from
> the ECN bits, in order to avoid a data leak.
> 
> Jason

Hi Jason,

Is there any room for revisiting this design decision? We are talking
about 6 bits of metadata per packet here...

Which realistic threats are we trying to protect against?

The solutions that don't involve code changes all have significant
drawbacks:
- awesome BPF-based magic will be Linux only
- multiple tunnels are not always practical and arguably worse traffic
correlation-wise.

I still use a patched wireguard to protect traffic from a voip app on an
android handset using wifi here... and while I have a solution that's
good enough for my requirements, I do think that the community would
benefit from having something that works better out of the box (and on
all platforms).

Florent

