Return-Path: toke@toke.dk
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 12364389
 for <wireguard@lists.zx2c4.com>;
 Sun, 16 Sep 2018 17:45:39 +0000 (UTC)
Received: from mail.toke.dk (mail.toke.dk [52.28.52.200])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4185363d
 for <wireguard@lists.zx2c4.com>;
 Sun, 16 Sep 2018 17:45:38 +0000 (UTC)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
To: Lane Russell <lanerussell@protonmail.com>,
 David Cowden <david.w.cowden@gmail.com>
Subject: Re: Configure WireGuard for Roaming Between IPv4, IPv6
In-Reply-To: <jbnB37pGZpZyPR34uyzg8hAsh9mvscgKeDF24wj3jh_h2q7PjAFmqwOKTzINMcNv4P6fsHfR3n3Slyfd2TfdpNkQz-zWHI_Yj84S8Rk0uPw=@protonmail.com>
References: <cLOCDzwe4IyvMeayGnJqwGcbyBRfTtha5e0S0zJ33t_4tNCutwD-Krje6NTotKw_lIJdZT7ldacMCg7Rv-m3UuEzS-diWg3-5Z3VE2J_thk=@protonmail.com>
 <CAD=29B_P0eF7f3m5cKfxmm0hy8KqVA1dgfmagcotz84eqO_nvQ@mail.gmail.com>
 <jbnB37pGZpZyPR34uyzg8hAsh9mvscgKeDF24wj3jh_h2q7PjAFmqwOKTzINMcNv4P6fsHfR3n3Slyfd2TfdpNkQz-zWHI_Yj84S8Rk0uPw=@protonmail.com>
Date: Sun, 16 Sep 2018 19:47:08 +0200
Message-ID: <87pnxd8hcz.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain
Cc: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Lane Russell <lanerussell@protonmail.com> writes:

> Thanks so much for setting me straight. I've gotten IPv6 working over
> my IPv4 tunnels to ensure that IPv6 traffic can't leak out while I'm
> using Wireguard. Since my ISP uses SLAAC to hand out /56s, I have a
> /64 pointed at the local subnet where my VPN server is. From there,
> the VPN clients use my ULA prefix to talk to the server. The server
> masquerades these ULA addresses to its global address.

Why are you using masquerading? Kinda defeats the whole point of IPv6,
doesn't it? :)

You can just pick a public /64 from your subnet and assign that for use
inside the tunnel, then give your clients addresses from that and use
normal routing on the wireguard server. You'll have to get the prefix
routed to your wireguard server, of course; either set that up manually,
or use something like DHCP prefix delegation, or a routing daemon...

If you don't want to use a whole /64 (but really, there's no reason you
shouldn't be able to), you can also use /128's inside the tunnel and
just route those from your gateway to your wireguard server.

-Toke
