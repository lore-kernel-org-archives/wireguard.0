Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 639d957f
 for <wireguard@lists.zx2c4.com>; Tue, 5 Jul 2016 16:31:27 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id dc52cbc1
 for <wireguard@lists.zx2c4.com>; Tue, 5 Jul 2016 16:31:24 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 3dfaf10c
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 5 Jul 2016 16:31:24 +0000 (UTC)
Received: by mail-lf0-f42.google.com with SMTP id l188so138336728lfe.2
 for <wireguard@lists.zx2c4.com>; Tue, 05 Jul 2016 09:34:51 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAHmME9qr2H=4Qdzx9Kz4=op-O-yzum0+hJWvazHZ_K7ex05ncQ@mail.gmail.com>
References: <CANQAqMXqQv_MkEsLSuSHNVqHGJuy6yVHhVP4mM6v3x+5iVbVqA@mail.gmail.com>
 <CAHmME9rXYm3yV0j5pW3yH59j-C9S=6X8-6OY+b=dkuRq7Vpzvw@mail.gmail.com>
 <CANQAqMX8Bf9taS+VgRYnGwuOoJcG3PL8PNmyOK66O3pHjP6VBw@mail.gmail.com>
 <CAHmME9rRHgEtsJ8F-4UrzZMwOs43T24Jq+mUHO91-oimQXXjwg@mail.gmail.com>
 <CANQAqMV=QeCG9BPvPpaCAu56a+mNi_7sNvhDL=_i4N7WFY1=Ng@mail.gmail.com>
 <CAHmME9qr2H=4Qdzx9Kz4=op-O-yzum0+hJWvazHZ_K7ex05ncQ@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 5 Jul 2016 18:34:48 +0200
Message-ID: <CAHmME9o_tg1qyoi9+kgjLopz=ZSyVFhBXnP8o4SPpiTwi64jkw@mail.gmail.com>
To: Norman Shulman <norman.shulman@n-dimension.com>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: multipart/alternative; boundary=001a114010ee1d7e040536e6084b
Subject: [WireGuard] Fwd: WireGuard cryptokey routing
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--001a114010ee1d7e040536e6084b
Content-Type: text/plain; charset=UTF-8

Hi Norm,

I'm moving this discussion over to the mailing list. Please be sure to keep
wireguard@lists.zx2c4.com CC'd in your replies if you'd like a response.

Our prior conversation follows below.

Regards,
Jason

Forwarded conversation
Subject: WireGuard cryptokey routing
------------------------

From: *Norman Shulman* <norman.shulman@n-dimension.com>
Date: Tue, Jul 5, 2016 at 5:58 PM
To: team@wireguard.io


You state:

"
In the server configuration, when the network interface wants to send a
packet to a peer (a client), it looks at that packet's destination IP and
compares it to each peer's list of allowed IPs to see which peer to send it
to.
...
In other words, when sending packets, the list of allowed IPs behaves as a
sort of routing table
"

But the allowed IPs can be non-routable addresses, so they are not
necessarily unique.

----------
From: *Jason A. Donenfeld* <Jason@zx2c4.com>
Date: Tue, Jul 5, 2016 at 6:09 PM
To: Norman Shulman <norman.shulman@n-dimension.com>


Hi Norman,

Can you expand what you mean a little bit by "not necessarily unique"?
And why that matters? I'm not sure I understand the thrust of your
point.

Thanks,
Jason

----------
From: *Norman Shulman* <norman.shulman@n-dimension.com>
Date: Tue, Jul 5, 2016 at 6:14 PM
To: "Jason A. Donenfeld" <Jason@zx2c4.com>


Hi Jason,

Many clients use the non-routable 192.168.0.0/16 addresses. How can looking
up such an address identify the client?

Thanks.

Norm


----------
From: *Jason A. Donenfeld* <Jason@zx2c4.com>
Date: Tue, Jul 5, 2016 at 6:19 PM
To: Norman Shulman <norman.shulman@n-dimension.com>


