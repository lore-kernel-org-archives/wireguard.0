Return-Path: <SRS0=ArOK=NX=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E48AC4320E
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  1 Sep 2021 13:44:55 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A728760F92
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  1 Sep 2021 13:44:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A728760F92
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6c22a010;
	Wed, 1 Sep 2021 13:44:28 +0000 (UTC)
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 995f399c
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 1 Sep 2021 09:03:33 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id y34so4898507lfa.8
 for <wireguard@lists.zx2c4.com>; Wed, 01 Sep 2021 02:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=cmEK8V+mjzVzSZPtBLM6yI1mnR2TUTNigjLeSk7gUOM=;
 b=COG9Dbii3zSvbrmcCcMijw2P1/+jECwNkDjfjVgJ2xU+TjnM70MP2d1fNhWUUpP+vX
 CHUfPqlh2fLmUYYzc1hQJwx6vxKin5R0iC46M7N5C0Ph/ldYprEpDwnF2BgbeTuxYGzC
 AsO+AxMomlbMqMtakS9YhmoUYhIPHRj4SrA6b+XiLCCGwcqfbhqsztMXYs/4yDDxR33g
 KI/tQ0N15C2m1gfpk+nAJ4UrqThVSRSfkN67PKhnqDxsJnWawXrectS1LlS3ksxCSSqf
 fW4F1SlKRBM6Yrb9ZZBhFQzDmdnFivC34+POY3mqc+D+FRjquMZbLzzvSqanm6FNDXpu
 CbrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=cmEK8V+mjzVzSZPtBLM6yI1mnR2TUTNigjLeSk7gUOM=;
 b=HcyqsgOd7zRjkllrriyNBCG4eRwt5Vzvo86qIYJuMNjQlEigHmmUAmPloM6Bk+vTSf
 PKVOJrkZaEmZkt+OcQSMuV0GsFWhkEJP9RRZo7gvj4ZbdqAWpii+ILSnbVjP1lFPC7Kk
 lT3FKWM2vGs0UuM1ni9o5EeHIEcMeFMgN3J1qy5lrQ06o+opaCd83TW8C025Y5DTpreV
 OVZlIHh4kvvELyZrmkNFQn7QzPJECEt44yxAucu1Lr1mSwiX98WTEdUpW7mBiv0f2age
 LRhNimTBX3UhZ7x1sAlBV3wbbGVy/UjlcPxgCRWujxB2zQg5s1n05G5XyYutDqhEoanq
 NTaA==
X-Gm-Message-State: AOAM5300IKTIqtLugZEd1G+//tInkdqdiIiX4gDIeMNpJ4g3LYXi4TGr
 jDNRGuoQJ38PniXDa5IpxJ84HJCTEFsffXZ0/33/ANWWbV/CKA==
X-Google-Smtp-Source: ABdhPJxEGIXR6H9dbC00VHiGg9UsdU2+s2lY2gP6o6cxGbJoAS9raRKaOsf9SB30rSqCLqXFqmsoI+ZAoPYeYUZj+2E=
X-Received: by 2002:a19:e306:: with SMTP id a6mr24363483lfh.319.1630487012484; 
 Wed, 01 Sep 2021 02:03:32 -0700 (PDT)
MIME-Version: 1.0
References: <CAECraRrhiAZQfZjSc0Auhby0Z+G0jSfNeapgDnfQ6=NT8p7q5Q@mail.gmail.com>
In-Reply-To: <CAECraRrhiAZQfZjSc0Auhby0Z+G0jSfNeapgDnfQ6=NT8p7q5Q@mail.gmail.com>
From: =?UTF-8?B?2K3Yp9mF2K8g2LXYp9io2LE=?= <hsaber@gmail.com>
Date: Wed, 1 Sep 2021 13:33:16 +0430
Message-ID: <CAECraRro-ZQrZbxBkQg=o1bnWmf1V4C65D0jkdkt2rMCCe+6bg@mail.gmail.com>
Subject: =?UTF-8?Q?Unexpected_experience_of_site=2Dto=2Dsite_wireguard_tunn?=
 =?UTF-8?Q?eling=E2=80=8F=E2=80=8F?=
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Wed, 01 Sep 2021 13:44:22 +0000
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

