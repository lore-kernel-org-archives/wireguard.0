Return-Path: <SRS0=As8F=XU=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,HTML_OBFUSCATE_05_10,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 838F9C432C2
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 25 Sep 2019 11:02:11 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D593221D7A
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 25 Sep 2019 11:02:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jtnnaUZs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D593221D7A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7fcc0227;
	Wed, 25 Sep 2019 11:01:53 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a135323c
 for <wireguard@lists.zx2c4.com>;
 Wed, 25 Sep 2019 11:01:51 +0000 (UTC)
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 12f9621b
 for <wireguard@lists.zx2c4.com>;
 Wed, 25 Sep 2019 11:01:51 +0000 (UTC)
Received: by mail-io1-xd2b.google.com with SMTP id v2so12611155iob.10
 for <wireguard@lists.zx2c4.com>; Wed, 25 Sep 2019 04:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lYGG7l1TAxNYtQD+Kg+DvJvVPje/QqvHT4oBq+XSsk0=;
 b=jtnnaUZs07Z1ITyX6sjzZ4d0/vBBLMU+sZZYbwLqEsCYiFhkylMtHVtPNnO1plv5Be
 kQVnmmAGx2UMi4K8NZNh7i+RQyF13cRAyUwBClKchLAGf4D+tdPQCMEdCpDshgsnpFLh
 seht8WeXUk/mc8IJRP9yFi9OmhYdVZdfGc7ruScwl/lW5O/KS1d5bQDCoHCrBp3avVjV
 a0YMcw4R5m2kW1EjXGoYGq5jG1uddvXyxH6eHrvbv8gmh6D2EQwSK7LVUQxwLMzTlut2
 Od0wicAW7Aqq8i/Xl7UVjNlDsPDU9thZ+R8AR6jltRaOoS93WI/FwqERTqOr3RjVd5RJ
 N8vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lYGG7l1TAxNYtQD+Kg+DvJvVPje/QqvHT4oBq+XSsk0=;
 b=hbRjZ6HcK8q/cr2/fssi31/YVmBhS9RU6/gzUisgmDz8YV3SuEjCdKJTNnZVUjtS9G
 aoSGjSXHPEa791EvnjrGJh2vYKbiI+jTz9QZu2aRQHVS8frjP6i+F0fxlkzQw874ifOG
 7d5qzKlRHs+yWPlToVIgRgWO4Bj+sbMM61CPkb+/m/f4ETczOZWPZS97gcrowd1IyZEk
 nQJj5JEZlcbQuEegr9+94WoprcwRcEf3tx/tNkkPvEo6vAfe4cFwzRdSAxRLuySF6BBX
 GcmbUuefgaBGQxsZdECQChuAXSTpI1C4R7rfjvTw7B5H+KwVKwEbmD92y+PBvcZZVgnM
 2Ggw==
X-Gm-Message-State: APjAAAVsUY4a4FG7uZdMdvR9mm7gXQ0TwStDjTzNxyyht3SFbHLAL75Y
 jSFI9rFfCCLOelhsM9cRgtq5niTm77UF4o95f1Q=
X-Google-Smtp-Source: APXvYqzSjuCuEIurrgwVCQCgjdxL4ckWCQj3+HpgAaJ17/JtlMybqQJ+kmzQHxanjXCUKSIioLjcQaDJjIMhJBqMaxk=
X-Received: by 2002:a6b:90c4:: with SMTP id s187mr9690285iod.178.1569409310044; 
 Wed, 25 Sep 2019 04:01:50 -0700 (PDT)
MIME-Version: 1.0
References: <573fbdd7-cc13-ee2a-e9a7-eaf095471e3a@noc23.de>
 <CAA6-MF-nK3Jm6jzdXuhk62cqfD4XACtG1md3jvUBCix3fcnuFw@mail.gmail.com>
 <97473dc6-22d5-0a13-f0e6-9ce6767f0ff7@noc23.de>
In-Reply-To: <97473dc6-22d5-0a13-f0e6-9ce6767f0ff7@noc23.de>
From: Janne Johansson <icepic.dz@gmail.com>
Date: Wed, 25 Sep 2019 13:01:38 +0200
Message-ID: <CAA6-MF8c+yxrzR_boA4zhd0-7X2zxJfk8rt9NiysJ87-qXr3eg@mail.gmail.com>
Subject: Re: Build fail on OpenBSD 6.5 amd64
To: Ulrich Kalloch <ulli@noc23.de>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
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
Content-Type: multipart/mixed; boundary="===============4256687521515811559=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============4256687521515811559==
Content-Type: multipart/alternative; boundary="0000000000006eb9a605935e9471"

--0000000000006eb9a605935e9471
Content-Type: text/plain; charset="UTF-8"

Den ons 25 sep. 2019 kl 10:52 skrev Ulrich Kalloch <ulli@noc23.de>:

> >> if you have installed firmware remove it if possible.
> > The install Process check that /usr/include/machine is empty.
> >> then check that the directory /usr/include/machine is empty.
> > If not clean it.
> > I think this part is way off and probably all the way into "bad advice".
> >
> > Cleaning /usr/include/machine is wrong, and fw_update seems completely
> > unrelated to either the contents of the C includes or building WG.
>
> but without cleaning /usr/include/machine the install Process fails ...
>

I made an amd64 VM to test and it went fine:

...

golang.zx2c4.com/wireguard/tun

