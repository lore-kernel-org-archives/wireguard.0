Return-Path: norman.shulman@n-dimension.com
Received: from mail-vk0-f49.google.com (mail-vk0-f49.google.com
 [209.85.213.49])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d69f9209
 for <wireguard@lists.zx2c4.com>; Thu, 7 Jul 2016 16:15:08 +0000 (UTC)
Received: by mail-vk0-f49.google.com with SMTP id f7so11157220vkb.3
 for <wireguard@lists.zx2c4.com>; Thu, 07 Jul 2016 09:15:21 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20160706154834.GH2040@lud.polynome.dn42>
References: <CAHmME9rXYm3yV0j5pW3yH59j-C9S=6X8-6OY+b=dkuRq7Vpzvw@mail.gmail.com>
 <CANQAqMX8Bf9taS+VgRYnGwuOoJcG3PL8PNmyOK66O3pHjP6VBw@mail.gmail.com>
 <CAHmME9rRHgEtsJ8F-4UrzZMwOs43T24Jq+mUHO91-oimQXXjwg@mail.gmail.com>
 <CANQAqMV=QeCG9BPvPpaCAu56a+mNi_7sNvhDL=_i4N7WFY1=Ng@mail.gmail.com>
 <CAHmME9qr2H=4Qdzx9Kz4=op-O-yzum0+hJWvazHZ_K7ex05ncQ@mail.gmail.com>
 <CANQAqMVT1UkM3uNQbHUKKysHv-tix-Ds9+KaRw62HVHUK5XC+Q@mail.gmail.com>
 <CAHmME9rh8wCLV3jaqyDBm8ZDuVUC__XZOuzbX1haonO2C_ZCEQ@mail.gmail.com>
 <CANQAqMWY=8WRbz9+bw11oUO2OAi-SFnHv=f+z5jQ0F1MYf5Ruw@mail.gmail.com>
 <CAHmME9pFhJoW+kFmJE7-acmb2q4=EqN+U+dJQ8GDEvBzN_=dRg@mail.gmail.com>
 <CANQAqMX-1MrYW+Yfn6g7BGPwn2qCDWOCoMWkLyM5W9KZgm52tQ@mail.gmail.com>
 <20160706154834.GH2040@lud.polynome.dn42>
From: Norman Shulman <norman.shulman@n-dimension.com>
Date: Thu, 7 Jul 2016 12:15:19 -0400
Message-ID: <CANQAqMW6=tBgOL67UHkjt79xUUcRzx51weE3Lj+8RpX6MkEK+g@mail.gmail.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Content-Type: multipart/alternative; boundary=94eb2c149e9419bfe005370dfe77
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] WireGuard cryptokey routing
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--94eb2c149e9419bfe005370dfe77
Content-Type: text/plain; charset=UTF-8

Look at it from the server side. There are millions of clients on millions
of 192.168.1.0/24 networks, yet a server can communicate with no more than
254 of them.


On Wed, Jul 6, 2016 at 11:48 AM, Baptiste Jonglez <
baptiste@bitsofnetworks.org> wrote:

> On Wed, Jul 06, 2016 at 11:31:28AM -0400, Norman Shulman wrote:
> > Ethernet networks don't scale; that's why we have IP networks.
>
> Wireguard does not use Ethernet at all, it operates purely at layer 3 (IP).
>
> IP over Ethernet would use a reactive scheme (ARP, Neighbour Discovery) to
> discover the mapping between IP addresses and link-layer addresses.  This
> is part of the reason why Ethernet does not scale well.
>
> Wireguard, on the other hand, does the equivalent mapping statically, via
> the AllowedIPs directive.  The mapping is also slightly different:
>
> - with Ethernet, you map from IP address to MAC address (using ARP or ND)
>
> - Wireguard maps from IP address to public key (using AllowedIP, so this
>   is completely static).  A public key is then mapped to the IP address
>   and UDP port of the peer on the Internet, using the last known endpoint
>   of the peer.  This makes this second mapping mostly dynamic, even though
>   it falls back to a static "Endpoint" configuration for bootstrap.
>
> Does that make things clearer for you?
>
> > So in general a client needs one address for each server? Rather limiting
> > for clients on small subnets, especially considering the case of n
> clients
> > on a subnet, each connecting to m different servers.
> >
> >
> >
> >
> > On Tue, Jul 5, 2016 at 3:11 PM, Jason A. Donenfeld <Jason@zx2c4.com>
> wrote:
> >
> > > On Tue, Jul 5, 2016 at 9:09 PM, Norman Shulman
> > > <norman.shulman@n-dimension.com> wrote:
> > > > How is this enforced?
> > > Receiving, line 238 here:
> > > https://git.zx2c4.com/WireGuard/tree/src/receive.c#n238
> > > Sending, line 112 here:
> > > https://git.zx2c4.com/WireGuard/tree/src/device.c#n112
> > >
> > > > How does this scale?
> > > The same way in which an ethernet network scales? One ethernet device
> > > can have multiple IPs, but separate (unbonded) ethernet devices
> > > generally do not share IPs.
> > >
>
> > _______________________________________________
> > WireGuard mailing list
> > WireGuard@lists.zx2c4.com
> > http://lists.zx2c4.com/mailman/listinfo/wireguard
>
>


-- 
Norman Shulman
Sr. Developer/Architect
N-Dimension Solutions Inc.
9030 Leslie St, Unit 300
Richmond Hill, ON L4B 1G2
Canada

