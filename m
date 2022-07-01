Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37DA9C433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  1 Jul 2022 08:38:38 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 2bea776e;
	Fri, 1 Jul 2022 08:38:37 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id c4a34a3d
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 1 Jul 2022 08:38:35 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E449C621AF;
 Fri,  1 Jul 2022 08:38:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C82B4C3411E;
 Fri,  1 Jul 2022 08:38:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1656664713;
 bh=rK44NCzWOqo4I27A6uYsVw7hmEv82qI7qYAMPwc9i4I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DDeZlJcZlyuirP4fEtdm38/8cVpaRhnnwtqkZonyATd0o1phMXhzCeA8sOyLQAS5w
 Q+zA6RpYehRvzRCOhwtFItE5u15sDrMphNGX9VVxHBsGJbQ4evqTAgadi2uALmNYN6
 I0aMVlfAO2SC59FH3Vnl1SQSniI5duk3FVI7DZAw=
Date: Fri, 1 Jul 2022 10:38:30 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Kalesh Singh <kaleshsingh@google.com>, jstultz@google.com,
 paulmck@kernel.org, rostedt@goodmis.org, rafael@kernel.org,
 hch@infradead.org, saravanak@google.com, tjmercier@google.com,
 surenb@google.com, kernel-team@android.com, Theodore Ts'o <tytso@mit.edu>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Len Brown <len.brown@intel.com>, Pavel Machek <pavel@ucw.cz>,
 linux-kernel@vger.kernel.org, wireguard@lists.zx2c4.com,
 netdev@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH] pm/sleep: Add PM_USERSPACE_AUTOSLEEP Kconfig
Message-ID: <Yr6yhnZNkCDgde9z@kroah.com>
References: <20220630191230.235306-1-kaleshsingh@google.com>
 <Yr3+RLhpp3g9A7vb@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yr3+RLhpp3g9A7vb@zx2c4.com>
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

On Thu, Jun 30, 2022 at 09:49:24PM +0200, Jason A. Donenfeld wrote:
> Hi Kalesh,
> 
> On Thu, Jun 30, 2022 at 07:12:29PM +0000, Kalesh Singh wrote:
> > Systems that initiate frequent suspend/resume from userspace
> > can make the kernel aware by enabling PM_USERSPACE_AUTOSLEEP
> > config.
> > 
> > This allows for certain sleep-sensitive code (wireguard/rng) to
> > decide on what preparatory work should be performed (or not) in
> > their pm_notification callbacks.
> > 
> > This patch was prompted by the discussion at [1] which attempts
> > to remove CONFIG_ANDROID that currently guards these code paths.
> > 
> > [1] https://lore.kernel.org/r/20220629150102.1582425-1-hch@lst.de/
> > 
> > Suggested-by: Jason A. Donenfeld <Jason@zx2c4.com>
> > Signed-off-by: Kalesh Singh <kaleshsingh@google.com>
> 
> Thanks, looks good to me. Do you have a corresponding Gerrit link to the
> change adding this to the base Android kernel config? If so, have my
> Ack:
> 
>     Acked-by: Jason A. Donenfeld <Jason@zx2c4.com>

Cool, I'll queue this up and also the CONFIG_ANDROID removal into my
tree now, thanks all for working it out!

greg k-h
