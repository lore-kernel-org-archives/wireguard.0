Return-Path: nicolas.prochazka@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d5fef679
 for <wireguard@lists.zx2c4.com>;
 Tue, 21 Feb 2017 07:40:16 +0000 (UTC)
Received: from mail-lf0-f45.google.com (mail-lf0-f45.google.com
 [209.85.215.45])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1c5034b0
 for <wireguard@lists.zx2c4.com>;
 Tue, 21 Feb 2017 07:40:16 +0000 (UTC)
Received: by mail-lf0-f45.google.com with SMTP id z127so59764207lfa.2
 for <wireguard@lists.zx2c4.com>; Mon, 20 Feb 2017 23:41:04 -0800 (PST)
MIME-Version: 1.0
Sender: nicolas.prochazka@gmail.com
In-Reply-To: <11EB84FE-DEE6-4E3A-BEB2-FFCE80BA0524@danrl.com>
References: <CADdae-jNLBGrjwKjfibBtwKennPDESaBe0_hE3vbu5=x_BTmFw@mail.gmail.com>
 <11EB84FE-DEE6-4E3A-BEB2-FFCE80BA0524@danrl.com>
From: nicolas prochazka <prochazka.nicolas@gmail.com>
Date: Tue, 21 Feb 2017 08:41:01 +0100
Message-ID: <CADdae-jugvWrivy_QoPywsrrFkjxisZ8Mk3PWZ4x6OmdOgGObg@mail.gmail.com>
Subject: Re: [wireguard-devel] About ip management
To: =?UTF-8?Q?Dan_L=C3=BCdtke?= <mail@danrl.com>
Content-Type: multipart/alternative; boundary=94eb2c1cb94a7368ab0549058057
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--94eb2c1cb94a7368ab0549058057
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Thanks
These are good ideas to explore
Regards,
Nicolas

2017-02-20 13:48 GMT+01:00 Dan L=C3=BCdtke <mail@danrl.com>:

> Hi Nicolas,
>
>
> > On 17 Feb 2017, at 15:03, nicolas prochazka <prochazka.nicolas@gmail.co=
m>
> wrote:
> > I hope not to have misunderstood ip management with wireguard,
> > in a "server mode operation" , as many peers -> one peer ( server ) ,
> > private ip configuration must be coherent.
>
> There is no need for private (assuming you mean RFC1918) addresses, but o=
f
> course it works with private IPs as well as with public IP addresses.
>
>
> > In fact, as server / client example in contrib, server must delivery ip
> to clients, there's no way for client to know good private_ip .
>
> Unless it is configured statically, which is what I suggest doing. There
> is plenty of IP space to use. Think of ULA or subprefixes of you GU(s). A
> single /64 should be sufficient to address all your clients uniquely per
> "server wg interface". The situation for legacy IP is also not that bad.
> RFC1918 space is huge, and there is also RFC6598 to pick from. Why don't
> just roll out IP configurations the same way you roll out WireGuard
> configuration? It's just a line more in the config when you use wg-quick.
>
>
> > We cannot use dhcp, layer 3 , so ...
>
> That's true for legacy IP. It does not hold true for state-of-the-art IP.
>
>
> > we need to implement a pool ip manager , is it correct ?
>
> I do not really know what you are referring to when you write "pool ip
> manager", but if you want to distribute IP configuration data inside the =
wg
> tunnel, you would need to configure static addresses to bootstrap that
> from. This might change in the future, as Jason said to be working in OOB
> features. IP management would then take place in user space mostly/entire=
ly.
>
> Hope that helps!
>
> Cheers,
>
> Dan

--94eb2c1cb94a7368ab0549058057
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><span id=3D"gmail-result_box" class=3D"gmail-sho=
rt_text" lang=3D"en"><span class=3D"gmail-">Thanks<br>These are good ideas =
to explore</span></span></div>Regards, <br></div>Nicolas<br></div><div clas=
s=3D"gmail_extra"><br><div class=3D"gmail_quote">2017-02-20 13:48 GMT+01:00=
 Dan L=C3=BCdtke <span dir=3D"ltr">&lt;<a href=3D"mailto:mail@danrl.com" ta=
rget=3D"_blank">mail@danrl.com</a>&gt;</span>:<br><blockquote class=3D"gmai=
l_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left=
:1ex">Hi Nicolas,<br>
<span class=3D""><br>
<br>
&gt; On 17 Feb 2017, at 15:03, nicolas prochazka &lt;<a href=3D"mailto:proc=
hazka.nicolas@gmail.com">prochazka.nicolas@gmail.com</a>&gt; wrote:<br>
&gt; I hope not to have misunderstood ip management with wireguard,<br>
&gt; in a &quot;server mode operation&quot; , as many peers -&gt; one peer =
( server ) ,<br>
&gt; private ip configuration must be coherent.<br>
<br>
</span>There is no need for private (assuming you mean RFC1918) addresses, =
but of course it works with private IPs as well as with public IP addresses=
.<br>
<span class=3D""><br>
<br>
&gt; In fact, as server / client example in contrib, server must delivery i=
p to clients, there&#39;s no way for client to know good private_ip .<br>
<br>
</span>Unless it is configured statically, which is what I suggest doing. T=
here is plenty of IP space to use. Think of ULA or subprefixes of you GU(s)=
. A single /64 should be sufficient to address all your clients uniquely pe=
r &quot;server wg interface&quot;. The situation for legacy IP is also not =
that bad. RFC1918 space is huge, and there is also RFC6598 to pick from. Wh=
y don&#39;t just roll out IP configurations the same way you roll out WireG=
uard configuration? It&#39;s just a line more in the config when you use wg=
-quick.<br>
<span class=3D""><br>
<br>
&gt; We cannot use dhcp, layer 3 , so ...<br>
<br>
</span>That&#39;s true for legacy IP. It does not hold true for state-of-th=
e-art IP.<br>
<span class=3D""><br>
<br>
&gt; we need to implement a pool ip manager , is it correct ?<br>
<br>
</span>I do not really know what you are referring to when you write &quot;=
pool ip manager&quot;, but if you want to distribute IP configuration data =
inside the wg tunnel, you would need to configure static addresses to boots=
trap that from. This might change in the future, as Jason said to be workin=
g in OOB features. IP management would then take place in user space mostly=
/entirely.<br>
<br>
Hope that helps!<br>
<br>
Cheers,<br>
<br>
Dan</blockquote></div><br></div>

--94eb2c1cb94a7368ab0549058057--
