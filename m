Return-Path: <SRS0=qOIe=3S=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6922BC2D0DB
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 29 Jan 2020 12:59:22 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 029C420716
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 29 Jan 2020 12:59:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=glexia.com header.i=@glexia.com header.b="b5knEkZp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 029C420716
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=glexia.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 261050f0;
	Wed, 29 Jan 2020 12:58:53 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id aeb9ead4
 for <wireguard@lists.zx2c4.com>;
 Wed, 29 Jan 2020 12:57:48 +0000 (UTC)
Received: from mail-vs1-xe34.google.com (mail-vs1-xe34.google.com
 [IPv6:2607:f8b0:4864:20::e34])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 38c2f4d6
 for <wireguard@lists.zx2c4.com>;
 Wed, 29 Jan 2020 12:57:48 +0000 (UTC)
Received: by mail-vs1-xe34.google.com with SMTP id g15so10350151vsf.1
 for <wireguard@lists.zx2c4.com>; Wed, 29 Jan 2020 04:57:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=glexia.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=+dcYBPB5NVXRYmw2y2bXvL+WohO/Xg374aVtrfzcuTQ=;
 b=b5knEkZphGY4kaC4oX0iDhpXQdAKeGggWX2wkWkJ4arGjtUpCdex0DuL8f0hWgxEWU
 ji8F0MVMN+jbtrPqVvevsyZQYY0G8Bkw0v6NReb5G1lkZyEmbCourqhk0rGI2Fu0xYkY
 P/SnneAY/pnGOMGKOk3r85Q6niLE930KzbUwF05/NAvndp9m5YOf9k0OTkdQVjEd1nI8
 T8cMCCZXPNmOf7wusv5OH/dEDU7jilMBzbYiX3/UrwKLHnFqDZPZtYh/VEQDxoOEiC4Z
 dBem+/jxnzrxxkahZVONrGM4sBzGFvBg5i8KaGPZqRK2gb53zFvOFMYroDGCd2LPZohA
 gskQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=+dcYBPB5NVXRYmw2y2bXvL+WohO/Xg374aVtrfzcuTQ=;
 b=eeY0NPLZejEcOD0p8SL0t7Uo9dniVD2201gi7vJGaxHR/bZBQ+CK4wGhEovuTrn7xU
 efoSyiCsKTuWXHj9MBSTu0H+EaYLm8DY+nVrLP5RnsO9EJ8B5ZD5pkXfFamzXhvloPF6
 r/RJXYeviGAKVOuDevY+Wc5MOxpqXw7PJ7InaMcJZgk8krUovRmqiM5pcbsECS0KiwU6
 eo/jiCL+1rqsr6M45o9x9QLdqVv576X0y0o35qy0SFlf64OW/nMR8U8IrCP5MdAKGID/
 +OzbF5Bp98RlVloJnTXHA/vT7R/KzTy5snXlmunSP0en5U05W9rHB375BPKdTKNvEToy
 E/KQ==
X-Gm-Message-State: APjAAAW5QXCi/Jdh3GrfAFg9m15NIV3EiE41cebzGr+sj7hp/9Sodh85
 UYtjy56RMFjX32vejlnGztzOc51pe27zugAuyCgqFw==
X-Google-Smtp-Source: APXvYqxFiUHk78f43cdvCFo8SFrQjsEUQeO8nic6iRSZIkp9xVgNYQmjFoOtE3u2Fp+DYhB3Kc4tDZIUGVjLWXQD5Lc=
X-Received: by 2002:a67:ec12:: with SMTP id d18mr16885944vso.129.1580302668716; 
 Wed, 29 Jan 2020 04:57:48 -0800 (PST)
MIME-Version: 1.0
References: <CAHmME9rProfVf4VGHGX9no3KTa08nL_oYkK8Nv+eknk4ewVMAw@mail.gmail.com>
 <20200129122259.GA25949@Gentoo>
In-Reply-To: <20200129122259.GA25949@Gentoo>
From: "Michael B. Williams" <Michael.Williams@glexia.com>
Date: Wed, 29 Jan 2020 23:57:37 +1100
Message-ID: <CAGj=18GhHmUqCKvwJWs+yEGQWBOsaSQW_no+x3Tr6wtRdfO5=Q@mail.gmail.com>
Subject: Re: wireguard ci hooked up to quite a few kernel trees
To: Bhaskar Chowdhury <unixbhaskar@gmail.com>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>, 
 LKML <linux-kernel@vger.kernel.org>, 
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Netdev <netdev@vger.kernel.org>, 
 WireGuard mailing list <wireguard@lists.zx2c4.com>
X-Mailman-Approved-At: Wed, 29 Jan 2020 13:58:52 +0100
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============7499105852164109889=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============7499105852164109889==
Content-Type: multipart/alternative; boundary="00000000000034fa70059d46e3d1"

--00000000000034fa70059d46e3d1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

What=E2=80=99s with all the =E2=80=9CBuilt Invalid Date=E2=80=9D below each=
 commit hash.

On Wed, Jan 29, 2020 at 23:37 Bhaskar Chowdhury <unixbhaskar@gmail.com>
wrote:

