Return-Path: joerg@higgsboson.tk
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3dcc4b87
 for <wireguard@lists.zx2c4.com>;
 Sun, 18 Dec 2016 19:48:13 +0000 (UTC)
Received: from mail.higgsboson.tk (mail.higgsboson.tk [188.68.39.17])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id dd42fa63
 for <wireguard@lists.zx2c4.com>;
 Sun, 18 Dec 2016 19:48:13 +0000 (UTC)
Received: from [IPv6:2001:470:1f0b:f8d:5e51:4fff:fe58:e70b] (unknown
 [IPv6:2001:470:1f0b:f8d:5e51:4fff:fe58:e70b])
 by mail.higgsboson.tk (Postfix) with ESMTPSA id C3FD04DD62
 for <wireguard@lists.zx2c4.com>; Sun, 18 Dec 2016 19:55:00 +0000 (UTC)
Subject: Re: awesome mips performance
To: wireguard@lists.zx2c4.com
References: <CAHmME9qKNucOvp=aEN_F3g+W7RktjtBoq76iSztLRtZeiQ57iA@mail.gmail.com>
From: Mic92 <joerg@higgsboson.tk>
Message-ID: <77c2ab1d-cc13-9917-33e2-ca33a6b9b65e@higgsboson.tk>
Date: Sun, 18 Dec 2016 20:54:58 +0100
MIME-Version: 1.0
In-Reply-To: <CAHmME9qKNucOvp=aEN_F3g+W7RktjtBoq76iSztLRtZeiQ57iA@mail.gmail.com>
Content-Type: text/plain; charset=windows-1252
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

I can tell from experience, that this device is indeed super crappy. Respect!
It barley routes 100mbit/s from LAN to WAN.

On 2016-12-16 20:25, Jason A. Donenfeld wrote:
> With the recent changes to add alignment in the headers, I now get 60
> megabits per second on a super crappy TL-WR841N board (QCA9533)
> transmitting over the internet. This is awesome performance -- a good
> milestone for little CPUs.
