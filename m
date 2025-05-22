Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7E8FC54ED0
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 23 May 2025 17:11:01 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8069bf33;
	Fri, 23 May 2025 17:10:59 +0000 (UTC)
Received: from dormouse.ash.relay.mailchannels.net
 (dormouse.ash.relay.mailchannels.net [23.83.222.50])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 1c62ef30
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 22 May 2025 22:36:51 +0000 (UTC)
X-Sender-Id: instrampxe0y3a|x-authuser|calestyo@scientia.org
Received: from relay.mailchannels.net (localhost [127.0.0.1])
 by relay.mailchannels.net (Postfix) with ESMTP id 64602164FE7;
 Thu, 22 May 2025 22:36:49 +0000 (UTC)
Received: from cpanel-007-fra.hostingww.com
 (100-122-100-82.trex-nlb.outbound.svc.cluster.local [100.122.100.82])
 (Authenticated sender: instrampxe0y3a)
 by relay.mailchannels.net (Postfix) with ESMTPA id C87E1164D60
 for <wireguard@lists.zx2c4.com>; Thu, 22 May 2025 22:36:48 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1747953409; a=rsa-sha256;
 cv=none;
 b=y8QhZcAzAJje8tvDlNRL7rdEUZCTgZDLdjEAJjqLlc47QjCxatGLOFH68mpOkU37OkU6cD
 kERMfofH8jUA/BoA3SjkMEEEGgEmplxYV4GYs/uWiyD5ga2YWWsAvIoDLwPy9WtmPtk5o/
 7OG3eQ8iR2FkPhsg9xPm/ZzPvxP2/ymMTWbgI4z8GuLaatLB+5wpMKHa5Ii5ht+7rBPQJY
 YM8LoRL+yG8ecXl9JdgqhmUTAI1y1hWjC1nnhzeltFh97A1DPBirh+Vk6WNwgID1PK3ikQ
 OI/VXb3/kvXYAE/CrI1z2FQZxaq7VBz86Dv0IbAVkJm1qCngvN9bAlwmmWZsWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net; s=arc-2022; t=1747953409;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=sA5RxBOo6WSoMGZMnIwFHcRpW6wJqCAEgGrJhouh2nA=;
 b=Mimgw+Y11IFp45lFFy0mg7joTCXOBtw0/7fMEmcZvUNy4q7x5Mqe3B8WLRbAi+g9snI/FP
 2BQgGYkOIMA89lDt4LO6LnvVUf+mPBpZjxW0B6zNs5oXtdHKinC9pgbGbOXxUmvHJFKykg
 hrmyZVoWJsDPnyssPn5lDx73l0VkzbJOaddUsvZui9iDxPCkPapdI2AILwuWhrd+ISgweR
 +Jrv9RCFmODrLOvfH6BLDtqbPy9CEcKVYkLUaGKNxypDW48S8qQq1BrDec6Dr4OL3cr2Su
 98fFAfgbZLzfCZFXNNzRB/YR+pS58IOo5u3fGkmge0v1/tzfYoyoABlMMeBjwA==
ARC-Authentication-Results: i=1; rspamd-766f9cfddb-fnbd4;
 auth=pass smtp.auth=instrampxe0y3a smtp.mailfrom=calestyo@scientia.org
