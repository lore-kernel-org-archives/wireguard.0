Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B54A0CCA473
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 27 Jun 2022 11:02:25 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 85a5c737;
	Mon, 27 Jun 2022 11:01:09 +0000 (UTC)
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com
 [2607:f8b0:4864:20::52c])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 010974d2
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 21 Jun 2022 14:20:23 +0000 (UTC)
Received: by mail-pg1-x52c.google.com with SMTP id l4so13237292pgh.13
 for <wireguard@lists.zx2c4.com>; Tue, 21 Jun 2022 07:20:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=AlvKSp7ft4ue0MTXWK9r0s0GcmqlhgzlBc3qlFtldEI=;
 b=LEcSxnc8jwJr7ON7lpAaCeUFiRorkodzcRA1Jqs3GwTQ6iORUD/gYdyzUdtufjq5ZK
 4KDwyiHf1gJgMHNX/Eed14Pf2oHyhR5g+zFEsd+wYmCJGOlaWCfh7h1HyN17pAqiu77n
 o5vgWPY758lT4QP0vCFR1iKZRbavlCfPtixO9FJ/oTlioWTurksH6xIv/OU78geqVkT3
 Z6ahzfKHCl0bTrt3goH0PNzg/ozJKJt4jlG9pDfy58gwxaKoaCBCfTyjr6puQW9KqVLR
 zR0KJlMmDVuIenY9yi4PQaOYrUPrH5u14Wn6u51rg6N0BCkSUZmefnWJ0yk3AvPIBKFx
 lOVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=AlvKSp7ft4ue0MTXWK9r0s0GcmqlhgzlBc3qlFtldEI=;
 b=S1jsgnAv1TjWLx/UDiEkmziXhhxw3514Tc/5zUWFLyHxFOR8EP0q4f9IrTGcsO1jCK
 bMlvZoQk3S/RKC6e58nhkPK4Yi0Ef16+faWJl4qvhGTVO9h097EgSAXLmaplXtvRDdZ5
 dqnWuwg3TInQC0SMdr+cruwYv3y2lnOumLl3RBT0m1PWXQUzPqwVFZxWjpr2UHN81zZ2
 MFA2NJO0Q8pwytRxxjqAsUQCGZcv055Kl5AG+PB3L+YOBWq4ztOM9+row0W6DN+XOtOb
 i6lsvw2WKYr3nuWdz3+dbwyTICBFQwgApKPfF4yt6fUJFAtPwjeWF7/f7216luQYYZci
 QRuA==
X-Gm-Message-State: AJIora/6QjpQwMXs7E6Yv/55zzorQiCIBj4ZXHDLwtMHr6UPdSuS9Xzk
 0njKo6E4gXpFHVfFORuVLC6v6qfOh+7+XcqZJ0jnTiWai5tHvmhX
X-Google-Smtp-Source: AGRyM1vpn5JEehX8+C77JoDsAI9V7bfgy+UTF9e+Ky/ElLi2Ct4LnEPfUfkYTO1RU5hEQHKNeIh3OqvDg9KxApfUtPo=
X-Received: by 2002:a63:3c58:0:b0:40c:83b6:1a4e with SMTP id
 i24-20020a633c58000000b0040c83b61a4emr15413163pgn.194.1655821220869; Tue, 21
 Jun 2022 07:20:20 -0700 (PDT)
MIME-Version: 1.0
From: Pavel Yegorov <yegorov.p@gmail.com>
Date: Tue, 21 Jun 2022 17:20:09 +0300
Message-ID: <CADuzeTx8_ODe2gF_hN6nhVFh5j+pEYXZB6fpVcC23pD2LLwCsw@mail.gmail.com>
Subject: Wireguard is loosing connection for no reason
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Mon, 27 Jun 2022 11:01:06 +0000
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

Hey folks!

I really need some advice, cause I just don't know how to deal with my problem.

So, I have a WG "server" on ubuntu 18.04.6 LTS, hosted in the oracle
free tier. I've installed wireguard using well-known
https://github.com/angristan/wireguard-install script. Then I've
generated several configs for my desktops, phones, etc. It connects
and runs perfectly, but sometimes it just freezes for no reason.
There's no connectivity issues or something like that. Logs on client
side says something like that:

