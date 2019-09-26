Return-Path: <SRS0=Bwq/=XV=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FB65C432C2
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 26 Sep 2019 00:14:00 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A363520872
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 26 Sep 2019 00:13:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="vI6Flh/W"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A363520872
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 277d1305;
	Thu, 26 Sep 2019 00:13:58 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 13838248
 for <wireguard@lists.zx2c4.com>;
 Thu, 26 Sep 2019 00:13:55 +0000 (UTC)
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3cfba4fd
 for <wireguard@lists.zx2c4.com>;
 Thu, 26 Sep 2019 00:13:55 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id q64so204023ljb.12
 for <wireguard@lists.zx2c4.com>; Wed, 25 Sep 2019 17:13:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pnMczjY9zjhQ+bZnlDxC2MBHPV2ngdegF4eBuQgrRVY=;
 b=vI6Flh/WSvIRWzeJgrBdV0bdjbM7hnMpVx9WwYA7L0MdR0wtP8UVwIQe2ubqx0l1BD
 AbGr4jiD8OvbEwpEzzGJiwFAnQC7SR4xz+gqUlmz9PvEpcT7TSkm3pDWTpPiAmFYXNjz
 9Rm+ws8G4kMz1GvwmEDDdnseJhZIpFjh2nvR3rpCg0YL7JiQkQRq7vAyqxqW8q3GZ3Ed
 haEbfC74qXivqiVO18Hq41n1gReGW2MapAjlRrproQI9Ugii1NuinqI2Jor7z7m5aLP0
 pVRO9BMCpgI42UYRGE26KiL++9A7FfQ7prWkrBst0BhaUxzX9fUxvxdSD9nDcHMd3Sma
 ShCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pnMczjY9zjhQ+bZnlDxC2MBHPV2ngdegF4eBuQgrRVY=;
 b=SMBXiRKm+gkK71dk1TfBbSUGdBZyYIXpKngz0cHs7CfuNPFNy+udyPav+H6onvc7pA
 5Pkho3hP6MtIZQu6R9Rs2YZ/lIxuN73KzCFsS7PYK3RxD/LEjP8pCXec2/8UWOkxZEZN
 n0a+Tf/495dAV+kpJCEkyoAeNcz6qCiRlM5o7B3fByVhHBwMz2r3LGjiWJl6uaGPLkOQ
 Dx4oFc7w/9EzFCymQ+d3GkQ9sk+3nYKIN1mdAVk1kUKiHiDbIVT6ntEWfHMWmUbaHxKr
 N6lcq/SR+R0quKZ+kFvBBehqnEKyHdVusMTjrVPjQOykYT6lio+4HFYpbY7O+Ilgw7Fs
 7RtQ==
X-Gm-Message-State: APjAAAUAMrlGfEWtomlF0+D8YDY66hSzpmHslqKnI7QERvOQSZ1UVyDe
 ppAYaYyS0GnjIChIIqwIBRDUWWue5ChMU6evGG0=
X-Google-Smtp-Source: APXvYqzdunaDPO5l1sfb4nB44/VtjZAWSt3VkYkhJsBZ5/TT1pdRPl4pUAFjFpb3tlph+kOl4nWuf2btK/Ak9ciokf8=
X-Received: by 2002:a2e:9a83:: with SMTP id p3mr595923lji.136.1569456834147;
 Wed, 25 Sep 2019 17:13:54 -0700 (PDT)
MIME-Version: 1.0
References: <1394974820.30160.1569317808871@office.mailbox.org>
 <bd2be5bf-13c6-8c38-e4e1-705fcfa98f73@mib-infotech.co.nz>
In-Reply-To: <bd2be5bf-13c6-8c38-e4e1-705fcfa98f73@mib-infotech.co.nz>
From: Reid Rankin <reidrankin@gmail.com>
Date: Wed, 25 Sep 2019 20:13:43 -0400
Message-ID: <CAMaqUZ2wFdWUcjCK8WMtkitGci6m92_s7ZNBdMD_8CKKykuW0Q@mail.gmail.com>
Subject: Re: Port dependent issues on iOS 13
To: John huttley <john@mib-infotech.co.nz>
Cc: wireguard@lists.zx2c4.com
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
Content-Type: multipart/mixed; boundary="===============7140992836265724732=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============7140992836265724732==
Content-Type: multipart/alternative; boundary="00000000000016fa81059369a59a"

--00000000000016fa81059369a59a
Content-Type: text/plain; charset="UTF-8"

FWIW, all those ports (4500, 1500, 500) seem to work for me with iOS 13 and
WireGuard for iOS build 0.0.20190610 (13).

On Wed, Sep 25, 2019 at 6:03 PM John huttley <john@mib-infotech.co.nz>
wrote:

