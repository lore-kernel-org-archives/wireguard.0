Return-Path: <SRS0=TwOG=MV=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06B18C64EAD
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  9 Oct 2018 09:28:12 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 867CD204EC
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  9 Oct 2018 09:28:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NhjS9P2t"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 867CD204EC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4e6d7b58;
	Tue, 9 Oct 2018 09:27:17 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 098d2e57
 for <wireguard@lists.zx2c4.com>; Tue, 9 Oct 2018 09:27:15 +0000 (UTC)
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 130690ab
 for <wireguard@lists.zx2c4.com>; Tue, 9 Oct 2018 09:27:14 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id g32-v6so1013996edg.13
 for <wireguard@lists.zx2c4.com>; Tue, 09 Oct 2018 02:28:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=J7KevjGWes++YCG5vpdnvziaK508IVaH41uc+OHo2n8=;
 b=NhjS9P2tkV/RmKyURtRlzxCCItCIk2i0T1zW06/XyKurg0cpVUZwBSBdk62TKkjSAj
 Le7rsxsmej5PRir42Kda3ZfPjUMZJBEHvUMKs6cLHvjEW90xV2PQpoaj7iEa+HaQkVYX
 NAg8FkK8iX0RyzGPGBxzPZdZmegxAUg0rwhX16KC4y3hsircuOaHGKLVG4L2Tjfwv38M
 Wz1SsQwBdJQ8a4ExCV0V4U4Rq2zgiKeRP4ySR18oMQpRSwcsZwgkied7RUogjGSppbqN
 XUnPN2PPhFBKQ6RpTxOs7lVZ9urb3O6pl/9zq1XWOtDdGxZ5bsiUKwdXfOXpzsr3WNhE
 e50Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=J7KevjGWes++YCG5vpdnvziaK508IVaH41uc+OHo2n8=;
 b=pDmpe++g7MapygJZ5UaRPrh26RAFecittdbDHoPTu6TvLlThx1VKhR4OWp7vS47rNe
 g6791EKga6+BFIhkB1lr/7vlNf0f1uz38J0mBsXsiBQVOB9Jzh+/2c/9qx8Knc6E9WnC
 UVFAy9Tjn/Ne1wsIrMMtYateJdoW9tWFDOjRavf4hfg/W3IKK6osIAKB+PNRZhyG5ZNy
 bWwm/UVuwblZJIjGD3oYr/IjCVBPAzHZCAntVdZce5ui1bofpDmUSIzJAPYRgNsR8m2T
 80NRQpgZ5dTV0biPCT4bFlWpDreKhsgUm1lnRTFLsUlvq8bnNmTCQ8ycagcNJ80iEYzE
 3UnQ==
X-Gm-Message-State: ABuFfogDNGlXr3kQ4slXqs/5iafoty+l22uIOHcLcwce2cIK1WwFxM33
 AKjzIEUAqyskL4a07OArK9V4SzftErgmXd4V8GteziUe
X-Google-Smtp-Source: ACcGV60YL30aHxQe6agbeqtmI6ipvzN1dIh8zMHhF4Ft+1ZrXbfVYmvxb/AThhO/hzLm2AYY3g1057AvzF/41QEIQ90=
X-Received: by 2002:a50:b519:: with SMTP id
 y25-v6mr33972060edd.24.1539077287039; 
 Tue, 09 Oct 2018 02:28:07 -0700 (PDT)
MIME-Version: 1.0
References: <CADdae-jYmx4Um14LK0S0Ay+14CjM8qvh-jmBMFCtXFqWMzCr4A@mail.gmail.com>
 <CAKVinOWVa7YHMs_M=bmjJfE28Yh1Jr1Rtm7PCrdt9DOywoidhA@mail.gmail.com>
 <CADdae-hGbeASZH3A+RWReEjT9oLYE50Oo4DRvtZSOjEept1nxQ@mail.gmail.com>
In-Reply-To: <CADdae-hGbeASZH3A+RWReEjT9oLYE50Oo4DRvtZSOjEept1nxQ@mail.gmail.com>
From: nicolas prochazka <prochazka.nicolas@gmail.com>
Date: Tue, 9 Oct 2018 11:27:56 +0200
Message-ID: <CADdae-gnEM5p-W+e9iYMMAT75tBo5ubeQaTg-37GEU-qT8Lb9g@mail.gmail.com>
Subject: Re: about wireguard-go
To: kexianbin@diyism.com
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
Content-Type: multipart/mixed; boundary="===============6048141090884552390=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============6048141090884552390==
Content-Type: multipart/alternative; boundary="000000000000f9d6ff0577c85aba"

--000000000000f9d6ff0577c85aba
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

In fact :

