Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2C23C433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 16 Jan 2022 21:10:50 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id dd101a58;
	Sun, 16 Jan 2022 21:10:48 +0000 (UTC)
Received: from mail-4323.proton.ch (mail-4323.proton.ch [185.70.43.23])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 50a1cfa1
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 5 Jan 2022 18:47:50 +0000 (UTC)
Date: Wed, 05 Jan 2022 18:47:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tpro.tech;
 s=protonmail; t=1641408469;
 bh=o3nnNAgBsBQS8QZxCN8XTDhMywEVM12POz9Oux+QTfc=;
 h=Date:To:From:Reply-To:Subject:Message-ID:From:To:Cc;
 b=Sb3YvGjpLYcyqhNdtjCQchmzmyRu5RzlyIBqthxfOx34TosHZ/U4CVYIU1PHHGRit
 MEoN3vdD3xs80/iPRM5XWw7lI6rPU8jZ2eFHVV1ajHNcL1I1RkwFO4pEJfrGdKeNly
 /h1PFnv7sASggo73h5I5cZB1xldBD4qmsjDaRV10=
To: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
From: Tony Pros <tony@tpro.tech>
Subject: Wireguard Windows Service Issues
Message-ID: <M95S0K3OLlWrjbBpofGUvTbVG6o7H8pKclgaVy8bSYAIklVksUf0PfyKeTYWPtt9QUBcrGlmQXnKvvndSWIntkZ-_pWfIG9vGbjeyv7H1jQ=@tpro.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Sun, 16 Jan 2022 21:10:46 +0000
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
Reply-To: Tony Pros <tony@tpro.tech>
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

I believe there's a bug in the Windows service implementation, if this issu=
e is by design, it's problematic.

I have non-admin users were when I initially set them up with wireguard, I =
configured it to use the service, using the command:

wireguard /installtunnelservice "C:\Program Files\WireGuard\Data\Configurat=
ions\vpn.domain.org.conf.dpapi"

The tunnel worked fine the first time. Then the user reboots the laptop, or=
 closes it or leaves whatever coffee shop they were at and get disconnected=
 from the wireless network they were using. When this happens, for some rea=
son, the wireguard service then gets torn down never to come back again unt=
il I issue the command from my admin account again.

There was an issue with some users initial configuration in that they could=
 not query hostname via DNS, so that entering the command to installservice=
 would not even create the service.

Here's a few notes that might help with understanding.
- Users must have the VPN established before they log into the active direc=
tory servers on the remote network so that they can get all of their GPO di=
rectives.
- Wireguard Service should stay up so that any time a users connects to any=
 network, the VPN is established immediately after that.
- The Wireguard service should also stay because non-admin users cannot cre=
ate a new service


If this issue is how things will stay, and this is not considered a bug, ho=
w would you configure windows non-admin users to tunnel to an enterprise ne=
twork before login via WireGuard and to continuously try to establish the t=
unnel while the user is not connected to a network?


--
Tony Pros - Owner
tony@tpro.tech
615 656 3543

T-Pro Tech LLC
Audio & IT Consulting
