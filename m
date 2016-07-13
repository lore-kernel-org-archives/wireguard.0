Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 41ea2f59
 for <wireguard@lists.zx2c4.com>;
 Wed, 13 Jul 2016 16:42:04 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 30e864bb
 for <wireguard@lists.zx2c4.com>;
 Wed, 13 Jul 2016 16:42:04 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 4758d492
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 13 Jul 2016 16:42:02 +0000 (UTC)
Received: by mail-lf0-f54.google.com with SMTP id b199so43786438lfe.0
 for <wireguard@lists.zx2c4.com>; Wed, 13 Jul 2016 09:43:00 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAHmME9qQ=46ZyPLPAw8sDb1bhwWGdEcxoFpof3meV+WUKHrMfg@mail.gmail.com>
References: <CAHmME9oiTG6Hfps0ZqJFJ13UxappXk3TyoLWWu0AZ_G_A65bxQ@mail.gmail.com>
 <CAHmME9qvbXDENXbTYhcf58FR+1vGQfpABXKNRk04+GFM7dt0YA@mail.gmail.com>
 <871t2zt93w.fsf@alice.fifthhorseman.net>
 <CAHmME9qVThvKJpCiDjYZJTWAU+xiVSXXRpWvxY0Vy+-+_X3hzQ@mail.gmail.com>
 <CAHmME9q2Mv7D-wRLGih0r4JHp+ePLQPpgGV-WEcn6sFu9Ewu0Q@mail.gmail.com>
 <CAHmME9pkr5T3fhrEo6kdLvjU9OmPr8qFLvbxrjmwZgFmvjH00A@mail.gmail.com>
 <CAHmME9qQ=46ZyPLPAw8sDb1bhwWGdEcxoFpof3meV+WUKHrMfg@mail.gmail.com>
Date: Wed, 13 Jul 2016 18:42:57 +0200
Message-ID: <CAHmME9rF+cYmwEMcrW9DitPSBtQ=NSVbMWvhiBajwV4FtCwRpQ@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Daniel Kahn Gillmor <dkg@fifthhorseman.net>
Content-Type: multipart/alternative; boundary=001a11410200f301b205378713bd
Cc: Christian Hesse <mail@eworm.de>, zorun@bitsofnetworks.org,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] The Distro Package Maintainers Thread
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--001a11410200f301b205378713bd
Content-Type: text/plain; charset=UTF-8

On Jul 13, 2016 6:35 PM, "Jason A. Donenfeld" <Jason@zx2c4.com> wrote:
> I did it!
>
> $ make test
>
> Will now execute src/test.sh.

If it turns out the test phase of the debian package build process isn't
permitted to do these things, we can always experiment with running this in
qemu or UML... the tests are entirely self-contained.

--001a11410200f301b205378713bd
Content-Type: text/html; charset=UTF-8

<p dir="ltr"><br>
On Jul 13, 2016 6:35 PM, &quot;Jason A. Donenfeld&quot; &lt;<a href="mailto:Jason@zx2c4.com">Jason@zx2c4.com</a>&gt; wrote:<br>
&gt; I did it!<br>
&gt;<br>
&gt; $ make test<br>
&gt;<br>
&gt; Will now execute src/test.sh.</p>
<p dir="ltr">If it turns out the test phase of the debian package build process isn&#39;t permitted to do these things, we can always experiment with running this in qemu or UML... the tests are entirely self-contained.</p>

--001a11410200f301b205378713bd--
