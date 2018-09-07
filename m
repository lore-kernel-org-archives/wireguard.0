Return-Path: symgryph@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5b2716aa
 for <wireguard@lists.zx2c4.com>; Fri, 7 Sep 2018 02:51:56 +0000 (UTC)
Received: from mail-yw1-xc32.google.com (mail-yw1-xc32.google.com
 [IPv6:2607:f8b0:4864:20::c32])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9f7974ec
 for <wireguard@lists.zx2c4.com>; Fri, 7 Sep 2018 02:51:56 +0000 (UTC)
Received: by mail-yw1-xc32.google.com with SMTP id y134-v6so4897192ywg.1
 for <wireguard@lists.zx2c4.com>; Thu, 06 Sep 2018 19:52:14 -0700 (PDT)
Return-Path: <symgryph@gmail.com>
Received: from [192.168.3.206] ([98.122.169.29])
 by smtp.gmail.com with ESMTPSA id q127-v6sm2426373ywq.83.2018.09.06.19.52.12
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 06 Sep 2018 19:52:12 -0700 (PDT)
From: Thomas Munn <symgryph@gmail.com>
Content-Type: multipart/alternative;
 boundary=Apple-Mail-D866055B-4BF9-4553-B72D-3FF3632E5325
Mime-Version: 1.0 (1.0)
Date: Thu, 6 Sep 2018 22:52:11 -0400
Subject: any interest in a centos aws terraform/ansible wireguard ami builder?
Message-Id: <9ACFE8D4-469E-4665-80B9-E95934B37B95@gmail.com>
To: wireguard@lists.zx2c4.com
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>


--Apple-Mail-D866055B-4BF9-4553-B72D-3FF3632E5325
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable

I have written both a terraform form and an interval script which automatica=
lly installs the basic components of wire guard and ensures that the kernel m=
odules are loaded at a time. The subsequent image can then be cloned and use=
d as a basis for a wire guard VPN appliances.

Thomas J Munn


--Apple-Mail-D866055B-4BF9-4553-B72D-3FF3632E5325
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head><meta http-equiv="content-type" content="text/html; charset=utf-8"></head><body dir="auto">I have written both a terraform form and an interval script which automatically installs the basic components of wire guard and ensures that the kernel modules are loaded at a time. The subsequent image can then be cloned and used as a basis for a wire guard VPN appliances.<br><br><div id="AppleMailSignature"><span style="font-size: 13pt;">Thomas J Munn</span><br><div><div><br></div></div></div></body></html>
--Apple-Mail-D866055B-4BF9-4553-B72D-3FF3632E5325--
