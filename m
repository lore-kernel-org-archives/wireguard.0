Return-Path: <SRS0=lEMV=UV=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7E89C4646B
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 22 Jun 2019 16:46:56 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 02FF420679
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 22 Jun 2019 16:46:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rBADkZlg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 02FF420679
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 60cfe0c8;
	Sat, 22 Jun 2019 16:46:38 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3f0079af
 for <wireguard@lists.zx2c4.com>;
 Sat, 22 Jun 2019 16:46:36 +0000 (UTC)
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 82c28938
 for <wireguard@lists.zx2c4.com>;
 Sat, 22 Jun 2019 16:46:36 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id w17so10189061qto.10
 for <wireguard@lists.zx2c4.com>; Sat, 22 Jun 2019 09:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=X1+mY71MYq8V5X2fqOYZpBV1dyo6ZTMRBVjzAX/YVBU=;
 b=rBADkZlgFyuZMWOuLNLtXhpWYZLzmYlWvHe7Xe1I3uyu7m/3wj3yFnpXh74MwTgL15
 +v80MPctiMhfouOKyx9vj6UJBIEqIhQAw2VV9/iqmLxgiXwq33r5/KESI3pjOZobONQQ
 si9zCeisCKhSVL4/w1mnfezIlaNdSkW9jCM1fF3tzPpZjIpqt+7mdgpJ7Y/g4tIPEPT5
 JXsuFqy0YmbKiRGvrqDDFQ9hDtTILF+3cOGgjezXtWbr6bSvtL9vDrTK0AeaCT0LnU+X
 Oy9XQKMtlaTcwb6//XXRhL6XxBOiX+UxIkWC6ubU2XpgoHJffNtr3QOyyuaf28TFhoeW
 7JAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=X1+mY71MYq8V5X2fqOYZpBV1dyo6ZTMRBVjzAX/YVBU=;
 b=stGDBz8DAyr/fOt1IQVB43X1iXPZq2w1UWaYfgC9GVphRPH9mw9lTPsLqjik6jobSn
 66+BSFy0rCgcadOTnAHOeT5JxILFUCnw2k27iVqJ+lYuVRWpNFsmF1KfPZq7XQiOCHBT
 bN8ZaXPCzQet5dOHyYkZ1mcVlEckykHD66JdV+pWVEsh8Yx78tCU7iQNEI/ZgqSGkN7P
 gg89K5e0QaZQbbo50kLZwQrG3MC926bLPkSmzoxZRP3RR4+Upfzk/I+NaSwRZp8wtohp
 MyalH3qk+I9DFFxu186FigtqcFJ9xLcWopDsdGlDwa2g5dYXvGltDD/xLFYq7D3atKh6
 JuJA==
X-Gm-Message-State: APjAAAUydiwRd/d75STRd3gIFQVO6877LKK+7VoNMe3nEAg2Pf8oHJ5+
 qS+Owr6LqqKL9FH3s2HneMPPXssucmX7wPXNHPMPceLe
X-Google-Smtp-Source: APXvYqxs2FVvaPLHIboQepMuF/OXiZ+yQ8IKj9/ZHzOo2UOidS/EekzT9mrMOvxZbcbp4UfskV7WQMQn5rERUhVHsyE=
X-Received: by 2002:ac8:3f32:: with SMTP id
 c47mr122031699qtk.342.1561221995740; 
 Sat, 22 Jun 2019 09:46:35 -0700 (PDT)
MIME-Version: 1.0
References: <9bcc3e74ccde028b05ca66a3145da8bf@krash.be>
In-Reply-To: <9bcc3e74ccde028b05ca66a3145da8bf@krash.be>
From: Laszlo KERTESZ <laszlo.kertesz@gmail.com>
Date: Sat, 22 Jun 2019 19:46:24 +0300
Message-ID: <CANcuY=oBZ41KNEeKqqUP5J=5sR-GtffxGym74c2c7SfW=Xhr+g@mail.gmail.com>
Subject: Re: Wireguard kernel module won't load on kernel 4.19.0-5 (Debian
 sid/buster)
To: Nils Cant <nils@krash.be>
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
Content-Type: multipart/mixed; boundary="===============3068369720968809972=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============3068369720968809972==
Content-Type: multipart/alternative; boundary="00000000000078c23d058bec52ea"

--00000000000078c23d058bec52ea
Content-Type: text/plain; charset="UTF-8"

I have this kernel on Debian Stretch (from backports) and wireguard works
just fine with it.


On Sat, Jun 22, 2019 at 10:52 AM Nils Cant <nils@krash.be> wrote:

