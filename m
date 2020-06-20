Return-Path: <SRS0=weui=AB=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E14F9C433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 20 Jun 2020 07:03:26 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E44912388E
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 20 Jun 2020 07:03:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E44912388E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=fud.no
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5e86d9bc;
	Sat, 20 Jun 2020 06:44:31 +0000 (UTC)
Received: from mail.fud.no (mail.fud.no [2a02:c0:2f0:de01:f816:3eff:fede:dc6a])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 8dcaf2e7
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 20 Jun 2020 06:44:28 +0000 (UTC)
Received: from [2a02:c0:2:7::1] (port=35628 helo=sloth.fud.no)
 by mail.fud.no with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tore@fud.no>)
 id 1jmXWc-0006St-IS; Sat, 20 Jun 2020 09:02:50 +0200
Message-ID: <322460e57138ccee828957de4320ca65cbd54631.camel@fud.no>
Subject: Re: [PATCH] wg-quick: add restart command
From: Tore Anderson <tore@fud.no>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>, Eric Light <eric@ericlight.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Date: Sat, 20 Jun 2020 09:02:49 +0200
In-Reply-To: <CAHmME9oiN4uUjKPqAAkvrVtzh-0LgfLcPd92xQgFJAqgtWtXsw@mail.gmail.com>
References: <20200528184510.51675-1-contact@garrit.xyz>
 <CAHmME9pt7itFsXQnU=9LeRrcT5Yh7gd97bghOA-5a-nCvo85UQ@mail.gmail.com>
 <29f7ec55-3a4b-42df-91f8-5204179639f5@www.fastmail.com>
 <CAHmME9oiN4uUjKPqAAkvrVtzh-0LgfLcPd92xQgFJAqgtWtXsw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.2 (3.36.2-1.fc32) 
MIME-Version: 1.0
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

* Jason A. Donenfeld

> On Wed, Jun 17, 2020 at 2:17 AM Eric Light <eric@ericlight.com> wrote:
> > As a purely Debian user, the 'service x restart' pattern is far more memorable than the syncconf method.  I know personal preference isn't a great reason to add a knob, but Garrit's method is probably going to be much more familiar to many users.
> 
> For users who want service management patterns like that, it'd
> certainly be possible to map the wg-quick strip stuff to `systemctl
> reload wg-quick@wg0.service`, for that purpose. Maybe that's something
> we should consider?

For what it is worth, I posted a patch that does exactly this back in
March:

https://lists.zx2c4.com/pipermail/wireguard/2020-March/005222.html

Reviews or user tests would be greatly appreciated.

You can also pull from https://github.com/toreanderson/wireguard-tools
if you prefer. The commit in question is here:

https://github.com/toreanderson/wireguard-tools/commit/8305a267ec4259206c0de7f1d3f9cfb8522a3223

There is one bugfix in GitHub compared to the patch I posted to the
list in March - using $REAL_INTERFACE instead of $INTERFACE in wg-
quick/openbsd.bash. I can post the updated patch to the list as well if
you want, just let me know. 

Tore

