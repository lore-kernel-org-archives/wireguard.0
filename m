Return-Path: <SRS0=kH4x=QG=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E82FC433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 19 Nov 2021 13:11:00 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9271B61A38
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 19 Nov 2021 13:10:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9271B61A38
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 766aa02a;
	Fri, 19 Nov 2021 13:10:57 +0000 (UTC)
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com
 [2607:f8b0:4864:20::72c])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 79192e17
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 19 Nov 2021 13:10:55 +0000 (UTC)
Received: by mail-qk1-x72c.google.com with SMTP id g28so10047553qkk.9
 for <wireguard@lists.zx2c4.com>; Fri, 19 Nov 2021 05:10:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=carLWI94+qkrar0gpqIn8kxAZ5ZRJjfO1jNorYjoGxw=;
 b=fpyi0AgZIJX/LpO2aCt8BYi+tZwYgmluJK9akxiY8UzY2n6T2ED7K0EaVM7GVrgnwM
 8mPnpAZhwvSscrmcHD3EaYxKYeqOvBcrS8i00h6APMqoosPLSiMgQ3ldqtB6Ax15bWo3
 R/DuFbK+ZcYokwt4mJl+9XzYvDCT+fFSj4c/SnhDod3Q1+2pwzPvezLcrW0RsLM/PymJ
 6bSvHbRAQgD21Rv2jLSnZdqe13yiFk+rs/0FAIuroGCGZIZeWPohjXVct94PU30CG2kH
 D22cOXghzTMSKdKlAg0d2eV+SDSp3333zOa1uCvRWGjktpaix6YUxbAHYS3IzNup5NFn
 GDEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=carLWI94+qkrar0gpqIn8kxAZ5ZRJjfO1jNorYjoGxw=;
 b=W9kwFd/vUIsZJwx8O92vzxEQFoIzguB6Sg2SVghGFxr0f0reHF22gCZ+941u4cy67U
 28a6Db0IB0b+vdjCf7Gnet7OCsWB33ChLaErd4X83KgUhD0bCIF4T3psmY3QjjZgB/ut
 L36z+QT9bhwqmxAZ6Usq6d35xIDbvjo5H/fQUXoRBGbWR0/G6EY2noMv2foXD2irLslg
 JyzICt1CZ3tgZsMHymTlfjopBhhU5LwzAvUE1B7CiZtitxfSH4jotpukRz+EOnQxALXc
 ZCOzNr9aSC3AxWswkx+jT2AgeGlwVTwJZtZZK+gT+KnHWfcfLesYhf1a0qKUW4pJd3OF
 WV/Q==
X-Gm-Message-State: AOAM532mLNZ2QMpUZp37QIOh++tlxDl5uPWRc3M8+4h4WYeBG2p91yew
 LY5VekEvv5CzUVpQQ2ZdMlpSxH7Lrv4gUuGLuBkFpY6qB/2tEA==
X-Google-Smtp-Source: ABdhPJz+jBoxwzQA+C/tsDtgaW1kMRzxSJfmKc9pcXQ2rL9m8nxstMtWd/17CbkB8+HWyAxeTfCSywe9/Q6sb9CUS+A=
X-Received: by 2002:a37:a50e:: with SMTP id o14mr27203812qke.288.1637327453593; 
 Fri, 19 Nov 2021 05:10:53 -0800 (PST)
MIME-Version: 1.0
From: =?UTF-8?B?5pu554Wc?= <cao88yu@gmail.com>
Date: Fri, 19 Nov 2021 21:10:42 +0800
Message-ID: <CACu-5+0Z1JPCttbZpM13870N9Wce8K3V2ZRdhV6XFmVk4FJKxQ@mail.gmail.com>
Subject: Wireguard source ip selection issue with multi interfaces
To: wireguard@lists.zx2c4.com
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

