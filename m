Return-Path: <SRS0=Af8f=VO=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2046BC7618F
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 17 Jul 2019 20:43:21 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A7DCA21850
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 17 Jul 2019 20:43:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nzNKgELQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A7DCA21850
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5609fa51;
	Wed, 17 Jul 2019 20:43:20 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id dcc096f1
 for <wireguard@lists.zx2c4.com>;
 Tue, 16 Jul 2019 20:07:55 +0000 (UTC)
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e1f7a98c
 for <wireguard@lists.zx2c4.com>;
 Tue, 16 Jul 2019 20:07:55 +0000 (UTC)
Received: by mail-io1-xd41.google.com with SMTP id q22so42037354iog.4
 for <wireguard@lists.zx2c4.com>; Tue, 16 Jul 2019 13:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FcJYla9+KycMPsxhr50jF2YdHaUSBqAG+PWoaqf+I+w=;
 b=nzNKgELQuKk2NDys42rvc/FXtwCyzV3MWf7ztXSzeTO12LSnUd3DeBxz4Ya3iu7rAx
 4PRTYclq+DCSPUTm0Y1z2mBz2w15IcNHf2emFNHqtJSg4+9dVBhUpsmHnqLLmullLwyG
 XlkgajYpTaRLgkUm0sMNfjLULXIPFGv55O/dqAKkqZIAVnE4n9Ym1oikhi9YGhIFRQ50
 PQ/6QOeb84BE0klzmW9oIoegATS3hQOCfMiPaEMe29Tv3abEgEv0TGti3cedmWtoZ9It
 iKHdasy/FYsKoc83zcgrX6QKKekQ/FR5ea+bOO/vbTPpoCj1f+Vhl2iu2O5sGmusq865
 77pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FcJYla9+KycMPsxhr50jF2YdHaUSBqAG+PWoaqf+I+w=;
 b=BS+CJ1tQj2Mj8jTrgMnUEo9z9H0ksCUDO8mLEZcihlA9JLaPvEe1UKrb52k/IN27z/
 6ZOaGFt9aMvdK/2UTl1xi3Tl+d8fIDawxIXF0ugOe++KWV0lfGFPa5ymQrhbllRSEAHn
 bZgB2W24yGoShh2HSTmRtpz/+P77R/LJaYJ2DgVcvdSSXIcQUWZp/VA2JWyrOb36Wn0i
 2uiY6mxdJriXqb+oJ0Cn+Z1UdE+A1XwqyoYBSdSanArGa5Pojcydek8SNvcAcBlGzVg8
 lAywqAmblvZmDhTTmKS8T92actNPgeQhHhBo9RpU9Id4heCY8NWsOFYU2Mijm8UAtabg
 W7KQ==
X-Gm-Message-State: APjAAAXnag80JxMp7h72LzAH5IyK8DYAjFk2XU/JqalX5fOXda/Z2h5t
 3Gqv2jSGhL5Pk2R4cqYx4JZidJCF4TKrKoqzuM4=
X-Google-Smtp-Source: APXvYqx7LGYyQwPskw0Yw1OyOLxc5ztPO0mTkUK/BaQ+y+h2LC46oSDYpiVes6YNsIEGs0Mt+K1Sj/4XJ3WMaOxaPYU=
X-Received: by 2002:a6b:4e1a:: with SMTP id c26mr32784310iob.178.1563307674856; 
 Tue, 16 Jul 2019 13:07:54 -0700 (PDT)
MIME-Version: 1.0
References: <ff30a296-bdb9-3b13-5fb1-636a520300c0@higgsboson.tk>
 <YKHm3E7XFkL3dPRaVjHwiURlLU4Q1SCJxWCu4j40Fd1TGco-rzr6XXAJ5I_kjb8H2X_vp5NgKz8EBBOpWqIDE8COgWd4aipFzmbiCaCtLbQ=@protonmail.ch>
In-Reply-To: <YKHm3E7XFkL3dPRaVjHwiURlLU4Q1SCJxWCu4j40Fd1TGco-rzr6XXAJ5I_kjb8H2X_vp5NgKz8EBBOpWqIDE8COgWd4aipFzmbiCaCtLbQ=@protonmail.ch>
From: Janne Johansson <icepic.dz@gmail.com>
Date: Tue, 16 Jul 2019 22:07:43 +0200
Message-ID: <CAA6-MF-AKSur+o78xguSc9W4C1RX2tnc6SCQV8vyCPgXGMKzdg@mail.gmail.com>
Subject: Re: [PATCH] treewide: more portable bash shebangs
To: Jordan Glover <Golden_Miller83@protonmail.ch>
X-Mailman-Approved-At: Wed, 17 Jul 2019 22:43:19 +0200
Cc: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
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
Content-Type: multipart/mixed; boundary="===============5832693082655930933=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============5832693082655930933==
Content-Type: multipart/alternative; boundary="000000000000a274b3058dd1ee9a"

--000000000000a274b3058dd1ee9a
Content-Type: text/plain; charset="UTF-8"

Den tis 16 juli 2019 kl 19:34 skrev Jordan Glover <
Golden_Miller83@protonmail.ch>:

