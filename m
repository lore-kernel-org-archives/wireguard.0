Return-Path: <SRS0=pvJ2=KM=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05971C43461
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 17 May 2021 15:21:57 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 190CD610CB
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 17 May 2021 15:21:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 190CD610CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9363be08;
	Mon, 17 May 2021 15:21:54 +0000 (UTC)
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com
 [2607:f8b0:4864:20::b2e])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id d6038971
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 15 May 2021 17:37:29 +0000 (UTC)
Received: by mail-yb1-xb2e.google.com with SMTP id e190so3099107ybb.10
 for <wireguard@lists.zx2c4.com>; Sat, 15 May 2021 10:37:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=svSEnE+f84KIPgTXskpETN0rKvJ4eY2nul2qGBYVDck=;
 b=kLSil8p9mgorP6ifHzQpwYNB5y2tdXGXuUyMFkEghBSjX9E6WfPu/aDJGzdQ0QjkXF
 O3e9endy1lfpOM8ShbjPaW0rA85r4YxzBoNE/m4DPTJOYOIqZNoxC1UhmYxBGJN20c67
 c3xJzi6+/8QTtb67bP3RsmIO2bV3wqeAdMN9SYQ6M+Cwo5Yz9EBQOzObHwmzj2lIN7WG
 Y1V1ovK/5xCMeNybtwAG0I+9bDANe9j+paEzxuL9SEcdGNWEmVJ0QFOTsXq+1mrCQVxv
 LOUHUi6uWNkNlUYfAl35ZV2egfDHm1ib+m/uWnC0rHmKTYi4bJxmhyjs8YM7JN4P1UgR
 f0cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=svSEnE+f84KIPgTXskpETN0rKvJ4eY2nul2qGBYVDck=;
 b=P0xMtEpUN63sohioLLpeGl2Kq4rCPSKsEeKG02iVm8pf/GE/NyIbmnRK9KFGvuNv5V
 OrpKWE8erbXhM77WvIzfnNViKVRO9tgxC4FgYWU9qPAGe1XxY3cyKHCLX4zjfuYa2q/T
 XjHAQ0fTxr+g/3TOwjFJzOMxjeCWxWJzUkgOTyuDtazQMIRP7bOeZZpmamc5GI4wXyIB
 v7eGUPOzxavtSMiBveITDZ7a9kODGZvGfU6M+KG6G1RVMSwMw9sv3pAhC0UiJClaFAZ0
 jAnduH5Dk47LhiBM+95bt1qsjZcSYRmOeZKQH1nFtd0wmNfu2Qr6Kh5qGMSHa8HG2HB2
 rSSg==
X-Gm-Message-State: AOAM533i0CNAjBJN24NyBULMcLVpiO27L3UY12p1gZ3NtfbE0t21+N4B
 +sVxVduwaNk1QeXVKCq36Ye5i/68HKu3gJltOEM5sTcN0uU=
X-Google-Smtp-Source: ABdhPJwxP31ZkobI3hc39/iHBaStT+I8QZ161Wvh63K7TJz/wi3i59ypR7c7F5bWv1oCE0Yi3bXIfbt7q75pZPrrIZQ=
X-Received: by 2002:a25:a147:: with SMTP id z65mr72357224ybh.104.1621100248032; 
 Sat, 15 May 2021 10:37:28 -0700 (PDT)
MIME-Version: 1.0
From: Michael Wu <michael.apply@gmail.com>
Date: Sun, 16 May 2021 01:36:33 +0800
Message-ID: <CAOYRf2F9q-yWwUjoSe01pO1TaeGcF5vGqt8unmowoRJ3iCTP6w@mail.gmail.com>
Subject: Bug report: Policy routed packets are dropped by wireguard
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Mon, 17 May 2021 15:21:51 +0000
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

Hello,

I'd like to confirm that the following problem seemed to be a bug, and
not configuration error:
https://lists.zx2c4.com/pipermail/wireguard/2019-September/004545.html
(Content dupated at the end of this email for easier reference)

On system 1 (kernel 4.15), everything worked as expected. However, on
system 2 (kernel 5.4), the issue described above is observed.

Regards,
Michael


[System 1]:
Ubuntu 18.04.5 LTS
4.15.0-128-generic #131-Ubuntu SMP Wed Dec 9 06:57:35 UTC 2020 x86_64
x86_64 x86_64 GNU/Linux

[System 2]:
Ubuntu 20.04.2 LTS
5.4.0-73-generic #82-Ubuntu SMP Wed Apr 14 17:39:42 UTC 2021 x86_64
x86_64 x86_64 GNU/Linux

[Policy routed packets are dropped by wireguard]
Original mail: https://lists.zx2c4.com/pipermail/wireguard/2019-September/004545.html

Hello!

I'm looking for technical advice.
Currently I'm trying to pass marked sessions through wireguard VPN network.

Marking is done by cgroups classid matching:
> iptables -A OUTPUT -m cgroup --cgroup 3735928559 -j MARK --set-xmark 0x1c3/0xffffffff

The only route in the `vpn` table is default routing through wg0:
> ip route add default dev wg0 table vpn

Routing rule is pretty simple:
> ip rule add fwmark 451 table vpn

Now I pass some packets on the interface:
> cgexec -g net_cls:vpn ping 10.0.1.1

I see packets reaching interface but dropped in the driver:
> tcpdump -i wg0 host 10.0.1.1
> ...
> 6 packets dropped by interface

Value in 4th column (TX drop) is increasing in the `/proc/net/dev` for wg0.

If I add route to default routing table and do ping without assigning
cgroup to the process then all is perfectly fine.
> ip route add 10.0.1.0/24 dev wg0

> ping 10.0.1.1
> PING 10.0.1.1 (10.0.1.1) 56(84) bytes of data.
> 64 bytes from 10.0.1.1: icmp_seq=1 ttl=64 time=46.1 ms

Is it some kind of a bug of misconfiguration?

> uname -r
> 5.2.1-gentoo

Installed Gentoo package atom.
> =net-vpn/wireguard-0.0.20190913

Thanks for any help!