Dear friends,
I have configured 3 wireguard interfaces on 2 servers to act as a
chained VPN for me (to bypass the internet censorship in my country),
with this schema:

client -- wg0 on middle-node -- wg1 on middle node -- wg2 on exit node
(to free internet)

Everything works fine, but after a while, the connection between wg1
and wg2 drops and I can't find the reason. The connection comes back
to action by simply switching the wg1 down and up again using
wg-quick. And the amazing behaviour is that sometimes the connection
comes back to work automatically  after some random time passes,
without any actions from my side (sometimes after a few tens of
minutes, sometimes after a few hours).
When the wg1-wg2 connection is not working, anything else between 2
servers (middle-node and exit-node) works fine. I mean I can ping the
public IP of each server from another part, but the local wireguard ip
of none of them are accessible.

I tried to monitor the situation and read the logs but couldn't find
what is happening here, so please help!

The configuration:
======================

client (my mobile phone):
-------------------------------------------
[Interface]
Address = 10.10.20.2/32
PrivateKey =  <private key of client>
DNS = 10.10.10.1

### Middle Node
[Peer]
PublicKey =  <public key of wg0>
PresharedKey =  <preshared key>
AllowedIPs = 0.0.0.0/0
Endpoint = middle-node:50842
======================

wg0 (in middle-node server):
-------------------------------------------
[Interface]
Address = 10.10.20.1/24
ListenPort = 50842
PrivateKey =  <private key of wg0>

### Client
[Peer]
PublicKey =  <public key of client>
PresharedKey =  <preshared key>
AllowedIPs = 10.10.20.2/32
======================

wg1 (again in middle-node server):
-------------------------------------------
[Interface]
Address = 10.10.10.2/32
PrivateKey =  <private key of wg1>

PostUp = ip route add default dev wg1 table middle
PostUp = ip rule add iif wg0 lookup middle
PostUp = wg set wg1 peer <publickey of wg2 (in exit-node)> allowed-ips 0.0.0.0/0

PreDown = ip route del default dev wg1 table middle
PreDown = ip rule del iif wg0 lookup middle

### Exit Node
[Peer]
PublicKey =  <publickey of wg2 (in exit-node)>
PresharedKey =  <preshared key>
AllowedIPs = 10.10.10.1/32
Endpoint = exit-node:50842
PersistentKeepalive = 25
======================

wg2 (in exit-node server):
-------------------------------------------
[Interface]
Address = 10.10.10.1/24
ListenPort = 50842
PrivateKey =  <private key of wg2>

PostUp   = iptables -A FORWARD -i eth0 -o wg2 -j ACCEPT
PostUp   = iptables -A FORWARD -i wg2 -j ACCEPT
PostUp   = iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE

PostDown = iptables -D FORWARD -i eth0 -o wg2 -j ACCEPT
PostDown = iptables -D FORWARD -i wg2 -j ACCEPT
PostDown = iptables -t nat -D POSTROUTING -o eth0 -j MASQUERADE

### Middle Node
[Peer]
PublicKey =  <publickey of wg1 (in middle-node)>
PresharedKey =  <preshared key>
AllowedIPs = 10.0.0.0/8
======================
======================
======================