> > While /usr/bin/env is more or less available on all POSIX systems
> > /bin/bash might not be. This is particular the case on NixOS and the BSD
> > family (/usr/local/bin/bash). Downstream packagers would often rewrite
> > those shebangs back automatically as they can rely on absolute paths
> > but having portable shebangs in the repository helps to run the code
> > without any further modification.
> >
>
> The reason almost everyone hardcodes bash to /bin/bash is the potential
> environment attack where someone create malicious "bash" and export it in
> PATH:
>
>
> https://developer.apple.com/library/archive/documentation/OpenSource/Conceptual/ShellScripting/ShellScriptSecurity/ShellScriptSecurity.html


Well, if they rewrite your env and PATH you can't trust anything you do on
that box ever. If wg is started with a malicious environment where IFS is
set to "/" so that
"/bin/bash" (or any absolute-path-named-program) turns into " bin bash"
then an evil PATH pointing to that "bin" would still start a bad script for
you.

https://books.google.se/books?id=-aIKj0lbADIC&pg=PT182&lpg=PT182&dq=set+IFS+to+slash&source=bl&ots=cNQdBQUJEv&sig=ACfU3U0apkUJWhJRjnJMgKlRBFBPD5nZ6g&hl=en&sa=X&ved=2ahUKEwiP0Ka8nrrjAhVOwsQBHZOtC08Q6AEwBHoECAgQAQ#v=onepage&q=set%20IFS%20to%20slash&f=false


-- 
May the most significant bit of your life be positive.

--000000000000a274b3058dd1ee9a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Den tis 16 juli 2019 kl 19:34 skrev Jorda=
n Glover &lt;<a href=3D"mailto:Golden_Miller83@protonmail.ch">Golden_Miller=
83@protonmail.ch</a>&gt;:</div><div class=3D"gmail_quote"><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
&gt; While /usr/bin/env is more or less available on all POSIX systems<br>
&gt; /bin/bash might not be. This is particular the case on NixOS and the B=
SD<br>
&gt; family (/usr/local/bin/bash). Downstream packagers would often rewrite=
<br>
&gt; those shebangs back automatically as they can rely on absolute paths<b=
r>
&gt; but having portable shebangs in the repository helps to run the code<b=
r>
&gt; without any further modification.<br>
&gt;<br>
<br>
The reason almost everyone hardcodes bash to /bin/bash is the potential<br>
environment attack where someone create malicious &quot;bash&quot; and expo=
rt it in PATH:<br>
<br>
<a href=3D"https://developer.apple.com/library/archive/documentation/OpenSo=
urce/Conceptual/ShellScripting/ShellScriptSecurity/ShellScriptSecurity.html=
" rel=3D"noreferrer" target=3D"_blank">https://developer.apple.com/library/=
archive/documentation/OpenSource/Conceptual/ShellScripting/ShellScriptSecur=
ity/ShellScriptSecurity.html</a></blockquote><div><br></div><div>Well, if t=
hey rewrite your env and PATH you can&#39;t trust anything you do on that b=
ox ever. If wg is started with a malicious environment where IFS is set to =
&quot;/&quot; so that</div><div>&quot;/bin/bash&quot; (or any absolute-path=
-named-program) turns into &quot; bin bash&quot; then an evil PATH pointing=
 to that &quot;bin&quot; would still start a bad script for you.</div><div>=
<br></div><div><a href=3D"https://books.google.se/books?id=3D-aIKj0lbADIC&a=
mp;pg=3DPT182&amp;lpg=3DPT182&amp;dq=3Dset+IFS+to+slash&amp;source=3Dbl&amp=
;ots=3DcNQdBQUJEv&amp;sig=3DACfU3U0apkUJWhJRjnJMgKlRBFBPD5nZ6g&amp;hl=3Den&=
amp;sa=3DX&amp;ved=3D2ahUKEwiP0Ka8nrrjAhVOwsQBHZOtC08Q6AEwBHoECAgQAQ#v=3Don=
epage&amp;q=3Dset%20IFS%20to%20slash&amp;f=3Dfalse">https://books.google.se=
/books?id=3D-aIKj0lbADIC&amp;pg=3DPT182&amp;lpg=3DPT182&amp;dq=3Dset+IFS+to=
+slash&amp;source=3Dbl&amp;ots=3DcNQdBQUJEv&amp;sig=3DACfU3U0apkUJWhJRjnJMg=
KlRBFBPD5nZ6g&amp;hl=3Den&amp;sa=3DX&amp;ved=3D2ahUKEwiP0Ka8nrrjAhVOwsQBHZO=
tC08Q6AEwBHoECAgQAQ#v=3Donepage&amp;q=3Dset%20IFS%20to%20slash&amp;f=3Dfals=
e</a><br></div><div><br></div><div><br></div></div>-- <br><div dir=3D"ltr" =
class=3D"gmail_signature">May the most significant bit of your life be posi=
tive.<br></div></div>

--000000000000a274b3058dd1ee9a--

--===============5832693082655930933==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============5832693082655930933==--
