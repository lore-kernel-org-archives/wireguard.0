Return-Path: geokozey@mailfence.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 85d22b5d
 for <wireguard@lists.zx2c4.com>;
 Thu, 26 Oct 2017 19:56:36 +0000 (UTC)
Received: from wilbur.contactoffice.com (wilbur.contactoffice.com
 [212.3.242.68])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 63c4bfb9
 for <wireguard@lists.zx2c4.com>;
 Thu, 26 Oct 2017 19:56:36 +0000 (UTC)
Received: from ichabod.co-bxl (ichabod.co-bxl [10.2.0.36])
 by wilbur.contactoffice.com (Postfix) with ESMTP id B5BC02860
 for <wireguard@lists.zx2c4.com>; Thu, 26 Oct 2017 21:58:20 +0200 (CEST)
Message-ID: <2027941193.391349.1509047899053@ichabod.co-bxl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Subject: Re: Fixing wg-quick's DNS= directive with a hatchet
From: Geo Kozey <geokozey@mailfence.com>
To: wireguard@lists.zx2c4.com
Date: Thu, 26 Oct 2017 21:58:19 +0200 (CEST)
Reply-To: Geo Kozey <geokozey@mailfence.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Thu, 26 Oct 2017, Jason A. Donenfeld wrote:

>Before I describe the hatchet, though, it might be worthwhile to
>remind ourselves of the three goals of DNS setting in this
>environment: a) be the exclusive DNS entry, b) restore the previous
>settings when the wireguard interface is removed, and c) not allow
>other things on the system (like roving dhcp daemons) to overwrite our
>settings.

What about usecases where more nameservers are needed, i.e. local nameserver used for caching, adblocking or whatever?
