Return-Path: <SRS0=89gA=OS=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBCCFC433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 28 Sep 2021 03:25:22 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D4670611F0
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 28 Sep 2021 03:25:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D4670611F0
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=stdmail.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ccbc1ace;
	Tue, 28 Sep 2021 03:22:39 +0000 (UTC)
Received: from mx2.simplelogin.co (mx2.simplelogin.co [94.237.125.28])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 84817f62
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 27 Sep 2021 21:36:27 +0000 (UTC)
X-SimpleLogin-Client-IP: 94.237.111.15
Received: from [172.17.0.10] (mx1.simplelogin.co [94.237.111.15])
 by mx2.simplelogin.co (Postfix) with ESMTP id 1A0C75EFED
 for <wireguard@lists.zx2c4.com>; Mon, 27 Sep 2021 21:36:27 +0000 (UTC)
Subject: Feature request - Number of tunnel entries in root of tray icon
 context menu
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
From: wireguard_mailing_list_user@stdmail.de
To: wireguard@lists.zx2c4.com
Message-ID: <163277858699.7.10950010429724590941.14337061@stdmail.de>
Date: Mon, 27 Sep 2021 21:36:26 -0000
X-SimpleLogin-Type: Reply
X-SimpleLogin-EmailLog-ID: 14337061
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=stdmail.de;
 i=@stdmail.de; q=dns/txt; s=dkim; t=1632778587;
 h=message-id : date :  subject : from : to;
 bh=kZXBown2S4kilm66JFqO8JQnD5LqxWp2vbaMDLNUfvk=;
 b=VyllQqPy0x1OGuCz9JjGJkAwASJb38us86MKFeZqJZ3dPFEIF9e1+FzkwmiTOZB7b7e2q
 Dn/9G+gSqq2r9kESLVLjG6yev1WXpv/LHJx+sni0rullujao1dVmPeeoVuyqAGLTB42AhAQ
 MUSpPgUaQ8b41ZseTyySTXkEcAxGY3Q= 
X-Mailman-Approved-At: Tue, 28 Sep 2021 03:22:38 +0000
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

the hardcoded value is 10 (in ui/tray.go)

Wouldn't it be possible to allow a user to set this value instead of=20
using a hardcoded one?

E.g. via:
HKEY_CURRENT_USER\SOFTWARE\WireGuard\TunnelsInRootMenu
Default is 10 and if that registry value doesn't exist, 10 is also the=20
default

It should accept values from 0 (display all tunnels) to +x (display at=20
maximum x tunnels)

Vertical screen space shouldn't be an issue nowadays and imho the value=20
of 10 is a bit too limiting.

Thank you!


