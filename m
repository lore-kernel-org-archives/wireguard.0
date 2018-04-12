Return-Path: mikael@m7n.se
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 426a43d6
 for <wireguard@lists.zx2c4.com>;
 Thu, 12 Apr 2018 13:07:16 +0000 (UTC)
Received: from bond.m7n.se (bond.m7n.se [46.246.28.121])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4046d56f
 for <wireguard@lists.zx2c4.com>;
 Thu, 12 Apr 2018 13:07:16 +0000 (UTC)
Received: from reyes.m7n.se (unknown
 [IPv6:2001:470:dfae:1000:908f:d87e:1d9b:cebe])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by bond.m7n.se (Postfix) with ESMTPSA id DD5606000AEB
 for <wireguard@lists.zx2c4.com>; Thu, 12 Apr 2018 13:21:15 +0000 (UTC)
Subject: Re: wg-ip, a tool to assign automatic ip addresses to wireguard
 interfaces
To: wireguard@lists.zx2c4.com
References: <CAHLp1Yk8oz-agDoJzKuU1SK9zsFL7HKep02r-n3hNcrYffp-CQ@mail.gmail.com>
 <CAHLp1YndY6g+WdQbNOYdo5AdGR22doGZN0_cVc+f2pG=bn8F-Q@mail.gmail.com>
 <CAHLp1YkNypEBTK3MWN9hOgBt9p1jh1z76U0tdGTccbJ_PeA=Pw@mail.gmail.com>
From: mikma.wg@m7n.se
Message-ID: <5ca6b5b4-ac07-a059-d5a0-afa7600c22ab@m7n.se>
Date: Thu, 12 Apr 2018 15:21:15 +0200
MIME-Version: 1.0
In-Reply-To: <CAHLp1YkNypEBTK3MWN9hOgBt9p1jh1z76U0tdGTccbJ_PeA=Pw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>



On 04/12/2018 01:42 PM, Christophe-Marie Duquesne wrote:

> Long story short, you need a proper central server that will find the
> next ip address, or you need to stick to ipv6 (and in that case the
> address space makes it pointless to do that check).

I think one option is to use the DHCPv4-over-DHCPv6 (DHCP 4o6) Transport 
defined in RFC 7341. In that case you would need a link-local IPv6 
address which is used with DHCPv6. Via DHCPv6 you will be able to 
receive the DHCP 4o6 server address option. And then request an IPv4 
address using the DHCP 4o6 server.

https://datatracker.ietf.org/doc/rfc7341/

/Mikma
