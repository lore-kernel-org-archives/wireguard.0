Return-Path: rwm.pc.repair@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 02e60ec5
 for <wireguard@lists.zx2c4.com>; Fri, 6 Oct 2017 00:31:29 +0000 (UTC)
Received: from mail-qt0-f179.google.com (mail-qt0-f179.google.com
 [209.85.216.179])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8f9c9dac
 for <wireguard@lists.zx2c4.com>; Fri, 6 Oct 2017 00:31:29 +0000 (UTC)
Received: by mail-qt0-f179.google.com with SMTP id o3so28788992qte.6
 for <wireguard@lists.zx2c4.com>; Thu, 05 Oct 2017 18:00:41 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAHmME9qHxvQc63ubFxv7KvrrJ0J26q6dSJPi4YYjjqs=cDDhxg@mail.gmail.com>
References: <CANcRkik-gjJqz89FFtAXPC2_ixi8uZv6wDTTOOsjJqNieiDPKg@mail.gmail.com>
 <CAHmME9qHxvQc63ubFxv7KvrrJ0J26q6dSJPi4YYjjqs=cDDhxg@mail.gmail.com>
From: Ryan McGee <rwm.pc.repair@gmail.com>
Date: Thu, 5 Oct 2017 18:00:00 -0700
Message-ID: <CANcRkim=9nUOQT5abRfTOVfXzVc1wAo+b_hNQjugHsxABhiWVw@mail.gmail.com>
Subject: Re: wireguard bypass question
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Content-Type: multipart/alternative; boundary="001a114e470aa8bace055ad65ec8"
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--001a114e470aa8bace055ad65ec8
Content-Type: text/plain; charset="UTF-8"

So I set up the VPN using Mullvad's guad here:
https://mullvad.net/guides/running-wireguard-router/

I've tried vpnbypass filling out just the domain "/netflix.com/vpnbypass"
then I also tried adding the port ranges, IPs and ports found at:
https://backlothelp.netflix.com/hc/en-us/articles/115000257627-What-are-Netflix-s-Aspera-IP-Addresses-and-Port-Ranges-

Nothing seems to work as netflix still sees me going through a VPN.

I've rebooted the router after making changes to vpnbypass just to be safe.

The only thing I can think of is maybe the firewall settings in the Mullvad
guide but I really don't know enough about this kind of stuff. I can follow
guides and how-tos, but that is about the end of it =)

On Thu, Oct 5, 2017 at 5:52 PM, Jason A. Donenfeld <Jason@zx2c4.com> wrote:

> Hi Ryan,
>
> You can use the `ipset=` feature of dnsmasq for this (which I wrote a
> number of years ago). It will add matched domains to a netfilter ipset
> object, which you can then use for policy based routing.
>
> I had a look at the vpnbypass project, and it doesn't actually look
> OpenVPN centric at all. It looks to me like it actually uses this
> dnsmasq feature along with classic policy routing. It looks like it
> automatically discovers your WAN interface too. Give vpnbypass a try
> and let me know if there are problems with it.
>
> Jason
>

--001a114e470aa8bace055ad65ec8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">So I set up the VPN using Mullvad&#39;s guad here:<div><a =
href=3D"https://mullvad.net/guides/running-wireguard-router/">https://mullv=
ad.net/guides/running-wireguard-router/</a><br></div><div><br></div><div>I&=
#39;ve tried vpnbypass filling out just the domain &quot;/<a href=3D"http:/=
/netflix.com/vpnbypass">netflix.com/vpnbypass</a>&quot; then I also tried a=
dding the port ranges, IPs and ports found at:=C2=A0</div><div><a href=3D"h=
ttps://backlothelp.netflix.com/hc/en-us/articles/115000257627-What-are-Netf=
lix-s-Aspera-IP-Addresses-and-Port-Ranges-">https://backlothelp.netflix.com=
/hc/en-us/articles/115000257627-What-are-Netflix-s-Aspera-IP-Addresses-and-=
Port-Ranges-</a></div><div><br></div><div>Nothing seems to work as netflix =
still sees me going through a VPN.</div><div><br></div><div>I&#39;ve reboot=
ed the router after making changes to vpnbypass just to be safe.</div><div>=
<br></div><div>The only thing I can think of is maybe the firewall settings=
 in the Mullvad guide but I really don&#39;t know enough about this kind of=
 stuff. I can follow guides and how-tos, but that is about the end of it =
=3D)</div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">O=
n Thu, Oct 5, 2017 at 5:52 PM, Jason A. Donenfeld <span dir=3D"ltr">&lt;<a =
href=3D"mailto:Jason@zx2c4.com" target=3D"_blank">Jason@zx2c4.com</a>&gt;</=
span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex">Hi Ryan,<br>
<br>
You can use the `ipset=3D` feature of dnsmasq for this (which I wrote a<br>
number of years ago). It will add matched domains to a netfilter ipset<br>
object, which you can then use for policy based routing.<br>
<br>
I had a look at the vpnbypass project, and it doesn&#39;t actually look<br>
OpenVPN centric at all. It looks to me like it actually uses this<br>
dnsmasq feature along with classic policy routing. It looks like it<br>
automatically discovers your WAN interface too. Give vpnbypass a try<br>
and let me know if there are problems with it.<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
Jason<br>
</font></span></blockquote></div><br></div>

--001a114e470aa8bace055ad65ec8--