Sample log of dmesg when the wg1-wg2 connection is not working:
-------------------------------------------
[Wed Sep  1 11:19:32 2021] wireguard: wg1: Sending keepalive packet to
peer 12 (~exit-node-ip~:50842)
[Wed Sep  1 11:19:44 2021] wireguard: wg0: Sending keepalive packet to
peer 8 (~client-ip~:65323)
[Wed Sep  1 11:19:44 2021] wireguard: wg1: Receiving keepalive packet
from peer 12 (~exit-node-ip~:50842)
[Wed Sep  1 11:20:09 2021] wireguard: wg0: Receiving handshake
initiation from peer 8 (~client-ip~:65323)
[Wed Sep  1 11:20:09 2021] wireguard: wg0: Sending handshake response
to peer 8 (~client-ip~:65323)
[Wed Sep  1 11:20:09 2021] wireguard: wg0: Keypair 2867 destroyed for peer 8
[Wed Sep  1 11:20:09 2021] wireguard: wg0: Keypair 2871 created for peer 8
[Wed Sep  1 11:20:09 2021] wireguard: wg0: Receiving keepalive packet
from peer 8 (~client-ip~:65323)
[Wed Sep  1 11:21:19 2021] wireguard: wg0: Sending keepalive packet to
peer 8 (~client-ip~:65323)
[Wed Sep  1 11:21:24 2021] wireguard: wg1: Retrying handshake with
peer 12 (~exit-node-ip~:50842) because we stopped hearing back after
15 seconds
[Wed Sep  1 11:21:24 2021] wireguard: wg1: Sending handshake
initiation to peer 12 (~exit-node-ip~:50842)
[Wed Sep  1 11:21:30 2021] wireguard: wg1: Handshake for peer 12
(~exit-node-ip~:50842) did not complete after 5 seconds, retrying (try
2)
======================

Sample log of dmesg when the wg1-wg2 connection is coming back using
manual restart:
-------------------------------------------
[Wed Sep  1 11:45:52 2021] wireguard: wg1: Sending handshake
initiation to peer 12 (~exit-node-ip~:50842)
[Wed Sep  1 11:45:52 2021] wireguard: wg0: Sending keepalive packet to
peer 8 (~client-ip~:2335)
[Wed Sep  1 11:45:58 2021] wireguard: wg1: Handshake for peer 12
(~exit-node-ip~:50842) did not complete after 5 seconds, retrying (try
3)
[Wed Sep  1 11:45:58 2021] wireguard: wg1: Sending handshake
initiation to peer 12 (~exit-node-ip~:50842)
[Wed Sep  1 11:45:58 2021] wireguard: wg1: Keypair 2878 destroyed for peer 12
[Wed Sep  1 11:45:58 2021] wireguard: wg1: Peer 12
(~exit-node-ip~:50842) destroyed
[Wed Sep  1 11:45:58 2021] wireguard: wg1: Interface destroyed
[Wed Sep  1 11:45:58 2021] wireguard: wg1: Interface created
[Wed Sep  1 11:45:58 2021] wireguard: wg1: Peer 13 created
[Wed Sep  1 11:45:58 2021] wireguard: wg1: Sending keepalive packet to
peer 13 (~exit-node-ip~:50842)
[Wed Sep  1 11:45:58 2021] wireguard: wg1: Sending handshake
initiation to peer 13 (~exit-node-ip~:50842)
[Wed Sep  1 11:45:58 2021] wireguard: wg1: Receiving handshake
response from peer 13 (~exit-node-ip~:50842)
[Wed Sep  1 11:45:58 2021] wireguard: wg1: Keypair 2881 created for peer 13
[Wed Sep  1 11:46:12 2021] wireguard: wg0: Receiving keepalive packet
from peer 8 (~client-ip~:2335)
[Wed Sep  1 11:46:14 2021] wireguard: wg1: Receiving keepalive packet
from peer 13 (~exit-node-ip~:50842)
[Wed Sep  1 11:46:27 2021] wireguard: wg0: Sending keepalive packet to
peer 8 (~client-ip~:2335)
[Wed Sep  1 11:46:28 2021] wireguard: wg1: Receiving keepalive packet
from peer 13 (~exit-node-ip~:50842)
[Wed Sep  1 11:46:52 2021] wireguard: wg1: Receiving keepalive packet
from peer 13 (~exit-node-ip~:50842)


Thanks in advance for your kind help
