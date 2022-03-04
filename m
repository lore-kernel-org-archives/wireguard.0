Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F12D3C433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 14 Mar 2022 17:16:57 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id a895e1eb;
	Mon, 14 Mar 2022 17:11:47 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id aa7b8e49
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 4 Mar 2022 12:03:03 +0000 (UTC)
Received: from [192.168.177.41] ([94.31.101.241]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1M3UlW-1nQec11VdS-000dJK
 for <wireguard@lists.zx2c4.com>; Fri, 04 Mar 2022 13:03:03 +0100
From: "Hendrik Friedel" <hendrik@friedels.name>
To: "WireGuard mailing list" <wireguard@lists.zx2c4.com>
Subject: Wireguard and double NAT
Date: Fri, 04 Mar 2022 12:03:05 +0000
Message-Id: <embc5c04ac-b215-462e-b047-6bf76ae1d6ce@envy>
User-Agent: eM_Client/8.2.1659.0
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:rAG6CAj2LR6GulJObl/3L6MmbcbCJDPqf/51G3GjO240ngyvt4y
 0LzXxNgs4uSxI8R1da4bqrPfkmUIiy8B4wxTYhwJoRfmcbZHnN1cQ/zuSQNjKuccEcM7Ays
 tlCQoOA1aEUqfNWmyugu7Y1BFKeYgBLtrOl9ltlZgpABHIOX7xtroVR5mo3wPkK6DVBceN+
 +dC2bVNATaCNuh3AmKyrQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:lYKvBVa5wP4=:bQ7qGliIKveq1cQ/o5S+c+
 3WCG8uDN1DKNrXucEk0ZubhfZiIA0SkrVHxG8mNuCN5k9p829aAo3y10n7tkAzIaU/ytHJgud
 v+CnU3MiL0ZY/CnnVueozjygJpLqJ8/fyBQQ8d7MngQDMEaO8hGLZrR8G+0s0Wl3ng81ZpHY4
 Y9fdIbhs8RNVwByVF2qs6DwUEM3JqctDRvkIMiMmzHIBbSwMsKZ0XJ2rnaljGk4C0V9JSLbb6
 JBe5G7AX/9iqJWl4Zq4zmV8N8Y1bR/zLB4kxpjQdCatb1jaXvNamUk3hxJMgn2CLunNJGbJKo
 /AbpuQDQ7MBuxtN87qkjK3x8QmgTYEh+ZFSzIIZEI5ndqHBT3+re8V2v7KinXFRfbarf2yYOG
 k859WXtsA5r8oetYfO/RXJbKWsNZgzA5PkOjnwBgLeUrHMHKUrPEjruwoSF/PsWCY+xN1z9Yg
 2NxLKV9USia9bGkxIVt9rC5hs/leZCSscRhdNqs6+mByna0NqHRpnGsvn8jJJXuMHMlcEVRjW
 DmHWpdRyGZ0TU/bF/B/tThYQ4h8Q3OK0mXmG4vBj8qaEA6GMX8YdYnzXa7MJoEU0/PBGIfvZG
 AzwjMwng3MHcjzKadTJRTuFqmfX7+xINPafyCWi2j1/48xMCRyQH/ksMAPeQIdpzZs5+TciY3
 +R0mSHvD2Tk7XudK4K7bn6kpmYbyt7xz7rT/iF9ake5vwtTEmjnPetW9envn30PXqu6lqA72k
 P2ubKt9WEeajxlpf
X-Mailman-Approved-At: Mon, 14 Mar 2022 17:11:40 +0000
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
Reply-To: Hendrik Friedel <hendrik@friedels.name>
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Hello,

I have a running Server serving several Clients with a wireguard tunnel=20
already. For this, port 51820 UDP is porwarded in my router to the=20
Server.

Now, I have one Client with a bit of a tricky setup: I have two Routers=20
doing NAT. For one of those, I have no control, i.e. I cannot setup=20
portforwarding.

Is it still possible, to use Wireguard to create a tunnel between my=20
server and this tricky client? If so, is there anything special, that I=20
need to consider?

Best regards,
Hendrik

