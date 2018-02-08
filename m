Return-Path: nino@ninov.de
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f5e0238d
 for <wireguard@lists.zx2c4.com>; Thu, 8 Feb 2018 07:54:29 +0000 (UTC)
Received: from herd.nv.gw (herd.nv.gw [185.16.61.54])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5225bd1e
 for <wireguard@lists.zx2c4.com>; Thu, 8 Feb 2018 07:54:28 +0000 (UTC)
Subject: Re: wg-quick save -brief unknown
To: wireguard@lists.zx2c4.com
References: <1145047671.838361.1518074558036.ref@mail.yahoo.com>
 <1145047671.838361.1518074558036@mail.yahoo.com>
From: ninov <lists-wireguard@ninov.de>
Message-ID: <98e34a69-6795-4b57-5109-4054c8641011@ninov.de>
Date: Thu, 8 Feb 2018 08:59:12 +0100
Mime-Version: 1.0
In-Reply-To: <1145047671.838361.1518074558036@mail.yahoo.com>
Content-Type: text/plain; charset=utf-8
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

> $ wg-quick save wg0
> Option "-brief" is unknown, try "ip -help".
The `-brief`-option seems to be available since iproute2-150831 (kernel
4.2.0). CentOS 7 uses iproute2-130716 (kernel 3.10).
wireguard seems to officially support kernel >= 3.10, so it should
probably not use the `-brief`-option.

Regards,
Nino