Tel: 905 707-8884 x 226
Fax: 905 707-0886

This email and any files transmitted with it are solely intended for the
use of the named recipient(s) and may contain information that is
privileged and confidential. If you receive this email in error, please
immediately notify the sender and delete this message in all its forms.

--94eb2c149e9419bfe005370dfe77
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Look at it from the server side. There are millions of cli=
ents on millions of <a href=3D"http://192.168.1.0/24">192.168.1.0/24</a> ne=
tworks, yet a server can communicate with no more than 254 of them.<div><br=
></div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On W=
ed, Jul 6, 2016 at 11:48 AM, Baptiste Jonglez <span dir=3D"ltr">&lt;<a href=
=3D"mailto:baptiste@bitsofnetworks.org" target=3D"_blank">baptiste@bitsofne=
tworks.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span cl=
ass=3D"">On Wed, Jul 06, 2016 at 11:31:28AM -0400, Norman Shulman wrote:<br=
>
&gt; Ethernet networks don&#39;t scale; that&#39;s why we have IP networks.=
<br>
<br>
</span>Wireguard does not use Ethernet at all, it operates purely at layer =
3 (IP).<br>
<br>
IP over Ethernet would use a reactive scheme (ARP, Neighbour Discovery) to<=
br>
discover the mapping between IP addresses and link-layer addresses.=C2=A0 T=
his<br>
is part of the reason why Ethernet does not scale well.<br>
<br>
Wireguard, on the other hand, does the equivalent mapping statically, via<b=
r>
the AllowedIPs directive.=C2=A0 The mapping is also slightly different:<br>
<br>
- with Ethernet, you map from IP address to MAC address (using ARP or ND)<b=
r>
<br>
- Wireguard maps from IP address to public key (using AllowedIP, so this<br=
>
=C2=A0 is completely static).=C2=A0 A public key is then mapped to the IP a=
ddress<br>
=C2=A0 and UDP port of the peer on the Internet, using the last known endpo=
int<br>
=C2=A0 of the peer.=C2=A0 This makes this second mapping mostly dynamic, ev=
en though<br>
=C2=A0 it falls back to a static &quot;Endpoint&quot; configuration for boo=
tstrap.<br>
<br>
Does that make things clearer for you?<br>
<span class=3D""><br>
&gt; So in general a client needs one address for each server? Rather limit=
ing<br>
&gt; for clients on small subnets, especially considering the case of n cli=
ents<br>
&gt; on a subnet, each connecting to m different servers.<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; On Tue, Jul 5, 2016 at 3:11 PM, Jason A. Donenfeld &lt;<a href=3D"mail=
to:Jason@zx2c4.com">Jason@zx2c4.com</a>&gt; wrote:<br>
&gt;<br>
&gt; &gt; On Tue, Jul 5, 2016 at 9:09 PM, Norman Shulman<br>
&gt; &gt; &lt;<a href=3D"mailto:norman.shulman@n-dimension.com">norman.shul=
man@n-dimension.com</a>&gt; wrote:<br>
&gt; &gt; &gt; How is this enforced?<br>
&gt; &gt; Receiving, line 238 here:<br>
&gt; &gt; <a href=3D"https://git.zx2c4.com/WireGuard/tree/src/receive.c#n23=
8" rel=3D"noreferrer" target=3D"_blank">https://git.zx2c4.com/WireGuard/tre=
e/src/receive.c#n238</a><br>
&gt; &gt; Sending, line 112 here:<br>
&gt; &gt; <a href=3D"https://git.zx2c4.com/WireGuard/tree/src/device.c#n112=
" rel=3D"noreferrer" target=3D"_blank">https://git.zx2c4.com/WireGuard/tree=
/src/device.c#n112</a><br>
&gt; &gt;<br>
&gt; &gt; &gt; How does this scale?<br>
&gt; &gt; The same way in which an ethernet network scales? One ethernet de=
vice<br>
&gt; &gt; can have multiple IPs, but separate (unbonded) ethernet devices<b=
r>
&gt; &gt; generally do not share IPs.<br>
&gt; &gt;<br>
<br>
</span>&gt; _______________________________________________<br>
&gt; WireGuard mailing list<br>
&gt; <a href=3D"mailto:WireGuard@lists.zx2c4.com">WireGuard@lists.zx2c4.com=
</a><br>
&gt; <a href=3D"http://lists.zx2c4.com/mailman/listinfo/wireguard" rel=3D"n=
oreferrer" target=3D"_blank">http://lists.zx2c4.com/mailman/listinfo/wiregu=
ard</a><br>
<br>
</blockquote></div><br><br clear=3D"all"><div><br></div>-- <br><div class=
=3D"gmail_signature" data-smartmail=3D"gmail_signature">Norman Shulman<br>S=
r. Developer/Architect<br>N-Dimension Solutions Inc.<br>9030 Leslie St, Uni=
t 300<br>Richmond Hill, ON L4B 1G2<br>Canada<br><br>Tel: 905 707-8884 x 226=
<br>Fax: 905 707-0886<br><br>This email and any files transmitted with it a=
re solely intended for the use of the named recipient(s) and may contain in=
formation that is privileged and confidential. If you receive this email in=
 error, please immediately notify the sender and delete this message in all=
 its forms.</div>
</div>

--94eb2c149e9419bfe005370dfe77--
