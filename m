Return-Path: <SRS0=S6z6=OR=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60196C433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 27 Sep 2021 10:34:48 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3EF4F60F6D
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 27 Sep 2021 10:34:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3EF4F60F6D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=wolff.to
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8e2e00d8;
	Mon, 27 Sep 2021 10:34:45 +0000 (UTC)
Received: from wolff.to (wolff.to [98.103.208.27])
 by lists.zx2c4.com (ZX2C4 Mail Server) with SMTP id 185eae61
 for <wireguard@lists.zx2c4.com>;
 Mon, 27 Sep 2021 10:34:41 +0000 (UTC)
Received: (qmail 23847 invoked by uid 500); 27 Sep 2021 10:21:57 -0000
Date: Mon, 27 Sep 2021 05:21:57 -0500
From: Bruno Wolff III <bruno@wolff.to>
To: Roman Mamedov <rm@romanrm.net>
Cc: Nico Schottelius <nico.schottelius@ungleich.ch>,
 el3xyz <el3xyz@protonmail.com>, wireguard@lists.zx2c4.com
Subject: Re: WireGuard with obfuscation support
Message-ID: <20210927102157.GA23755@wolff.to>
References: <XhEJRjPvvlk57PFUWApI0RPX2-dCuDbQ9RYxw9Y5GxzMs8YEpwVc4U-fR3avC-NT1X2UlBNQerMkOxgqrue_EEOtyZR18V329KuKev_i3aE=@protonmail.com>
 <877df2d5px.fsf@ungleich.ch> <20210927071130.GA13681@wolff.to>
 <20210927123439.7a551913@nvm> <20210927091435.GA10234@wolff.to>
 <20210927143628.36c2ceab@nvm>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20210927143628.36c2ceab@nvm>
User-Agent: Mutt/1.12.1 (2019-06-15)
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

On Mon, Sep 27, 2021 at 14:36:28 +0500,
  Roman Mamedov <rm@romanrm.net> wrote:
>On Mon, 27 Sep 2021 04:14:35 -0500
>Bruno Wolff III <bruno@wolff.to> wrote:
>
>> This isn't a simple problem. The assumption is that someone is seeing
>> your network traffic and blocking it.
>
>The assumption is that there's an appliance at the ISP which has a DROP rule
>for UDP with 4 fixed bytes at a fixed offset. It has five hundreds other rules
>to process as well, so it can't spend "too much" time on specifically WG.
>
>> They are still going to see it  even if you disguise it.
>
>With obfuscation there would be UDP packets of random junk, and it would be a
>much harder job to come up with a rule to drop those without affecting
>anything else.

If your ISP is blocking your Wireguard traffic call them up and complain.
