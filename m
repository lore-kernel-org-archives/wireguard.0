Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c5e6744c
 for <wireguard@lists.zx2c4.com>; Thu, 7 Jul 2016 17:15:06 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id aa7fff20
 for <wireguard@lists.zx2c4.com>; Thu, 7 Jul 2016 17:15:06 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id de658185
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 7 Jul 2016 17:15:06 +0000 (UTC)
Received: by mail-lf0-f49.google.com with SMTP id f6so15759425lfg.0
 for <wireguard@lists.zx2c4.com>; Thu, 07 Jul 2016 10:15:19 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20160707165840.GG18014@lud.polynome.dn42>
References: <CAHmME9piH4WkMpJ3p0rzFmtA=ozkfa-+rGbAH0T2OjQ+5AJkJg@mail.gmail.com>
 <20160707165840.GG18014@lud.polynome.dn42>
Date: Thu, 7 Jul 2016 19:15:16 +0200
Message-ID: <CAHmME9pa1fUAwaE9-FsnmfRYrGRrjXAcv2pDYwO-CG9_vO9f7A@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Baptiste Jonglez <baptiste@bitsofnetworks.org>
Content-Type: multipart/alternative; boundary=001a114a729e8d2ce905370ed43a
Cc: wireguard@lists.zx2c4.com
Subject: Re: [WireGuard] NAT-T Keepalives
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--001a114a729e8d2ce905370ed43a
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Jul 7, 2016 6:58 PM, "Baptiste Jonglez" <baptiste@bitsofnetworks.org>
wrote:
> Why not simply use the same technique as the opportunic keepalives, then?
> (encrypted payload)

Because when persistent-keepalive-interval > keylifetime (2 minutes), this
results in a new handshake, causing 3 packets instead of 1.

Also, why waste crypto cycles when you don't have to? If we're just trying
to appease firewalls and NATs, then let's leave the problem at that level,
not let it infect other layers.

>
> One small advantage over the "empty UDP packet" method is that it will
> also refresh the "latest handshake" timer shown in wg (or whatever GUI
> people will build on top of wireguard).  From a user perspective, it's
> nice to know that the VPN is still alive.

No way jos=C3=A9. (In fact I wouldn't mind removing the beloved latest hand=
shake
field.) From the perspective of the sysadmin, wireguard must appear
stateless. Fundamental design goal.

> [0 len could be bad]
> 30 seconds?

I have the same set of speculations and concerns, but it's mostly just
imaginary without real data, as you said. Maybe I'll write into NANOG?

--001a114a729e8d2ce905370ed43a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr"><br>
On Jul 7, 2016 6:58 PM, &quot;Baptiste Jonglez&quot; &lt;<a href=3D"mailto:=
baptiste@bitsofnetworks.org">baptiste@bitsofnetworks.org</a>&gt; wrote:<br>
&gt; Why not simply use the same technique as the opportunic keepalives, th=
en?<br>
&gt; (encrypted payload)</p>
<p dir=3D"ltr">Because when persistent-keepalive-interval &gt; keylifetime =
(2 minutes), this results in a new handshake, causing 3 packets instead of =
1.</p>
<p dir=3D"ltr">Also, why waste crypto cycles when you don&#39;t have to? If=
 we&#39;re just trying to appease firewalls and NATs, then let&#39;s leave =
the problem at that level, not let it infect other layers. </p>
<p dir=3D"ltr">&gt;<br>
&gt; One small advantage over the &quot;empty UDP packet&quot; method is th=
at it will<br>
&gt; also refresh the &quot;latest handshake&quot; timer shown in wg (or wh=
atever GUI<br>
&gt; people will build on top of wireguard).=C2=A0 From a user perspective,=
 it&#39;s<br>
&gt; nice to know that the VPN is still alive.</p>
<p dir=3D"ltr">No way jos=C3=A9. (In fact I wouldn&#39;t mind removing the =
beloved latest handshake field.) From the perspective of the sysadmin, wire=
guard must appear stateless. Fundamental design goal.</p>
<p dir=3D"ltr">&gt; [0 len could be bad]<br>
&gt; 30 seconds?</p>
<p dir=3D"ltr">I have the same set of speculations and concerns, but it&#39=
;s mostly just imaginary without real data, as you said. Maybe I&#39;ll wri=
te into NANOG?<br>
</p>

--001a114a729e8d2ce905370ed43a--
