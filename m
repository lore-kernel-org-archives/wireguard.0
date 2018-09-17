Return-Path: rspazzol@redhat.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2dc7c778
 for <wireguard@lists.zx2c4.com>;
 Mon, 17 Sep 2018 11:08:31 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 814fca36
 for <wireguard@lists.zx2c4.com>;
 Mon, 17 Sep 2018 11:08:31 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id m26-v6so13209958lfb.0
 for <wireguard@lists.zx2c4.com>; Mon, 17 Sep 2018 04:10:07 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20180917091635.GB5016@matrix-dream.net>
References: <CACOeLq+PG-SFUhSZUejCVWc+uMnBq1ATRwUFFLQZBTCU6JMSew@mail.gmail.com>
 <20180916165458.GA31165@matrix-dream.net>
 <CACOeLqLN5vc7O9_VwGhipycVE5Yi+phDKKwf2U4VPzZM00KeMw@mail.gmail.com>
 <CACOeLq+GseaDTZaOKD3qA_pPoT0_xRFAgqip2+KEkxTeG1Mw=Q@mail.gmail.com>
 <20180917091635.GB5016@matrix-dream.net>
From: Raffaele Spazzoli <rspazzol@redhat.com>
Date: Mon, 17 Sep 2018 07:10:05 -0400
Message-ID: <CACOeLqLB8zbarowwTZFrxTkHyAk=B_cT_OruWDwAi6FvHjGi-Q@mail.gmail.com>
Subject: Re: what to do when the peers use different IPs to transmit and
 receive
To: =?UTF-8?B?SXZhbiBMYWLDoXRo?= <labawi-wg@matrix-dream.net>
Content-Type: multipart/alternative; boundary="0000000000002fdcd105760f37c3"
Cc: wireguard@lists.zx2c4.com
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--0000000000002fdcd105760f37c3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ivan,

sorry for the formatting, it seemed right on my email editor (gmail).
I cannot do SNAT at the source because the packet would be dropped if it
didn't come from the actual IP of the VM.
So I am doing SNAT at the destination. why do you say I am doing it wrong?
I know it would be ideal to do it at the source, but should it work when
done at the destination?

Thanks,
Raffaele

Raffaele Spazzoli
Senior Architect - OpenShift <https://www.openshift.com>, Containers
and PaaS Practice <https://www.redhat.com/en/services/consulting/paas>
Tel: +1 216-258-7717



On Mon, Sep 17, 2018 at 5:16 AM, Ivan Lab=C3=A1th <labawi-wg@matrix-dream.n=
et>
wrote:

> On Sun, Sep 16, 2018 at 07:08:58PM -0400, Raffaele Spazzoli wrote:
> > sh-4.2# iptables -t nat -n -L Chain PREROUTING (policy ACCEPT) target
> prot
> > opt source destination Chain INPUT (policy ACCEPT) target prot opt sour=
ce
> > destination SNAT udp -- 10.128.2.10 0.0.0.0/0 udp dpt:5555 to:
> > 192.168.99.12:5555 SNAT udp -- 10.128.1.94 0.0.0.0/0 udp dpt:5555 to:
> > 192.168.99.14:5555 SNAT udp -- 10.130.0.136 0.0.0.0/0 udp dpt:5555 to:
> > 192.168.99.13:5555 SNAT udp -- 10.129.1.158 0.0.0.0/0 udp dpt:5555 to:
> > 192.168.99.15:5555 SNAT udp -- 10.131.0.199 0.0.0.0/0 udp dpt:5555 to:
> > 192.168.99.7:5555 SNAT udp -- 10.129.2.217 0.0.0.0/0 udp dpt:5555 to:
> > 192.168.99.6:5555 Chain OUTPUT (policy ACCEPT) target prot opt source
> > destination Chain POSTROUTING (policy ACCEPT) target prot opt source
> > destination
>
> Please try to have no or reasonable line wrapping.
>
> If you are applying SNAT on your source node, you are setting
> the source address, which should be set to the reachable address
> for the replies to come to. In your case VIP.
> If you are setting it on the destination, you are IMO doing it wrong.
>
> Same thing applies to TCP and most typical protocol, nothing special
> about wireguard here.
>
> If you have a middlebox doing DNAT, it would normaly be expected
> for it or something else to do SNAT in the reverse direction.
> Or, if your node has both adresses assigned, then it might be
> a case of improperly set source address on outgoing packets
> (e.g. your routing might need tuning).
>
> Regards,
> Ivan
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
>

--0000000000002fdcd105760f37c3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Ivan,<div><br></div><div>sorry for the formatting, it seem=
ed right on my email editor (gmail).</div><div>I cannot do SNAT at the sour=
ce because the packet would be dropped if it didn&#39;t come from the actua=
l IP of the VM.</div><div>So I am doing SNAT at the destination. why do you=
 say I am doing it wrong?</div><div>I know it would be ideal to do it at th=
e source, but should it work when done at the destination?</div></div><div =
class=3D"gmail_extra"><br clear=3D"all"><div><div class=3D"gmail_signature"=
 data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr">=
