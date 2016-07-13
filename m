Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 07236a0b
 for <wireguard@lists.zx2c4.com>;
 Wed, 13 Jul 2016 14:28:43 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 064f9d85
 for <wireguard@lists.zx2c4.com>;
 Wed, 13 Jul 2016 14:28:42 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 44877d8c
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 13 Jul 2016 14:28:41 +0000 (UTC)
Received: by mail-lf0-f52.google.com with SMTP id b199so40905462lfe.0
 for <wireguard@lists.zx2c4.com>; Wed, 13 Jul 2016 07:29:37 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAHmME9qVThvKJpCiDjYZJTWAU+xiVSXXRpWvxY0Vy+-+_X3hzQ@mail.gmail.com>
References: <CAHmME9oiTG6Hfps0ZqJFJ13UxappXk3TyoLWWu0AZ_G_A65bxQ@mail.gmail.com>
 <CAHmME9qvbXDENXbTYhcf58FR+1vGQfpABXKNRk04+GFM7dt0YA@mail.gmail.com>
 <871t2zt93w.fsf@alice.fifthhorseman.net>
 <CAHmME9qVThvKJpCiDjYZJTWAU+xiVSXXRpWvxY0Vy+-+_X3hzQ@mail.gmail.com>
Date: Wed, 13 Jul 2016 16:29:34 +0200
Message-ID: <CAHmME9q2Mv7D-wRLGih0r4JHp+ePLQPpgGV-WEcn6sFu9Ewu0Q@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Daniel Kahn Gillmor <dkg@fifthhorseman.net>
Content-Type: multipart/alternative; boundary=001a114010eee4f41d05378536fb
Cc: zorun@bitsofnetworks.org,
 WireGuard mailing list <wireguard@lists.zx2c4.com>,
 Christian Hesse <mail@eworm.de>
Subject: Re: [WireGuard] The Distro Package Maintainers Thread
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--001a114010eee4f41d05378536fb
Content-Type: text/plain; charset=UTF-8

On Jul 12, 2016 5:27 PM, "Jason A. Donenfeld" <zx2c4@gentoo.org> wrote:
> That's a good point. Alright, that seems sufficient motivation for me
> to construct a good automated test harness.

So I briefly thought about this and made some infrastructure changes. The
demo.wireguard.io box is now infrastructure stable enough for use in
automated test suites. So, as a first run at an automated test, these
things could happen:

1. dpkg -i path/to/pkgs
2. Set up a wireguard tunnel to the demo box.
3. ping -c 1 the demo box through the tunnel and see if it reports success.
4. remove the wireguard tunnel.

If these succeed, it passes.

Now (2) is a subtle point. It's not a good idea to use the private key in
the contrib/external-tests/ because it's possible somebody else will be
using it. (As a general rule, private keys should never be shared or leave
the box on which they were generated.) Alternatively, the ncat client.sh
can be used to provision things dynamically. Or, you could generate a
private key that remains private on debian infrastructure, and send me the
public key. I'm okay with either.

However, it might be easiest to simply use network namespaces and run all
this locally. I'm about to take an airplane; I'll create a 'make test' that
does this. Then you could just incorporate calling that into your build
system; would that work for you?

--001a114010eee4f41d05378536fb
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr"><br>
On Jul 12, 2016 5:27 PM, &quot;Jason A. Donenfeld&quot; &lt;<a href=3D"mail=
to:zx2c4@gentoo.org">zx2c4@gentoo.org</a>&gt; wrote:<br>
&gt; That&#39;s a good point. Alright, that seems sufficient motivation for=
 me<br>
&gt; to construct a good automated test harness.</p>
<p dir=3D"ltr">So I briefly thought about this and made some infrastructure=
 changes. The <a href=3D"http://demo.wireguard.io">demo.wireguard.io</a> bo=
x is now infrastructure stable enough for use in automated test suites. So,=
 as a first run at an automated test, these things could happen:</p>
<p dir=3D"ltr">1. dpkg -i path/to/pkgs<br>
2. Set up a wireguard tunnel to the demo box.<br>
3. ping -c 1 the demo box through the tunnel and see if it reports success.=
<br>
4. remove the wireguard tunnel.</p>
<p dir=3D"ltr">If these succeed, it passes.</p>
<p dir=3D"ltr">Now (2) is a subtle point. It&#39;s not a good idea to use t=
he private key in the contrib/external-tests/ because it&#39;s possible som=
ebody else will be using it. (As a general rule, private keys should never =
be shared or leave the box on which they were generated.) Alternatively, th=
e ncat client.sh can be used to provision things dynamically. Or, you could=
 generate a private key that remains private on debian infrastructure, and =
send me the public key. I&#39;m okay with either.</p>
<p dir=3D"ltr">However, it might be easiest to simply use network namespace=
s and run all this locally. I&#39;m about to take an airplane; I&#39;ll cre=
ate a &#39;make test&#39; that does this. Then you could just incorporate c=
alling that into your build system; would that work for you?</p>

--001a114010eee4f41d05378536fb--
