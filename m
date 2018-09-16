Return-Path: rspazzol@redhat.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a7e2eb70
 for <wireguard@lists.zx2c4.com>;
 Sun, 16 Sep 2018 18:54:35 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
 [209.85.208.182])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 129f8f60
 for <wireguard@lists.zx2c4.com>;
 Sun, 16 Sep 2018 18:54:35 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id p6-v6so11316551ljc.5
 for <wireguard@lists.zx2c4.com>; Sun, 16 Sep 2018 11:56:05 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20180916165458.GA31165@matrix-dream.net>
References: <CACOeLq+PG-SFUhSZUejCVWc+uMnBq1ATRwUFFLQZBTCU6JMSew@mail.gmail.com>
 <20180916165458.GA31165@matrix-dream.net>
From: Raffaele Spazzoli <rspazzol@redhat.com>
Date: Sun, 16 Sep 2018 14:56:04 -0400
Message-ID: <CACOeLqLN5vc7O9_VwGhipycVE5Yi+phDKKwf2U4VPzZM00KeMw@mail.gmail.com>
Subject: Re: what to do when the peers use different IPs to transmit and
 receive
To: =?UTF-8?B?SXZhbiBMYWLDoXRo?= <labawi-wg@matrix-dream.net>
Content-Type: multipart/alternative; boundary="000000000000d0f0600576019bf0"
Cc: wireguard@lists.zx2c4.com
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--000000000000d0f0600576019bf0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I'll try to make an example
cluster 1 node 1 has private IP1 and VIP1
cluster 2 node 2 has private IP2 and VIP2

each node uses it's private ip for outbound connections.
each node can receive inbound connection on its VIP.

so the wireguard config file for node1 is going to look like:

[peer]
endpoint: VIP2:port

and for node 2:
[peer]
endpoint: VIP1: port

the problem is that after the handshake, wireguard updates the config to
the following (for example for node2):
[peer]
endpoint: IP1:port

but IP2 cannot route to IP1...

I think a well configured SNAT rule may work, although is not elegant
because it forces the cluster to exchange information about their private
IPs.
This should not be needed and in the cloud private IPs are ephemeral....

anyway thanks for the advice, I am going to try to use it  in my prototype.

I still think there is need for a better technical approach for a long term
solution.


Thanks,
Raffaele

Raffaele Spazzoli
Senior Architect - OpenShift <https://www.openshift.com>, Containers
and PaaS Practice <https://www.redhat.com/en/services/consulting/paas>
Tel: +1 216-258-7717



On Sun, Sep 16, 2018 at 12:54 PM, Ivan Lab=C3=A1th <labawi-wg@matrix-dream.=
net>
wrote:

> Hi,
>
> On Sun, Sep 16, 2018 at 08:21:02AM -0400, Raffaele Spazzoli wrote:
> > ... then the IP that a  node uses for its outbound
> > connection is not the same that its peer need to use for its inbound
> > connections.
>
> Who uses what for whose connection? You lost me here.
> Looks like a broken network to me. Does TCP even work?
>
> Anyway, SNAT/DNAT should be able to fix things up, if you want to go
> that route.
>
> Regards,
> Ivan
>

--000000000000d0f0600576019bf0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I&#39;ll try to make an example<div>cluster 1 node 1 has p=
rivate IP1 and VIP1=C2=A0</div><div>cluster 2 node 2 has private IP2 and VI=
P2</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">eac=
h node uses it&#39;s private ip for outbound connections.=C2=A0</div><div c=
lass=3D"gmail_extra">each node can receive inbound connection on its VIP.</=
div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">so the =
wireguard config file for node1 is going to look like:</div><div class=3D"g=
mail_extra"><br></div><div class=3D"gmail_extra">[peer]</div><div class=3D"=
gmail_extra">endpoint: VIP2:port</div><div class=3D"gmail_extra"><br></div>=
<div class=3D"gmail_extra">and for node 2:</div><div class=3D"gmail_extra">=
[peer]=C2=A0</div><div class=3D"gmail_extra">endpoint: VIP1: port</div><div=
 class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">the problem is =
that after the handshake, wireguard updates the config to the following (fo=
r example for node2):</div><div class=3D"gmail_extra">[peer]</div><div clas=
s=3D"gmail_extra">endpoint: IP1:port</div><div class=3D"gmail_extra"><br></=
div><div class=3D"gmail_extra">but IP2 cannot route to IP1...</div><div cla=
ss=3D"gmail_extra"><br></div><div class=3D"gmail_extra">I think a well conf=
igured SNAT rule may work, although is not elegant because it forces the cl=
uster to exchange information about their private IPs.</div><div class=3D"g=
mail_extra">This should not be needed and in the cloud private IPs are ephe=
meral....</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_ext=
ra">anyway thanks for the advice, I am going to try to use it=C2=A0 in my p=
rototype.=C2=A0</div><div class=3D"gmail_extra"><br></div><div class=3D"gma=
il_extra">I still think there is need for a better technical approach for a=
 long term solution.</div><div class=3D"gmail_extra"><br></div><div class=
=3D"gmail_extra"><br clear=3D"all"><div><div class=3D"gmail_signature" data=
-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr"><div>=
<div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=
=3D"ltr"><div><div dir=3D"ltr">Thanks,<div>Raffaele</div><div><br></div><di=
v>Raffaele Spazzoli</div><div>Senior Architect - <a href=3D"https://www.ope=
nshift.com" target=3D"_blank">OpenShift</a>, <a href=3D"https://www.redhat.=
com/en/services/consulting/paas" target=3D"_blank">Containers and=C2=A0PaaS=
 Practice</a></div><div>Tel: +1 216-258-7717</div><div><br></div><div><br><=
/div></div></div></div></div></div></div></div></div></div></div></div></di=
v></div></div></div>
<br><div class=3D"gmail_quote">On Sun, Sep 16, 2018 at 12:54 PM, Ivan Lab=
=C3=A1th <span dir=3D"ltr">&lt;<a href=3D"mailto:labawi-wg@matrix-dream.net=
" target=3D"_blank">labawi-wg@matrix-dream.net</a>&gt;</span> wrote:<br><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #=
ccc solid;padding-left:1ex">Hi,<br>
<br>
On Sun, Sep 16, 2018 at 08:21:02AM -0400, Raffaele Spazzoli wrote:<br>
&gt; ... then the IP that a=C2=A0 node uses for its outbound<br>
<span class=3D"">&gt; connection is not the same that its peer need to use =
for its inbound<br>
&gt; connections.<br>
<br>
</span>Who uses what for whose connection? You lost me here.<br>
Looks like a broken network to me. Does TCP even work?<br>
<br>
Anyway, SNAT/DNAT should be able to fix things up, if you want to go<br>
that route.<br>
<br>
Regards,<br>
Ivan<br>
</blockquote></div><br></div></div>

--000000000000d0f0600576019bf0--
