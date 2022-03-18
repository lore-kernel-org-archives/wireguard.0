Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31D1BC433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 21 Mar 2022 19:34:54 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id ad5dbef7;
	Mon, 21 Mar 2022 19:34:53 +0000 (UTC)
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com
 [2607:f8b0:4864:20::b2e])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 7548650a
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 18 Mar 2022 11:19:00 +0000 (UTC)
Received: by mail-yb1-xb2e.google.com with SMTP id v130so15210244ybe.13
 for <wireguard@lists.zx2c4.com>; Fri, 18 Mar 2022 04:19:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=yCep0zNmLr2wPkCEFOKmu4uG9zzf7bJ1a2j0xbM9W4o=;
 b=Pu295bDPw2Bd53HZgBdgsnlMlh86FdSGYcS4Pgz3xnqBN8abXu9h7xNSqNk8jYAGKc
 iAhTU7c74v2Rffb0MInZwHBYofL39w8MxtY1totapKoqR/n7rG2+NbbolnWizl4Q9eXb
 0VxSXT8VjQqMSvoUG/PLWBByHejMMLmE+ZvMRzpqxpJH/BRoF5faONU0otiXriwjUd1r
 D47vZcnoCJuPJnXz8kLD99UjsXqAiSqlAaNRo1QSVsdT5bgY7Ouh34GTfm0D6wlCDm7p
 8FUxORscMDIfJh2WM27w35uvgYmBB93TbAIlN9fa4swsmI9wWEdEYQTvVx0u8wJWPS3h
 6JPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=yCep0zNmLr2wPkCEFOKmu4uG9zzf7bJ1a2j0xbM9W4o=;
 b=5rG6Rq7bHTka3wT0KOjNkNPjlhIgyd23uYfHUyCRbb8XKHMeijFcAl3ze4ua6F/sKA
 5hOQkm+gXx7v4yWP+6Oab/a1ELPROhSuhnOpoHXDGFf3kBdSusUnAJKoOonHn0dYR5S2
 CGryOpymA5Axr4FXOMmiMzG6IqtzBD4d2zsLD5IdX7QybedqDvi7JU5W1xLRz0/udUSA
 jBN3GbQP8stypbbsCpNSbAJiSj9Svm73RsiGr8FXeQ8ZXGdRiS6x9lr5Es5EBYvfevSI
 Y7s+3PfirTdGywK8jR0M0XWvcNf/oL5kTZgT9Z/9SAKDcInjNI5Grdk0V8iRWiI/ijT2
 xf/Q==
X-Gm-Message-State: AOAM530kcLBjS0JcsufZCftlefZWvJaCGDgdevy/j6P9nBFkYN/8YjRu
 KRNw9yHpN2Xmw8tEqT1IUXBfb8h9HcO9SUbMtRiEZwe8M3DcZg==
X-Google-Smtp-Source: ABdhPJyh5FiqXF0LDq0iyx48SB8XI6Pkwf1tSek8t7a2I5gf7S7bs0xdNuFr/guqHH/y5Qllj6EJN/OU8l+U7nBjpy8=
X-Received: by 2002:a25:848c:0:b0:633:a01a:9d9d with SMTP id
 v12-20020a25848c000000b00633a01a9d9dmr7733948ybk.21.1647602339033; Fri, 18
 Mar 2022 04:18:59 -0700 (PDT)
MIME-Version: 1.0
From: Fokin Denis <fokin33@gmail.com>
Date: Fri, 18 Mar 2022 14:18:53 +0300
Message-ID: <CAF=+C5203fZkUFSAaDR=yvAv8dtbAMPmp=q3Mg6-6zfD6yXR7g@mail.gmail.com>
Subject: Too litle timeout for networkwatcher
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
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

Hello!
Timeout for NetworkWatcher is one minute now.
It is too little on some PC
For example about 2 minutes (i use modified version - set timeout to one hour):
2022-03-17 00:22:57.612: [TUN] [client1] Starting WireGuard/0.5.3
(Windows 6.1.7601; amd64)
2022-03-17 00:22:57.612: [TUN] [client1] Watching network interfaces
2022-03-17 00:22:57.612: [TUN] [client1] Resolving DNS names
2022-03-17 00:22:57.612: [TUN] [client1] Creating network adapter
2022-03-17 00:22:57.676: [TUN] [client1] Using existing driver 0.10
2022-03-17 00:22:57.680: [TUN] [client1] Creating adapter
2022-03-17 00:22:58.056: [TUN] [client1] Using WireGuardNT/0.10
2022-03-17 00:22:58.056: [TUN] [client1] Enabling firewall rules
2022-03-17 00:22:58.029: [TUN] [client1] Interface created
2022-03-17 00:22:58.059: [TUN] [client1] Dropping privileges
2022-03-17 00:22:58.060: [TUN] [client1] Setting interface configuration
2022-03-17 00:22:58.060: [TUN] [client1] Peer 1 created
2022-03-17 00:22:58.060: [TUN] [client1] Sending keepalive packet to
peer 1 (167.99.208.250:51820)
2022-03-17 00:22:58.060: [TUN] [client1] Sending handshake initiation
to peer 1 (167.99.208.250:51820)
2022-03-17 00:22:58.060: [TUN] [client1] Interface up
2022-03-17 00:22:58.107: [TUN] [client1] Receiving handshake response
from peer 1 (167.99.208.250:51820)
2022-03-17 00:22:58.107: [TUN] [client1] Keypair 1 created for peer 1
2022-03-17 00:23:19.329: [TUN] [client1] Sending keepalive packet to
peer 1 (167.99.208.250:51820)
2022-03-17 00:23:40.579: [TUN] [client1] Sending keepalive packet to
peer 1 (167.99.208.250:51820)
2022-03-17 00:24:01.830: [TUN] [client1] Sending keepalive packet to
peer 1 (167.99.208.250:51820)
2022-03-17 00:24:23.079: [TUN] [client1] Sending keepalive packet to
peer 1 (167.99.208.250:51820)
2022-03-17 00:24:28.038: [TUN] [client1] Monitoring MTU of default v4 routes
2022-03-17 00:24:28.107: [TUN] [client1] Setting device v4 addresses
2022-03-17 00:24:28.239: [TUN] [client1] Monitoring MTU of default v6 routes
2022-03-17 00:24:28.239: [TUN] [client1] Startup complete
2022-03-17 00:24:28.239: [TUN] [client1] Setting device v6 addresses

Maybe set timeout to 5 minutes or make setting for it ?
Thank you for great VPN!
