Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 442C4C63797
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 12 Jan 2023 00:40:32 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e20224b9;
	Thu, 12 Jan 2023 00:36:43 +0000 (UTC)
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com
 [2607:f8b0:4864:20::835])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id f93dfef9
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 11 Jan 2023 11:57:38 +0000 (UTC)
Received: by mail-qt1-x835.google.com with SMTP id j15so8029436qtv.4
 for <wireguard@lists.zx2c4.com>; Wed, 11 Jan 2023 03:57:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=instasafe.com; s=google;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=2hZbHsWmX29qwK3SVqja8/n6V5o0tcFCPTJX+a0ku64=;
 b=i0gl0A/8UpohMNAzu6rv3/iGx/iyU8shyhcEuizemib1I828cRdNSY+xsHWTidI3w6
 NQRsmqL7GpSUNmRVmCAzNCpL4apmC5FnycbU2XZ5PaZ/LzWJqDGnif3blwJMCDNo6a+u
 bJ1bHFg8Eif6NJSLs34qx9Rz+JRfuXcynDgQHaGqwE2eLhKp3eiYrNL8VVf+2SaT+cGp
 fC0OopKO2YtyhG+Eqzgs0EJqMWB9NX5kXjoN7b2NFcIEY60oIpR7pmAwECsUKG7nJgzP
 R7F8Hs9vQjJrjzvtPHv1W4p5mB3pu7OUyP5ELWV8h4N+YBbiXALdPEH7NSFPpN1WOWN4
 5UcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2hZbHsWmX29qwK3SVqja8/n6V5o0tcFCPTJX+a0ku64=;
 b=bUEneAoAeYeBZzrDMYLfPIrtZHLBiO8EzmyWfKo+b1C8ScQVWlUO/xtGeTh0ub71sO
 8ZJ26NuzN7QVWFAcx67oL0sa44LkXIUIef8yhRMlnYrEGkRAN3N1q/wuHSGaVyLmkn7k
 D9CnCHvQucYi8CAysCUDcmruriE4TjvuQEbuaixr/9C+s764an+s2kbym9EMdHfAcrfy
 lnyRvxbSoOpGGrwiTwdwLmZiEwB4jFWQ3dC/yGFk9/Pu5hTvNbC2GvV7cO1fsl86j2gi
 XN2aty1DlGRLnOUJxDIr/kgAKSVe82hmJYcsRrSnUjdIp+eJaRisS386pCWmkUVHYlVZ
 nChg==
X-Gm-Message-State: AFqh2kpQk+2kJHNY8RyTXlFUdCG7DXwLorjWGBUIDE5LtZ1cQ4Xy+bQh
 aB1PpujfFyuXTeI5u5gAyN+a5ZZITJPV5C33ATJvzFUkPOuNIYM6
X-Google-Smtp-Source: AMrXdXs89MjeBgk/vq9HbwkQ1/FUob4M+QCfKHw3Jsjb/gDfm1T6fRVFn8A0TkPdYyHY+tLGaVBSWw+LiMQc18v3W44=
X-Received: by 2002:a05:622a:408f:b0:3a9:79e0:270c with SMTP id
 cg15-20020a05622a408f00b003a979e0270cmr3269366qtb.44.1673438257249; Wed, 11
 Jan 2023 03:57:37 -0800 (PST)
MIME-Version: 1.0
From: Venkatakrishna S <venkata@instasafe.com>
Date: Wed, 11 Jan 2023 17:27:27 +0530
Message-ID: <CAFVpa6c6SfxuvYydyazutBuCYWMf19q+YvDBfrKJ0ugRjMkRTg@mail.gmail.com>
Subject: Wireguard Handshake failures
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Thu, 12 Jan 2023 00:36:34 +0000
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

I came across a weird problem when I connect and disconnect
continuously. The handshakes are failing and the wireguard(server) is
generating and destroying key pairs continuously for the client. I
have added the wireguard logs ,client and server configuration below.
Checked the iptable input rules for the client , those are correct.
But the wireguard traffic is blocked. Tried with persistent-keepalive
enabled and disabled. The same conf below works if I do not connect
and disconnect continuously within a short span of time. It starts
working after I stop the wireguard on my client and remove the peer on
the server. Need help as I'm unable to figure out the root cause.
Thanks in advance!

