Return-Path: nicolas.prochazka@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cb2b213c
 for <wireguard@lists.zx2c4.com>; Wed, 8 Mar 2017 16:36:51 +0000 (UTC)
Received: from mail-lf0-f47.google.com (mail-lf0-f47.google.com
 [209.85.215.47])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e9008ecd
 for <wireguard@lists.zx2c4.com>; Wed, 8 Mar 2017 16:36:50 +0000 (UTC)
Received: by mail-lf0-f47.google.com with SMTP id k202so16936293lfe.1
 for <wireguard@lists.zx2c4.com>; Wed, 08 Mar 2017 08:39:33 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20170308160004.GA21799@tuxmachine.polynome.dn42>
References: <CADdae-hV6TSfo+1JqgKYE9TUTXhK9MzHHLKYf3SU6Yd5eMa1QA@mail.gmail.com>
 <CADdae-hrvCdqrnGJeKf_6swqd_dWhn7kzTx3NfM3iOtGzn5vHQ@mail.gmail.com>
 <CADdae-hYMwuJO2jR6MUmQFKuMka8Hq8nmqUcKAVKBweG8=wgzA@mail.gmail.com>
 <20170308160004.GA21799@tuxmachine.polynome.dn42>
From: Nicolas Prochazka <nicolas.prochazka@gmail.com>
Date: Wed, 8 Mar 2017 17:39:31 +0100
Message-ID: <CADdae-hPgb3gkrCF2LCpCVi6D__frrRKVkF=Uh4pjPurE9kH+Q@mail.gmail.com>
Subject: Re: [wireguard-devel ] traffic shapping
To: Baptiste Jonglez <baptiste@bitsofnetworks.org>
Content-Type: multipart/alternative; boundary=94eb2c0d8d7cec19c3054a3ac54d
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--94eb2c0d8d7cec19c3054a3ac54d
Content-Type: text/plain; charset=UTF-8

in doubt i add all ipv6 kernel options ...
and i'm using tc filter , not iptables fwmark.

Regards,
Nicolas

2017-03-08 17:00 GMT+01:00 Baptiste Jonglez <baptiste@bitsofnetworks.org>:

> Hi Nicolas,
>
> For posterity, can you be more specific about how you solved your issue?
> You were simply missing traffic shaping support for IPv6 in your kernel?
> Which symbols were needed?
>
> Thanks,
> Baptiste
>
> On Wed, Mar 08, 2017 at 02:39:23PM +0100, Nicolas Prochazka wrote:
> > hello,
> > to close, it's working perfectly well in ipv4 and then when i correctly
> > configure my kernel, perfectly well for ipv6.
> > Regards,
> > Nicolas
> >
> > 2017-03-08 12:26 GMT+01:00 Nicolas Prochazka <
> nicolas.prochazka@gmail.com>:
> >
> > > Hello again,
> > > So i verify my configuration,
> > > - on a virtual tap , traffic shaping is ok with same configuration
> > > - on physical card, traffic shaping is ok
> > > - on wg0 , all traffic are going to default queue,filter seems to be
> not
> > > applied ,  tcpdump on wg0 is ok with my queue definition, only
> difference
> > > is wg0 is configured as ipv6 tunnel.
> > >
> > >
> > > Regards,
> > > NIcolas
> > >
> > >
> > >
> > > 2017-03-06 18:40 GMT+01:00 Nicolas Prochazka <
> nicolas.prochazka@gmail.com>
> > > :
> > >
> > >> Hello,
> > >> is there an incompatibilty between wireguard and traffic shaping or i
> > >> misconfig something  ?
> > >>
> > >> After configuring Qos , I need to add filter to flow
> > >>
> > >> If i'm trying with simple tc command :
> > >> tc filter add dev wg0 protocol ip parent 1: prio 10 u32 match ip
> dport 80
> > >> 0xffff flowid 1:10
> > >>
> > >> or If i'm trying with tc + iptables,
> > >>
> > >> tc filter add dev wg0 protocol ip parent 1: prio 1 handle 6 fw flowid
> 1:10
> > >> and iptables mark rules,
> > >>
> > >> traffic seems to be not "apply" to queue .
> > >>
> > >> Regards,
> > >> Nicolas Prochazka.
> > >>
> > >> -----
> > >> Example :  after this configuration, traffic on wg0 on port
> 80,443,8080
> > >> are going to 1:30 ,not to 1:10
> > >> _trafficShappingMaxRate=15
> > >>
> > >> tc qdisc del dev wg0 root
> > >>
> > >> tc qdisc add dev wg0 root handle 1: htb default 30
> > >>
> > >> # Base
> > >> tc class add dev wg0 parent 1: classid 1:1 htb rate
> > >> ${_trafficShappingMaxRate}mbit burst 15k
> > >>
> > >> # http/https
> > >>
> > >> # Class 1:10,
> > >> tc class add dev wg0 parent 1:1 classid 1:10 htb rate
> > >> ${_trafficShappingMaxRate}mbit ceil ${_trafficShappingMaxRate} burst
> 15k
> > >>
> > >> # Class 1:20,
> > >> tc class add dev wg0 parent 1:1 classid 1:20 htb rate
> > >> ${_trafficShappingMaxRate}mbit ceil ${_trafficShappingMaxRate}mbit
> burst 15k
> > >>
> > >> # Class 1:30, which has a rate of 1kbit. This one is the default
> class.
> > >> tc class add dev wg0 parent 1:1 classid 1:30 htb rate 10kbit ceil
> 1mbit
> > >> burst 15k
> > >>
> > >> tc qdisc add dev wg0 parent 1:10 handle 10: fq_codel quantum 300 noecn
> > >> tc qdisc add dev wg0 parent 1:20 handle 20: fq_codel quantum 300 noecn
> > >> tc qdisc add dev wg0 parent 1:30 handle 30: fq_codel quantum 300 noecn
> > >>
> > >> # --- associate queue with traffic
> > >>
> > >> #tc filter add dev wg0 protocol ipv6 parent 1: prio 1 handle 6 fw
> flowid
> > >> 1:10
> > >> # http/https
> > >> tc filter add dev wg0 protocol ipv6 parent 1: prio 10 u32 match ip
> dport
> > >> 80 0xffff flowid 1:10
> > >> tc filter add dev wg0 protocol ipv6 parent 1: prio 10 u32 match ip
> dport
> > >> 443 0xffff flowid 1:10
> > >> tc filter add dev wg0 protocol ipv6 parent 1: prio 10 u32 match ip
> dport
> > >> 8080 0xffff flowid 1:10
> > >> # ncfs
> > >> tc filter add dev wg0 parent 1: protocol ipv6 prio 5 u32 match ip
> dport
> > >> 16379 0xffff flowid 1:20
> > >> # icmp
> > >> tc filter add dev wg0 parent 1: protocol ip prio 1 u32 match  ip
> protocol
> > >> 1 0xff flowid 1:30
> > >>
> > >> tc -s qdisc ls dev wg0
> > >>
> > >>
> > >
>
> > _______________________________________________
> > WireGuard mailing list
> > WireGuard@lists.zx2c4.com
> > https://lists.zx2c4.com/mailman/listinfo/wireguard
>
>