2022-06-21 03:01:01.845: [TUN] [win] Keypair 17 created for peer 1
2022-06-21 03:01:01.846: [TUN] [win] Sending keepalive packet to peer
1 (SERVER_IP:SERVER_PORT)
2022-06-21 03:03:01.822: [TUN] [win] Sending handshake initiation to
peer 1 (SERVER_IP:SERVER_PORT)
2022-06-21 03:03:01.884: [TUN] [win] Receiving handshake response from
peer 1 (SERVER_IP:SERVER_PORT)
2022-06-21 03:03:01.884: [TUN] [win] Keypair 16 destroyed for peer 1
2022-06-21 03:03:01.884: [TUN] [win] Keypair 18 created for peer 1
2022-06-21 03:03:01.884: [TUN] [win] Sending keepalive packet to peer
1 (SERVER_IP:SERVER_PORT)
2022-06-21 03:05:02.058: [TUN] [win] Sending handshake initiation to
peer 1 (SERVER_IP:SERVER_PORT)
2022-06-21 03:05:02.106: [TUN] [win] Receiving handshake response from
peer 1 (SERVER_IP:SERVER_PORT)
2022-06-21 03:05:02.106: [TUN] [win] Keypair 17 destroyed for peer 1
2022-06-21 03:05:02.106: [TUN] [win] Keypair 19 created for peer 1
2022-06-21 03:05:02.106: [TUN] [win] Sending keepalive packet to peer
1 (SERVER_IP:SERVER_PORT)
2022-06-21 03:06:21.302: [TUN] [win] Retrying handshake with peer 1
(SERVER_IP:SERVER_PORT) because we stopped hearing back after 15
seconds
2022-06-21 03:06:21.302: [TUN] [win] Sending handshake initiation to
peer 1 (SERVER_IP:SERVER_PORT)
2022-06-21 03:06:26.423: [TUN] [win] Handshake for peer 1
(SERVER_IP:SERVER_PORT) did not complete after 5 seconds, retrying
(try 2)
2022-06-21 03:06:26.423: [TUN] [win] Sending handshake initiation to
peer 1 (SERVER_IP:SERVER_PORT)
2022-06-21 03:06:31.471: [TUN] [win] Handshake for peer 1
(SERVER_IP:SERVER_PORT) did not complete after 5 seconds, retrying
(try 3)
2022-06-21 03:06:31.473: [TUN] [win] Sending handshake initiation to
peer 1 (SERVER_IP:SERVER_PORT)
2022-06-21 03:06:36.517: [TUN] [win] Handshake for peer 1
(SERVER_IP:SERVER_PORT) did not complete after 5 seconds, retrying
(try 4)

If I reconnect WG client, it immediately connects and everything is ok.

Any advices? I tried to experiment with PersistentKeepAlive param (on
both sides!) that doesn't change anything.

My server cfg:

[Interface]
Address = 10.66.66.1/24,fd42:42:42::1/64
ListenPort = SERVER_PORT
PrivateKey = M?????Uyg4r3mo=

PostUp = iptables -I FORWARD -i ens3 -o wg0 -j ACCEPT; iptables -I
FORWARD -i wg0 -j ACCEPT; iptables -t nat -A POSTROUTING -o ens3 -j
MASQUERADE; ip6tables -A FORWARD -i wg0 -j ACCEPT; ip6tables -t nat -A
POSTROUTING -o ens3 -j MASQUERADE; sudo iptables -I INPUT -i ens3 -p
udp --dport SERVER_PORT -m state --state NEW,ESTABLISHED -j ACCEPT
PostDown = iptables -D FORWARD -i ens3 -o wg0 -j ACCEPT; iptables -D
FORWARD -i wg0 -j ACCEPT; iptables -t nat -D POSTROUTING -o ens3 -j
MASQUERADE; ip6tables -D FORWARD -i wg0 -j ACCEPT; ip6tables -t nat -D
POSTROUTING -o ens3 -j MASQUERADE; sudo iptables -D INPUT -i ens3 -p
udp --dport SERVER_PORT -m state --state NEW,ESTABLISHED -j ACCEPT

### Client iphone
[Peer]
PublicKey = 0+V???????4HnM=
PresharedKey = s???????amJCxJyqcE=
AllowedIPs = 10.66.66.2/32,fd42:42:42::2/128

### Client mac
[Peer]
PublicKey = Tet4??????mI=
PresharedKey = Ld???r8=
AllowedIPs = 10.66.66.3/32,fd42:42:42::3/128

My client cfg

[Interface]
PrivateKey = 4Bp????=
Address = 10.66.66.2/32,fd42:42:42::2/128
DNS = 8.8.8.8,1.1.1.1

[Peer]
PublicKey = 5R?????c=
PresharedKey = sY????E=
Endpoint = SERVER_IP:SERVER_PORT
AllowedIPs = 0.0.0.0/0,::/0

some stats

root@oraclevpn:~# wg show all
interface: wg0
  public key: 5R?????c=
  private key: (hidden)
  listening port: SERVER_PORT

peer: 0+?????nM=
  preshared key: (hidden)
  endpoint: 666.666.666.666:11111
  allowed ips: 10.66.66.2/32, fd42:42:42::2/128
  latest handshake: 2 minutes, 2 seconds ago
  transfer: 533.52 MiB received, 5.18 GiB sent


-- 
Pavel Yegorov
