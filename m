Return-Path: <SRS0=HpKU=IU=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E5C1C433DB
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 22 Mar 2021 04:06:06 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D27E361967
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 22 Mar 2021 04:06:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D27E361967
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=reldeif.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8d9aea98;
	Mon, 22 Mar 2021 04:05:51 +0000 (UTC)
Received: from mail.reldeif.de (mail.reldeif.de [62.113.206.78])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id b028dcb2
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 21 Mar 2021 21:24:53 +0000 (UTC)
Received: from [192.168.2.193]
 (dslb-188-099-197-081.188.099.pools.vodafone-ip.de [188.99.197.81])
 by mail.reldeif.de (Postfix) with ESMTPSA id CE61C40154
 for <wireguard@lists.zx2c4.com>; Sun, 21 Mar 2021 22:24:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=reldeif.de;
 s=2019010301; t=1616361893;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=PAOryCvOBr4//k0QxZ5CosutJ/WKM1quX/uim/6pdRw=;
 b=s/Z9Ckiv0LBnOtqCHg0q+wH050IJKFJGSqEaTmZ5SGlH8N2+d3kP8MXv8/OAjNZIzjP9ey
 +MlpnAfZAigSUbGCy2LzFSCQxUke7mbf4Ntr7TBNZXW0cXLGjQSsFm7+TVDnVd4UrD6Wou
 FbcOl3+SUbZd9DdVwHqLZ2y6VODWHbA=
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
From: =?UTF-8?Q?Bj=c3=b6rn_Fiedler?= <bjoern@reldeif.de>
Subject: Android/GoBackend: Wrong Src IP
Message-ID: <a2b1d031-029c-d71b-ff59-e7d1442af6a7@reldeif.de>
Date: Sun, 21 Mar 2021 22:24:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: de-DE
X-Mailman-Approved-At: Mon, 22 Mar 2021 04:05:50 +0000
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

I'd like to report some kind of behavior from which I think it is a bug of the Android App with go backend.


The Scenario:
My android phone should participate in two private networks with distinct IP ranges, subnets and clients. As the android app is restricted to one interface at a time, the single config contains the settings for both private nets.

Server A:
[Interface]
Address = 10.14.0.221/24
ListenPort = 56345
PrivateKey = ...

[Peer]
AllowedIPs = 10.14.0.13
PublicKey = ...


Server B:
[Interface]
Address = 10.200.200.2/24
ListenPort = 37699
PrivateKey = ...

[Peer]
PublicKey = ...
AllowedIPs = 10.200.200.13/32



Android phone:
[Interface]
PrivateKey = ...
Address = 10.200.200.13/24
Address = 10.14.0.13/24
ListenPort = 6677


[Peer]
AllowedIPs = 10.200.200.0/24
Endpoint = server_a.example.com:56345
PublicKey = ...


[Peer]
AllowedIPs = 10.14.0.0/24
Endpoint = server_b.example.com:37699
PublicKey = ...



The Problem:
Issue a `ping 10.200.200.2` via termux works as expected.
Issue a `ping 10.14.0.221` via termux results in 100% packet loss.


The ip address assignment and routing tables of my phone seem to be as I would expect them
$ ip route
10.14.0.0/24 dev tun0 proto kernel scope link src 10.14.0.13
10.200.200.0/24 dev tun0 proto kernel scope link src 10.200.200.13
192.168.2.0/24 dev wlan0 proto kernel scope link src 192.168.2.151

$ ip address  show tun0
42: tun0: <POINTOPOINT,UP,LOWER_UP> mtu 1280 qdisc pfifo_fast state UNKNOWN group default qlen 500
     link/none
     inet 10.200.200.13/24 scope global tun0
        valid_lft forever preferred_lft forever
     inet 10.14.0.13/24 scope global tun0:1
        valid_lft forever preferred_lft forever
     inet6 fe80::ee0a:a411:b6b2:a911/64 scope link stable-privacy
        valid_lft forever preferred_lft forever


The kernel logs from server A shows the problem:
[309387.725202] wireguard: wg0: Packet has unallowed src IP (10.200.200.13) from peer 13 (192.168.2.151:6677)

It seems as if the wrong address is used as source addres by the android app or go backend. I've tested the same config on a linux machine using the wireguard-go userspace implementation but it worked correctly. Hence I would assume it is some kind of interworking problem of the android components.
Switching the two addresses in the interface section results in the same behaviour but inverted. It always uses the first address as source address.
The problem is not limited to ping but seems to affect all apps and protocols (tested http, ssh, ping).

App version:
WireGuard for Android v1.0.20210211
Go userspace backend v0.0.20201118
Installed via google play

Android 10 QKQ1.191215.002
Kernel 4.14.117-perf-ge9e6b4f


If you need more infos or my help for reproducing, let me know.

Thank you in advance,
Björn