--94eb2c0d8d7cec19c3054a3ac54d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div>in doubt i add all ipv6 kernel options ...<=
br></div>and i&#39;m using tc filter , not iptables fwmark.<br><br></div>Re=
gards, <br></div>Nicolas<br></div><div class=3D"gmail_extra"><br><div class=
=3D"gmail_quote">2017-03-08 17:00 GMT+01:00 Baptiste Jonglez <span dir=3D"l=
tr">&lt;<a href=3D"mailto:baptiste@bitsofnetworks.org" target=3D"_blank">ba=
ptiste@bitsofnetworks.org</a>&gt;</span>:<br><blockquote class=3D"gmail_quo=
te" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"=
>Hi Nicolas,<br>
<br>
For posterity, can you be more specific about how you solved your issue?<br=
>
You were simply missing traffic shaping support for IPv6 in your kernel?<br=
>
Which symbols were needed?<br>
<br>
Thanks,<br>
Baptiste<br>
<div><div class=3D"h5"><br>
On Wed, Mar 08, 2017 at 02:39:23PM +0100, Nicolas Prochazka wrote:<br>
&gt; hello,<br>
&gt; to close, it&#39;s working perfectly well in ipv4 and then when i corr=
ectly<br>
&gt; configure my kernel, perfectly well for ipv6.<br>
&gt; Regards,<br>
&gt; Nicolas<br>
&gt;<br>
&gt; 2017-03-08 12:26 GMT+01:00 Nicolas Prochazka &lt;<a href=3D"mailto:nic=
olas.prochazka@gmail.com">nicolas.prochazka@gmail.com</a>&gt;:<br>
&gt;<br>
&gt; &gt; Hello again,<br>
&gt; &gt; So i verify my configuration,<br>
&gt; &gt; - on a virtual tap , traffic shaping is ok with same configuratio=
n<br>
&gt; &gt; - on physical card, traffic shaping is ok<br>
&gt; &gt; - on wg0 , all traffic are going to default queue,filter seems to=
 be not<br>
&gt; &gt; applied ,=C2=A0 tcpdump on wg0 is ok with my queue definition, on=
ly difference<br>
&gt; &gt; is wg0 is configured as ipv6 tunnel.<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; Regards,<br>
&gt; &gt; NIcolas<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; 2017-03-06 18:40 GMT+01:00 Nicolas Prochazka &lt;<a href=3D"mailt=
o:nicolas.prochazka@gmail.com">nicolas.prochazka@gmail.com</a>&gt;<br>
&gt; &gt; :<br>
&gt; &gt;<br>
&gt; &gt;&gt; Hello,<br>
&gt; &gt;&gt; is there an incompatibilty between wireguard and traffic shap=
ing or i<br>
&gt; &gt;&gt; misconfig something=C2=A0 ?<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; After configuring Qos , I need to add filter to flow<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; If i&#39;m trying with simple tc command :<br>
&gt; &gt;&gt; tc filter add dev wg0 protocol ip parent 1: prio 10 u32 match=
 ip dport 80<br>