Hi Norm,

I think you're misunderstanding how things work. I'll try to explain a
bit more clear here:

A linux system has several network interfaces, such as lo, eth0,
wlan0, wg0. The ordinary kernel routing table determines which
interface to use when sending outgoing packets. So, let's say the
kernel routing table is setup to route 192.168.0.0/16 via WireGuard:

# ip route add 192.168.0.0/16 dev wg0
or
# ip addr add 192.168.0.5/16 dev wg0

Now userspace can send packets that will be handled by the wireguard driver:

# ping 192.168.32.19
...

When that ping packet hits the wireguard driver, it has a dst IP of
192.168.32.19. What does wireguard do with it now?

It looks in the cryptokey routing table to see if 192.168.32.19
belongs to any peers. If so, it uses that peer's public key to make a
secure session and encrypt that ping packet. It then sends it off to
the peer's configured external internet endpoint.

Does this make more sense? Or is there still something you're wondering
about?

Regards,
Jason

----------
From: *Norman Shulman* <norman.shulman@n-dimension.com>
Date: Tue, Jul 5, 2016 at 6:23 PM
To: "Jason A. Donenfeld" <Jason@zx2c4.com>


Hi Jason,

I'm still wondering what wireguard does if more than one peer has the
address 192.168.32.19.

Thanks.

Norm

----------
From: *Jason A. Donenfeld* <Jason@zx2c4.com>
Date: Tue, Jul 5, 2016 at 6:30 PM
To: Norman Shulman <norman.shulman@n-dimension.com>


Hi Norm,

If you run these commands:

wg set wg0 peer ABCD allowed-ips 192.168.32.19/32
wg set wg0 peer EFGH allowed-ips 192.168.32.19/32

After the first command ABCD has 192.168.32.19/32. After the second
command, ABCD has no allowed ips, and EFGH has 192.168.32.19/32.

However, if you run these commands:

wg set wg0 peer ABCD allowed-ips 192.168.32.0/24
wg set wg0 peer EFGH allowed-ips 192.168.32.19/32

After running both commands, ABCD will have 192.168.32.0/24 and EFGH
will have 192.168.32.19/32. However, when sending packets, the routing
table lookups will always match on the most specific match, so ABCD
will not be able to send or receive packets for 192.168.32.19/32.

Make sense?

Jason

--001a114010ee1d7e040536e6084b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Norm,<div><br></div><div>I&#39;m moving this discussion=
 over to the mailing list. Please be sure to keep <a href=3D"mailto:wiregua=
rd@lists.zx2c4.com">wireguard@lists.zx2c4.com</a> CC&#39;d in your replies =
if you&#39;d like a response.</div><div><br></div><div>Our prior conversati=
on follows below.</div><div><br></div><div>Regards,</div><div>Jason</div><d=
iv><br><div class=3D"gmail_quote"><span style=3D"font-size:large;font-weigh=
t:bold">Forwarded conversation</span><br>Subject: <b class=3D"gmail_sendern=
ame">WireGuard cryptokey routing</b><br>------------------------<br><br><sp=
an class=3D"undefined"><font color=3D"#888">From: <b class=3D"undefined">No=
rman Shulman</b> <span dir=3D"ltr">&lt;<a href=3D"mailto:norman.shulman@n-d=
imension.com">norman.shulman@n-dimension.com</a>&gt;</span><br>Date: Tue, J=
ul 5, 2016 at 5:58 PM<br>To: <a href=3D"mailto:team@wireguard.io">team@wire=
guard.io</a><br></font><br></span><br><div dir=3D"ltr">You state:<div><br><=
/div><div>&quot;<br clear=3D"all"><div>In the server configuration, when th=
e network interface wants to send a packet to a peer (a client), it looks a=
t that packet&#39;s destination IP and compares it to each peer&#39;s list =
of allowed IPs to see which peer to send it to.=C2=A0<br></div><div>...</di=
v><div>In other words, when sending packets, the list of allowed IPs behave=
s as a sort of routing table<br></div><div>&quot;</div><div><br></div><div>=
But the allowed IPs can be non-routable addresses, so they are not necessar=
ily unique.<br></div><span class=3D"HOEnZb"><font color=3D"#888888">
</font></span></div></div>
<br>----------<br><span class=3D"undefined"><font color=3D"#888">From: <b c=
lass=3D"undefined">Jason A. Donenfeld</b> <span dir=3D"ltr">&lt;<a href=3D"=
mailto:Jason@zx2c4.com">Jason@zx2c4.com</a>&gt;</span><br>Date: Tue, Jul 5,=
 2016 at 6:09 PM<br>To: Norman Shulman &lt;<a href=3D"mailto:norman.shulman=