[nicolas@linux wireguard-go-0.0.20180613]$ printf 'package main\nconst
UseTheKernelModuleInstead =3D 0xdeadbabe\n' > ireallywantobuildon_linux.go
[nicolas@linux wireguard-go-0.0.20180613]$ make
Makefile:7: *** Do not build this for Linux. Instead use the Linux kernel
module. See wireguard.com/install/ for more info..  Stop.


Le mar. 9 oct. 2018 =C3=A0 11:24, nicolas prochazka <prochazka.nicolas@gmai=
l.com>
a =C3=A9crit :

> thanks a lot
> Regards
> NIcolas Prochazka
>
> Le mar. 9 oct. 2018 =C3=A0 11:17, KeXianbin(http://diyism.com) <
> kexianbin@diyism.com> a =C3=A9crit :
>
>> Some hint here:
>> https://gist.github.com/diyism/60aa6ca24df772a4928f1aced65e72ee#file-bar=
geos-on-digitalocean-L40
>>
>> On Tue, Oct 9, 2018 at 5:14 PM, nicolas prochazka <
>> prochazka.nicolas@gmail.com> wrote:
>>
>>> Hello,
>>> We need to compile wireguard-go on linux, because we are using a closed
>>> linux, under we cannot compile module,
>>> how can we do ? make on wireguard-go tells us that is not recommend on
>>> linux
>>>
>>> Regards,
>>> Nicolas Prochazka
>>>
>>> _______________________________________________
>>> WireGuard mailing list
>>> WireGuard@lists.zx2c4.com
>>> https://lists.zx2c4.com/mailman/listinfo/wireguard
>>>
>>>
>>

--000000000000f9d6ff0577c85aba
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>In fact : <br></div><div><br>[nicola=
s@linux wireguard-go-0.0.20180613]$ printf &#39;package main\nconst UseTheK=
ernelModuleInstead =3D 0xdeadbabe\n&#39; &gt; ireallywantobuildon_linux.go<=
br>[nicolas@linux wireguard-go-0.0.20180613]$ make<br>Makefile:7: *** Do no=
t build this for Linux. Instead use the Linux kernel module. See <a href=3D=
"http://wireguard.com/install/">wireguard.com/install/</a> for more info..=
=C2=A0 Stop.<br><br></div></div></div><br><div class=3D"gmail_quote"><div d=
ir=3D"ltr">Le=C2=A0mar. 9 oct. 2018 =C3=A0=C2=A011:24, nicolas prochazka &l=
t;<a href=3D"mailto:prochazka.nicolas@gmail.com">prochazka.nicolas@gmail.co=
m</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div =
dir=3D"ltr"><div>thanks a lot <br></div><div>Regards</div><div>NIcolas Proc=
hazka<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr">Le=C2=
=A0mar. 9 oct. 2018 =C3=A0=C2=A011:17, KeXianbin(<a href=3D"http://diyism.c=
om" target=3D"_blank">http://diyism.com</a>) &lt;<a href=3D"mailto:kexianbi=
n@diyism.com" target=3D"_blank">kexianbin@diyism.com</a>&gt; a =C3=A9crit=
=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div dir=
=3D"ltr">Some hint here: <a href=3D"https://gist.github.com/diyism/60aa6ca2=
4df772a4928f1aced65e72ee#file-bargeos-on-digitalocean-L40" target=3D"_blank=
">https://gist.github.com/diyism/60aa6ca24df772a4928f1aced65e72ee#file-barg=
eos-on-digitalocean-L40</a><br></div></div><div class=3D"gmail_extra"><br><=
div class=3D"gmail_quote">On Tue, Oct 9, 2018 at 5:14 PM, nicolas prochazka=
 <span dir=3D"ltr">&lt;<a href=3D"mailto:prochazka.nicolas@gmail.com" targe=
t=3D"_blank">prochazka.nicolas@gmail.com</a>&gt;</span> wrote:<br><blockquo=
te class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc so=
lid;padding-left:1ex"><div dir=3D"ltr"><div>Hello, <br></div><div>We need t=
o compile wireguard-go on linux, because we are using a closed linux, under=
 we cannot compile module, <br></div><div>how can we do ? make on wireguard=
-go tells us that is not recommend on linux</div><div><br></div><div>Regard=
s, <br></div><div>Nicolas Prochazka<br></div></div>
<br>_______________________________________________<br>
WireGuard mailing list<br>
<a href=3D"mailto:WireGuard@lists.zx2c4.com" target=3D"_blank">WireGuard@li=
sts.zx2c4.com</a><br>
<a href=3D"https://lists.zx2c4.com/mailman/listinfo/wireguard" rel=3D"noref=
errer" target=3D"_blank">https://lists.zx2c4.com/mailman/listinfo/wireguard=
</a><br>
<br></blockquote></div><br></div>
</blockquote></div>
</blockquote></div>

--000000000000f9d6ff0577c85aba--

--===============6048141090884552390==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============6048141090884552390==--
