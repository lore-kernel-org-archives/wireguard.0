Return-Path: <SRS0=K437=FV=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA087C4361B
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 17 Dec 2020 01:37:01 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DED4323426
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 17 Dec 2020 01:37:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DED4323426
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=glenn.id.au
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6cbddc73;
	Thu, 17 Dec 2020 01:28:16 +0000 (UTC)
Received: from mail-40136.protonmail.ch (mail-40136.protonmail.ch
 [185.70.40.136])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id c858d30b
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 16 Dec 2020 23:44:16 +0000 (UTC)
Date: Wed, 16 Dec 2020 23:52:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=glenn.id.au;
 s=protonmail; t=1608162761;
 bh=MgmVSmMb28XHZU/Crcrxp0n+qN3lhxTIxJatf1gfvts=;
 h=Date:To:From:Reply-To:Subject:From;
 b=fI8PlJxsAAcW6DUcCHy7cTUW+h2GLkaNrNDH7MiZ3n0i6by4meKwvscVFrVLcvSSO
 IQ/tWCnBV2bgDn0gqkY8Og1W+ecixqOZypJimX57rbobbZ/xdIFPkSfFKL8HzxjGaz
 9i/KFlUfwDEc+/CGG2Vlxi7ZB7rpwCuKL1pTwmY01w5kVQXod+HUa9jT4CclQa3JTt
 4fd+k5oqwVJvEh6EcWrmv6Jo/vEp7fPyQUhwrHwazieCg3iVQiThRvS84TCC0xUYsq
 u5h5ELvrU9DqVkNcGR7jKqIrL4JWU+wQbpUtF0kSnsR59kpgSrsCErIHGett2LswwB
 BGZkZ0WTxCpLw==
To: wireguard@lists.zx2c4.com
From: Glenn Schmidt <glenn@glenn.id.au>
Subject: WireGuard on macOS stopped working after 1.0.10 update
Message-ID: <A9F23E70-C8AA-4C54-99E4-63E2E40FE0FA@glenn.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Thu, 17 Dec 2020 02:28:15 +0100
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
Reply-To: Glenn Schmidt <glenn@glenn.id.au>
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

After I installed the new WireGuard update from the Mac app store, I can=
=E2=80=99t connect my tunnel. The message in the UI is "Unable to apply net=
work settings to tunnel object."

I=E2=80=99m using macOS 10.15.7. I've tried rebooting, removing and re-impo=
rting tunnel configs, deleting and re-installing the WireGuard app.

Here=E2=80=99s a dump of possibly-relevant warnings in Console.app during a=
 connection attempt:

error=0910:47:01.801958+1100=09WireGuardNetworkExtension=09Bootstrapping; e=
xternal subsystem UIKit_PKSubsystem refused setup
error=0910:47:01.837971+1100=09nehelper=09-[NWPrivilegedHelper startXPCList=
ener]_block_invoke client pid 111 does not have any known entitlement
error=0910:47:01.838068+1100=09configd=09networkd_privileged_check_interfac=
e_settings_block_invoke received XPC_ERROR_CONNECTION_INVALID
error=0910:47:06.947361+1100=09WireGuardNetworkExtension=09Starting tunnel =
failed with setTunnelNetworkSettings timing out
error=0910:47:06.955318+1100=09nesessionmanager=09address is loopback
error=0910:47:06.959919+1100=09nesessionmanager=09address is loopback
error=0910:47:11.985280+1100=09WireGuardNetworkExtension=09SIOCGIFMTU faile=
d: Device not configured
error=0910:47:11.985358+1100=09WireGuardNetworkExtension=09NEVirtualInterfa=
ceAdjustReadBufferSize: interface_get_mtu failed (6), defaulting to max mtu
error=0910:47:11.988228+1100=09neagent=09[u E64DEC42-DC15-401F-8590-DAFE723=
FB670:m (null)] [<private>(<private>)] Connection to plugin interrupted whi=
le in use.
error=0910:47:11.989727+1100=09neagent=09[u E64DEC42-DC15-401F-8590-DAFE723=
FB670:m (null)] [<private>(<private>)] Connection to plugin invalidated whi=
le in use.
