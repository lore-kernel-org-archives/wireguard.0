Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85D7BCA5FFC
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  5 Oct 2026 08:16:37 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 03e905fd;
	Mon, 5 Oct 2026 06:56:26 +0000 (UTC)
Received: from mail-43167.protonmail.ch (mail-43167.protonmail.ch
 [185.70.43.167])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id e41e2e5c
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 16 Jul 2026 21:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=protonmail3; t=1784238017; x=1784497217;
 bh=IoBiPP9ms3dVWyNvMB5wWI47xOQ8iciDzNvIVAQ5C5I=;
 h=Date:To:From:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
 b=XyLNSyzt5PAplvzpetFCvBAkYUFbAuPyAIRwO8R5b5f1I/VjNc54XoaFf74S98REb
 51FDNyxTiNw9n98NDP9DimNxdAkDsxGeZr2q/2vgPdtIbML2PPsI7y8arladj/p6EV
 8AVM1d2o5K+CsZtTFAWHUSHQMox6fJKn00oFdO5HPqO5K5JHOOWiczrqql9enX4zzB
 quzNnHbexnpoKgaVDf/mmMhSiw33ogSO6MqeLdOCnXiSxWDfw9P4Mm+66cIxpdMcaC
 QJ0swmpqW71zs34L9yYYjk0hosYIe3hgDVctlfs4VYDpzu2fNxuPVkyKhv6H+SMsfr
 h/8MkvCMech6g==
Date: Thu, 16 Jul 2026 21:40:12 +0000
To: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
From: Gawen Arab <gawenr@protonmail.com>
Subject: macOS: what was Apple bug 32073323 behind the exit(0) in stopTunnel?
Message-ID: <y2EVlgMSkCGydcCZhMSiXxemgpMF-lwsDM7fYzsBk_X6m5Xn6vQ5AOAKUT3VDK4mG9yDJiF57_v24-32oipCvXbqLmD2sMhc2-gusoC5M3U=@protonmail.com>
Feedback-ID: 2762778:user:proton
X-Pm-Message-ID: 75b21e0cc8873899dfe47412a4dca21688fc981d
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Mon, 05 Oct 2026 06:55:46 +0000
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

Hi,
I've been hacking on the macOS app to let more than one tunnel be up at the=
 same time, and I hit the exit(0) at the end of stopTunnel() in PacketTunne=
lProvider.swift, with the comment pointing at Apple bug 32073323 (dup'd as =
47526107). The radar isn't public so I can't see the original symptom.

From git, 394a0cb ("proper fix for 32073323") swapped out an older workarou=
nd that held the tunnel in .deactivating for a few seconds; the comment the=
re said that reactivating inside that window got the new tunnel torn down b=
y the system about 25 seconds later. Was that the whole of it, or was there=
 more to the bug?

The reason I care: exit(0) gets in the way of multiple tunnels. macOS puts =
all of an app's packet-tunnel providers in a single extension process, so e=
xit(0) on one stopTunnel kills the others too. On 26.5.1 I can no longer re=
produce the ~25s auto-kill even with exit(0) removed - stop a tunnel, start=
 it again a few seconds later, it stays up. So I'm wondering whether the ha=
ck can be dropped on recent macOS, or at least gated to the versions that s=
till need it.

While I'm here: does anyone know if the one-process-for-all-providers behav=
iour can be avoided, i.e. one process per tunnel? Or a way to tear a single=
 tunnel down without taking the whole extension process with it? Stopping o=
ne tunnel currently drops every other active tunnel, which is the main thin=
g blocking this.

Thanks,
=E2=80=94 Gawen Arab
http://gawen.me/
