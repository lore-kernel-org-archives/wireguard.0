Return-Path: chm.duquesne@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0057cd78
 for <wireguard@lists.zx2c4.com>; Mon, 7 May 2018 13:21:45 +0000 (UTC)
Received: from mail-io0-x234.google.com (mail-io0-x234.google.com
 [IPv6:2607:f8b0:4001:c06::234])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 753366f0
 for <wireguard@lists.zx2c4.com>; Mon, 7 May 2018 13:21:44 +0000 (UTC)
Received: by mail-io0-x234.google.com with SMTP id r9-v6so33590071iod.6
 for <wireguard@lists.zx2c4.com>; Mon, 07 May 2018 06:24:06 -0700 (PDT)
MIME-Version: 1.0
Sender: chm.duquesne@gmail.com
In-Reply-To: <586e6364-d143-2b9b-8ea0-940072a9db9a@gmx.net>
References: <c940ea93-e022-27ba-f906-783b0a7d3c1a@gmx.net>
 <CAHLp1Yk-33m1X5nkoVA7ofA8=h7uTdXP9x+DWmFzHkxAhq-g_g@mail.gmail.com>
 <586e6364-d143-2b9b-8ea0-940072a9db9a@gmx.net>
From: Christophe-Marie Duquesne <chmd@chmd.fr>
Date: Mon, 7 May 2018 15:23:45 +0200
Message-ID: <CAHLp1YmAf+hD+iHD+cZPorqMp-m=Aw_nJ5E2TcQYrXt-y7FZNQ@mail.gmail.com>
Subject: Re: WG endpoint node exit to inet and DNS resolver
To: vtol <vtol@gmx.net>, wireguard@lists.zx2c4.com
Content-Type: multipart/alternative; boundary="0000000000007fe725056b9d952d"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--0000000000007fe725056b9d952d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Re-adding the ML that I removed from my response by mistake

On Mon, May 7, 2018 at 3:12 PM, =D1=BD=D2=89=E1=B6=AC=E1=B8=B3=E2=84=A0 <vt=
ol@gmx.net> wrote:

> Thank you for the instant response.
>
>>
>> Wireguard does not mess with the DNS (afaik) so whatever is already
>> configured on the client is used.
>>
>
> Had hoped there would a way for the clients to utilize the endpoint node'=
s
> DNS resolver.
>
>
There are many ways to do that. You could setup post-up scripts that modify
resolv.conf when the wg interface is up. You could run a caching dns server
on your lan that talks to your gateway dns resolver.


>> If you want to route ipv4 traffic of "clients" through your "server"
>> (using quotes here because wireguard is peer to peer, so it does not rea=
lly
>> makes sense to say that), you probably need to enable ipv4 forwarding in
>> the kernel, and have postrouting rules that look like "iptables -t nat -=
A
>> POSTROUTING -o eth0 -j MASQUERADE".
>>
>
> forwarding is enabled in the kernel. Currently I am trying to set it up
> with the name space solution (https://www.wireguard.com/netns/) which
> perhaps do not require iptable rules, at least there is no mentioning of =
it.
>

I have not played with netns, so I cannot comment on that.


>
> Being a of peer-to-peer concept WG is then not really suited as VPN
> gateway?
>
>
It certainly is suited for tunneling all traffic through the tunnel. There
are a few blog posts around describing how to do this.

--0000000000007fe725056b9d952d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Re-adding the ML that I removed from my response by mistak=
e<br><div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Mon,=
 May 7, 2018 at 3:12 PM, =D1=BD=D2=89=E1=B6=AC=E1=B8=B3=E2=84=A0 <span dir=
=3D"ltr">&lt;<a href=3D"mailto:vtol@gmx.net" target=3D"_blank">vtol@gmx.net=
</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>Thank you for the instant response.<span class=3D"gmail-"><br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Wireguard does not mess with the DNS (afaik) so whatever is already configu=
red on the client is used.<br>
</blockquote>
<br></span>
Had hoped there would a way for the clients to utilize the endpoint node&#3=
9;s DNS resolver.<span class=3D"gmail-"><br>
<br></span></blockquote><div><br></div><div>There are many ways to do that.=
 You could setup post-up scripts that modify resolv.conf when the wg interf=
ace is up. You could run a caching dns server on your lan that talks to you=
r gateway dns resolver.<br><br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex"><span class=3D"gmail-">
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
If you want to route ipv4 traffic of &quot;clients&quot; through your &quot=
;server&quot; (using quotes here because wireguard is peer to peer, so it d=
oes not really makes sense to say that), you probably need to enable ipv4 f=
orwarding in the kernel, and have postrouting rules that look like &quot;ip=
tables -t nat -A POSTROUTING -o eth0 -j MASQUERADE&quot;.<br>
</blockquote>
<br></span>
forwarding is enabled in the kernel. Currently I am trying to set it up=C2=
=A0 with the name space solution (<a href=3D"https://www.wireguard.com/netn=
s/" rel=3D"noreferrer" target=3D"_blank">https://www.wireguard.com/net<wbr>=
ns/</a>) which perhaps do not require iptable rules, at least there is no m=
entioning of it.<br></blockquote><div><br></div><div>I have not played with=
 netns, so I cannot comment on that.<br></div><div>=C2=A0</div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">
<br>
Being a of peer-to-peer concept WG is then not really suited as VPN gateway=
?<br>
<br></blockquote><div><br></div><div>It certainly is suited for tunneling a=
ll traffic through the tunnel. There are a few blog posts around describing=
 how to do this.<br></div></div><br></div></div></div>

--0000000000007fe725056b9d952d--
