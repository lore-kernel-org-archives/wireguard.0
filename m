Return-Path: <SRS0=1xjk=6I=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0788AC55196
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 24 Apr 2020 20:56:26 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 90BE621556
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 24 Apr 2020 20:56:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=alerinaldi-it.20150623.gappssmtp.com header.i=@alerinaldi-it.20150623.gappssmtp.com header.b="s5aqQrp8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 90BE621556
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=alerinaldi.it
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3dfcd438;
	Fri, 24 Apr 2020 20:37:25 +0000 (UTC)
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [2a00:1450:4864:20::443])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id b3383a14
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 17 Apr 2020 22:45:47 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id d27so4875698wra.1
 for <wireguard@lists.zx2c4.com>; Fri, 17 Apr 2020 15:56:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=alerinaldi-it.20150623.gappssmtp.com; s=20150623;
 h=mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=EPn47IZXaPqVh9ui8ffVEWj+n5vOAQ+1oWtYnyRYwrs=;
 b=s5aqQrp8GpXZ7uC0ja9ojX+9k6zqnmmBHPxuDswpAhBY4pTVT1GlXdzoNbHLstRArD
 TN6tWIjrKJeIznnRwDUazdAz/qbysuw3fJkYWyIUYle5TULMO5qqN25R01WwfctqRLMf
 5JG3cilMMIP70oQERFTwQP9M6vw5YpxsG0Eu1ogaaUrg7wvVZutNNvcZjVCwicdwesRi
 lYPa+eXciUG1Os9n04QDc5gJJI6ilnLtz+m4j34h9h9H34VpGXHJJ9/7y/sM4+PL58rR
 CnmLOwk7NP65LHP1elDyeNHUTYt0F/mj4BQyfVNcXXbjsppTLBwcyAtvshwvutKK95lo
 Zeug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=EPn47IZXaPqVh9ui8ffVEWj+n5vOAQ+1oWtYnyRYwrs=;
 b=gSVebR7HnuquAh58+p+uiM7WKzM65cBWIhBf8kbDfDsmJvcRHbqdaJc6VK5fQ6iFIY
 hjJgwaLznrxnbC+V5RGyRVJeluZZd0lZAL0w8TP+iSkOSgS54hWTCN/Z4qIGzzZxS9cQ
 fzwOzuqlxU6YopOq6GyUW7+LMzPQejG57U4AZPJuXwUvjgBDp/cEadvjPaiU600Bz2uX
 epnEZLF0ivwoO2Zor7D9Dx0QBnj15jKJT7Lc9za5Y4iLnnzytVVE8zFmZpC9TzwM5mOo
 XxoZl8UAwoaq/+/UzcviVjG5V2MJuXyrvSBBmokPz7r4bCBYfLjRTAa7+qKxkpOjyV4p
 eKXg==
X-Gm-Message-State: AGi0Pua506PDGuG4kZrDJRPDCdxM9LFuTTF3D/4B3z3Ti7ru1ArsZGiG
 haObYenjAgW6WWekEXEP4XBWj+J9QG9z7LQQldrctx6HuP9Gew==
X-Google-Smtp-Source: APiQypJ450vXu7c4FLm4fisu74cTgU8ryo3CkiOXM7DnHiMfslry+T62xlH6V3DXHiKL2VM4P00mQyFThhIyCCJ9wR0=
X-Received: by 2002:adf:e552:: with SMTP id z18mr6072901wrm.244.1587164160680; 
 Fri, 17 Apr 2020 15:56:00 -0700 (PDT)
MIME-Version: 1.0
From: Alessandro Rinaldi <ale@alerinaldi.it>
Date: Sat, 18 Apr 2020 00:55:49 +0200
Message-ID: <CAJntV_GNfHPPUQKf=PnFuK3g4J30F+DVy+=9op-=K+u2ihzSHA@mail.gmail.com>
Subject: engarde - small issue with wireguard-windows
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Fri, 24 Apr 2020 22:37:24 +0200
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

I just subscribed to the mailing list so I'll introduce myself: I'm
Alessandro, I'm from Italy and I LOVE WireGuard :)

Last year I was looking for a way to create a reliable network tunnel
over multiple unstable connections. I'm a volunteer in a radio station
and it happens sometimes to broadcast from remote locations where
Internet connections are not good.
What I was looking for was not a failover mechanism, since when
transmitting nearly real-time audio we couldn't afford even the time
for it to detect a problem in the connection and switch to another
one. Audio transmission requires low bandwidth, so we didn't care
about wasting it to have a stable connection.

So I came up with a solution that I called engarde [0]: it basically
takes packets emitted from WireGuard and sends them to the other peer
over all the available network interfaces (like for example, an ADSL
modem over Ethernet, one or two 4G USB dongles, and maybe a WiFi
network). On the other peer, engarde takes all the packets it receives
and sends them to the local UDP port WireGuard is listening on. When
it receives a packet back from WireGuard, it sends them back to all
the destinations it received packets from recently (by default, 30
seconds). Since WireGuard disards duplicated packets by looking at
their timestamps [1], this totally works as a redundant bonding
solution, for both upload and download: as long as at least one
connection is up at any given moment, the tunnel is stable, without
even a minimal interruption.
The behaviour is better described in the project README, along with
some example use cases and configurations.

With the spreading of Covid-19 here in North of Italy, many radio
speakers started transmitting from home, and I know of various radio
stations that used engarde to have a stable audio signal by using, for
example, the speaker's home connection and its smartphone one via USB
tethering.

First of all, I'd love to know what you think about it, or if you have
a better approach than this one: I searched a lot for possible
solutions before coming up with my own one and, even if I'm really
satisfied with it, I'd like to know if there are more "mainstream"
approaches for that.

Also, by testing this, I found a strange issue with the WireGuard
Windows client. For the solution to work, the WireGuard client must
send its packets not directly to the other peer, but to engarde
itself, that will dispatch them through all the interfaces. So, I need
to set "127.0.0.1:54321" as the peer address, where 54321 is the port
engarde is listening on. This works on Linux and Mac, but not on
Windows. When I bring the tunnel up with 127.0.0.1:12345 as peer
address, this is the error I get in logs:
```
2020-04-18 00:45:33.537: [TUN] [Radio] peer(gucn=E2=80=A6uwWE) - Failed to
send handshake initiation write udp4 0.0.0.0:59301->127.0.0.1:12345:
wsasendto: Indirizzo richiesto non valido nel proprio contesto.
```
This seems to be returned directly by the OS, since it's translated:
I'm using Italian Windows, in the English version it's "The requested
address is not valid in its context".
The exact same configuration works like a charm in TunSafe.
Is this an issue that could be solved on the WireGuard side?

Thank you so much for any feedback you'll provide me, both for engarde
itself and for the issue I'm having on Windows.

[0] https://github.com/porech/engarde
[1] https://www.wireguard.com/protocol/ , "DoS Mitigation" section
