Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55D55C001DE
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 23 Jul 2023 16:05:20 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bb35ccc0;
	Sun, 23 Jul 2023 16:00:52 +0000 (UTC)
Received: from smtp.gentoo.org (woodpecker.gentoo.org
 [2001:470:ea4a:1:5054:ff:fec7:86e4])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 04c3ddd4
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sun, 2 Jul 2023 14:04:24 +0000 (UTC)
User-agent: mu4e 1.10.4; emacs 29.0.92
From: Sam James <sam@gentoo.org>
To: regressions@leemhuis.info
Cc: Jason@zx2c4.com, andy@greyhouse.net, bagasdotme@gmail.com,
 boqun.feng@gmail.com, boris.ovstrosky@oracle.com, bp@alien8.de,
 dave.hansen@linux.intel.com, david@unsolicited.net, eric.devolder@oracle.com,
 hpa@zytor.com, j.vosburgh@gmail.com, joel@joelfernandes.org, lenb@kernel.org,
 linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, manuel.leiner@gmx.de,
 miguel.luis@oracle.com, mingo@redhat.com, netdev@vger.kernel.org,
 paulmck@kernel.org, rafael@kernel.org, rcu@vger.kernel.org,
 regressions@lists.linux.dev, tglx@linutronix.de, wireguard@lists.zx2c4.com,
 x86@kernel.org
Subject: Re: Fwd: RCU stalls with wireguard over bonding over igb on Linux
 6.3.0+
In-Reply-To: <10f2a5ee-91e2-1241-9e3b-932c493e61b6@leemhuis.info>
Date: Sun, 02 Jul 2023 15:03:36 +0100
Message-ID: <87sfa6if4x.fsf@gentoo.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Mailman-Approved-At: Sun, 23 Jul 2023 16:00:49 +0000
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

#regzbot link: https://bugs.gentoo.org/909066
