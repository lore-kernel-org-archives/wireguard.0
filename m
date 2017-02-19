Return-Path: egbert@eggiecode.org
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 72866aba
 for <wireguard@lists.zx2c4.com>;
 Sun, 19 Feb 2017 14:51:20 +0000 (UTC)
Received: from mail01.eggieservers.nl (mail01.eggieservers.nl
 [149.210.159.147])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8d0276d8
 for <wireguard@lists.zx2c4.com>;
 Sun, 19 Feb 2017 14:51:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail01.eggieservers.nl (Postfix) with ESMTP id F13A61C2E05
 for <wireguard@lists.zx2c4.com>; Sun, 19 Feb 2017 15:51:23 +0100 (CET)
Received: from mail01.eggieservers.nl ([127.0.0.1])
 by localhost (vps01.eggieservers.nl [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gvKZX1sat82M for <wireguard@lists.zx2c4.com>;
 Sun, 19 Feb 2017 15:51:13 +0100 (CET)
Received: from [IPv6:2001:470:1f15:66b:5e51:4fff:fe43:dc49] (unknown
 [IPv6:2001:470:1f15:66b:5e51:4fff:fe43:dc49])
 (Authenticated sender: egbert@eggiecode.org)
 by mail01.eggieservers.nl (Postfix) with ESMTPSA id 1E8FD1C2C35
 for <wireguard@lists.zx2c4.com>; Sun, 19 Feb 2017 15:51:13 +0100 (CET)
Subject: Re: wg binary in armhf deb from ppa missing
To: wireguard@lists.zx2c4.com
References: <EF6AB0BF-E341-41C1-8744-7CA8A5A778D0@dd19.de>
From: Egbert Verhage <egbert@eggiecode.org>
Message-ID: <37c21d07-0153-7fa2-8fe3-c852704e53b9@eggiecode.org>
Date: Sun, 19 Feb 2017 15:51:42 +0100
MIME-Version: 1.0
In-Reply-To: <EF6AB0BF-E341-41C1-8744-7CA8A5A778D0@dd19.de>
Content-Type: text/plain; charset=windows-1252
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hey Alex,

Ow, I never tested the package on armhf. I will give test it tomorrow on
my own Banana Pi 2 and Raspberry pi 2.

If you are running the image of lemaker on your banana pi, maybe try
first to build the package from the git repo.

Greetz,
Egbert


On 2017-02-19 02:14, Alexander Morlang wrote:
> Hi,
> used the launchpad ppa in xenial on armhf (Banana Pro). 
> The wireguard-tools packet installed only /usr/share/doc
>
> Is this a known problem?
>
> I downloaded the
> https://launchpad.net/~wireguard/+archive/ubuntu/wireguard/+files/wireguard-tools_0.0.20170214-wg1~xenial_armhf.deb
> and hat a look with dpkg -c <file>, getting the same result of no binary in the packet.
>
> regards, Alex
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
