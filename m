Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1DD7C433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 19 Mar 2022 04:31:19 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 217d4dbc;
	Sat, 19 Mar 2022 04:31:17 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 5e208743
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 19 Mar 2022 04:31:16 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D743960A5B;
 Sat, 19 Mar 2022 04:31:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F199BC340EC;
 Sat, 19 Mar 2022 04:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647664274;
 bh=XWy9DkkcQQqF8h9WSfaHugUA6mtBirkqKD1AceGceSg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=kGnLUzC5LeBTBBONCSrOyEHpNuaRN3oRsCy9e2J9Ntsc5Az5jhuVh3SegdPcbnlis
 K9kL0hOJo1O17erSZQUgCjs4/pckUVcQmdLb/9S7QWgC3YDXgW+E8cwWb9UkcbfyRX
 ScIvBTfYT9U4qKnIF5NSFvenaF3E4h5zbfqbPEl6/dSdaJAaOjMMHgTyoVPr4E+7AP
 Xaz8+CnTI3fzL8qC3T5Cjeh9neD17TE3FRKEcKByPMp1PHGWuv4i1D1c7S2cNPfaJm
 2MMzxTBDrXYQcGsZ+L5KRLj6uA+SuVZ6oC18VxushSC795vfDR7gKeK0glCKlOv9IF
 mxAlmJ0dEeK3Q==
Date: Fri, 18 Mar 2022 21:31:12 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Netdev <netdev@vger.kernel.org>, WireGuard mailing list
 <wireguard@lists.zx2c4.com>, Sebastian Andrzej Siewior
 <bigeasy@linutronix.de>, Saeed Mahameed <saeed@kernel.org>, Eric Dumazet
 <edumazet@google.com>, Thomas Gleixner <tglx@linutronix.de>, Peter Zijlstra
 <peterz@infradead.org>
Subject: Re: [PATCH] net: remove lockdep asserts from ____napi_schedule()
Message-ID: <20220318213112.33289a68@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <CAHmME9rUrWE=AtBhTo95GfCeQCMoRh_KMSOKfpTVpq-7LywMzw@mail.gmail.com>
References: <20220319004738.1068685-1-Jason@zx2c4.com>
 <CAHmME9rUrWE=AtBhTo95GfCeQCMoRh_KMSOKfpTVpq-7LywMzw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Fri, 18 Mar 2022 18:50:08 -0600 Jason A. Donenfeld wrote:
> Hi Jakub,
> 
> Er, I forgot to mark this as net-next, but as it's connected to the
> discussion we were just having, I think you get the idea. :)

Yup, patchwork bot figured it out, too. All good :)
