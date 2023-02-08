Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB261C636D3
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  8 Feb 2023 20:22:17 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b61ee8bd;
	Wed, 8 Feb 2023 20:22:15 +0000 (UTC)
Received: from mail-108-mta198.mxroute.com (mail-108-mta198.mxroute.com
 [136.175.108.198])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 3c1bdc4c
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 8 Feb 2023 19:33:54 +0000 (UTC)
Received: from mail-111-mta2.mxroute.com ([136.175.111.2]
 filter006.mxroute.com) (Authenticated sender: mN4UYu2MZsgR)
 by mail-108-mta198.mxroute.com (ZoneMTA) with ESMTPSA id
 18632851faa000011e.001 for <wireguard@lists.zx2c4.com>
 (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES128-GCM-SHA256);
 Wed, 08 Feb 2023 19:33:50 +0000
X-Zone-Loop: d72bc4184ba35a040b1d4592a23a1fe63a36808c461b
X-Originating-IP: [136.175.111.2]
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=linuxserver.io; s=x; h=Content-Type:To:Subject:Message-ID:Date:From:
 MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LewNL0ud9mn1FKjp1/I/JIKdzyT6Jh4Yb00u9XkZH1M=; b=ohEBDxpa6njtAjqxI2NINVes31
 GdndDI+/+x9zFY+xruNnwQDAnrR1cpSnc0Kv1ID1QcrfCbYUa9skp5/DvgOH7/epmieXdBPnDiiC5
 OEZGFvSqdM3BN74rA41GCxKS0MjxjCBHU7VuKc9PIq338NLIQTep97lZY7lC7vrdL1qe3gTdoEJjS
 nryV822Wc0o/EnD0hw/c8OG4c1+3zhf7xWI/GPmZheGizyTCcmEGShW3zkrRIIsIGvdXoQt+ibuBj
 3YCxKwoW0FfVfdhDPkFQ5AaqZMuKIE82oDEMj4T+jKI9GaYwhlksre4dUMqq4bT9AkeMkOzMG/t+K
 Gq2XcTIw==;
Received: by mail-yw1-f181.google.com with SMTP id
 00721157ae682-52bed2ce9bdso30003887b3.13
 for <wireguard@lists.zx2c4.com>; Wed, 08 Feb 2023 11:33:48 -0800 (PST)
X-Gm-Message-State: AO0yUKWzBGttneqccPYx5HAeH9p18qAEW/SzS9rGbgGmEb9g9//rZNNw
 fVa+L4qYc2qPn0YDQ+JWruiQ3FWNZ3x1pBd7oFk=
X-Google-Smtp-Source: AK7set/9EmA9n1WgIBd8BkstMiQ4yHtqJqxaObUadimiKm5Kc+t+gTW/YJZRj5d9fB7Oc5RIUkK3JhuVOoBXiF3U19s=
X-Received: by 2002:a81:6ec2:0:b0:527:bd74:994c with SMTP id
 j185-20020a816ec2000000b00527bd74994cmr1146668ywc.60.1675884827718; Wed, 08
 Feb 2023 11:33:47 -0800 (PST)
MIME-Version: 1.0
From: aptalca <aptalca@linuxserver.io>
Date: Wed, 8 Feb 2023 14:33:37 -0500
X-Gmail-Original-Message-ID: <CAAwaY-A2T3HRX2KOD7U2xTseU885+zDaZHPGPX7-W7aF-6k4sQ@mail.gmail.com>
Message-ID: <CAAwaY-A2T3HRX2KOD7U2xTseU885+zDaZHPGPX7-W7aF-6k4sQ@mail.gmail.com>
Subject: [PATCH] wg-quick: Set sysctl only if necessary
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
X-Authenticated-Id: aptalca@linuxserver.io
X-Mailman-Approved-At: Wed, 08 Feb 2023 20:22:14 +0000
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

Currently, wg-quick script on linux attempts to set the sysctl
"net.ipv4.conf.all.src_valid_mark=1" every time, no matter if it's
already set or not.

The issue is, when the script is run inside a container lacking the
privilege for setting sysctls, it fails with a warning message. In
such cases, like a docker container, the user is expected to set the
sysctl via docker arguments when creating the container so the sysctl
is already set correctly. There is no need for wg-quick to set it
inside the container as it's already set. The warning in such cases is
a false positive and is confusing to the user as it leads them to
believe the sysctl is not set correctly.

One example is the linuxserver wireguard docker image:
https://github.com/linuxserver/docker-wireguard
The container is meant to be created with the docker argument
'--sysctl="net.ipv4.conf.all.src_valid_mark=1"' so there is no need
for wg-quick to set it inside the container. It tries anyway and fails
with a warning as listed below. Since the sysctl is already set
correctly, everything works as expected.

[#] ip link add wg0 type wireguard
[#] wg setconf wg0 /dev/fd/63
[#] ip -4 address add 10.1.13.12/32 dev wg0
[#] ip link set mtu 1420 up dev wg0
[#] wg set wg0 fwmark 51820
[#] ip -4 route add 0.0.0.0/0 dev wg0 table 51820
[#] ip -4 rule add not fwmark 51820 table 51820
[#] ip -4 rule add table main suppress_prefixlength 0
[#] sysctl -q net.ipv4.conf.all.src_valid_mark=1
sysctl: setting key "net.ipv4.conf.all.src_valid_mark", ignoring:
Read-only file system
[#] iptables-restore -n
[#] iptables -t nat -A POSTROUTING -o wg+ -j MASQUERADE

Here's a patch that makes the sysctl setting attempt to be
conditional. It first checks whether it's already set correctly, and
only attempts to set it if necessary.

Signed-off-by: aptalca <aptalca@linuxserver.io>
---
 src/wg-quick/linux.bash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/src/wg-quick/linux.bash b/src/wg-quick/linux.bash
index 69e5bef..5a8048f 100755
--- a/src/wg-quick/linux.bash
+++ b/src/wg-quick/linux.bash
@@ -237,7 +237,7 @@ add_default() {
  printf -v restore '%sCOMMIT\n*mangle\n-I POSTROUTING -m mark --mark
%d -p udp -j CONNMARK --save-mark %s\n-I PREROUTING -p udp -j CONNMARK
--restore-mark %s\nCOMMIT\n' "$restore" $table "$marker" "$marker"
  printf -v nftcmd '%sadd rule %s %s postmangle meta l4proto udp mark
%d ct mark set mark \n' "$nftcmd" "$pf" "$nftable" $table
  printf -v nftcmd '%sadd rule %s %s premangle meta l4proto udp meta
mark set ct mark \n' "$nftcmd" "$pf" "$nftable"
- [[ $proto == -4 ]] && cmd sysctl -q net.ipv4.conf.all.src_valid_mark=1
+ [[ $proto == -4 ]] && [[ $(sysctl -n
net.ipv4.conf.all.src_valid_mark) != 1 ]] && cmd sysctl -q
net.ipv4.conf.all.src_valid_mark=1
  if type -p nft >/dev/null; then
  cmd nft -f <(echo -n "$nftcmd")
  else
--
2.34.1