> Looks bloody good Jason! thanks, man!
>
> ~Bhaskar
>
> On 13:15 Wed 29 Jan 2020, Jason A. Donenfeld wrote:
> >Hi all,
> >
> >With the merging of wireguard, I've hooked the project's CI up to
> >quite a few trees. We now have:
> >
> >- net-next
> >- net
> >- linux-next
> >- linux (Linus' tree)
> >- wireguard-linux (my tree)
> >- wireguard-linux-compat (backports to kernels 3.10 - 5.5)
> >
> >When the various pushes and pulls click a few more cranks through the
> >machinery, I'll probably add crypto and cryptodev, and eventually
> >Greg's stable trees. If anybody has suggestions on other relevant
> >trees that might help catch bugs as early as possible, I'm all ears.
> >
> >Right now builds are kicked off for every single commit made to each
> >one of these trees, on x86_64, i686, aarch64, aarch64_be, arm, armeb,
> >mips64, mips64el, mips, mipsel, powerpc64le, powerpc, and m68k. For
> >each of these, a fresh kernel and miniature userland containing the
> >test suite is built from source, and then booted in qemu.
> >
> >Even though the CI at the moment is focused on the wireguard test
> >suite, it has a habit of finding lots of bugs and regressions in other
> >weird places. For example, linux-next is failing at the moment on a
> >few archs.
> >
> >I run this locally every day all day while developing kernel things
> >too. It's one command to test a full kernel for whatever thing I'm
> >working on, and this winds up saving a lot of time in development and
> >lets me debug things with printk in the dumbest ways possible while
> >still being productive and efficient.
> >
> >You can view the current build status here:
> >https://www.wireguard.com/build-status/
> >
> >This sort of CI is another take on the kernel CI problem; I know a few
> >organizations are doing similar things. I'd be happy to eventually
> >expand this into something more general, should there be sufficient
> >interest -- probably initially on networking stuff -- or it might turn
> >out that this simply inspires something else that is more general and
> >robust, which is fine too. Either way, here's my contribution to the
> >modicum of kernel CI things happening.
> >
> >Regards,
> >Jason
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
>
--=20
Sent from Gmail Mobile

--00000000000034fa70059d46e3d1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div dir=3D"auto">What=E2=80=99s with all the =E2=80=9CBuilt Invalid D=
ate=E2=80=9D below each commit hash.</div></div><div><br><div class=3D"gmai=
l_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jan 29, 2020 at 23:3=
7 Bhaskar Chowdhury &lt;<a href=3D"mailto:unixbhaskar@gmail.com">unixbhaska=
r@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Looks bl=
oody good Jason! thanks, man!<br>
<br>
~Bhaskar<br>
<br>
On 13:15 Wed 29 Jan 2020, Jason A. Donenfeld wrote:<br>
&gt;Hi all,<br>
&gt;<br>
&gt;With the merging of wireguard, I&#39;ve hooked the project&#39;s CI up =
to<br>
&gt;quite a few trees. We now have:<br>
&gt;<br>
&gt;- net-next<br>
&gt;- net<br>
&gt;- linux-next<br>
&gt;- linux (Linus&#39; tree)<br>
&gt;- wireguard-linux (my tree)<br>
&gt;- wireguard-linux-compat (backports to kernels 3.10 - 5.5)<br>
&gt;<br>
&gt;When the various pushes and pulls click a few more cranks through the<b=
r>
&gt;machinery, I&#39;ll probably add crypto and cryptodev, and eventually<b=
r>
&gt;Greg&#39;s stable trees. If anybody has suggestions on other relevant<b=
r>
&gt;trees that might help catch bugs as early as possible, I&#39;m all ears=
.<br>
&gt;<br>
&gt;Right now builds are kicked off for every single commit made to each<br=
>
&gt;one of these trees, on x86_64, i686, aarch64, aarch64_be, arm, armeb,<b=
r>
&gt;mips64, mips64el, mips, mipsel, powerpc64le, powerpc, and m68k. For<br>
&gt;each of these, a fresh kernel and miniature userland containing the<br>
&gt;test suite is built from source, and then booted in qemu.<br>
&gt;<br>
&gt;Even though the CI at the moment is focused on the wireguard test<br>
&gt;suite, it has a habit of finding lots of bugs and regressions in other<=
br>
&gt;weird places. For example, linux-next is failing at the moment on a<br>
&gt;few archs.<br>
&gt;<br>
&gt;I run this locally every day all day while developing kernel things<br>
&gt;too. It&#39;s one command to test a full kernel for whatever thing I&#3=
9;m<br>
&gt;working on, and this winds up saving a lot of time in development and<b=
r>
&gt;lets me debug things with printk in the dumbest ways possible while<br>
&gt;still being productive and efficient.<br>
&gt;<br>
&gt;You can view the current build status here:<br>
&gt;<a href=3D"https://www.wireguard.com/build-status/" rel=3D"noreferrer" =
target=3D"_blank">https://www.wireguard.com/build-status/</a><br>
&gt;<br>
&gt;This sort of CI is another take on the kernel CI problem; I know a few<=
br>
&gt;organizations are doing similar things. I&#39;d be happy to eventually<=
br>
&gt;expand this into something more general, should there be sufficient<br>
&gt;interest -- probably initially on networking stuff -- or it might turn<=
br>
&gt;out that this simply inspires something else that is more general and<b=
r>
&gt;robust, which is fine too. Either way, here&#39;s my contribution to th=
e<br>
&gt;modicum of kernel CI things happening.<br>
&gt;<br>
&gt;Regards,<br>
&gt;Jason<br>
_______________________________________________<br>
WireGuard mailing list<br>
<a href=3D"mailto:WireGuard@lists.zx2c4.com" target=3D"_blank">WireGuard@li=
sts.zx2c4.com</a><br>
<a href=3D"https://lists.zx2c4.com/mailman/listinfo/wireguard" rel=3D"noref=
errer" target=3D"_blank">https://lists.zx2c4.com/mailman/listinfo/wireguard=
</a><br>
</blockquote></div></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature" =
data-smartmail=3D"gmail_signature">Sent from Gmail Mobile</div>

--00000000000034fa70059d46e3d1--

--===============7499105852164109889==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============7499105852164109889==--
