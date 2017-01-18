Return-Path: oiaohm@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 73305622
 for <wireguard@lists.zx2c4.com>;
 Wed, 18 Jan 2017 05:44:44 +0000 (UTC)
Received: from mail-yw0-f175.google.com (mail-yw0-f175.google.com
 [209.85.161.175])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 012157d8
 for <wireguard@lists.zx2c4.com>;
 Wed, 18 Jan 2017 05:44:44 +0000 (UTC)
Received: by mail-yw0-f175.google.com with SMTP id w75so1945150ywg.1
 for <wireguard@lists.zx2c4.com>; Tue, 17 Jan 2017 21:55:27 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <F343B5F3-4A99-4F0D-B5BE-DBDC0CDECE09@danrl.com>
References: <CANA3KFU0THGCkVhCsEC4CMfoj394XetYZ_TebyFGTwYiDZ9cBg@mail.gmail.com>
 <CAHmME9qS7ptMcCuvxcobi12hgfYdd4yYcOW5+D_uL6uOGq2f2A@mail.gmail.com>
 <CANA3KFWZP9XmCyWNnb19ywGRa8q57OUNt=42G1yjqkvLYc1kPw@mail.gmail.com>
 <CAHmME9qG4KnuFOCVi6w8fUJ9DVDL9_XjZnWxWPQGQaaPz6UTQw@mail.gmail.com>
 <CANA3KFUyf6NP9hu5i0rWfaKq7a27NQhWg4z-LE2SnTHTrbKM9g@mail.gmail.com>
 <F343B5F3-4A99-4F0D-B5BE-DBDC0CDECE09@danrl.com>
From: Peter Dolding <oiaohm@gmail.com>
Date: Wed, 18 Jan 2017 15:55:25 +1000
Message-ID: <CANA3KFWHVtdDTRPqrbOfqJmHU=oh=ZDHitHmjBRO=xv+LnjYJg@mail.gmail.com>
Subject: Re: Built-in Roaming is limited due to a design fault adding STUN and
 TURN support would be good and make wire-guard connections more
 durable.
To: =?UTF-8?Q?Dan_L=C3=BCdtke?= <mail@danrl.com>
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

On Sun, Jan 15, 2017 at 6:39 PM, Dan L=C3=BCdtke <mail@danrl.com> wrote:
> Hi Peter,
>
> I followed this thread and like to express some concerns. Although I see =
the problem and ran into it myself, I would like to see a solution outside =
the wireguard code. Like the one Jason proposed or even a new approach. I a=
m afraid that network layers problems (legacy IP and especially NAT) are ab=
out to uglify yet another beautiful protocol. None of the problems stated i=
n this thread have I ever observed in an dual stack or in a IP (read IPv6) =
environment. This is all inconvenience that legacy IP (read IPv4) brings an=
d that is caused by ten+ years of overprovisioning and not taking care of t=
he network layer of the infrastructure. It is 2017, run IPv6. There should =
not be a single line of code in wireguard that deals with broken infrastruc=
ture. There is plenty of room for all kinds of workarounds in the userspace=
. Like the scripts in the Wireguard repository. I see the problem, agree on=
 it, but It is out of the scope for wireguard to solve. The infrastructure =
must be able to somehow connect to peers via UDP. That is I think the least=
 one can expect from a network layer. Whatever _outside_ magic it may need =
due to historical protocol usage.
>
> My concerns expressed and all that said, I would love to see some code or=
 PoC. Code and pcaps are king :)
>
> I solved the problem using ipv6 only when I ran into it. May require to f=
inally invest in state of the art layer 3 protocol usage in some cases. How=
ever, it's overdue anyway. Wireguards roaming feature tool care of the site=
s where even the ipv6 prefix changes from time to time. HTH.
>
> Cheers,
>
> Dan
>
https://mirrors.bieringer.de/Linux+IPv6-HOWTO/nat-netfilter6..html

I am sorry to say double nat happens even in IPv6 not common in most
countries.   You find it when you have country firewalls.    Nat
issues are not fixed by going IPv6 only reduced how often people will
hit them.  Only delayed until the point that was giving you NAT issues
under IPv4 decides to update their hardware to IPv6 and leaves the
same Nat settings in place.


IPv6 has all the same nat configurations as IPv4.   The larger address
range of ipv6 means you should not need to do it.  But if country or
company wants to create a internet access limitation point  forcing
all traffic to be NAT converted before internet access is one of those
things.

Calling NAT legacy in IPv6 has something very wrong.   If you are
behind a nat that is IPv6 aware even attempting to tunnel out by ipv4
does not work.    Even if everyone was using IPv6 right now there
would still be users due to country and carrier ideals behind all the
types of NAT STUN rfc documents.

If NAT was not part of IPv6 systems in the same forms as what was in
IPv4 you would have an arguement.   You have made a big error in
thinking that the problem of punching though NAT disappears when IPv6
is deployed.   The need to punch though NAT with IPv6 reduces are
places switch to IPv6 but you have the stubborn hold outs(government
regulations stating nats be used) or the incompetent operators who
duplicate configuration from IPv4 to IPv6 so leaving carrier NAT in
place or Carriers intentionally putting NAT to have two tier pricing
for business and home.   Yes that dual stack stunt you are currently
using to get around NAT if you carrier upgrades to a smarter IPv6/IPv4
NAT is going to fail over night as your direct connection by IPv6
disappears.

Why would a carrier intentionally deploy a NAT that STUN and other NAT
punching solutions cannot cope with even when you have IPv6 simple so
they can charge 2 different plans 1 for home and 1 for business of
course those on home who are not meant to be running servers get stuck
behind the NAT.     NAT is not just about over-provisioning it also
about being a jerk.    If NAT was only used for over-provisioning then
IPv6 increased addresses would make it disappear problem is it also
used to limited what users can do with their ISP account.

Dan your IPv6 work around only working because you are not seeing
ip/v6 aware NATs.     In a world of pure IPV6  like it or not NAT
punching and working around is part of it.     Wireguard current
roaming feature will fail when it hitting different IPv6 nats as the
change address packet will be blocked for the same reason as being
from a IP address that the NAT has not communicated with.    Dan you
are not alone thinking that IPv6 fixes more than what it does because
their carriers have not updated their hardware or their carriers have
decided for IPv6 to reduce the NAT count..

Peter Dolding
