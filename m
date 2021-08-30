Return-Path: <SRS0=kIRS=NV=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6316BC432BE
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 30 Aug 2021 18:43:16 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7AE7160F3A
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 30 Aug 2021 18:43:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7AE7160F3A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emdete.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 735bbeba;
	Mon, 30 Aug 2021 18:43:13 +0000 (UTC)
Received: from emdete.de (emdete.de [2a01:4f8:140:81c4::2])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 6c06d91b
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 30 Aug 2021 18:43:10 +0000 (UTC)
Received: from emdete.de (<unknown> [185.254.75.44])
 by emdete.de (OpenSMTPD) with ESMTPSA id 8d3127c3
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 30 Aug 2021 18:43:08 +0000 (UTC)
Received: from localhost (emdete.de [local])
 by emdete.de (OpenSMTPD) with ESMTPA id 1cd2ba06
 for <wireguard@lists.zx2c4.com>;
 Mon, 30 Aug 2021 18:43:03 +0000 (UTC)
Date: Mon, 30 Aug 2021 20:43:03 +0200
From: "M. Dietrich" <mdt@emdete.de>
Subject: Behaviour on MTU problem
To: wireguard@lists.zx2c4.com
MIME-Version: 1.0
User-Agent: astroid/0.16.0 (https://github.com/astroidmail/astroid)
Message-Id: <1630347517.szy5mrrs16.astroid@morple.none>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

Hi friends of Wireguard,

i am neither a network guru nor a kernel hacker and after all=20
i had no time to fully investigate the case. so please read=20
with a grain of salt.

i had my notebook in a wifi network lately that seemed to have=20
some MTU size problems. download worked fine while uploads=20
blocked for bigger packages. when i set the MTU down to 1200=20
on the wg interface the same upload worked fine.

this was obviously a problem of that very wifi network and is
not related to wg at all, the dhcp answer did not even contain=20
any MTU hints, so 1500 was assumed.

anyway the kernel locked up. commands like `ip` or `wg-quick=20
down ...` get stuck and ^C oder even a `kill -9 ...` did not=20
end the processes. any access to the wg interface blocked.

my question is if that scenario (misconfigured MTU size in the=20
"outer network") is tested and works fine. i know that MTU=20
size problem lead to lockups (that's why i immediatly came to=20
that conclusion) but never saw such a hard lockup related to=20
commands like `ip`.

if my assumption is just stupid let me know. if not i would=20
further investigate the case, setup a test scenario and burn=20
some time. what do you think?

best regards, michael
