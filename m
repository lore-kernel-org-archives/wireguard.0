Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD7F3CDB474
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 23 Oct 2023 14:24:07 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 898faffb;
	Mon, 23 Oct 2023 14:07:32 +0000 (UTC)
Received: from filter.openoffice.nl (filter.openoffice.nl
 [2a01:4f8:200:546b::2eef])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c7d14afb
 for <wireguard@lists.zx2c4.com>; Tue, 5 Sep 2023 14:04:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by filter.openoffice.nl (Postfix) with ESMTP id 479C9100745
 for <wireguard@lists.zx2c4.com>; Tue,  5 Sep 2023 16:04:35 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at filter.openoffice.nl
Received: from filter.openoffice.nl ([127.0.0.1])
 by localhost (filter.openoffice.nl [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oJ9WIP0NSUaN for <wireguard@lists.zx2c4.com>;
 Tue,  5 Sep 2023 16:04:35 +0200 (CEST)
Received: from blub.net (tunnel512631-pt.tunnel.tserv11.ams1.ipv6.he.net
 [IPv6:2001:470:1f14:4ab::2])
 by filter.openoffice.nl (Postfix) with ESMTP id F1B3D10027E
 for <wireguard@lists.zx2c4.com>; Tue,  5 Sep 2023 16:04:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=sess.ink; s=filter;
 t=1693922675; bh=BvRc6c+8jfLCE+tFXmqMQ6cbBVPUQcY7SJLH2ctWOuo=;
 h=Date:To:From:Subject:From;
 b=fiF+IAZPlW5tWBIecKiVYxuqVncyfJHke8DqGguHKixp7BiCvh60qH+dz+G0qFvXb
 yq+xRHPuJKDQqFyO34SJxvV+r8dTP4eOynfDwGQPV/yE4/I4jcEOdD4tGVKXIfhpd7
 f2y4tWelT7CvrPyGkSJVlQPs84fBoBJSO1UQ4DM11v4eLrIRoOOXQ/hs6riH7iIdAV
 h6PyvopFSulzhOHiQG0VzkV71yuNvK7wJyGnQx3VNwojJAg4sRo78QI8V/jJFRcnok
 WJMsl3WZHNXetsM8hT7K8EBuDExLgvL+LUmrQ7uB55t0OVct6dr9EjVDZMHduG4NDE
 Os0c0cl+N86mg==
Received: from [IPV6:2a02:a46d:bbe9:0:a139:d73f:a8e:1c85]
 (2a02-a46d-bbe9-0-a139-d73f-a8e-1c85.fixed6.kpn.net
 [IPv6:2a02:a46d:bbe9:0:a139:d73f:a8e:1c85])
 by blub.net (Postfix) with ESMTPSA id B11633001F0
 for <wireguard@lists.zx2c4.com>; Tue,  5 Sep 2023 16:04:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=sess.ink; s=v;
 t=1693922674; bh=BvRc6c+8jfLCE+tFXmqMQ6cbBVPUQcY7SJLH2ctWOuo=;
 h=Date:To:From:Subject:From;
 b=ps8FvMujTKlclYsLZ+Cpvm+Oo/Es33njHuM09QQrxdnRjKEpxuk4gfRQ1sHvGTgSI
 RhQXjGYwYZHuCpdVHWs2YG2RJZTXUzihILBGpV3fwzcGMCrX3N+uxq2w2HsQNAB36A
 N+enoYyzQ7F5rz8Y97/hM88sr33ajnsFDlcBhSOuhURt6xegPi+zPuA+s2t6ZwXzNg
 2oWx3rXlVeZ3HRbQL6xUK+zXx5YrY6EeXiDuV1b34pBqB3ruH1bz5yD/7MOijQSNLg
 aANy4lyr5jbqtlIchs3/IJYTFJGFankAX/ZTLHWUu6E/TBr/MAkSJUysXHoHMgCg2a
 0/TDp/U2xWeGQ==
Message-ID: <63bb2149-2d0b-df64-27f9-6e003dfdc577@openoffice.nl>
Date: Tue, 5 Sep 2023 16:04:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
To: wireguard@lists.zx2c4.com
Content-Language: nl-NL
From: Valentijn Sessink <v@sess.ink>
Subject: AllowedIPs = ::/0 routes IPv4 - on Android?
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Mon, 23 Oct 2023 14:07:27 +0000
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

Hi List,

I have a WG endpoint configured with
AllowedIPs = ::/0
... on an Android phone.

To my surprise, I found out that this also tries to route IPv4 addresses 
to the other WG side.

I was able to change that with a single "bogus" IPv4 address,
"AllowedIPs = ::/0, 192.0.2.99/32"

Is this a known feature? Android 13, WireGuard for Android 
v1.0.20230707, (from AOSP).

Best regards,

Valentijn
