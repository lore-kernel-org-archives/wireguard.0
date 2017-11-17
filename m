Return-Path: manuel.schoelling@gmx.de
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8382b642
 for <wireguard@lists.zx2c4.com>;
 Fri, 17 Nov 2017 08:16:10 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f9511bdc
 for <wireguard@lists.zx2c4.com>;
 Fri, 17 Nov 2017 08:16:10 +0000 (UTC)
Received: from schoellingm ([193.175.154.19]) by mail.gmx.com (mrgmx003
 [212.227.17.190]) with ESMTPSA (Nemesis) id 0LuP5z-1fDnUZ1G6x-011kwF for
 <wireguard@lists.zx2c4.com>; Fri, 17 Nov 2017 09:20:36 +0100
Message-ID: <1510906834.6309.77.camel@gmx.de>
Subject: Re: Request: Optional "Comment" [Peer] entry
From: Manuel =?ISO-8859-1?Q?Sch=F6lling?= <manuel.schoelling@gmx.de>
To: wireguard@lists.zx2c4.com
Date: Fri, 17 Nov 2017 09:20:34 +0100
In-Reply-To: <7777F2EF-1D1B-4403-91C6-FB4A36C92CC5@lonnie.abelbeck.com>
References: <1510826689.1349863.1174432192.27EE87E6@webmail.messagingengine.com>
 <CAHmME9qvePERJzuUKXz+nMgd9rH2G9T2EkTbyfPO+8oonR+KoQ@mail.gmail.com>
 <7777F2EF-1D1B-4403-91C6-FB4A36C92CC5@lonnie.abelbeck.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

I like the idea of comments!

And while we're at it: having multiple [Peer] section in incompatible
with most other config parsing tools (e.g. python std library's
configparser [1]).
Maybe we could allow the peer section names to be of the form "Peer[A-
Za-z0-9\-]*" or something?
You could also use it for naming peers, i.e. using "Peer-(?P<name>[A-
Za-z0-9\-]+)".

Bye,

Manuel

[1] https://docs.python.org/3.5/library/configparser.html

On Thu, 2017-11-16 at 14:31 -0600, Lonnie Abelbeck wrote:
> I have a suggestion, feature request ...
> 
> With several peers, the output of "wg show" is difficult to visually
> identify the peers at a quick glance.
> 
> How about an optional "Comment = " entry for the [Peer] section.
> 
> For Example:
> --
> [Peer]
> PublicKey = UMJMPFVTzjmzr7SJMQ7k+Z+3Pr1aq4w+5chtUny6Akg=
> Endpoint = [fda6:66b2:b74a:50::3]:51820
> AllowedIPs = 10.4.0.2/32
> Comment = pbx3 - Jetway NF9HG-2930
> --
> 
> For each peer in "wg show" with a "Comment = " defined ...
> --
> peer: HIgo9xNzJMWLKASShiTqIybxZ0U3wGLiUeJ1PKf8ykw=
>   endpoint: [fda6:662b:b74a:50::3]:51820
>   allowed ips: 10.4.0.2/32
>   latest handshake: 3 seconds ago
>   transfer: 376 B received, 680 B sent
>   comment: pbx3 - Jetway NF9HG-2930
> --
> 
> If others like this idea, should the comment be displayed first,
> last, etc. ?
> 
> Truncating the comment string to 64 characters would be fine.  Or
> even 32 chars.
> 
> Thoughts ?
> 
> Lonnie
> 
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
