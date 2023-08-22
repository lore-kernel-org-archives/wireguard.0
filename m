Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9881EEE49A5
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 22 Aug 2023 20:39:40 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 51401e0f;
	Tue, 22 Aug 2023 20:39:38 +0000 (UTC)
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [2a00:1450:4864:20::236])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 64928a04
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 22 Aug 2023 20:39:36 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2b962c226ceso76884151fa.3
 for <wireguard@lists.zx2c4.com>; Tue, 22 Aug 2023 13:39:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692736775; x=1693341575;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=4h8P0LUOqLBgi0S8c4NN0qaEyXk9NKVhNWbXoi9VnJY=;
 b=oGzBpZBf08wHnKoi9ZVLulsoh8rbbsRFT+xzHaJj57tFH/cYA9lmydgTlzD0C4yYi5
 sJpURWv8LA1xNEtD3Kg0QFXPgV1ZkXLjuqjz9y2ndj1pChM0s3M01Q/35+1UIHnWoe+N
 mlDK3Stz6qQS6uSBBs1GH524V+jZ4JDxdvAblHwJoqfKHnzevK0nfEw+PNg368XnuU8K
 v0Vr5ZbeQqjmWRX/b0mzVOO7Bwk4Q+DrRUX7XGGTyhXTieM9qGtqZDwSWn7GvmgNLuNp
 rufB9cL9UKxcjQ8/SIo7kjCWtceiryCvpBflYkaEgLwJiRbb+lWjloTgK18owow9iXN2
 MnaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692736776; x=1693341576;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4h8P0LUOqLBgi0S8c4NN0qaEyXk9NKVhNWbXoi9VnJY=;
 b=c/IZQywLAvngx47qQKKLzWliP4jbVWZQZPBbfUn22s5wQnNMc1tK0z2hXpL7vwm5G/
 QdbqNguA6cjnSwlV6oGqisnFRa00Rs4pJSdCFCsSpJz+5n/Q+pCgqp7ICv8bSUydGwyU
 AfK2x2gFq8ULOBl/IZ2pl/lrOdtkhZA+EXUafkuveVPA4cEdYNEZpz3KOTg6K3FY+82O
 MYcmU3CYBqbIwTV6IASbO5RFtlTSwCTmEZaxLuUwX+2deB23uQ3EINHxFa6bMBKIwy7a
 i0m0LGH0RSYQCe8dxZ+8bhxnMpYGfxfVPAK2sV5wlPL7niv55tb32D2SBqWCNNoQuXW2
 mRNQ==
X-Gm-Message-State: AOJu0YxTHBS6acdtqWPrdh7zXRDmM7X2GDqupTlC/U3NUmA180ki+o3W
 8zJcs0rsGZ4rEUZAP/OxbxOputN0AVFR3Y2oIgI8ov7L03YPNA==
X-Google-Smtp-Source: AGHT+IG/C6Czs7nq/kllK7fPdGy5Mn3n0YyWL0VmcSUWJUWQYc6UvYcsX65+HOCdP915aid6sGe2twfiOxwmAutwxzc=
X-Received: by 2002:a2e:9c51:0:b0:2bc:d8cb:59fe with SMTP id
 t17-20020a2e9c51000000b002bcd8cb59femr635827ljj.8.1692736774697; Tue, 22 Aug
 2023 13:39:34 -0700 (PDT)
MIME-Version: 1.0
From: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Date: Tue, 22 Aug 2023 17:39:23 -0300
Message-ID: <CAJq09z6Dz3idziDgB-3-VOVa=YEWk6ZOrLOwLTBctRb5VkLMLA@mail.gmail.com>
Subject: IPv6 and PPPoE with MSSFIX
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
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

We noticed an issue with clients that use PPPoE and connect to WG
using IPv6. Both sides start to fragment the encrypted packet leading
to a severe degradation in performance. We reduced the wireguard MTU
from the default 1420 to 1400 and the issue was solved. However, I
wonder if it could be fixed with MSSFIX (in my case, nftables
equivalent).

The server does know that the remote address has a smaller MTU as it
fragments the packet accordingly when any VPN peer sends some traffic.
The traffic inside the VPN does adjust the TCP MSS to fit into vpn
interface MTU (1420 by default, now 1400).

I could dynamically add firewall rules to clamp MSS per authorized_ips
but, theoretically, the kernel has all the info to do that
automatically. I wonder if MSSFIX could detect the best MTU for a
specific address through the wireguard. It should consider the
peer-to-peer PMTU, the IP protocol wireguard is using and the normal
wireguard headers.

Regards,

---
     Luiz Angelo Daros de Luca
            luizluca@gmail.com
