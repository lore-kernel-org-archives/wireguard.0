Return-Path: toke@toke.dk
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0946ff2c
 for <wireguard@lists.zx2c4.com>;
 Sun, 16 Sep 2018 18:20:38 +0000 (UTC)
Received: from mail.toke.dk (mail.toke.dk [52.28.52.200])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 499ba024
 for <wireguard@lists.zx2c4.com>;
 Sun, 16 Sep 2018 18:20:38 +0000 (UTC)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
To: Lane Russell <lanerussell@protonmail.com>, david.w.cowden@gmail.com
Subject: Re: Configure WireGuard for Roaming Between IPv4, IPv6
In-Reply-To: <Ea_ThlFNfnz6b5yIEpIB8ZPryiwewgFtSFd-PyXbPB5vQZQ91Es-IjDzPAbJxuux3Zr8pTAtwC9X0M3GXw08pVyqrDIOQBnxIdmiS_-6y8Y=@protonmail.com>
References: <cLOCDzwe4IyvMeayGnJqwGcbyBRfTtha5e0S0zJ33t_4tNCutwD-Krje6NTotKw_lIJdZT7ldacMCg7Rv-m3UuEzS-diWg3-5Z3VE2J_thk=@protonmail.com>
 <CAD=29B_P0eF7f3m5cKfxmm0hy8KqVA1dgfmagcotz84eqO_nvQ@mail.gmail.com>
 <jbnB37pGZpZyPR34uyzg8hAsh9mvscgKeDF24wj3jh_h2q7PjAFmqwOKTzINMcNv4P6fsHfR3n3Slyfd2TfdpNkQz-zWHI_Yj84S8Rk0uPw=@protonmail.com>
 <87pnxd8hcz.fsf@toke.dk>
 <Ea_ThlFNfnz6b5yIEpIB8ZPryiwewgFtSFd-PyXbPB5vQZQ91Es-IjDzPAbJxuux3Zr8pTAtwC9X0M3GXw08pVyqrDIOQBnxIdmiS_-6y8Y=@protonmail.com>
Date: Sun, 16 Sep 2018 20:22:07 +0200
Message-ID: <87mush8fqo.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain
Cc: wireguard@lists.zx2c4.com
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Lane Russell <lanerussell@protonmail.com> writes:

> Since this is a home setup and my /56 might (will) change at some
> point, I don't want to have to reconfigure my router, server, and
> clients. Unless there's a way to dynamically reconfigure these devices
> in such a situation?

Ah, right; renumbering is a PITA. Hmm, you could tell your ISP to get a
clue and stop doing that? ;)

Otherwise I suppose it *may* be possible to run a DHCPv6 server on the
wireguard server. Assuming the clients have the server configured with
AllowedIPs=::/0, the DHCP request should get through to the server. So
as long as the DHCP daemon replies via unicast, it could work. You'd
need to manually configure a static link-local (fe80::/64) address for
each client, which can be used as a source address for a DHCP request.
And then have a trigger script on the wireguard server add the IP to
AllowedIPs for the peer when it assigns an IP. I think odhcpd (that is
used on OpenWrt) allows this at least.

Note I haven't tested this; but I *think* it could be made to work, with
a bit of tweaking :)

-Toke