> Hello,
>
> I'm unable to load the wireguard kernel module on Debian Sid or Debian
> Buster. (4.19.0-5-amd64 kernel)
> (Debian buster is scheduled to be promoted to stable in a couple of weeks)
>
> root@buster:~# modprobe wireguard
> modprobe: ERROR: could not insert 'wireguard': Invalid argument
> root@buster:~# modinfo wireguard
> filename: /lib/modules/4.19.0-5-amd64/updates/dkms/wireguard.ko
> alias: net-pf-16-proto-16-family-wireguard
> alias: rtnl-link-wireguard
> version: 0.0.20190601
> author: Jason A. Donenfeld <Jason@zx2c4.com>
> description: WireGuard secure network tunnel
> license: GPL v2
> srcversion: 69000E9D4B2B253E97C189A
> depends: udp_tunnel,ip6_udp_tunnel
> retpoline: Y
> name: wireguard
> vermagic: 4.19.0-5-amd64 SMP mod_unload modversions
>
> The same version seems to work fine on Debian Stretch (4.9.0-9) or Fedora
> Core 30 (5.1.11-300)
>
> The kernel ring throws a number of symbol version errors:
>
> [...]
> [ 97.450944] wireguard: loading out-of-tree module taints kernel.
> [ 97.453335] wireguard: module verification failed: signature and/or
> required key missing - tainting kernel
> [ 97.457727] wireguard: disagrees about version of symbol skb_put
> [ 97.459772] wireguard: Unknown symbol skb_put (err -22)
> [ 97.461555] wireguard: disagrees about version of symbol ip6_dst_hoplimit
> [ 97.463609] wireguard: Unknown symbol ip6_dst_hoplimit (err -22)
> [ 97.465590] wireguard: disagrees about version of symbol consume_skb
> [ 97.467495] wireguard: Unknown symbol consume_skb (err -22)
> [ 97.469326] wireguard: disagrees about version of symbol udp_sock_create4
> [...]
>
> I have tried both the apt package from debian unstable, as well as compile
> from source.
>
> Any idea what could be going wrong? Is this a Debian kernel bug?
>
>
> Thanks in advance,
>
> Nils
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
>

--00000000000078c23d058bec52ea
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I have this kernel on Debian Stretch (from backports)=
 and wireguard works just fine with it.</div><div><br></div></div><br><div =
class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, Jun 22,=
 2019 at 10:52 AM Nils Cant &lt;<a href=3D"mailto:nils@krash.be">nils@krash=
.be</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x"><u></u><div><div style=3D"font-family:arial,sans-serif;font-size:13px">H=
ello,<br><br>I&#39;m unable to load the wireguard kernel module on Debian S=
id or Debian Buster. (4.19.0-5-amd64 kernel)<br>(Debian buster is scheduled=
 to be promoted to stable in a couple of weeks)<br><br>root@buster:~# modpr=
obe wireguard<br>modprobe: ERROR: could not insert &#39;wireguard&#39;: Inv=
alid argument<br>root@buster:~# modinfo wireguard<br>filename: /lib/modules=
/4.19.0-5-amd64/updates/dkms/wireguard.ko<br>alias: net-pf-16-proto-16-fami=
ly-wireguard<br>alias: rtnl-link-wireguard<br>version: 0.0.20190601<br>auth=
or: Jason A. Donenfeld &lt;<a href=3D"mailto:Jason@zx2c4.com" target=3D"_bl=
ank">Jason@zx2c4.com</a>&gt;<br>description: WireGuard secure network tunne=
l<br>license: GPL v2<br>srcversion: 69000E9D4B2B253E97C189A<br>depends: udp=
_tunnel,ip6_udp_tunnel<br>retpoline: Y<br>name: wireguard<br>vermagic: 4.19=
.0-5-amd64 SMP mod_unload modversions<br><br>The same version seems to work=
 fine on Debian Stretch (4.9.0-9) or Fedora Core 30 (5.1.11-300)<br><br>The=
 kernel ring throws a number of symbol version errors:<br><br>[...]<br>[ 97=
.450944] wireguard: loading out-of-tree module taints kernel.<br>[ 97.45333=
5] wireguard: module verification failed: signature and/or required key mis=
sing - tainting kernel<br>[ 97.457727] wireguard: disagrees about version o=
f symbol skb_put<br>[ 97.459772] wireguard: Unknown symbol skb_put (err -22=
)<br>[ 97.461555] wireguard: disagrees about version of symbol ip6_dst_hopl=
imit<br>[ 97.463609] wireguard: Unknown symbol ip6_dst_hoplimit (err -22)<b=
r>[ 97.465590] wireguard: disagrees about version of symbol consume_skb<br>=
[ 97.467495] wireguard: Unknown symbol consume_skb (err -22)<br>[ 97.469326=
] wireguard: disagrees about version of symbol udp_sock_create4<br>[...]<br=
><br>I have tried both the apt package from debian unstable, as well as com=
pile from source.<br><br>Any idea what could be going wrong? Is this a Debi=
an kernel bug?<br><br><br>Thanks in advance,<br><br>Nils<br> </div></div>
_______________________________________________<br>
WireGuard mailing list<br>
<a href=3D"mailto:WireGuard@lists.zx2c4.com" target=3D"_blank">WireGuard@li=
sts.zx2c4.com</a><br>
<a href=3D"https://lists.zx2c4.com/mailman/listinfo/wireguard" rel=3D"noref=
errer" target=3D"_blank">https://lists.zx2c4.com/mailman/listinfo/wireguard=
</a><br>
</blockquote></div>

--00000000000078c23d058bec52ea--

--===============3068369720968809972==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============3068369720968809972==--
