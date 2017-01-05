Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 40545e2d
 for <wireguard@lists.zx2c4.com>; Thu, 5 Jan 2017 20:23:56 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4c133813
 for <wireguard@lists.zx2c4.com>; Thu, 5 Jan 2017 20:23:56 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4910ae9a
 for <wireguard@lists.zx2c4.com>; Thu, 5 Jan 2017 20:23:56 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 35e81c17
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 5 Jan 2017 20:23:56 +0000 (UTC)
Received: by mail-oi0-f49.google.com with SMTP id b126so594072417oia.2
 for <wireguard@lists.zx2c4.com>; Thu, 05 Jan 2017 12:33:04 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CANA3KFWZP9XmCyWNnb19ywGRa8q57OUNt=42G1yjqkvLYc1kPw@mail.gmail.com>
References: <CANA3KFU0THGCkVhCsEC4CMfoj394XetYZ_TebyFGTwYiDZ9cBg@mail.gmail.com>
 <CAHmME9qS7ptMcCuvxcobi12hgfYdd4yYcOW5+D_uL6uOGq2f2A@mail.gmail.com>
 <CANA3KFWZP9XmCyWNnb19ywGRa8q57OUNt=42G1yjqkvLYc1kPw@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 5 Jan 2017 21:33:03 +0100
Message-ID: <CAHmME9qG4KnuFOCVi6w8fUJ9DVDL9_XjZnWxWPQGQaaPz6UTQw@mail.gmail.com>
Subject: Re: Built-in Roaming is limited due to a design fault adding STUN and
 TURN support would be good and make wire-guard connections more
 durable.
To: Peter Dolding <oiaohm@gmail.com>
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

Hi Peter,

On Thu, Jan 5, 2017 at 12:08 PM, Peter Dolding <oiaohm@gmail.com> wrote:
>> 1. Dynamic IPs.
>> 2. Both peers behind NAT.
> That misses one completely
> 3. Server and Peers both behind NAT.   Yes there is a usage case for this one.

WireGuard has no concept of client/server. There are only peers. So,
when I wrote "both peers behind NAT", I most certainly had in mind
what you refer to as "server and peer". Please reread my answer in
light of this new understanding.

> Dynamic DNS has it weaknesses.   Transparent DNS caching and DNS
> access restrictions in some networks mess with the solution you
> describe.
>
> https://tools.ietf.org/html/rfc3489
>
> For Voip STUN was developed for many reasons three key reasons.
> 1. you can username and password protect a STUN server so restricting
> the users who can find out about the service.
> 2 . It does support TLS so encrypted.
> 3. Information on a STUN server is not replaced to other servers like
> lots of dynamic DNS are so in case of attack there are limited sources
> of information.
>
> Dynamic DNS option really using a hack that was not suitable for voip
> yet for some reason people think it suitable to use for VPN.   Dynamic
> DNS is not designed for punching though NAT solutions for the server
> address like STUN is or designed to limit access to the address
> information like STUN is.

So, as I already wrote in my previous email, implement a STUN tool for
setting up initial WireGuard communications. The example code I linked
to already provides a framework on how this might be done. Just
replace my homebaked hooks with whatever STUN library tickles your
fancy.

> This example the WireGuard server has a public IP address.   The case
> I am mentioning Wireguard server may not have a public IP address.

Um, no. Did you even read the example? Both WireGuard peers have
private IP addresses. Only the NAT-helper server has a public IP
address. This is the same model as STUN. Spend some time actually
reading and studying the work already done on this before wasting more
time with long emails.

> Now STUN will attempt hole punching in the case you don't have a
> public IP address for the WireGuard server if the NAT in use are
> cooperative.   Of course if you read STUN rfc they state the case
> where STUN cannot be used to create a link between server and client
> both behind NATs as long as the STUN server is in the open.

The example code I linked to presents the same model.

> Jason the issue here to be able to use STUN/TURN combination in all
> cases I need Wireguard to be able to be directed to use TURN.

Great. I already outlined how this could be done, and I provided
example code. Plug your STUN or TURN library into that, and you'll be
all set.

No, I'm not going to write it for you. You got a NAT-punching example
from me. You can get a STUN/TURN library from somebody else. All
that's left for you is putting them together.

> Current model is
> [Client]-[Server]
> What is needed is
> [Client]-[Relay]-[Server] with [Client]-[Server] to cover all usage
> cases.   Of course the relay being something standard and common
> reduces the number of servers that have to be publicly deployed and
> maintained.

Yes, I'm aware. And this is exactly what the example code demonstrates
is possible.

> This is a fault in a lot of VPN designs no relay option because is
> always presumed that you can get a public IP the clients can access
> for the server and the location where you can get the public IP
> address is suitable to house the encryption keys that is not always
> the case.   With a TURN server relay option packets passing though the
> TURN relay server will remain encoded at the relay server this does
> solve the issue where the encryption keys due to privacy acts have to
> remain inside a particular country or department.    The only part
> that requires a public address when using a TURN is the TURN relay
> server.    This is just not reinventing the wheel protocol that is
> fairly widely deployed being TURN can provide Relay option.    A VPN
> that can run with TURN relays means servers and peers containing
> encryption keys don't have to be on the internet exposed IP addresses.

Great, so plug your TURN library into some resembling the example I
wrote, and you'll be all set.

> Jason I don't code that much I work on deployments.    I have run into
> issues where I don't have a public IP address to use.   I have used
> solutions containing libnice  to get me around problems.  Libnice is
> not my project.

Then integrate libnice into my example code, and you'll have what you want.

> Please do note needing TURN/Relay comes important even when attempt to
> link up clients by IRC, Xmmp or other resolve methods where it may
> turn out that both ends are sitting behind NAT where direct
> connectivity is impossible.

Yes, I'm aware. Again, see example code. Replace the homebrewed
structures with a STUN/TURN library.

Please do not write again until you've read the example code and taken
the time to understand what it does.

Regards,
Jason
