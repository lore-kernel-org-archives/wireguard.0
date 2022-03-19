Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73F0FC433FE
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 21 Mar 2022 19:44:06 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id b2019f4f;
	Mon, 21 Mar 2022 19:34:57 +0000 (UTC)
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [2607:f8b0:4864:20::62b])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 784d0e0b
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 19 Mar 2022 18:34:43 +0000 (UTC)
Received: by mail-pl1-x62b.google.com with SMTP id n2so9535124plf.4
 for <wireguard@lists.zx2c4.com>; Sat, 19 Mar 2022 11:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=btW/zswqakIaUZDJg3zkcKkM0ugrpLti1bBHSi70g3s=;
 b=jnHUK33Zz5cq13lc+QIvgTTqD4zvVMIjmucE2VIffRv7a2bEUgS9ozKJcL6lV/tvmO
 TkTosWBFVjOiYsWho4jjkr4MJeLk2g55AbVmekDiPJjpTmu8CP2OgXUE53hACwMNdVvW
 HXohN3YVp/ChyASLaGIglrfHQ4Z0gy75QL2Vr5JjmtDAY3j4uVPByXXezRqyzCF7MmOG
 NNuvc9SC+p+Ryb2i5qOeksPWuuf+QhHAHKkt99aSdpRzTdb1+IgDs8d+H/mQA0pU527u
 7lrI/0gogzxuoQ7PStUHc5zGFvaiXrWRPlD06I7OfHxmdrCFJz0stvYbz8sw6VGavik4
 N46g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=btW/zswqakIaUZDJg3zkcKkM0ugrpLti1bBHSi70g3s=;
 b=2WcsShr0LBTw/7Y9KMB+OUVLTO43AegX4N13h3G2Q2kSOHbJOjrQExQpWGZ4abVRXd
 yfN9VqomfOqaJMr2skIhp7bkkAVER8zg+eY0UNC25teR46K9lBTx56++nAS07KeBfw5q
 EDp1W841xpG4SnSGIZbYo6usl+zf80Nfbxu0jhNd6emE2xTQ0Jxb5J1Ok1nm7y8OwGQ8
 v+EGWyhYfn1u5slEbJYWziOnZU3wiN6YQCKbuW+ONOWhye7EtrWTC2QEJqyFkZK2OVXn
 zPEHUpJ+c3Mc0mAqMGFrKm+elVbPw9A6FTwgpRumda80259NwWqWTo/9gQDc/ZskS6Si
 KHFw==
X-Gm-Message-State: AOAM533cqhvSSj2QSGAxTJ+XUZUa09vqbgkL7YYxQRB/6HxMvn5FG/xJ
 z+ygxkijZM2jcoHIdeuntutBU8vNQ3Ni/D+G7GUzlQ/2izE=
X-Google-Smtp-Source: ABdhPJyG6lHxlYi3X7dONm86hYs4ctOBbnERU6kaKhmMp2HNHEqn71KxM//4/cQ2+NPce3yWWMYQmgKvXKIEo4+/e58=
X-Received: by 2002:a17:90a:ba10:b0:1bf:6900:2c5d with SMTP id
 s16-20020a17090aba1000b001bf69002c5dmr28498522pjr.36.1647714880942; Sat, 19
 Mar 2022 11:34:40 -0700 (PDT)
MIME-Version: 1.0
From: Ryan Govostes <rgovostes@gmail.com>
Date: Sat, 19 Mar 2022 14:34:30 -0400
Message-ID: <CAMtyXZYQ6_Y9Tfa+3dHgXS1yWfV7xBpYBK7tO8_yegLJgxKGoQ@mail.gmail.com>
Subject: macOS: WireGuard traffic sent over wrong interface
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Mon, 21 Mar 2022 19:34:47 +0000
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

I wasn't able to find a bug tracker so apologies if this is a known issue.

I=E2=80=99m running macOS 12.3 with WireGuard 1.0.15 from the App Store.

My WireGuard peer is on my corporate network, to which I am first
connecting via Palo Alto Networks GlobalProtect.

If I use `route get <peer IP>` then macOS reports that it will send
traffic to the peer via the GlobalProtect tunnel interface. And I can
confirm this by sending UDP traffic from macOS to the peer server and
monitoring it going over that interface using Wireshark.

However, when I then turn on the WireGuard tunnel, it sends its
traffic over en0, my Wi-Fi interface, over which the peer is not
reachable.

As a workaround, I can have my endpoint configured as localhost and
use socat to redirect traffic over the correct interface:

socat -T 3600 udp-listen:51820,reuseaddr,fork udp:<peer>:51820

Ryan
