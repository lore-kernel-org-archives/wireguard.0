Return-Path: tcondeixa@veniamworks.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a9d6dc27
 for <wireguard@lists.zx2c4.com>;
 Fri, 23 Jun 2017 16:39:57 +0000 (UTC)
Received: from mail-wr0-f176.google.com (mail-wr0-f176.google.com
 [209.85.128.176])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8011016e
 for <wireguard@lists.zx2c4.com>;
 Fri, 23 Jun 2017 16:39:57 +0000 (UTC)
Received: by mail-wr0-f176.google.com with SMTP id 77so73568463wrb.1
 for <wireguard@lists.zx2c4.com>; Fri, 23 Jun 2017 09:55:59 -0700 (PDT)
Return-Path: <tcondeixa@veniamworks.com>
Received: from [192.168.0.64] ([213.58.201.38])
 by smtp.gmail.com with ESMTPSA id k12sm6812106wrc.10.2017.06.23.09.55.56
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 23 Jun 2017 09:55:57 -0700 (PDT)
From: Tiago Condeixa <tcondeixa@veniamworks.com>
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Subject: openwrt reboot with high load using wireguard
Message-Id: <7F8F2DEF-6394-4169-8232-75781A45CA7D@veniamworks.com>
Date: Fri, 23 Jun 2017 17:55:56 +0100
To: wireguard@lists.zx2c4.com
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi Janson,

I have been doing several experiments with wireguard and I am quite =
happy with the results in different platform, but I have been =
experiencing some reboots with openwrt.
I=E2=80=99m running openwrt 10.15.1 with kernel 3.18.45 in an embedded =
system and with heavy load (iperf3) to the wireguard server the board =
sometimes reboots, did you performed any stress tests using openwrt?
This reboots do not happen to me when I use a direct IP route or openvpn =
to connect to the server, so seems that it is related with wireguard.


thanks you,
Tiago Condeixa=