> Hi,
>
> Port  4500 is the IPSec UDP nat port and 500 is IKE.
>
> Anyconnect uses ISPEC so I think those ports are simply in use.
>
>
> --John
> On 24/09/19 9:36 PM, wireguard@p-np.de wrote:
>
> Hello,
>
> in place upgrades from iOS 12 -> iOS 13 (release) seem to work well in
> general. But there is a bizarre issue depending on *remote* endpoint
> ports. If you have, in my case, 4500/UDP configured as remote endpoint the
> tunnel does not send or receive traffic. Changing it to any other port
> works. Changing back to 4500/UDP breaks it again reproducibly. For others,
> documented here
> <https://www.reddit.com/r/WireGuard/comments/d6in39/wg_broken_on_ios_13/> ,
> it is 1500/UDP, in #WireGuard there has been a documented issue for 500/UDP
> not working.
>
> I have AnyConnect installed in parallel and checked, whether that's
> related. But removing and resetting Network settings did not fix port 4500
> for me.
>
> As there is no port number dependent branching in the WireGuard-iOS code
> base, this is likely an iOS regression. Does any one of you have a working
> channel to Apple to report this?
>
> Thank you for an else excellent product. Let me know if I can be of any
> help.
>
> Best regards,
>
> Christian
>
> _______________________________________________
> WireGuard mailing listWireGuard@lists.zx2c4.comhttps://lists.zx2c4.com/mailman/listinfo/wireguard
>
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
>

--00000000000016fa81059369a59a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div dir=3D"auto">FWIW, all those ports (4500, 1500, 500) seem to work=
 for me with iOS 13 and WireGuard for iOS build 0.0.20190610 (13).</div></d=
iv><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr=
">On Wed, Sep 25, 2019 at 6:03 PM John huttley &lt;<a href=3D"mailto:john@m=
ib-infotech.co.nz">john@mib-infotech.co.nz</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc s=
olid;padding-left:1ex">
 =20
   =20
 =20
  <div text=3D"#000000" bgcolor=3D"#FFFFFF">
    <p>Hi, <br>
    </p>
    <p>Port=C2=A0 4500 is the IPSec UDP nat port and 500 is IKE.</p>
    <p>Anyconnect uses ISPEC so I think those ports are simply in use.</p><=
/div><div text=3D"#000000" bgcolor=3D"#FFFFFF">
    <p><br>
    </p>
    <p>--John<br>
    </p>
    <div>On 24/09/19 9:36 PM, <a href=3D"mailto:wireguard@p-np.de" target=
=3D"_blank">wireguard@p-np.de</a>
      wrote:<br>
    </div>
    <blockquote type=3D"cite">
     =20
     =20
      <div> Hello, </div>
      <div> <br>
      </div>
      <div> in place upgrades from iOS 12 -&gt; iOS 13 (release) seem to
        work well in general. But there is a bizarre issue depending on
        <strong>remote</strong> endpoint ports. If you have, in my case,
        4500/UDP configured as remote endpoint the tunnel does not send
        or receive traffic. Changing it to any other port works.
        Changing back to 4500/UDP breaks it again reproducibly. For
        others, documented <a href=3D"https://www.reddit.com/r/WireGuard/co=
mments/d6in39/wg_broken_on_ios_13/" target=3D"_blank">here</a>=C2=A0, it is=
 1500/UDP, in
        #WireGuard there has been a documented issue for 500/UDP not
        working. </div>
      <div> <br>
      </div>
      <div> I have AnyConnect installed in parallel and checked, whether
        that&#39;s related. But removing and resetting Network settings did
        not fix port 4500 for me. </div>
      <div> <br>
      </div>
      <div> As there is no port number dependent branching in the
        WireGuard-iOS code base, this is likely an iOS regression. Does
        any one of you have a working channel to Apple to report this? </di=
v>
      <div> <br>
      </div>
      <div> Thank you for an else excellent product. Let me know if I
        can be of any help. </div>
      <div> <br>
      </div>
      <div> Best regards, </div>
      <div> <br>
      </div>
      <div> Christian </div>
      <br>
      <fieldset></fieldset>
      <pre>_______________________________________________
WireGuard mailing list
<a href=3D"mailto:WireGuard@lists.zx2c4.com" target=3D"_blank">WireGuard@li=
sts.zx2c4.com</a>
<a href=3D"https://lists.zx2c4.com/mailman/listinfo/wireguard" target=3D"_b=
lank">https://lists.zx2c4.com/mailman/listinfo/wireguard</a>
</pre>
    </blockquote>
  </div>

_______________________________________________<br>
WireGuard mailing list<br>
<a href=3D"mailto:WireGuard@lists.zx2c4.com" target=3D"_blank">WireGuard@li=
sts.zx2c4.com</a><br>
<a href=3D"https://lists.zx2c4.com/mailman/listinfo/wireguard" rel=3D"noref=
errer" target=3D"_blank">https://lists.zx2c4.com/mailman/listinfo/wireguard=
</a><br>
</blockquote></div></div>

--00000000000016fa81059369a59a--

--===============7140992836265724732==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============7140992836265724732==--
