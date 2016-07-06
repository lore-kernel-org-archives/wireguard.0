Return-Path: Jason@zx2c4.com
MIME-Version: 1.0
In-Reply-To: <20160706154715.GA8543@wolff.to>
References: <20160706120410.GA765@wolff.to>
 <CAHmME9qs42O4KQtsuZDdPGPKEkyxGhHEGxB3crkrgrAaLDKh3w@mail.gmail.com>
 <20160706151911.GA11926@wolff.to>
 <CAHmME9qMVsQ1GDMRu862dNJqw006HuGCv4mPdBb7h8urmQOp+g@mail.gmail.com>
 <20160706154715.GA8543@wolff.to>
Date: Wed, 6 Jul 2016 17:58:12 +0200
Message-ID: <CAHmME9oL2fQawO-GHanCNzaGgyvtGRdExDVO5s5CVeVvJ3Acjg@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Bruno Wolff III <bruno@wolff.to>
Content-Type: multipart/alternative; boundary=001a113db060fd91830536f9a2d2
Cc: WireGuard mailing list <WireGuard@lists.zx2c4.com>
Subject: Re: [WireGuard] Comments on wgserver.service
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--001a113db060fd91830536f9a2d2
Content-Type: text/plain; charset=UTF-8

On Jul 6, 2016 5:47 PM, "Bruno Wolff III" <bruno@wolff.to> wrote:
> I thought those usually end up in rpmfusion, copr or other external
repos, rather than Fedora proper.

Nope, not the case.

>
> I'd still like to see if it is going to land upstream. Even if it ends up
in 4.9, it'd probably be simpler to just wait and package the wg part when
the kernel part is included with the Fedora kernel. If upstream declines
merging it, then things would be different as we'd need to use dkms or
akmod to make the packages easy to use.

It's going to be after 4.9 for sure. We've got a road to go. I'd really
recommend not waiting.

--001a113db060fd91830536f9a2d2
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr"><br>
On Jul 6, 2016 5:47 PM, &quot;Bruno Wolff III&quot; &lt;<a href=3D"mailto:b=
runo@wolff.to">bruno@wolff.to</a>&gt; wrote:<br>
&gt; I thought those usually end up in rpmfusion, copr or other external re=
pos, rather than Fedora proper.</p>
<p dir=3D"ltr">Nope, not the case.</p>
<p dir=3D"ltr">&gt;<br>
&gt; I&#39;d still like to see if it is going to land upstream. Even if it =
ends up in 4.9, it&#39;d probably be simpler to just wait and package the w=
g part when the kernel part is included with the Fedora kernel. If upstream=
 declines merging it, then things would be different as we&#39;d need to us=
e dkms or akmod to make the packages easy to use.</p>
<p dir=3D"ltr">It&#39;s going to be after 4.9 for sure. We&#39;ve got a roa=
d to go. I&#39;d really recommend not waiting.</p>

--001a113db060fd91830536f9a2d2--
