Return-Path: me.kalin@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4d231d76
 for <wireguard@lists.zx2c4.com>; Mon, 5 Mar 2018 19:33:30 +0000 (UTC)
Received: from mail-oi0-f51.google.com (mail-oi0-f51.google.com
 [209.85.218.51])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9b9a1b11
 for <wireguard@lists.zx2c4.com>; Mon, 5 Mar 2018 19:33:30 +0000 (UTC)
Received: by mail-oi0-f51.google.com with SMTP id c18so12964757oiy.9
 for <wireguard@lists.zx2c4.com>; Mon, 05 Mar 2018 11:42:46 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <9de22427-0180-ac5a-cd7c-b5f9810ecbf9@posteo.net>
References: <d98b43d3-b847-c1c5-931a-5c3164061058@posteo.net>
 <9de22427-0180-ac5a-cd7c-b5f9810ecbf9@posteo.net>
From: Kalin KOZHUHAROV <me.kalin@gmail.com>
Date: Mon, 5 Mar 2018 20:42:25 +0100
Message-ID: <CAKXLc7dPyiqBYCNedFc6cPyGCh3j4RmO7fKU+BNsH4g8T2dJKw@mail.gmail.com>
Subject: Re: Update: exempting two things from WireGuard tunneling
To: Nicholas Joll <najoll@posteo.net>
Content-Type: text/plain; charset="UTF-8"
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Mon, Mar 5, 2018 at 7:59 PM, Nicholas Joll <najoll@posteo.net> wrote:
>     I've tried all sorts of things to answer my own question (the questio=
n I asked the list a little while ago; my initial e-mail is appended below)=
 but to no avail. However, I've found something, on the Wireguard list itse=
lf, which looks as though it may help - but I do not understand it well eno=
ugh. Might anyone help? The material I found is located here: https://marc.=
info/?l=3Dwireguard&m=3D148813372820847&w=3D2
>
May be it was too vague of a question/statement...

> I'd like to exempt two things from WG:
>
What does exempt mean?
You can "NOT route" packets via a wg interface (fix your routing,
subnets, etc.), or BLOCK packets with a firewall (e.g. nftables,
iptables). 1st is better if possible (requires redesign), 2nd may be
easier. Combining both is the best.


> (1) some samba shares, accessed
> via autofs, which give me enough trouble without having VPN dropouts
> (courtesy of my VPN provider and/or my ISP) as well,
>
"samba shares" is like "red car"...
there are quite a few protocols involved with them, most of them run
atop UDP and TCP or both.

> (2) Netflix (which I run via a Chrome app).
... cannot help you much here, but I guess it is some tcp, udp and rtp
mix to some large cloud of IPs.

> The samba shares all have fixed IPs and most of
> them are on a single Windows machine, on my home network, and another
> share is to router-attached USB storage (and only works on Samba
> protocol version 1, for some reason; the other shares work on version 3).
>
draw a map (on paper) or ascii art or something, put some IP
addresses, fake if you are worried.

> I imagine many people will want to do each of these things. There was
> something on the list a long time back, I think, about 2, but it was too
> technical for me to understand. (My VPN and Wireguard knowledge is
> minimal, though I have Bash scripts that put WG up and take it down, and
> tell it which servers(s) to use.)
>
Those are some (aadvanced) routing rules, you probably can live with
standard, if you can choose the IP addresses/networks you connect to
(home).

Really, try to draw a diagram. If you cannot - then it is probably too
complex and wireguard is not gonna help you.

Cheers,
Kalin.