X-Sender-Id: instrampxe0y3a|x-authuser|calestyo@scientia.org
X-MC-Relay: Neutral
X-MC-Copy: stored-urls
X-MailChannels-SenderId: instrampxe0y3a|x-authuser|calestyo@scientia.org
X-MailChannels-Auth-Id: instrampxe0y3a
X-Broad-Wipe: 1867ab0628723d40_1747953409299_986338253
X-MC-Loop-Signature: 1747953409299:1683624562
X-MC-Ingress-Time: 1747953409299
Received: from cpanel-007-fra.hostingww.com (cpanel-007-fra.hostingww.com
 [3.69.87.180]) (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
 by 100.122.100.82 (trex/7.0.3); Thu, 22 May 2025 22:36:49 +0000
Received: from p5b071812.dip0.t-ipconnect.de ([91.7.24.18]:63838
 helo=heisenberg.fritz.box)
 by cpanel-007-fra.hostingww.com with esmtpsa (TLS1.3) tls
 TLS_AES_256_GCM_SHA384 (Exim 4.98.1)
 (envelope-from <calestyo@scientia.org>) id 1uIEWu-0000000BubF-2avD
 for wireguard@lists.zx2c4.com; Thu, 22 May 2025 22:36:47 +0000
Message-ID: <1a897464d3fb56184b83cb6ac7b4a2407047b10e.camel@scientia.org>
Subject: are WG clients expected to automatically handle it when the
 endpoint is within the AllowedIPs
From: Christoph Anton Mitterer <calestyo@scientia.org>
To: wireguard@lists.zx2c4.com
Date: Fri, 23 May 2025 00:36:46 +0200
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1 
MIME-Version: 1.0
X-AuthUser: calestyo@scientia.org
X-Mailman-Approved-At: Fri, 23 May 2025 17:10:58 +0000
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

(re-posting, now that the list seems to work again)


Hey folks.

In science/education, many organisations (I could find the total list
only in the Android app, but there it seems to be several 1000) use
eduVPN to provide VPN access to their users.
It comes with a client which, AFAIU, either sets up some OpenVPN or WG
VPN.

I've previously used the OpenVPN profile files successfully with
NetworkManager but now wanted to switch to WG, and again I don't wanna
use the eduVPN client, because I think this should be done with the
native tools that integrate nicely into the system (e.g. NM for desktop
environments, ifupdown/systemd-networkd/etc. for servers).

I guess quite a few sites offer two kinds of profiles, "full" (where
the VPN is set up so that all traffic goes via it) and "split" (where
only the subnets of the respective organisations go via the VPN.

For WG and split a provided config looks like:
[Interface]
MTU =3D 1392
PrivateKey =3D blafasl
Address =3D 10.153.154.19/24,2001:4ca0:4fff:2:4::13/96
DNS =3D
10.156.33.53,129.187.5.1,2001:4ca0::53:1,2001:4ca0::53:2,lmu.de,uni-
muenchen.de,mwn.de

[Peer]
PublicKey =3D 7Bp04UdAbZDqChLFgm0sJa6YUaIsye0mZ2c0AxKe5RE=3D
AllowedIPs =3D
10.0.0.0/8,85.208.24.0/22,129.27.124.136/32,129.187.0.0/16,131.159.0.0/


16,138.244.0.0/15,138.246.0.0/16,141.39.128.0/18,141.39.240.0/20,141.40


.0.0/16,141.84.0.0/16,172.16.0.0/12,192.54.42.0/24,192.55.197.0/24,192.


68.211.0/24,192.68.212.0/24,192.168.0.0/16,193.174.96.0/23,194.94.155.2


24/28,2001:4ca0::/29,2a09:80c0::/29
Endpoint =3D eduvpn-n14.srv.lrz.de:51820

for full it's effectively the same, except for:
AllowedIPs =3D 0.0.0.0/0,::/0


Using that config with NM fails, for which I've opened [0] which is
mostly about the "split" setup and for which there's [1] which is
mostly about the full setup.

The reason being, that the endpoint has IPs that are also within the
AllowedIPs subnet and no special care is taken (well for full, it seems
they=E2=80=99re about to handle it [2]), that packets to the endpoint don't=
 go
via the tunnel.


With wg-quick, full works, but split fails, too, I guess because
add_default is only called in the AllowedIPs =3D 0.0.0.0/0,::/0 case.
https://github.com/WireGuard/wireguard-tools/blob/17c78d31c27a3c311a2ff42a8=
81057753c6ef2a4/src/wg-quick/linux.bash#L169-L170



So the question is now, should clients be expected to automatically
handle the split case (they apparently are for the full case)...
... or are (split) profiles expected to "simply" (well it could be ugly
in practise) provide their AllowedIPs so that it doesn't contain any
endpoints.

The practical problem with the latter would of course be that the
endpoints will typically be within subnets that shall also be
tunnelled.


Thanks,
Chris.


[0] https://gitlab.freedesktop.org/NetworkManager/NetworkManager/-/issues/1=
737
[1] https://gitlab.freedesktop.org/NetworkManager/NetworkManager/-/issues/1=
521
[2] https://gitlab.freedesktop.org/NetworkManager/NetworkManager/-/merge_re=
quests/2158
