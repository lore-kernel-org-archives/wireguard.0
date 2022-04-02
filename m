Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 165BDC433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 21 Apr 2022 23:51:33 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id c4402f01;
	Thu, 21 Apr 2022 23:48:51 +0000 (UTC)
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com
 [2607:f8b0:4864:20::234])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 7f8ba0bf
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sat, 2 Apr 2022 12:42:47 +0000 (UTC)
Received: by mail-oi1-x234.google.com with SMTP id k10so5452857oia.0
 for <wireguard@lists.zx2c4.com>; Sat, 02 Apr 2022 05:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=5APsVisN9yO8bKgbK9K3MYX9mCLXwQNX0GLlUvqaAjg=;
 b=dFMAonpTfeWqPsPQE8TdrY2SiCozbqVRv35nIt4TNTlq4A+pjq/rCJnbgGA7oZSXkU
 3ktRILz4w96APC1ETc4/xK3D85DVuiSYnMhmkX79PKWt1Y0pFRdNxeViJTKt9Di9eHWr
 U5vNxRXl5D+yggDQCsJ5g0tflIlXQv2HcRseSvC1WM7zSi/2LL8O2dumK4nWNsf9vhFQ
 6KWDBb15ewCBTyple9Stb5C0K9LSeDvnlw4Nv770sSyj53S0Sz01/SnZExaMimFzww2u
 YGKI6GG0hAUjIDtrmCKJovjBwi5/vmaOEetSNc7uqvHtpc6y3WfbN7sLc7iIOWdyXKVS
 GHEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=5APsVisN9yO8bKgbK9K3MYX9mCLXwQNX0GLlUvqaAjg=;
 b=GRjR+HcxPI23ROnnrLC5FFZwTq3Qn9nHMIzFfpxVptwgWhWWJWMfC3Zr57i0F9WMlF
 ex4aGnWUWY1FV+i7hhdWZtnvg+4+JM94UZmRgv2p1nr7c6eMGVt98FSmj0S9oUEsRrdA
 2MtTghICLGLcj4MNWHLW7+HyTxGCfoTbwPG7uUWdYhXoIrC5rLdEkv+ziz189Cv41/Yn
 +TM4LHMfdflfydXvZkKmf5/nZ7aBtVZ1nugvy4GUzrDzR8vOGeEZtpO+KHvtH8mfhaBO
 f36bpoN9QiFZFjNzrie+235h6wZmrQcykHybHvgWTFZOgsrtT6sNiE5Py//akQG7Im9e
 2luQ==
X-Gm-Message-State: AOAM533cpgNyq32xirGyPJ9GvGcyPLhuNk/zpsHBIGjmfDYKtYqBopOz
 vdnubAX4La9XGOU4m5bo0EE9iMua+jDCXAxvvRNfCRgMeX0=
X-Google-Smtp-Source: ABdhPJzit5+X9iCe5LfjgrAPfSRCHJ2E+Cuwly8nef3Iao+HSXwnZps1QlL9ehqJ9la/ABbPU25hZzWt9tQG0hNQvX8=
X-Received: by 2002:aca:1213:0:b0:2ef:1f7e:3d93 with SMTP id
 19-20020aca1213000000b002ef1f7e3d93mr6589454ois.177.1648903366067; Sat, 02
 Apr 2022 05:42:46 -0700 (PDT)
MIME-Version: 1.0
From: Barry Cisna <brcisna@gmail.com>
Date: Sat, 2 Apr 2022 07:42:35 -0500
Message-ID: <CAL0AYvf0NqPprxZGMe9oqeRdr5aWG+c4sk1pjY6CeUQJJoRZbQ@mail.gmail.com>
Subject: hostapd compatible
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Thu, 21 Apr 2022 23:48:42 +0000
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

Hello All,

Have been struggling trying to get WireGuard set for a peer(B) that
also acts as an ltsp server to diskless clients,,running dnsmasq,
which iis connected to a Google Cloud instance WireGaurd

PeerA - Google Cloud Debian Bullseye static ip
PeerB - local Debian Bullseye behind CGNAT  cellular connection

PeerB uses a cellular modem for internet wwan0 and a bridged interface
for supplying dhcp to thin clients via dnsmasq
bridge0 = ethernet & wlan,which in turns uses hostapd to run the wlan
in master mode AP.
After many hours of iptabling,multiple wired clients works fine
through dnsmasq and internet through PeerB.
BUT the wireless clients are super slow and most web pages never
complete. Have tried all mtu settings on PeerA and PeerB and now see
no fragmented hits in wireshark.
It almost seems as though the MTU on the wlan interface needs to be
changed, but never see any fragment hits on wireshark on the wified
client?
 Do NOT have stp enabled on the bridge,Have not tried enabling stp.
MTU 1460 seems to be the best setting for this setup,,but have read on
many tuts using GCloud instance should be 1360. This MTU 1360 made web
pages almost unusable for this setup.


wgo-client2.conf-

[Interface]
PrivateKey = <>
Address = 192.168.69.2/24
#Address = 10.88.88.2/24
#DNS = 10.128.0.2
#Table=off
MTU = 1460
#------------------------------------------------------------------------------------------
#PostUp = ip6tables -t nat -A POSTROUTING -o wwan0 -j MASQUERADE
#PostDown = ip6tables -t nat -A POSTROUTING -o wwan0 -j MASQUERADE

# PostUp = iptables -A FORWARD -i wg0client2 -j ACCEPT
# PostDown = iptables -t nat -A POSTROUTING -o wwan0 -j MASQUERADE


[Peer]
# Google Cloud Server
 PublicKey = <.>
 Endpoint = 35.226.##.###:51820
 AllowedIPs = 0.0.0.0/0, ::/0 # Forward all traffic to server

 network/interfaces

 auto bridge0
auto wlp3s0
auto enp2s0
iface wlp3s0 inet manual
iface enp2s0 inet manual
#iface wlp3s0 inet6 manual
#iface enp2s0 inet6 manual
#bridge setup
iface bridge0 inet static
bridge_ports enp2s0 wlp3s0
    address 192.168.67.1
broadcast 192.168.67.255
netmask 255.255.255.0
post-up iptables-restore < /etc/iptables.up.rules
post-up ip6tables-restore < /etc/ip6tables.up.rules
# gateway 192.168.67.1
# bridge_stp on

Thanks
