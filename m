Return-Path: jason.donenfeld@gmail.com
Received: from mail-lf0-f65.google.com (mail-lf0-f65.google.com
 [209.85.215.65])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id dac8b4d5
 for <wireguard@lists.zx2c4.com>; Sat, 2 Jul 2016 10:51:26 +0000 (UTC)
Received: by mail-lf0-f65.google.com with SMTP id w130so13402078lfd.2
 for <wireguard@lists.zx2c4.com>; Sat, 02 Jul 2016 03:54:29 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20160702102754.GD12181@lud.polynome.dn42>
References: <20160629112423.GC31514@lud.polynome.dn42>
 <20160702102754.GD12181@lud.polynome.dn42>
Date: Sat, 2 Jul 2016 12:54:27 +0200
Message-ID: <CAHmME9pVO_UeRDkAYYHdhsSN3q+BmaRoh6pHkL7S0H=8u6-Y-A@mail.gmail.com>
From: "Jason A. Donenfeld" <jason.donenfeld@gmail.com>
To: Baptiste Jonglez <baptiste@bitsofnetworks.org>
Content-Type: multipart/alternative; boundary=001a1140d2be5c23520536a4ed30
Cc: wireguard@lists.zx2c4.com
Subject: Re: [WireGuard] OpenWRT package for wireguard
Reply-To: Jason@zx2c4.com
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--001a1140d2be5c23520536a4ed30
Content-Type: text/plain; charset=UTF-8

On Jul 2, 2016 12:28 PM, "Baptiste Jonglez" <baptiste@bitsofnetworks.org>
wrote:
> However, you have to manually select needed kernel symbols in `make
> kernel_menuconfig`, which is very annoying.  If you want to give it a try,
> look for these symbols:
>
>     +CONFIG_IP6_NF_IPTABLES=m
>     +CONFIG_IPV6=y
>     +CONFIG_NETFILTER=y
>     +CONFIG_NETFILTER_ADVANCED=y
>     +CONFIG_NETFILTER_XTABLES=m
>     +CONFIG_NETFILTER_XT_MATCH_HASHLIMIT=m
>     +CONFIG_NET_FOU=m
>     +CONFIG_NET_IP_TUNNEL=m
>     +CONFIG_NET_UDP_TUNNEL=m

On SMP systems, wireguard will benefit from CONFIG_PADATA which is
selectable by the parallel crypto engine option in the crypto API menu of
menuconfig.

--001a1140d2be5c23520536a4ed30
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr"><br>
On Jul 2, 2016 12:28 PM, &quot;Baptiste Jonglez&quot; &lt;<a href=3D"mailto=
:baptiste@bitsofnetworks.org">baptiste@bitsofnetworks.org</a>&gt; wrote:<br=
>
&gt; However, you have to manually select needed kernel symbols in `make<br=
>
&gt; kernel_menuconfig`, which is very annoying.=C2=A0 If you want to give =
it a try,<br>
&gt; look for these symbols:<br>
&gt;<br>
&gt; =C2=A0 =C2=A0 +CONFIG_IP6_NF_IPTABLES=3Dm<br>
&gt; =C2=A0 =C2=A0 +CONFIG_IPV6=3Dy<br>
&gt; =C2=A0 =C2=A0 +CONFIG_NETFILTER=3Dy<br>
&gt; =C2=A0 =C2=A0 +CONFIG_NETFILTER_ADVANCED=3Dy<br>
&gt; =C2=A0 =C2=A0 +CONFIG_NETFILTER_XTABLES=3Dm<br>
&gt; =C2=A0 =C2=A0 +CONFIG_NETFILTER_XT_MATCH_HASHLIMIT=3Dm<br>
&gt; =C2=A0 =C2=A0 +CONFIG_NET_FOU=3Dm<br>
&gt; =C2=A0 =C2=A0 +CONFIG_NET_IP_TUNNEL=3Dm<br>
&gt; =C2=A0 =C2=A0 +CONFIG_NET_UDP_TUNNEL=3Dm</p>
<p dir=3D"ltr">On SMP systems, wireguard will benefit from CONFIG_PADATA wh=
ich is selectable by the parallel crypto engine option in the crypto API me=
nu of menuconfig.</p>

--001a1140d2be5c23520536a4ed30--
