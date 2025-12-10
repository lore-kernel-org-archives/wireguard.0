Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8937BEF06E1
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  8 Feb 2026 18:50:55 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6d11fa3f;
	Sun, 8 Feb 2026 17:17:18 +0000 (UTC)
Received: from perseverance.encs.concordia.ca (perseverance.encs.concordia.ca
 [132.205.96.94])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f1202e28
 for <wireguard@lists.zx2c4.com>;
 Wed, 10 Dec 2025 14:48:29 +0000 (UTC)
X-Scanned-By: MIMEDefang 3.1 on perseverance.encs.concordia.ca at 2025-12-10
 09:48:29 EST
Received: from frostbite.encs.concordia.ca (frostbite.encs.concordia.ca
 [132.205.47.172] port 58004)
 by perseverance.encs.concordia.ca (envelope-from pmn@encs.concordia.ca)
 (8.17.1/8.17.1) with ESMTP id 5BAEmSMx023412
 for <wireguard@lists.zx2c4.com>; Wed, 10 Dec 2025 09:48:29 -0500
DKIM-Filter: OpenDKIM Filter v2.11.0 perseverance.encs.concordia.ca
 5BAEmSMx023412
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=encs.concordia.ca;
 s=perseverance-2024; t=1765378109;
 bh=SWOVGWMSdQAlftO4RMw4H6mfi/+BaQZbEUPmwLSqpmA=;
 h=Date:From:To:Subject:From;
 b=lTO7dhhfFE9Vm2EU7dDbx6OeO37yArWzFFE0QwGDobDRBe9nhD2Ph3gZuiK5dLRRr
 YEaD8PDMpqT/5XebK5xDhc8phfVDzY5j3bjonvSxyAzOLqdn2+8MlFOx3oA0BN54zG
 K+j2Qnottv7Fsghm7vFzslUfewTEHKVRWcTob4LE=
Received: by frostbite.encs.concordia.ca (Postfix, from userid 60092)
 id CE1D035A3779; Wed, 10 Dec 2025 09:48:28 -0500 (EST)
Date: Wed, 10 Dec 2025 09:48:28 -0500
From: Paymon <paymon@encs.concordia.ca>
To: wireguard@lists.zx2c4.com
Subject: plugging into wireguard clients
Message-ID: <3a43yktovcw425zm7lexmqsysj35skly7f7emftcyirbwarkus@gocmz2oxt4l2>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
X-Mailman-Approved-At: Sun, 08 Feb 2026 17:17:13 +0000
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

hello,

posted a version of this earlier on #wireguard, posting here for those who
missed it? hope it is in good form.

> i'm pushing our organisation to use wireguard for vpn and the show stopper is
> compliance. what they use at the moment is fortinet and the main feature the
> windows admins are asking for is the compliance. what they care about is
> mainly the os version of the staff's own devices atm.
>
> one question i have is, do you know of any open source solution for this?
> (besides tailscale of course)

> i have looked into implementing it myself and the main issue is the windows
> platform, i'm unfamiliar with their package/distributing dance.
>
> nevertheless, i had a brief look into wireguard-windows and first thing i
> notices was `supportedOS` in manifest.xml
>
> one idea would be to repackage and distribute wireguard-windows, with the old
> version of os removed from that manifest file plus a logic that kicks in and
> onboard the user. i.e. authenticate them to the backend, generate a pair of
> keys for them and exchange it to the backend etc.
>
> i wonder what you think about this? in particular, any suggestion as to where
> would be a good entry point for this?
> i see fetcher has some comments related to intunes (not so much familiar with
> that), is that a good place to start?

-- 

               Paymon
