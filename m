Return-Path: <SRS0=FGbH=EV=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3D2CC2D0E4
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 15 Nov 2020 18:43:23 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F27A722409
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 15 Nov 2020 18:43:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FPqvCj7p"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F27A722409
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 06d6cbc8;
	Sun, 15 Nov 2020 18:38:31 +0000 (UTC)
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 47fe7e88
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 15 Nov 2020 18:38:29 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id v144so21726379lfa.13
 for <wireguard@lists.zx2c4.com>; Sun, 15 Nov 2020 10:42:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BTlAW2utc9LRxFuZFlSNtiK7BZiLdFb4zKfYkRW3lKc=;
 b=FPqvCj7pGyDoLnL0KHdumQrerU6SttUlf/iKpIA6a2XT7LjKOb1RfwtEYO5ObKEf9X
 XpzSa66NmAZcF2lt6bsGDipaERMbg8hH9bRmfha8SRho61pkAy2dbCCjOl8QfUi1FGWN
 8Q1jZYe0t39iADQJMMao0oMIpryBsGlZp61T+qLcXsAIyytVCZDjS5iQSOm/+ZywbFUC
 xt7pULQU3r1Oys316tqi/hjvn3Unld5mS7NIG2SEC+heAQf+EhnQUTKdcUOB0mHyZeud
 VfuNDYw8II5EpVuF1fSTUoNzOj7rRGDDD7Utm1gi+W1WejIHzUgBQ1VVQTY+49xrNcT5
 mwmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BTlAW2utc9LRxFuZFlSNtiK7BZiLdFb4zKfYkRW3lKc=;
 b=Jp5ZF31jXVNmaJxouBEYO0FxumnZ7y9tMVRBDlSflvw5Yy96LL5aOEztyYLr3i5Wh+
 HB1bNWw3WgSAPXhJ+qv67FH9mbEepbQVMjYysuQMcsgWSF+4sCabYmF086AH9c+7Mw2W
 ixeZLPYOBwIRN7EN92bHF/FuYLldQZZuC1vpuD/oXUxxfXCWkacM/DU6YiO63T8fKf8t
 4Zq83k3cKJX41IqMqKGlXv99hPIH7RC/NTKm+etd8y1jYwnFP7yE7YwIUattVRbrPA9J
 q5xbG1XlfEBaN0B9K3EoP4VXnEfUyJ2k7cxDLeCfa1aFJD8oj1NsyLkTdAfIIB5XPro0
 UjyQ==
X-Gm-Message-State: AOAM5331sNmpOyHtoajglqgeNhHblnOvWN9teSJSjrPzG98L4cZ6O3fx
 jAq37jXThZBkoASA3uCBfuozZz+mMN2iiJ/IJRo=
X-Google-Smtp-Source: ABdhPJzfMfIBBPJ8LIdoFf15hMhcR5RD+WNXG5bn/+EhGA+OmzfVrBTBeeOLzjd8P2v4EdsoXWqjofa091NLmkx8ef4=
X-Received: by 2002:ac2:4834:: with SMTP id 20mr3940728lft.598.1605465769880; 
 Sun, 15 Nov 2020 10:42:49 -0800 (PST)
MIME-Version: 1.0
References: <CADJb3qRk2nuvQdyF1+=9yf84annmJ+nyapdokFx1o-WcVfvfKQ@mail.gmail.com>
 <A64A6CAC-E8CA-41AB-8CCD-E9E379591C91@tomcsanyi.net>
 <d62f54e7-cb5f-7baf-9320-19903b7c5d51@pcfreak.de>
 <CADJb3qRapO=3-fuyeS6iC8EnM34TxTxpZBr1uyVhhTmfjgOmwA@mail.gmail.com>
 <55dea4e3-0499-2b23-6bef-4ebd67b3d905@gmail.com>
In-Reply-To: <55dea4e3-0499-2b23-6bef-4ebd67b3d905@gmail.com>
From: Yves Goergen <yves.goergen@gmail.com>
Date: Sun, 15 Nov 2020 19:42:39 +0100
Message-ID: <CADJb3qTCed6GvshAmqOuVV-T9Pk7g6gs=KgHPGFSP7e9J8aMig@mail.gmail.com>
Subject: Re: Add local DNS forwarder to Windows client
To: Lech Perczak <lech.perczak@gmail.com>
Cc: wireguard@lists.zx2c4.com
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

I still cannot see how the suggested measures solve the root problem.

I, too, think of FritzBox or Speedport or EasyBox when I think of a
home LAN. These DSL routers are also often used in small offices. So
for this part, small offices and private home networks use the same
technology. Larger companies surely have more money to spend. The
mentioned router models probably make up half of all internet users in
Germany. Other models (like TP-Link) don't include a DNS server for
DHCP'd local hosts and are almost unusable for home LANs. If you use a
router of that kind you have problems before thinking of VPN.

None of these networks offer a DNS suffix. And if they do (FritzBox),
it's fixed to ".local". Everywhere. I tried to change it but it's not
possible, confirmed by AVM support. Now you may want to call LANs
managed by a FritzBox unprofessional. And to a certain point I can
follow you. But unprofessional or not, it's the reality that a whole
lot of people live in. Now and for the foreseeable future. I wouldn't
want to spend extra work to set up a different custom-made router in
all of my networks just so that the limited WireGuard capabilities
solve my problems. Using OpenVPN is a lot easier then.

This reality includes host names like "pc1" and "pc2" in one LAN and
"pc3" and "pc4" in the other LAN. If I'm in one of these LANs and want
to connect to the other, I need name resolution with both routers to
be able to use names in the LAN I'm currently in and at the same time
names in the LAN I'm connected to. No single existing DNS server could
ever do that because the two routers don't know each other.

I haven't mentioned public names yet. In this simple scenario, both
routers could resolve internet names, but the local router is
preferred because it's faster.

As far as I understand things, I need this specific solution, and it's
almost impossible to built that without tight integration with a
WireGuard client:

* A local DNS proxy on the tunnel client end
* that registers itself as the new default DNS server for as long as a
tunnel is active
* and forwards all DNS queries to *all* of the connected tunnels' DNS
(if specified) and also the previous system's DNS server
* and responds with the first positive answer that comes in.
* This proxy adapts to all active tunnels and
* stops and unregisters when the last tunnel is closed.

None of the suggested solutions provide these features. All of them
assume that I have host names with a distinguishable name suffix (not
the case, not changeable) and that I can reconfigure DNS proxy
configuration upon activating and deactivating a tunnel (not
practical).

While I understand that WireGuard (the tunnel tech) is intended to be
simple, I consider this feature necessary on a higher level for normal
network operation. Make things as simple as possible, but no simpler!
And in this case, it's just a client GUI that already provides several
comfort features outside of the core tunnel scope. A DNS proxy would
well fit in this.

And yes, this causes more network traffic than necessary in an ideal
world. But I'm looking for a solution in the existing world, and it's
only DNS packets, no OS image downloads. Make it correct, and fast; in
that order.

-Yves