Server conf :
# interface_server start Created by wrapper @ 2022-12-28
17:02:22.645524175 +0000 UTC
[Interface]
Address = 10.0.0.48/26
ListenPort = 443
PrivateKey = <privateKey>
PostUp = sysctl -w net.ipv4.ip_forward=1; iptables -t nat -A
POSTROUTING -o eth0 -j MASQUERADE;
PostDown = iptables -t nat -D POSTROUTING -o eth0 -j MASQUERADE;
SaveConfig = false
# interface_server end


Client conf :

 PrivateKey = <privatekey>
 Address = 10.0.0.41/32
 DNS = 8.8.8.8, 8.8.4.4
 [Peer]
 PublicKey = <public key>
 AllowedIPs = <ip1>, <ip2>  , <ip3> ,   8.8.8.8/32, 8.8.4.4/32
 Endpoint = endpointip:443


Server Wireguard logs :

[Wed Jan 11 11:42:21 2023] wireguard: wg0: Sending handshake response
to peer 247 (ip:port)
[Wed Jan 11 11:42:21 2023] wireguard: wg0: Keypair 12666 destroyed for peer 247
[Wed Jan 11 11:42:21 2023] wireguard: wg0: Keypair 12667 created for peer 247
[Wed Jan 11 11:42:26 2023] wireguard: wg0: Receiving handshake
initiation from peer 247 (ip:port)
[Wed Jan 11 11:42:26 2023] wireguard: wg0: Sending handshake response
to peer 247 (ip:port)
[Wed Jan 11 11:42:26 2023] wireguard: wg0: Keypair 12667 destroyed for peer 247
[Wed Jan 11 11:42:26 2023] wireguard: wg0: Keypair 12668 created for peer 247
[Wed Jan 11 11:42:31 2023] wireguard: wg0: Receiving handshake
initiation from peer 247 (ip:port)
[Wed Jan 11 11:42:31 2023] wireguard: wg0: Sending handshake response
to peer 247 (ip:port)
[Wed Jan 11 11:42:31 2023] wireguard: wg0: Keypair 12668 destroyed for peer 247
[Wed Jan 11 11:42:31 2023] wireguard: wg0: Keypair 12669 created for peer 247
[Wed Jan 11 11:42:36 2023] wireguard: wg0: Receiving handshake
initiation from peer 247 (ip:port)
[Wed Jan 11 11:42:36 2023] wireguard: wg0: Sending handshake response
to peer 247 (ip:port)
[Wed Jan 11 11:42:36 2023] wireguard: wg0: Keypair 12669 destroyed for peer 247
[Wed Jan 11 11:42:36 2023] wireguard: wg0: Keypair 12670 created for peer 247
[Wed Jan 11 11:42:41 2023] wireguard: wg0: Receiving handshake
initiation from peer 247 (ip:port)
[Wed Jan 11 11:42:41 2023] wireguard: wg0: Sending handshake response
to peer 247 (ip:port)
[Wed Jan 11 11:42:41 2023] wireguard: wg0: Keypair 12670 destroyed for peer 247
[Wed Jan 11 11:42:41 2023] wireguard: wg0: Keypair 12671 created for peer 247
[Wed Jan 11 11:42:46 2023] wireguard: wg0: Receiving handshake
initiation from peer 247 (ip:port)
[Wed Jan 11 11:42:46 2023] wireguard: wg0: Sending handshake response
to peer 247 (ip:port)
[Wed Jan 11 11:42:46 2023] wireguard: wg0: Keypair 12671 destroyed for peer 247
[Wed Jan 11 11:42:46 2023] wireguard: wg0: Keypair 12672 created for peer 247
[Wed Jan 11 11:42:51 2023] wireguard: wg0: Receiving handshake
initiation from peer 247 (ip:port)
[Wed Jan 11 11:42:51 2023] wireguard: wg0: Sending handshake response
to peer 247 (ip:port)
[Wed Jan 11 11:42:51 2023] wireguard: wg0: Keypair 12672 destroyed for peer 247
[Wed Jan 11 11:42:51 2023] wireguard: wg0: Keypair 12673 created for peer 247


Client Logs :

