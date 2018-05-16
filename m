Return-Path: steve@erayd.net
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a5eb7f84
 for <wireguard@lists.zx2c4.com>;
 Wed, 16 May 2018 20:31:56 +0000 (UTC)
Received: from mail-yw0-x229.google.com (mail-yw0-x229.google.com
 [IPv6:2607:f8b0:4002:c05::229])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 79c1ef7c
 for <wireguard@lists.zx2c4.com>;
 Wed, 16 May 2018 20:31:56 +0000 (UTC)
Received: by mail-yw0-x229.google.com with SMTP id q7-v6so653705ywd.9
 for <wireguard@lists.zx2c4.com>; Wed, 16 May 2018 13:32:19 -0700 (PDT)
MIME-Version: 1.0
References: <c1e04862-162f-eff9-7884-467f672608e2@cgws.de>
 <CAKXLc7capqT5oFinwT6Cj1-b2h5gKo+CG+WTLbFO+bG7pR7NsQ@mail.gmail.com>
 <793381ba-b59d-50e4-6d7b-cbe9bef91ba1@cgws.de>
 <489c2f57-574a-1223-9c4d-266904e52c94@gmail.com>
 <20180515202126.yw57deh6st5ebnk6@kowloon>
 <CAKXLc7drht4CVexsCTXwHe-Z_RyFghAhQsXom=z9dtQuxQU48Q@mail.gmail.com>
 <20C72316-B8FC-4515-8DC8-8BC82BF3864F@cgws.de>
In-Reply-To: <20C72316-B8FC-4515-8DC8-8BC82BF3864F@cgws.de>
From: Steve Gilberd <steve@erayd.net>
Date: Thu, 17 May 2018 08:32:06 +1200
Message-ID: <CAJQSx3at0rGtjPrpch2mcCqeTQCZVwaiG1kSHBW19Nk4McJxGQ@mail.gmail.com>
Subject: Re: Need for HW-clock independent timestamps
To: Axel Neumann <neumann@cgws.de>
Content-Type: multipart/alternative; boundary="0000000000007ae724056c589db5"
Cc: wireguard@lists.zx2c4.com
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--0000000000007ae724056c589db5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> $20 would increase the HW cost of many typical community-networks (CN)
deployments significantly.

This seems unlikely. In most cases, $20 is notably less than the cost of a
single node.

> Plus requiering more knowledge, maintenence, and power supply for
sometimes solar-powered setups... no USB.

If that's a concern, then put the GPS on nodes where those constraints
aren't a problem. You only need GPS on a few nodes (or one node if you
don't care about redundancy). Most nodes will get by just fine with just
plain NTP, and can happily fetch their time from the GPS nodes, or from
other non-GPS nodes with a correct time sync.

> It is really NOT as simple as it sounds to plug a $20 GPS !!!

It's not particularly complicated either. The actual setup of the devices
isn't particularly difficult, and you're already touching these nodes to
set up wireguard on them, so "I have to touch the config" isn't a barrier
in this case.

Cheers,
Steve
--=20

Cheers,

*Steve Gilberd*
Erayd LTD *=C2=B7* Consultant
*Phone: +64 4 974-4229 **=C2=B7** Mob: +64 27 565-3237*
*PO Box 10019, The Terrace, Wellington 6143, NZ*

--0000000000007ae724056c589db5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

&gt; $20 would increase the HW cost of many typical community-networks (CN)=
 deployments significantly.<div><br></div><div>This seems unlikely. In most=
 cases, $20 is notably less than the cost of a single node.<br><div dir=3D"=
auto"><br></div><div dir=3D"auto">&gt; Plus requiering more knowledge, main=
tenence, and power supply for sometimes solar-powered setups... no USB.</di=
v><div dir=3D"auto"><br></div><div dir=3D"auto">If that&#39;s a concern, th=
en put the GPS on nodes where those constraints aren&#39;t a problem. You o=
nly need GPS on a few nodes (or one node if you don&#39;t care about redund=
ancy). Most nodes will get by just fine with just plain NTP, and can happil=
y fetch their time from the GPS nodes, or from other non-GPS nodes with a c=
orrect time sync.</div><div dir=3D"auto"><br></div><div dir=3D"auto">&gt; I=
t is really NOT as simple as it sounds to plug a $20 GPS !!!</div><div dir=
=3D"auto"><br></div><div dir=3D"auto">It&#39;s not particularly complicated=
 either. The actual setup of the devices isn&#39;t particularly difficult, =
and you&#39;re already touching these nodes to set up wireguard on them, so=
 &quot;I have to touch the config&quot; isn&#39;t a barrier in this case.</=
div><div dir=3D"auto"><br></div><div dir=3D"auto">Cheers,</div><div dir=3D"=
auto">Steve</div></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature" da=
ta-smartmail=3D"gmail_signature"><p dir=3D"ltr">Cheers,</p>
<p dir=3D"ltr"><b>Steve Gilberd</b><br>
<span style=3D"color:#666666">Erayd LTD=C2=A0</span><span style=3D"color:#6=
66666"><b>=C2=B7</b></span><span style=3D"color:#666666">=C2=A0Consultant</=
span><br>
<span style=3D"color:#666666"><i>Phone: +64 4 974-4229=C2=A0</i></span><spa=
n style=3D"color:#666666"><i><b>=C2=B7</b></i></span><span style=3D"color:#=
666666"><i>=C2=A0Mob: +64 27 565-3237</i></span><br>
<span style=3D"color:#666666"><i>PO Box 10019, The Terrace, Wellington 6143=
, NZ</i></span></p>
</div>

--0000000000007ae724056c589db5--
