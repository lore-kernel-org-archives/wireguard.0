Return-Path: <SRS0=TwOG=MV=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C65D7C64EAD
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  9 Oct 2018 09:24:46 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 622122086D
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  9 Oct 2018 09:24:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OIOOVPbm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 622122086D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 49b4f2f9;
	Tue, 9 Oct 2018 09:23:52 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 94180331
 for <wireguard@lists.zx2c4.com>; Tue, 9 Oct 2018 09:23:50 +0000 (UTC)
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 52b24b8a
 for <wireguard@lists.zx2c4.com>; Tue, 9 Oct 2018 09:23:50 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id h13-v6so1044694edq.0
 for <wireguard@lists.zx2c4.com>; Tue, 09 Oct 2018 02:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KuUV8j4K4CWeyMdW6k/UTrvHr98a3VY0kMFI0YikEnk=;
 b=OIOOVPbmR0mhkWagUP8wvHEXJM+egTXk1Jazn1g/dy2ILN2HN+e80ewKRqkCyP1PRi
 Cy3bcgZUYcMLsBJG8I/LKGXPA3KFJC9Vte66OCD6k1rPNLs3JuUl4awuLSD1HE1CaBgH
 h4BxY3FGCD+f4SAZdrMwsFhcME4H7rByH4eWmgHnHWdtB4MFGggWUseh2EAXnxGpjlFA
 o9Ik1eabTgC42lweBD3FDyq533SHNP19+0rU0hZm8u/TQGo4XB+qJpWh3pphnni0pKbs
 c9tj7fbWj0WaSDC6bpJPEHBUAtQMVpKSwz2awED0f8sUc5fHSFCnemgHi0uQuF1YvKQN
 AQQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KuUV8j4K4CWeyMdW6k/UTrvHr98a3VY0kMFI0YikEnk=;
 b=pjMdq1pPdiJkmBqKk/rJeXymMvxgvgD+MQ0PFhV7iY/hqW7XOe7KE2g2E/Ise6EjhQ
 e/bZ3oVkT1g1NX9XngU5ipvd5E5fDD4wxObAOuPy5AIwtF2ziRgJQssBMVW4aIl0+Ax9
 GU44175IbP6bhXiB7Pwu4UNhWc2ZQsVS/67qXGYueDr2XSClc5JFxJJnKlAUcVak7V4r
 83ui/+N3W9SbPutN5kXZPdr32eBsnx8kxh7VMGAfT1N0vldtCHSCw1q8BeL3kwyeYL0I
 GfdLDSTjg+V0YpnHtsUCHSKPAIOLnvXf1bbh7g3wZNtSo/vtO2tvhHGjf48P1igVLNOS
 TacA==
X-Gm-Message-State: ABuFfoi975YAyZsqbQYRFPccZhNF2uKMUQqaLLqduc3KdL292HgXNehT
 qvDG7d43qF/+u64GxIjvLh0XHghAGCcc6IzGpkptgw==
X-Google-Smtp-Source: ACcGV63/44zhPnPzxHxit/Z5aRhU6Mgu+0yx40qFiX00wUCoAQp0hd0nb6TM0tExdno8OusH0+PSCt7bToOVZUVOagY=
X-Received: by 2002:a50:b765:: with SMTP id
 g92-v6mr34429326ede.94.1539077082344; 
 Tue, 09 Oct 2018 02:24:42 -0700 (PDT)
MIME-Version: 1.0
References: <CADdae-jYmx4Um14LK0S0Ay+14CjM8qvh-jmBMFCtXFqWMzCr4A@mail.gmail.com>
 <CAKVinOWVa7YHMs_M=bmjJfE28Yh1Jr1Rtm7PCrdt9DOywoidhA@mail.gmail.com>
In-Reply-To: <CAKVinOWVa7YHMs_M=bmjJfE28Yh1Jr1Rtm7PCrdt9DOywoidhA@mail.gmail.com>
From: nicolas prochazka <prochazka.nicolas@gmail.com>
Date: Tue, 9 Oct 2018 11:24:31 +0200
Message-ID: <CADdae-hGbeASZH3A+RWReEjT9oLYE50Oo4DRvtZSOjEept1nxQ@mail.gmail.com>
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
Content-Type: multipart/mixed; boundary="===============0437319365798610821=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============0437319365798610821==
Content-Type: multipart/alternative; boundary="000000000000c671630577c84ef3"

--000000000000c671630577c84ef3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

thanks a lot
Regards
NIcolas Prochazka

Le mar. 9 oct. 2018 =C3=A0 11:17, KeXianbin(http://diyism.com) <
kexianbin@diyism.com> a =C3=A9crit :

> Some hint here:
> https://gist.github.com/diyism/60aa6ca24df772a4928f1aced65e72ee#file-barg=
eos-on-digitalocean-L40
>
> On Tue, Oct 9, 2018 at 5:14 PM, nicolas prochazka <
> prochazka.nicolas@gmail.com> wrote:
>
>> Hello,
>> We need to compile wireguard-go on linux, because we are using a closed
>> linux, under we cannot compile module,
>> how can we do ? make on wireguard-go tells us that is not recommend on
>> linux
>>
>> Regards,
>> Nicolas Prochazka
>>
>> _______________________________________________
>> WireGuard mailing list
>> WireGuard@lists.zx2c4.com
>> https://lists.zx2c4.com/mailman/listinfo/wireguard
>>
>>
>

--000000000000c671630577c84ef3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>thanks a lot <br></div><div>Regards</div><div>NIcolas=
 Prochazka<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr">L=
e=C2=A0mar. 9 oct. 2018 =C3=A0=C2=A011:17, KeXianbin(<a href=3D"http://diyi=
sm.com">http://diyism.com</a>) &lt;<a href=3D"mailto:kexianbin@diyism.com">=
kexianbin@diyism.com</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr">Some hint here: <a href=3D"=
https://gist.github.com/diyism/60aa6ca24df772a4928f1aced65e72ee#file-bargeo=
s-on-digitalocean-L40" target=3D"_blank">https://gist.github.com/diyism/60a=
a6ca24df772a4928f1aced65e72ee#file-bargeos-on-digitalocean-L40</a><br></div=
></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Tue, Oc=
t 9, 2018 at 5:14 PM, nicolas prochazka <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:prochazka.nicolas@gmail.com" target=3D"_blank">prochazka.nicolas@gmail=
.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"lt=
r"><div>Hello, <br></div><div>We need to compile wireguard-go on linux, bec=
ause we are using a closed linux, under we cannot compile module, <br></div=
><div>how can we do ? make on wireguard-go tells us that is not recommend o=
n linux</div><div><br></div><div>Regards, <br></div><div>Nicolas Prochazka<=
br></div></div>
<br>_______________________________________________<br>
WireGuard mailing list<br>
<a href=3D"mailto:WireGuard@lists.zx2c4.com" target=3D"_blank">WireGuard@li=
sts.zx2c4.com</a><br>
<a href=3D"https://lists.zx2c4.com/mailman/listinfo/wireguard" rel=3D"noref=
errer" target=3D"_blank">https://lists.zx2c4.com/mailman/listinfo/wireguard=
</a><br>
<br></blockquote></div><br></div>
</blockquote></div>

--000000000000c671630577c84ef3--

--===============0437319365798610821==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============0437319365798610821==--