<div><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div=
 dir=3D"ltr"><div><div dir=3D"ltr">Thanks,<div>Raffaele</div><div><br></div=
><div>Raffaele Spazzoli</div><div>Senior Architect - <a href=3D"https://www=
.openshift.com" target=3D"_blank">OpenShift</a>, <a href=3D"https://www.red=
hat.com/en/services/consulting/paas" target=3D"_blank">Containers and=C2=A0=
PaaS Practice</a></div><div>Tel: +1 216-258-7717</div><div><br></div><div><=
br></div></div></div></div></div></div></div></div></div></div></div></div>=
</div></div></div></div>
<br><div class=3D"gmail_quote">On Mon, Sep 17, 2018 at 5:16 AM, Ivan Lab=C3=
=A1th <span dir=3D"ltr">&lt;<a href=3D"mailto:labawi-wg@matrix-dream.net" t=
arget=3D"_blank">labawi-wg@matrix-dream.net</a>&gt;</span> wrote:<br><block=
quote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc=
 solid;padding-left:1ex"><span class=3D"">On Sun, Sep 16, 2018 at 07:08:58P=
M -0400, Raffaele Spazzoli wrote:<br>
</span><span class=3D"">&gt; sh-4.2# iptables -t nat -n -L Chain PREROUTING=
 (policy ACCEPT) target prot<br>
&gt; opt source destination Chain INPUT (policy ACCEPT) target prot opt sou=
rce<br>
&gt; destination SNAT udp -- 10.128.2.10 <a href=3D"http://0.0.0.0/0" rel=
=3D"noreferrer" target=3D"_blank">0.0.0.0/0</a> udp dpt:5555 to:<br>
&gt; <a href=3D"http://192.168.99.12:5555" rel=3D"noreferrer" target=3D"_bl=
ank">192.168.99.12:5555</a> SNAT udp -- 10.128.1.94 <a href=3D"http://0.0.0=
.0/0" rel=3D"noreferrer" target=3D"_blank">0.0.0.0/0</a> udp dpt:5555 to:<b=
r>
&gt; <a href=3D"http://192.168.99.14:5555" rel=3D"noreferrer" target=3D"_bl=
ank">192.168.99.14:5555</a> SNAT udp -- 10.130.0.136 <a href=3D"http://0.0.=
0.0/0" rel=3D"noreferrer" target=3D"_blank">0.0.0.0/0</a> udp dpt:5555 to:<=
br>
&gt; <a href=3D"http://192.168.99.13:5555" rel=3D"noreferrer" target=3D"_bl=
ank">192.168.99.13:5555</a> SNAT udp -- 10.129.1.158 <a href=3D"http://0.0.=
0.0/0" rel=3D"noreferrer" target=3D"_blank">0.0.0.0/0</a> udp dpt:5555 to:<=
br>
&gt; <a href=3D"http://192.168.99.15:5555" rel=3D"noreferrer" target=3D"_bl=
ank">192.168.99.15:5555</a> SNAT udp -- 10.131.0.199 <a href=3D"http://0.0.=
0.0/0" rel=3D"noreferrer" target=3D"_blank">0.0.0.0/0</a> udp dpt:5555 to:<=
br>
&gt; <a href=3D"http://192.168.99.7:5555" rel=3D"noreferrer" target=3D"_bla=
nk">192.168.99.7:5555</a> SNAT udp -- 10.129.2.217 <a href=3D"http://0.0.0.=
0/0" rel=3D"noreferrer" target=3D"_blank">0.0.0.0/0</a> udp dpt:5555 to:<br=
>
&gt; <a href=3D"http://192.168.99.6:5555" rel=3D"noreferrer" target=3D"_bla=
nk">192.168.99.6:5555</a> Chain OUTPUT (policy ACCEPT) target prot opt sour=
ce<br>
&gt; destination Chain POSTROUTING (policy ACCEPT) target prot opt source<b=
r>
&gt; destination<br>
<br>
</span><span class=3D"">Please try to have no or reasonable line wrapping.<=
br>
<br>
If you are applying SNAT on your source node, you are setting<br>
the source address, which should be set to the reachable address<br>
for the replies to come to. In your case VIP.<br>
If you are setting it on the destination, you are IMO doing it wrong.<br>
<br>
Same thing applies to TCP and most typical protocol, nothing special<br>
about wireguard here.<br>
<br>
If you have a middlebox doing DNAT, it would normaly be expected<br>
for it or something else to do SNAT in the reverse direction.<br>
Or, if your node has both adresses assigned, then it might be<br>
a case of improperly set source address on outgoing packets<br>
(e.g. your routing might need tuning).<br>
<br>
Regards,<br>
Ivan<br>
</span>______________________________<wbr>_________________<br>
WireGuard mailing list<br>
<a href=3D"mailto:WireGuard@lists.zx2c4.com">WireGuard@lists.zx2c4.com</a><=
br>
<a href=3D"https://lists.zx2c4.com/mailman/listinfo/wireguard" rel=3D"noref=
errer" target=3D"_blank">https://lists.zx2c4.com/<wbr>mailman/listinfo/wire=
guard</a><br>
</blockquote></div><br></div>

--0000000000002fdcd105760f37c3--