Hi,
As Jason said in mailing list
(https://lists.zx2c4.com/pipermail/wireguard/2017-November/002018.html)
years ago, if wireguard reply the client with wrong src ip, then it is
a bug. And now I'm trying to set up a minimal configuration.

Server info:

Ubuntu 20.04 in VMware with two Host-only network adapters:

wacke@Ubuntu:/etc$ lsb_release -a
No LSB modules are available.
Distributor ID: Ubuntu
Description: Ubuntu 20.04.3 LTS
Release: 20.04
Codename: focal

wacke@Ubuntu:/etc$ uname -a
Linux Ubuntu 5.14.8-051408-generic #202109280455 SMP Tue Sep 28
04:57:31 UTC 2021 x86_64 x86_64 x86_64 GNU/Linux

wacke@Ubuntu:/etc$ sudo ip route show
169.254.0.0/16 dev ens33 scope link metric 1000
172.17.0.0/16 dev docker0 proto kernel scope link src 172.17.0.1 linkdown
192.168.187.0/24 dev ens33 proto kernel scope link src 192.168.187.129
metric 100
192.168.187.0/24 dev ens35 proto kernel scope link src 192.168.187.128
metric 101
192.168.199.0/24 dev wg0 proto kernel scope link src 192.168.199.1

wacke@Ubuntu:/etc$ sudo cat /etc/wireguard/wg0.conf
[Interface]
PrivateKey = oLLeTlvwWsfGoyQpDwZo0k7AsMf0LkkfycGPwFjamEA=
ListenPort = 5999

[Peer]
PublicKey = JYvK2/FBbbSrDbkH29ejWejkBJS3ch/SFtyZwNf5O1c=
AllowedIPs = 192.168.199.2/32
PersistentKeepalive = 25

[Peer]
PublicKey = keIPXZFgvB79biV74kGc5R9vAHpzyVyQHci8KBSDIUw=
AllowedIPs = 192.168.199.3/32
PersistentKeepalive = 25

wacke@Ubuntu:/etc$ sudo wg setconf wg0 /etc/wireguard/wg0.conf
wacke@Ubuntu:/etc$ sudo ip address add dev wg0 192.168.199.1/24
wacke@Ubuntu:/etc$ sudo ip link set up dev wg0
wacke@Ubuntu:/etc$ sudo wg show
interface: wg0
  public key: Vkdx0MhQkc9anLaUehR/Df1zuKjxceflxMCAeAaCWCo=
  private key: (hidden)
  listening port: 5999

peer: JYvK2/FBbbSrDbkH29ejWejkBJS3ch/SFtyZwNf5O1c=
  endpoint: 192.168.187.1:35560
  allowed ips: 192.168.199.2/32
  transfer: 2.89 KiB received, 1.80 KiB sent
  persistent keepalive: every 25 seconds

peer: keIPXZFgvB79biV74kGc5R9vAHpzyVyQHci8KBSDIUw=
  allowed ips: 192.168.199.3/32
  persistent keepalive: every 25 seconds

Client info:

HOME-Server:/NAS/Software/Software # uname -a
Linux HOME-Server 5.14.14-2-default #1 SMP Thu Oct 21 05:05:03 UTC
2021 (2b5383f) x86_64 x86_64 x86_64 GNU/Linux

HOME-Server:/NAS/Software/Software # cat wg0.conf
[Interface]
PrivateKey = 4Pw1cetxd9TdfH3TSab+9UcRBlHwZ1o/vmrUgkerZls=

[Peer]
PublicKey = Vkdx0MhQkc9anLaUehR/Df1zuKjxceflxMCAeAaCWCo=
Endpoint = 192.168.187.128:5999
AllowedIPs = 192.168.199.0/24
PersistentKeepalive = 25

HOME-Server:/NAS/Software/Software # ip link add wg0 type wireguard
HOME-Server:/NAS/Software/Software # ip address add dev wg0 192.168.199.2/24
HOME-Server:/NAS/Software/Software # wg setconf wg0 wg0.conf
HOME-Server:/NAS/Software/Software # ip link set wg0 up
HOME-Server:/NAS/Software/Software # wg show
interface: wg0
  public key: JYvK2/FBbbSrDbkH29ejWejkBJS3ch/SFtyZwNf5O1c=
  private key: (hidden)
  listening port: 53058

peer: Vkdx0MhQkc9anLaUehR/Df1zuKjxceflxMCAeAaCWCo=
  endpoint: 192.168.187.128:5999
  allowed ips: 192.168.199.0/24
  transfer: 0 B received, 59.26 KiB sent
  persistent keepalive: every 25 seconds


tcpdump of client side:

HOME-Server:/NAS/Software/Software # tcpdump -i any -vn "(dst port 5999)"
tcpdump: data link type LINUX_SLL2
tcpdump: listening on any, link-type LINUX_SLL2 (Linux cooked v2),
snapshot length 262144 bytes
22:10:37.794301 vmnet1 Out IP (tos 0x88, ttl 64, id 54724, offset 0,
flags [none], proto UDP (17), length 176)
    192.168.187.1.53058 > 192.168.187.128.5999: UDP, length 148
22:10:43.170306 vmnet1 Out IP (tos 0x88, ttl 64, id 55327, offset 0,
flags [none], proto UDP (17), length 176)
    192.168.187.1.53058 > 192.168.187.128.5999: UDP, length 148
22:10:48.546281 vmnet1 Out IP (tos 0x88, ttl 64, id 56142, offset 0,
flags [none], proto UDP (17), length 176)
    192.168.187.1.53058 > 192.168.187.128.5999: UDP, length 148
22:10:53.670343 vmnet1 Out IP (tos 0x88, ttl 64, id 57053, offset 0,
flags [none], proto UDP (17), length 176)
    192.168.187.1.53058 > 192.168.187.128.5999: UDP, length 148
22:11:18.754308 vmnet1 Out IP (tos 0x88, ttl 64, id 58505, offset 0,
flags [none], proto UDP (17), length 176)
    192.168.187.1.53058 > 192.168.187.128.5999: UDP, length 148
22:11:24.130286 vmnet1 Out IP (tos 0x88, ttl 64, id 58621, offset 0,
flags [none], proto UDP (17), length 176)
    192.168.187.1.53058 > 192.168.187.128.5999: UDP, length 148
22:11:29.506305 vmnet1 Out IP (tos 0x88, ttl 64, id 58810, offset 0,
flags [none], proto UDP (17), length 176)
    192.168.187.1.53058 > 192.168.187.128.5999: UDP, length 148
22:11:34.882326 vmnet1 Out IP (tos 0x88, ttl 64, id 59444, offset 0,
flags [none], proto UDP (17), length 176)
    192.168.187.1.53058 > 192.168.187.128.5999: UDP, length 148
^C
8 packets captured
8 packets received by filter
0 packets dropped by kernel

tcpdump of server side:

wacke@Ubuntu:~$ sudo tcpdump -i any -vn "(src port 5999)"
tcpdump: listening on any, link-type LINUX_SLL (Linux cooked v1),
capture size 262144 bytes
22:10:11.754862 IP (tos 0x88, ttl 64, id 22024, offset 0, flags
[none], proto UDP (17), length 120)
    192.168.187.129.5999 > 192.168.187.1.53058: UDP, length 92
22:10:16.874400 IP (tos 0x88, ttl 64, id 22399, offset 0, flags
[none], proto UDP (17), length 120)
    192.168.187.129.5999 > 192.168.187.1.53058: UDP, length 92
22:10:21.994433 IP (tos 0x88, ttl 64, id 23057, offset 0, flags
[none], proto UDP (17), length 120)
    192.168.187.129.5999 > 192.168.187.1.53058: UDP, length 92
22:10:27.370558 IP (tos 0x88, ttl 64, id 23912, offset 0, flags
[none], proto UDP (17), length 120)
    192.168.187.129.5999 > 192.168.187.1.53058: UDP, length 92
22:10:32.494605 IP (tos 0x88, ttl 64, id 24944, offset 0, flags
[none], proto UDP (17), length 120)
    192.168.187.129.5999 > 192.168.187.1.53058: UDP, length 92
22:10:37.610779 IP (tos 0x88, ttl 64, id 25327, offset 0, flags
[none], proto UDP (17), length 120)
    192.168.187.129.5999 > 192.168.187.1.53058: UDP, length 92
22:10:42.986834 IP (tos 0x88, ttl 64, id 25498, offset 0, flags
[none], proto UDP (17), length 120)
    192.168.187.129.5999 > 192.168.187.1.53058: UDP, length 92
22:10:48.362908 IP (tos 0x88, ttl 64, id 26521, offset 0, flags
[none], proto UDP (17), length 120)
    192.168.187.129.5999 > 192.168.187.1.53058: UDP, length 92
22:10:53.486942 IP (tos 0x88, ttl 64, id 27214, offset 0, flags
[none], proto UDP (17), length 120)
    192.168.187.129.5999 > 192.168.187.1.53058: UDP, length 92
22:11:18.571437 IP (tos 0x88, ttl 64, id 31112, offset 0, flags
[none], proto UDP (17), length 120)
    192.168.187.129.5999 > 192.168.187.1.53058: UDP, length 92
22:11:23.947460 IP (tos 0x88, ttl 64, id 31897, offset 0, flags
[none], proto UDP (17), length 120)
    192.168.187.129.5999 > 192.168.187.1.53058: UDP, length 92
22:11:29.323608 IP (tos 0x88, ttl 64, id 32715, offset 0, flags
[none], proto UDP (17), length 120)
    192.168.187.129.5999 > 192.168.187.1.53058: UDP, length 92
22:11:34.699676 IP (tos 0x88, ttl 64, id 33840, offset 0, flags
[none], proto UDP (17), length 120)
    192.168.187.129.5999 > 192.168.187.1.53058: UDP, length 92
^C
13 packets captured
13 packets received by filter
0 packets dropped by kernel

As the tcpdump log showed, the wireguard server always chose the ip
with lowest metric as source ip (192.168.187.129) to reply to the
client (while the client tried to connect 192.168.187.128).

Hope the info above can help to debug. Many thanks.