&gt; &gt;&gt; 0xffff flowid 1:10<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; or If i&#39;m trying with tc + iptables,<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; tc filter add dev wg0 protocol ip parent 1: prio 1 handle 6 f=
w flowid 1:10<br>
&gt; &gt;&gt; and iptables mark rules,<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; traffic seems to be not &quot;apply&quot; to queue .<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Regards,<br>
&gt; &gt;&gt; Nicolas Prochazka.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; -----<br>
&gt; &gt;&gt; Example :=C2=A0 after this configuration, traffic on wg0 on p=
ort 80,443,8080<br>
&gt; &gt;&gt; are going to 1:30 ,not to 1:10<br>
&gt; &gt;&gt; _trafficShappingMaxRate=3D15<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; tc qdisc del dev wg0 root<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; tc qdisc add dev wg0 root handle 1: htb default 30<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; # Base<br>
&gt; &gt;&gt; tc class add dev wg0 parent 1: classid 1:1 htb rate<br>
&gt; &gt;&gt; ${_trafficShappingMaxRate}mbit burst 15k<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; # http/https<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; # Class 1:10,<br>
&gt; &gt;&gt; tc class add dev wg0 parent 1:1 classid 1:10 htb rate<br>
&gt; &gt;&gt; ${_trafficShappingMaxRate}mbit ceil ${_trafficShappingMaxRate=
} burst 15k<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; # Class 1:20,<br>
&gt; &gt;&gt; tc class add dev wg0 parent 1:1 classid 1:20 htb rate<br>
&gt; &gt;&gt; ${_trafficShappingMaxRate}mbit ceil ${_trafficShappingMaxRate=
}mbit burst 15k<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; # Class 1:30, which has a rate of 1kbit. This one is the defa=
ult class.<br>
&gt; &gt;&gt; tc class add dev wg0 parent 1:1 classid 1:30 htb rate 10kbit =
ceil 1mbit<br>
&gt; &gt;&gt; burst 15k<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; tc qdisc add dev wg0 parent 1:10 handle 10: fq_codel quantum =
300 noecn<br>
&gt; &gt;&gt; tc qdisc add dev wg0 parent 1:20 handle 20: fq_codel quantum =
300 noecn<br>
&gt; &gt;&gt; tc qdisc add dev wg0 parent 1:30 handle 30: fq_codel quantum =
300 noecn<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; # --- associate queue with traffic<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; #tc filter add dev wg0 protocol ipv6 parent 1: prio 1 handle =
6 fw flowid<br>
&gt; &gt;&gt; 1:10<br>
&gt; &gt;&gt; # http/https<br>
&gt; &gt;&gt; tc filter add dev wg0 protocol ipv6 parent 1: prio 10 u32 mat=
ch ip dport<br>
&gt; &gt;&gt; 80 0xffff flowid 1:10<br>
&gt; &gt;&gt; tc filter add dev wg0 protocol ipv6 parent 1: prio 10 u32 mat=
ch ip dport<br>
&gt; &gt;&gt; 443 0xffff flowid 1:10<br>
&gt; &gt;&gt; tc filter add dev wg0 protocol ipv6 parent 1: prio 10 u32 mat=
ch ip dport<br>
&gt; &gt;&gt; 8080 0xffff flowid 1:10<br>
&gt; &gt;&gt; # ncfs<br>
&gt; &gt;&gt; tc filter add dev wg0 parent 1: protocol ipv6 prio 5 u32 matc=
h ip dport<br>
&gt; &gt;&gt; 16379 0xffff flowid 1:20<br>
&gt; &gt;&gt; # icmp<br>
&gt; &gt;&gt; tc filter add dev wg0 parent 1: protocol ip prio 1 u32 match=
=C2=A0 ip protocol<br>
&gt; &gt;&gt; 1 0xff flowid 1:30<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; tc -s qdisc ls dev wg0<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt;<br>
<br>
</div></div>&gt; ______________________________<wbr>_________________<br>
&gt; WireGuard mailing list<br>
&gt; <a href=3D"mailto:WireGuard@lists.zx2c4.com">WireGuard@lists.zx2c4.com=
</a><br>
&gt; <a href=3D"https://lists.zx2c4.com/mailman/listinfo/wireguard" rel=3D"=
noreferrer" target=3D"_blank">https://lists.zx2c4.com/<wbr>mailman/listinfo=
/wireguard</a><br>
<br>
</blockquote></div><br></div>

--94eb2c0d8d7cec19c3054a3ac54d--