2023-01-11 17:10:28.493: [TUN] [ZTNATunnelService] Sending handshake
initiation to peer 7 (endpoint:port)
2023-01-11 17:10:33.601: [TUN] [ZTNATunnelService] Handshake for peer
7 (endpoint:port) did not complete after 5 seconds, retrying (try 2)
2023-01-11 17:10:33.601: [TUN] [ZTNATunnelService] Sending handshake
initiation to peer 7 (endpoint:port)
2023-01-11 17:10:38.616: [TUN] [ZTNATunnelService] Handshake for peer
7 (endpoint:port) did not complete after 5 seconds, retrying (try 2)
2023-01-11 17:10:38.616: [TUN] [ZTNATunnelService] Sending handshake
initiation to peer 7 (endpoint:port)
2023-01-11 17:10:43.637: [TUN] [ZTNATunnelService] Handshake for peer
7 (endpoint:port) did not complete after 5 seconds, retrying (try 2)
2023-01-11 17:10:43.637: [TUN] [ZTNATunnelService] Sending handshake
initiation to peer 7 (endpoint:port)
2023-01-11 17:10:48.699: [TUN] [ZTNATunnelService] Handshake for peer
7 (endpoint:port) did not complete after 5 seconds, retrying (try 2)
2023-01-11 17:10:48.699: [TUN] [ZTNATunnelService] Sending handshake
initiation to peer 7 (endpoint:port)
2023-01-11 17:10:53.781: [TUN] [ZTNATunnelService] Handshake for peer
7 (endpoint:port) did not complete after 5 seconds, retrying (try 2)
2023-01-11 17:10:53.781: [TUN] [ZTNATunnelService] Sending handshake
initiation to peer 7 (endpoint:port)
2023-01-11 17:10:58.835: [TUN] [ZTNATunnelService] Handshake for peer
7 (endpoint:port) did not complete after 5 seconds, retrying (try 2)
2023-01-11 17:10:58.835: [TUN] [ZTNATunnelService] Sending handshake
initiation to peer 7 (endpoint:port)
2023-01-11 17:11:03.922: [TUN] [ZTNATunnelService] Handshake for peer
7 (endpoint:port) did not complete after 5 seconds, retrying (try 2)
2023-01-11 17:11:03.922: [TUN] [ZTNATunnelService] Sending handshake
initiation to peer 7 (endpoint:port)
2023-01-11 17:11:08.968: [TUN] [ZTNATunnelService] Handshake for peer
7 (endpoint:port) did not complete after 5 seconds, retrying (try 2)
2023-01-11 17:11:08.968: [TUN] [ZTNATunnelService] Sending handshake
initiation to peer 7 (endpoint:port)
2023-01-11 17:11:14.079: [TUN] [ZTNATunnelService] Handshake for peer
7 (endpoint:port) did not complete after 5 seconds, retrying (try 2)
2023-01-11 17:11:14.079: [TUN] [ZTNATunnelService] Sending handshake
initiation to peer 7 (endpoint:port)
2023-01-11 17:11:19.183: [TUN] [ZTNATunnelService] Handshake for peer
7 (endpoint:port) did not complete after 5 seconds, retrying (try 2)
2023-01-11 17:11:19.183: [TUN] [ZTNATunnelService] Sending handshake
initiation to peer 7 (endpoint:port)
2023-01-11 17:11:24.196: [TUN] [ZTNATunnelService] Handshake for peer
7 (endpoint:port) did not complete after 5 seconds, retrying (try 2)
2023-01-11 17:11:24.196: [TUN] [ZTNATunnelService] Sending handshake
initiation to peer 7 (endpoint:port)
2023-01-11 17:11:29.345: [TUN] [ZTNATunnelService] Handshake for peer
7 (endpoint:port) did not complete after 5 seconds, retrying (try 2)
2023-01-11 17:11:29.345: [TUN] [ZTNATunnelService] Sending handshake
initiation to peer 7 (endpoint:port)
2023-01-11 17:11:34.360: [TUN] [ZTNATunnelService] Sending handshake
initiation to peer 7 (endpoint:port)
2023-01-11 17:11:39.376: [TUN] [ZTNATunnelService] Handshake for peer
7 (endpoint:port) did not complete after 5 seconds, retrying (try 2)
2023-01-11 17:11:39.376: [TUN] [ZTNATunnelService] Sending handshake
initiation to peer 7 (endpoint:port)
2023-01-11 17:11:44.537: [TUN] [ZTNATunnelService] Handshake for peer
7 (endpoint:port) did not complete after 5 seconds, retrying (try 2)
2023-01-11 17:11:44.537: [TUN] [ZTNATunnelService] Sending handshake
initiation to peer 7 (endpoint:port)
