Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0AF7C3DA6E
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 17 Dec 2022 22:08:18 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d8245a0e;
	Sat, 17 Dec 2022 22:03:05 +0000 (UTC)
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [2607:f8b0:4864:20::62a])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id d3bdbb5d
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 16 Dec 2022 02:12:23 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id m4so926854pls.4
 for <wireguard@lists.zx2c4.com>; Thu, 15 Dec 2022 18:12:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=F7hL3LebACMGjolfxzcTXHMNe7782YRTzOiRtweysw8=;
 b=b2LqPnfKaV+qXVtX6CjMxyJE8rUGHiFTateett28mYQoGvDgRVB9RkaInYWuYEbaoj
 7vRVkDpaubcYdhHHaXzc2d/DvvMF9YTaFaKUvqjVPFcEUdmBN6xHMQYxRX4bAgb9Z7kl
 Ji0lU1d7FLUKTOgxZXTno+mWj5OLTdrH0OzCBNJVTU29Hpo+f4/SEs+sir8eXUknZB+Z
 Jyu57aQmRq5r+/2jiXvO1dsY79nQKIRXkH8yu60dnMVMjnhzQ/wC8of87eRXQ6le/n4Y
 L7mai/Uy52YAfYCA9b/NmBHwYnVhTX3xCbL+XGEpwJ8MjY27BRcLcKxso7cN1T9tK8Vf
 BNEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=F7hL3LebACMGjolfxzcTXHMNe7782YRTzOiRtweysw8=;
 b=eIYUKaer3paRvvMH1ZPPzaq+89GWSH01WihQuxTBlEquQ3U6IOpkKNu2bhF0AR9ZUS
 3Mw2HqMSwfXwNeAYFxE20kTHRtZTEhKPZ3YBCtbuP/WifdrR8r1K6lkee/p8LgSVcRnc
 uMHiuXue/Dhd0dsbWMTweUtiKeMn+NnmDQROHCBqvs5IRNXOGr+rJ6SJmeMyng1JgD9V
 tpZxliPpZesggft8p/6CxPklq9c5LrCpHszCZaucgQthLD/L/63HV4Osb1Q/NITIWZxx
 xIWkFRfTqlcAd4w0DNhi5tAYYX4Sc3l0a2WTe6g2fPer0pXFaHo4vk1pDqttguV3Z90k
 j2QA==
X-Gm-Message-State: ANoB5plwJTdBfYvW2OUy5WiTk7apvrEPpG7xt6QfZ0b0uVcyui04Fyr+
 Fr5JdW6MrTCo8pbK4HhyoKr7lJPBRLC3z896pQdVS3upCZ0=
X-Google-Smtp-Source: AA0mqf4GJVbeXhjbY0jiPtcsoGP/mwCuK6frSYKme1uYbFLo/O49ymMpDwG6RKCnGkvGu3qZ35Cf5a5mAtPv1IXVU/o=
X-Received: by 2002:a17:903:2055:b0:189:d3d9:930b with SMTP id
 q21-20020a170903205500b00189d3d9930bmr20346973pla.85.1671156741131; Thu, 15
 Dec 2022 18:12:21 -0800 (PST)
MIME-Version: 1.0
From: Nikolay Martynov <mar.kolya@gmail.com>
Date: Thu, 15 Dec 2022 21:12:09 -0500
Message-ID: <CALGY4fuH9oXpa34nzyj+jc94sS+ZQ5MaJUktFJF2A2-p213vEQ@mail.gmail.com>
Subject: Connection hangs over CGNAT (Starlink)
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Sat, 17 Dec 2022 22:02:59 +0000
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

Hi!

I'm experiencing strange behaviour with wireguard: from time to time
connection 'freezes'.
Most often I'm observing this on an Android phone when connected from
my home over Starlink.
Server: latest Openwrt, Client: latest Android app.
The connection establishes and works fine for some time. After some
time the client still shows connection is established, but no incoming
data is coming.
On a server side 'latest handshake' goes into hours/days.
The freeze happens randomly, for no apparent reason and I think only
over starlink. I do not think I have ever observed this problem on
cell networks.

Reconnection solves the problem immediately.
I did some tcpdumping when the problem was present and found the following:
* Server side sees incoming traffic from the client and sends responses.
* On my own router connected to Starlink (i.e. interface between my
router and Starlink router) I see data going from the client to the
server - but no packets coming back.

So my 'hypothesis' is that somehow Starlink's CGNAT 'forgets' one side
of the connection - and so data continues to go in one direction, but
it doesn't come back. The thing with the wireguard is that it looks
like it doesn't change the outgoing port when it attempts to do
another handshake. This means that it continues using the same 'half
broken' connection forever.

I think the same happens to me at least once on a Linux client - but
the difference with the phone is that the phone is always on and
therefore the duration of the connection is much longer.

I tried experimenting with keepalive messages - but it looks like they
make no difference. Once connection freezes I see keepalived arriving
onto the server, server sending reply - but that reply never arrives
to the client.

It looks like the solution to this problem would be for the client to
use a different outgoing port when sending a handshake but I was not
able to find an option for that.

Is this something that is possible to do?
Thanks!


-- 
Martynov Nikolay.
Email: mar.kolya@gmail.com
