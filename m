Return-Path: bert@biot.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 876667e2
 for <wireguard@lists.zx2c4.com>;
 Sun, 21 May 2017 23:01:49 +0000 (UTC)
Received: from yawp.biot.com (yawp.biot.com [88.99.24.79])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 16ace7d1
 for <wireguard@lists.zx2c4.com>;
 Sun, 21 May 2017 23:01:49 +0000 (UTC)
Received: from debian-spamd by yawp.biot.com with sa-checked (Exim 4.87)
 (envelope-from <bert@biot.com>) id 1dCa2d-0001F4-B1
 for wireguard@lists.zx2c4.com; Mon, 22 May 2017 01:13:39 +0200
Received: from [2a01:4f8:10a:8e::1:1]
 by yawp.biot.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.87) (envelope-from <bert@biot.com>) id 1dCa2d-0001F0-5G
 for wireguard@lists.zx2c4.com; Mon, 22 May 2017 01:13:39 +0200
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
From: Bert Vermeulen <bert@biot.com>
Subject: openresolv dependency
Message-ID: <2fa3ef35-fde6-55d2-0872-52aa2bcb87d2@biot.com>
Date: Mon, 22 May 2017 01:13:38 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi,

Happy WireGuard user here. I use the PPA package on ubuntu, and I see
it's grown a dependency on openresolv. That's the convoluted horror also
known as resolvconf, and I really can't have it on my system. It likes
to overwrite my resolv.conf, randomly spawn thousands of zombies, and so on.

It's particularly disturbing that this means your tunnel endpoint's
server end now also gets resolvconf installed. You might almost make an
argument that it has uses on say a laptop, but not on anything with
static network configuration.

Can this dependency please be removed?


-- 
Bert Vermeulen
bert@biot.com
