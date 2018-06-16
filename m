Return-Path: justaguy@justaguy.be
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ea3f5bab
 for <wireguard@lists.zx2c4.com>;
 Sat, 16 Jun 2018 17:52:41 +0000 (UTC)
Received: from mail.justaguy.be (mail.justaguy.be
 [IPv6:2a01:4f8:1c17:51f9:995:993:587:25])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id eae4ae19
 for <wireguard@lists.zx2c4.com>;
 Sat, 16 Jun 2018 17:52:41 +0000 (UTC)
Received: by mail.justaguy.be (OpenSMTPD) with ESMTPSA id 3a0064a7
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 16 Jun 2018 17:56:53 +0000 (UTC)
To: wireguard@lists.zx2c4.com
From: justaguy <justaguy@justaguy.be>
Subject: wireguard-tools : Depends: libc6 (>= 2.25) but 2.24-11+deb9u3 is to
 be installed
Message-ID: <ef8a7d8c-83e5-8e3a-0441-5c6398e33e50@justaguy.be>
Date: Sat, 16 Jun 2018 19:56:52 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi,

Wireguard-tools is currently uninstallable on stretch

The following packages have unmet dependencies:
  wireguard-tools : Depends: libc6 (>= 2.25) but 2.24-11+deb9u3 is to be 
installed

(added to sources by https://www.wireguard.com/install/ )

https://packages.debian.org/stretch/libc6
