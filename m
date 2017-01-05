Return-Path: oiaohm@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b70f6743
 for <wireguard@lists.zx2c4.com>; Thu, 5 Jan 2017 10:58:58 +0000 (UTC)
Received: from mail-yw0-f173.google.com (mail-yw0-f173.google.com
 [209.85.161.173])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 64b5fc0f
 for <wireguard@lists.zx2c4.com>; Thu, 5 Jan 2017 10:58:58 +0000 (UTC)
Received: by mail-yw0-f173.google.com with SMTP id t125so339088702ywc.1
 for <wireguard@lists.zx2c4.com>; Thu, 05 Jan 2017 03:08:03 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAHmME9qS7ptMcCuvxcobi12hgfYdd4yYcOW5+D_uL6uOGq2f2A@mail.gmail.com>
References: <CANA3KFU0THGCkVhCsEC4CMfoj394XetYZ_TebyFGTwYiDZ9cBg@mail.gmail.com>
 <CAHmME9qS7ptMcCuvxcobi12hgfYdd4yYcOW5+D_uL6uOGq2f2A@mail.gmail.com>
From: Peter Dolding <oiaohm@gmail.com>
Date: Thu, 5 Jan 2017 21:08:01 +1000
Message-ID: <CANA3KFWZP9XmCyWNnb19ywGRa8q57OUNt=42G1yjqkvLYc1kPw@mail.gmail.com>
Subject: Re: Built-in Roaming is limited due to a design fault adding STUN and
 TURN support would be good and make wire-guard connections more
 durable.
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Content-Type: text/plain; charset=UTF-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Tue, Jan 3, 2017 at 12:18 AM, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> Hi Peter,
>
> That's a pretty bombastic and rambling way to put a simple point. I
> believe you're conflating two different things. Let's break it down:
>
> 1. Dynamic IPs.
> 2. Both peers behind NAT.
That misses one completely
3. Server and Peers both behind NAT.   Yes there is a usage case for this one.
>
> With regard to dynamic IPs, the solution is to use a dynamic DNS
> service, and simply use the DNS name as the endpoint. When you set up
> the device after being disconnected, userspace will do the DNS lookup
> to determine a current IP. When you're already connected to that IP,
> WireGuard's roaming capabilities will automatically keep track of IP
> updates.

Dynamic DNS has it weaknesses.   Transparent DNS caching and DNS
access restrictions in some networks mess with the solution you
describe.

https://tools.ietf.org/html/rfc3489

For Voip STUN was developed for many reasons three key reasons.
1. you can username and password protect a STUN server so restricting
the users who can find out about the service.
2 . It does support TLS so encrypted.
3. Information on a STUN server is not replaced to other servers like
lots of dynamic DNS are so in case of attack there are limited sources
of information.

Dynamic DNS option really using a hack that was not suitable for voip
yet for some reason people think it suitable to use for VPN.   Dynamic
DNS is not designed for punching though NAT solutions for the server
address like STUN is or designed to limit access to the address
information like STUN is.

>
> With regard to NAT, this is where you want your STUN-like solution.
> However, this does _not_ belong inside of WireGuard. This is where you
> simply need some basic userspace utility to handle punching holes in
> NAT/firewall, and then bringing up the WireGuard interface with the
> discovered address/port. It's not that complicated. In fact, there was
> already a substantial discussion about this on the list (did you check
> the archives?), and I wound up writing a simple PoC utility for it:
> https://git.zx2c4.com/WireGuard/tree/contrib/examples/nat-hole-punching/README
> It works well, though it of course needs work before it's
> production-ready.
This example the WireGuard server has a public IP address.   The case
I am mentioning Wireguard server may not have a public IP address.

Now STUN will attempt hole punching in the case you don't have a
public IP address for the WireGuard server if the NAT in use are
cooperative.   Of course if you read STUN rfc they state the case
where STUN cannot be used to create a link between server and client
both behind NATs as long as the STUN server is in the open.

TURN relay protocol used in SIP and other usage cases is for when you
don't have a public IP address of your own and you are behind NAT
solutions where you cannot form a direct link between client and
server.
https://tools.ietf.org/html/rfc5766

TURN is not without is overhead.   Now if you are hosting a TURN
server somewhere it does not have to contain any important encryption
information as it just a Relay point.

> Perhaps you could rewrite it to use your glib-based
> libnice? Send an email here when you've got a github repo for
> something like this, as I'm sure a few others on the list might
> benefit from it too.
>

Jason the issue here to be able to use STUN/TURN combination in all
cases I need Wireguard to be able to be directed to use TURN.

The difference is a turn relay server is not holding critical secrets.

Current model is
[Client]-[Server]
What is needed is
[Client]-[Relay]-[Server] with [Client]-[Server] to cover all usage
cases.   Of course the relay being something standard and common
reduces the number of servers that have to be publicly deployed and
maintained.

This is a fault in a lot of VPN designs no relay option because is
always presumed that you can get a public IP the clients can access
for the server and the location where you can get the public IP
address is suitable to house the encryption keys that is not always
the case.   With a TURN server relay option packets passing though the
TURN relay server will remain encoded at the relay server this does
solve the issue where the encryption keys due to privacy acts have to
remain inside a particular country or department.    The only part
that requires a public address when using a TURN is the TURN relay
server.    This is just not reinventing the wheel protocol that is
fairly widely deployed being TURN can provide Relay option.    A VPN
that can run with TURN relays means servers and peers containing
encryption keys don't have to be on the internet exposed IP addresses.

Jason I don't code that much I work on deployments.    I have run into
issues where I don't have a public IP address to use.   I have used
solutions containing libnice  to get me around problems.  Libnice is
not my project.

Please do note needing TURN/Relay comes important even when attempt to
link up clients by IRC, Xmmp or other resolve methods where it may
turn out that both ends are sitting behind NAT where direct
connectivity is impossible.

Peter Dolding