@n-dimension.com">norman.shulman@n-dimension.com</a>&gt;<br></font><br></sp=
an><br>Hi Norman,<br>
<br>
Can you expand what you mean a little bit by &quot;not necessarily unique&q=
uot;?<br>
And why that matters? I&#39;m not sure I understand the thrust of your<br>
point.<br>
<br>
Thanks,<br>
Jason<span class=3D"HOEnZb"><font color=3D"#888888"><br>
</font></span><br>----------<br><span class=3D"undefined"><font color=3D"#8=
88">From: <b class=3D"undefined">Norman Shulman</b> <span dir=3D"ltr">&lt;<=
a href=3D"mailto:norman.shulman@n-dimension.com">norman.shulman@n-dimension=
.com</a>&gt;</span><br>Date: Tue, Jul 5, 2016 at 6:14 PM<br>To: &quot;Jason=
 A. Donenfeld&quot; &lt;<a href=3D"mailto:Jason@zx2c4.com">Jason@zx2c4.com<=
/a>&gt;<br></font><br></span><br><div dir=3D"ltr">Hi Jason,<div><br></div><=
div>Many clients use the non-routable <a href=3D"http://192.168.0.0/16" tar=
get=3D"_blank">192.168.0.0/16</a> addresses. How can looking up such an add=
ress identify the client?</div><div><br></div><div>Thanks.</div><div><br></=
div><div>Norm</div><div><br></div></div><div class=3D"HOEnZb"></div><br>---=
-------<br><span class=3D"undefined"><font color=3D"#888">From: <b class=3D=
"undefined">Jason A. Donenfeld</b> <span dir=3D"ltr">&lt;<a href=3D"mailto:=
Jason@zx2c4.com">Jason@zx2c4.com</a>&gt;</span><br>Date: Tue, Jul 5, 2016 a=
t 6:19 PM<br>To: Norman Shulman &lt;<a href=3D"mailto:norman.shulman@n-dime=
nsion.com">norman.shulman@n-dimension.com</a>&gt;<br></font><br></span><br>=
Hi Norm,<br>
<br>
I think you&#39;re misunderstanding how things work. I&#39;ll try to explai=
n a<br>
bit more clear here:<br>
<br>
A linux system has several network interfaces, such as lo, eth0,<br>
wlan0, wg0. The ordinary kernel routing table determines which<br>
interface to use when sending outgoing packets. So, let&#39;s say the<br>
kernel routing table is setup to route <a href=3D"http://192.168.0.0/16" re=
l=3D"noreferrer" target=3D"_blank">192.168.0.0/16</a> via WireGuard:<br>
<br>
# ip route add <a href=3D"http://192.168.0.0/16" rel=3D"noreferrer" target=
=3D"_blank">192.168.0.0/16</a> dev wg0<br>
or<br>
# ip addr add <a href=3D"http://192.168.0.5/16" rel=3D"noreferrer" target=
=3D"_blank">192.168.0.5/16</a> dev wg0<br>
<br>
Now userspace can send packets that will be handled by the wireguard driver=
:<br>
<br>
# ping 192.168.32.19<br>
...<br>
<br>
When that ping packet hits the wireguard driver, it has a dst IP of<br>
192.168.32.19. What does wireguard do with it now?<br>
<br>
It looks in the cryptokey routing table to see if 192.168.32.19<br>
belongs to any peers. If so, it uses that peer&#39;s public key to make a<b=
r>
secure session and encrypt that ping packet. It then sends it off to<br>
the peer&#39;s configured external internet endpoint.<br>
<br>
Does this make more sense? Or is there still something you&#39;re wondering=
 about?<br>
