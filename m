Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3986C54ED0
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 21 May 2025 16:10:19 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1c292d33;
	Tue, 20 May 2025 19:49:53 +0000 (UTC)
Received: from smtp-relay-internal-1.canonical.com
 (smtp-relay-internal-1.canonical.com [185.125.188.123])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id dcdf4e78
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 23 Dec 2024 19:46:03 +0000 (UTC)
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 0BE713F82B
 for <wireguard@lists.zx2c4.com>; Mon, 23 Dec 2024 19:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1734983162;
 bh=PMlKiln3iwEpneOOTZL0kPrOdyCOuYGPe8vE8NpYPWI=;
 h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type;
 b=Fv1qWeChxOyQp276qN0NYIeUuK8IhwGKlC5xCzJkPRd+KSSe5raSy22JWjdtL9r45
 11zC0fRcHGTyQsMB7OG+h5KHBJTk7K9RPlNBe9CJGIOCK7iXblsfVd/Q3UuLsQpcMj
 wWKz2sopZzy2rx/SlY3sg1yYDoG4d+HsvAVylXjbih7dENHQP6Sr40T/vBfFcc89Aq
 50xCUyMpCJZZgqqmz1F8r0W/RBaXlCIiB+iYd3R9knIGbxC2JAO3uKzoKT/0LPfXTj
 oQ9HKCiFclS0rvLljgFoQJ6Hd5urAfekT5eoKR2Fx7PDp0uddwmECQmBg+ei0ol0/p
 vglrcPa2/f2VQ==
Received: by mail-yb1-f199.google.com with SMTP id
 3f1490d57ef6-e3886f4cee2so6853998276.0
 for <wireguard@lists.zx2c4.com>; Mon, 23 Dec 2024 11:46:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734983160; x=1735587960;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PMlKiln3iwEpneOOTZL0kPrOdyCOuYGPe8vE8NpYPWI=;
 b=cuXp7Vvi1UyoPTiAFEDheXnHkSzRq0+Aim/kkeFy74FYNa/53ypK/mtiWeP4MNMvSU
 GciRJ2vPF3cChkOGIvTay0hW8M4bGrCEF8BeHYnw5qF5KKr5/N1hTuwlnmHBtQ90Rs0p
 EvWXEN4fN+us3Lzx337Vwmy4AbgJG9Jzng8OkEc+r2mvFNbbjs+1MowQqndQ2JSSVgOr
 p3nzzmZM6g8XxXjtqLhW+c3elpqBkUh+vBwGbZTwoieZrqoXNFXaD4CP12359WKyHeyq
 dxFkkm/gWfXoxoMMP51hMIOuOKaNzRWAZpwnhulVau22F7siNrhP2BCklL8EdNkNCLTc
 YRiQ==
X-Gm-Message-State: AOJu0YzIApNDyP6AaE7HiKx0OAgJkuKBT7s2XrcjaZFKria8FupUjZVb
 Cchts60bhvLZX55Wr6MTWoSELnK7BQ8Gmna/JANMpTwJAwcYYhrz2FP1AQEZP6ar3aDXUITGb+o
 0ysaPKZVop5tkIj506ia2q1xRhUJvQTluLFHrHLba5zMdNnPQmOQpecOnZ3gFjV1151skq08aHc
 RI5R4Wctkshmd9/1ZIelVTIHHipyYVKMEGlTqoM6z2RuNOFtKzkOwXnwIAl/U=
X-Gm-Gg: ASbGnctrPYEgGbvsZYfZLAQAfdjLpjKfsykIZRfmhqvkY9GpPehIZBat4z+wWjTcxcu
 U21nsTKZo/YN1tN9fBwfk8sLUYuVvXYDkBeUH0UE=
X-Received: by 2002:a05:690c:3687:b0:6f0:301:5fea with SMTP id
 00721157ae682-6f3e2ac4f92mr132273517b3.12.1734983160654; 
 Mon, 23 Dec 2024 11:46:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHRqWJHdMWPALLSHqsnDvlehw+ePhS5NkGOqTeCzt6IhZ8I4UA7gI/8J6DQtEiwE9HgrS4atAHwEemerpI4+GM=
X-Received: by 2002:a05:690c:3687:b0:6f0:301:5fea with SMTP id
 00721157ae682-6f3e2ac4f92mr132273377b3.12.1734983160391; Mon, 23 Dec 2024
 11:46:00 -0800 (PST)
MIME-Version: 1.0
From: Andreas Hasenack <andreas.hasenack@canonical.com>
Date: Mon, 23 Dec 2024 16:45:12 -0300
Message-ID: <CANYNYEHOiXF1NC2WQY8-CSoQatMgqszk4SXW4XosjQceKXUh_Q@mail.gmail.com>
Subject: Trying to route only IRC traffic through wireguard interface
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Tue, 20 May 2025 19:45:56 +0000
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

I'm traveling, and this ISP that I'm using "on the road" decided to
block port 6697/tcp. I thought about using my existing wireguard VPN
to also route this traffic through it.

The problem is that there isn't just one ip to pick to add to
AllowedIPs, it's several, and they change according to what DNS is
resolving at that particular time.

So I thought to use policy routing. Something like:

iptables -t mangle -A OUTPUT -p tcp --dport 6697 -j MARK --set-mark 1
echo "100 wireguard" > /etc/iproute2/rt_tables.d/wireguard.conf
ip rule add fwmark 1 table wireguard
ip route add default via 10.10.12.1 dev wg0 table wireguard source 10.10.12.11

tcpdump shows this working on the local box, i.e., I see an outbound
connection to the IRC server on the wireguard interface, but it never
arrives anywyere. tcpdump on the other side of the wireguard tunnel
shows zero traffic. I suspect wireguard locally is blocking it,
because that IP is not in AllowedIPs, but I can't confirm because this
box has secure boot and I can't enable debugfs to check the wireguard
messages.

If that's the case, is the only solution to really add all IPs of this
IRC server to AllowedIPs, dynamically even perhaps? I know I could
just route everything through wireguard, but now my interest is spiked
by this particular case, and I wanted to be able to use policy
routing.