golang.zx2c4.com/wireguard/device

golang.zx2c4.com/wireguard

install -d "/usr/local/bin" && install -m 0755 "wireguard-go"
"/usr/local/bin/wireguard-go"

gmake: Leaving directory '/usr/src/wireguard/wireguard-go-0.0.20190908'

[+] Cleaning up build directory

comptest# ls /usr/include/machine/


_float.h            exec.h              limits.h            rbus_machdep.h
_types.h            fenv.h              loadfile_machdep.h  reg.h
...

I think your comp-less box was messed up in more ways than you know,
probably because of the random "lets poke here, rerun unrelated fw_update
there" and you had no idea which of your actions made it back into a usable
shape again. Redo your test from scratch (without skipping the compiler
set) and post the output on a pastebin.

If there is an error it needs to get fixed for real and not with
hand-wavingly delete include files needed for other things.

-- 
May the most significant bit of your life be positive.

--0000000000006eb9a605935e9471
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Den ons 25 sep. 2019 kl 10:52 skrev Ulric=
h Kalloch &lt;<a href=3D"mailto:ulli@noc23.de">ulli@noc23.de</a>&gt;:<br></=
div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">&gt;&gt; if you have installed firmware remove it if possible.<br>
&gt; The install Process check that /usr/include/machine is empty.<br>
&gt;&gt; then check that the directory /usr/include/machine is empty.<br>
&gt; If not clean it.<br>
&gt; I think this part is way off and probably all the way into &quot;bad a=
dvice&quot;.<br>
&gt;<br>
&gt; Cleaning /usr/include/machine is wrong, and fw_update seems completely=
<br>
&gt; unrelated to either the contents of the C includes or building WG.<br>
<br>
but without cleaning /usr/include/machine the install Process fails ...=C2=
=A0<br></blockquote><div><br></div><div>I made an amd64 VM to test and it w=
ent fine:</div>





<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">...</span></p><p class=3D"gmail=
-p1" style=3D"margin:0px;font-variant-numeric:normal;font-variant-east-asia=
n:normal;font-stretch:normal;font-size:11px;line-height:normal;font-family:=
Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"font-variant-liga=
tures:no-common-ligatures"><a href=3D"http://golang.zx2c4.com/wireguard/tun=
">golang.zx2c4.com/wireguard/tun</a></span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures"><a href=3D"http://golang.zx2c4.=
com/wireguard/device">golang.zx2c4.com/wireguard/device</a></span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures"><a href=3D"http://golang.zx2c4.=
com/wireguard">golang.zx2c4.com/wireguard</a></span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">install -d &quot;/usr/local/bin=
&quot; &amp;&amp; install -m 0755 &quot;wireguard-go&quot; &quot;/usr/local=
/bin/wireguard-go&quot;</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">gmake: Leaving directory &#39;/=
usr/src/wireguard/wireguard-go-0.0.20190908&#39;</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">[+] Cleaning up build directory=
</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">comptest# ls /usr/include/machi=
ne/<span class=3D"gmail-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0</span></span></=
p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">_float.h<span class=3D"gmail-Ap=
ple-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>exec.=
h<span class=3D"gmail-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 </span>limits.h<span class=3D"gmail-Apple-converted-sp=
ace">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>rbus_machdep.h</span>=
</p>
<div><span style=3D"font-variant-ligatures:no-common-ligatures;color:rgb(0,=
0,0);font-family:Menlo;font-size:11px">_types.h</span><span class=3D"gmail-=
Apple-converted-space" style=3D"font-variant-ligatures:no-common-ligatures;=
color:rgb(0,0,0);font-family:Menlo;font-size:11px">=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 </span><span style=3D"font-variant-ligatures:no-common-li=
gatures;color:rgb(0,0,0);font-family:Menlo;font-size:11px">fenv.h</span><sp=
an class=3D"gmail-Apple-converted-space" style=3D"font-variant-ligatures:no=
-common-ligatures;color:rgb(0,0,0);font-family:Menlo;font-size:11px">=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 </span><span style=3D"font-varia=
nt-ligatures:no-common-ligatures;color:rgb(0,0,0);font-family:Menlo;font-si=
ze:11px">loadfile_machdep.h</span><span class=3D"gmail-Apple-converted-spac=
e" style=3D"font-variant-ligatures:no-common-ligatures;color:rgb(0,0,0);fon=
t-family:Menlo;font-size:11px">=C2=A0 </span><span style=3D"font-variant-li=
gatures:no-common-ligatures;color:rgb(0,0,0);font-family:Menlo;font-size:11=
px">reg.h</span></div><div>...</div><div>=C2=A0</div></div><div>I think you=
r comp-less box was messed up in more ways than you know, probably because =
of the random &quot;lets poke here, rerun unrelated fw_update there&quot; a=
nd you had no idea which of your actions made it back into a usable shape a=
gain. Redo your test from scratch (without skipping the compiler set) and p=
ost the output on a pastebin.</div><div><br></div><div>If there is an error=
 it needs to get fixed for real and not with hand-wavingly delete include f=
iles needed for other things.</div><div>=C2=A0=C2=A0</div>-- <br><div dir=
=3D"ltr" class=3D"gmail_signature">May the most significant bit of your lif=
e be positive.<br></div></div>

--0000000000006eb9a605935e9471--

--===============4256687521515811559==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============4256687521515811559==--