<br>
Regards,<br>
Jason<br>
<br>----------<br><span class=3D"undefined"><font color=3D"#888">From: <b c=
lass=3D"undefined">Norman Shulman</b> <span dir=3D"ltr">&lt;<a href=3D"mail=
to:norman.shulman@n-dimension.com">norman.shulman@n-dimension.com</a>&gt;</=
span><br>Date: Tue, Jul 5, 2016 at 6:23 PM<br>To: &quot;Jason A. Donenfeld&=
quot; &lt;<a href=3D"mailto:Jason@zx2c4.com">Jason@zx2c4.com</a>&gt;<br></f=
ont><br></span><br><div dir=3D"ltr">Hi Jason,<div><br></div><div>I&#39;m st=
ill wondering what wireguard does if more than one peer has the address=C2=
=A0192.168.32.19.</div><div><br></div><div>Thanks.</div><div><br></div><div=
>Norm</div><div><br></div></div>----------<br><span class=3D"undefined"><fo=
nt color=3D"#888">From: <b class=3D"undefined">Jason A. Donenfeld</b> <span=
 dir=3D"ltr">&lt;<a href=3D"mailto:Jason@zx2c4.com">Jason@zx2c4.com</a>&gt;=
</span><br>Date: Tue, Jul 5, 2016 at 6:30 PM<br>To: Norman Shulman &lt;<a h=
ref=3D"mailto:norman.shulman@n-dimension.com">norman.shulman@n-dimension.co=
m</a>&gt;<br></font><br></span><br>Hi Norm,<br>
<br>
If you run these commands:<br>
<br>
wg set wg0 peer ABCD allowed-ips <a href=3D"http://192.168.32.19/32" rel=3D=
"noreferrer" target=3D"_blank">192.168.32.19/32</a><br>
wg set wg0 peer EFGH allowed-ips <a href=3D"http://192.168.32.19/32" rel=3D=
"noreferrer" target=3D"_blank">192.168.32.19/32</a><br>
<br>
After the first command ABCD has <a href=3D"http://192.168.32.19/32" rel=3D=
"noreferrer" target=3D"_blank">192.168.32.19/32</a>. After the second<br>
command, ABCD has no allowed ips, and EFGH has <a href=3D"http://192.168.32=
.19/32" rel=3D"noreferrer" target=3D"_blank">192.168.32.19/32</a>.<br>
<br>
However, if you run these commands:<br>
<br>
wg set wg0 peer ABCD allowed-ips <a href=3D"http://192.168.32.0/24" rel=3D"=
noreferrer" target=3D"_blank">192.168.32.0/24</a><br>
wg set wg0 peer EFGH allowed-ips <a href=3D"http://192.168.32.19/32" rel=3D=
"noreferrer" target=3D"_blank">192.168.32.19/32</a><br>
<br>
After running both commands, ABCD will have <a href=3D"http://192.168.32.0/=
24" rel=3D"noreferrer" target=3D"_blank">192.168.32.0/24</a> and EFGH<br>
will have <a href=3D"http://192.168.32.19/32" rel=3D"noreferrer" target=3D"=
_blank">192.168.32.19/32</a>. However, when sending packets, the routing<br=
>
table lookups will always match on the most specific match, so ABCD<br>
will not be able to send or receive packets for <a href=3D"http://192.168.3=
2.19/32" rel=3D"noreferrer" target=3D"_blank">192.168.32.19/32</a>.<br>
<br>
Make sense?<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
Jason<br>
</font></span><br></div><div><br></div>
</div></div>

--001a114010ee1d7e040536e6084b--
