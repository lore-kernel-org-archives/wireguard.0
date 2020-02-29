Return-Path: <SRS0=PDJl=4R=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD158C3F2CD
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 29 Feb 2020 22:21:13 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3C7DD24650
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 29 Feb 2020 22:21:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r2QdriwQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3C7DD24650
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fb997ad0;
	Sat, 29 Feb 2020 22:16:40 +0000 (UTC)
Received: from mail-vs1-xe2c.google.com (mail-vs1-xe2c.google.com
 [2607:f8b0:4864:20::e2c])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id dc3da9b2
 for <wireguard@lists.zx2c4.com>;
 Sat, 29 Feb 2020 22:16:37 +0000 (UTC)
Received: by mail-vs1-xe2c.google.com with SMTP id a19so4088825vsp.6
 for <wireguard@lists.zx2c4.com>; Sat, 29 Feb 2020 14:20:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=E7LvInT/5vBV2oIw5h18kiqAxLoIrWGGeNZtikevTjA=;
 b=r2QdriwQzCnZkxhRRi8hRIChly+lZM/ka8+KcJ3gJVi3rSJnqC2FJAfYpOYICj92fW
 xTYRYfvQ3S0FXYcrHMJ75Ftm48MhUOZwVmg8XjXGIjDt+tjFya6TuSjoLWaqOsS4L2id
 6XSy7LNzalJV+cwjMycBJ03HDU++U0qZouWoFWWq5l8YGMtdCcQG3utkRJ6KX8c0BW7g
 OGSjt9BhvxTTMd35vUAxVTheczIj4x7G7Tc3TMnxzl1YxS/sa25oFcmEyj8u7Sd/tRpd
 8gNgOnY93REcx/Y5bWKN4TC2gyPyz4Wz4TBW6ntXR5evZ/dSDmLox2HdaVBB4iDgzlmA
 04OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=E7LvInT/5vBV2oIw5h18kiqAxLoIrWGGeNZtikevTjA=;
 b=Miho+K8lInuofrNqobImYDPfuf7AAGOHBA36veEpkr8838A/ZwDF4x0HHehhdLR4+O
 VoIUmrDWN7pyLdygZc4toEmz202JTz4Bhf8m6q9+U5H5qHY3hoh1v/4cJjvTQnlo/nR3
 kjSdlhHL/jE7laeHnzxBEv1HuTHrRRENLoTsot0KnDZBbcXEOFvHRKcHxO7JJOc/+Gnb
 mTzgpSGAAA0ZKsCBuMBBkJMe5ATgYu7FYRkUI9hUKDICPPcCC9qAIxV6/oOfP9qCY/bZ
 j1nIPKagLUgvugzqCJL1+1FLWXSlYBWer9r/5PBMbPM1E+NCXUomIh4BiDPQHoGnsakB
 4riQ==
X-Gm-Message-State: ANhLgQ3EVa9wl9RKprdW9xeomGza80DTNkaBvPEjGfD1sHkbEJmQf36M
 fTijh0NFJoCpSjBHvLcyBztiZyA95AZRC7p7wnfhG5hDOv0QpQ==
X-Google-Smtp-Source: ADFU+vveVhgQqu+qC+Afk1iPk07GbSOOK0W49lrFowfjbW705wVZBpIzGK10ClpoWo4164lmb7jPaV0n7ssiKNPvtZM=
X-Received: by 2002:a67:ee59:: with SMTP id g25mr6037792vsp.186.1583014841592; 
 Sat, 29 Feb 2020 14:20:41 -0800 (PST)
MIME-Version: 1.0
References: <CANcmUPE9PPfniYa5ejj180Wncth7i3qS0A-ZaG06X4bwkRn5qQ@mail.gmail.com>
 <CAHmME9raXy8gjJ44MHso1WjU_QFz1_Z8Q12q2GauoBPGJSaSxg@mail.gmail.com>
 <CANcmUPEyCiw694-aa32fbLJ5LTd-fMp0D7NtgteqRvLasfmNZQ@mail.gmail.com>
In-Reply-To: <CANcmUPEyCiw694-aa32fbLJ5LTd-fMp0D7NtgteqRvLasfmNZQ@mail.gmail.com>
From: Jonathan Beri <jmberi@gmail.com>
Date: Sat, 29 Feb 2020 14:20:05 -0800
Message-ID: <CANcmUPEcc4TbeSi85nQbG86-nO4mrRE=xCHcid=K8H=UESGVDA@mail.gmail.com>
Subject: Re: Cortex-m support
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
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
Content-Type: multipart/mixed; boundary="===============3786514664590954594=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============3786514664590954594==
Content-Type: multipart/alternative; boundary="0000000000004eaea0059fbe5d4d"

--0000000000004eaea0059fbe5d4d
Content-Type: text/plain; charset="UTF-8"

Hi all,

I'm interested in revisiting the idea of Wireguard on embedded systems. It
looks like cross platform implementations have gotten very mature in the
past two years. Is it anymore feasible to implement WG in an OS-less
("freestanding") environment where something like a TUN interface doesn't
exist? Take one such environment, an RTOS, and the popular open source
https://www.zephyrproject.org/. It has a full networking implementation but
apps typically use BSD sockets (
https://docs.zephyrproject.org/latest/reference/networking/sockets.html) or
PPP (https://docs.zephyrproject.org/latest/reference/networking/ppp.html)
and network management (
https://docs.zephyrproject.org/latest/reference/networking/net_mgmt.html)
directly. Also, these implementations are very optimized as they typically
run on tiny MCUs (~100 Mhz, 256kb ram.)

I'd be curious to hear y'all's thoughts!

On Sat, Feb 17, 2018 at 7:39 AM Jonathan Beri <jmberi@gmail.com> wrote:

> Thanks Jason! Do you have a sense of the resource requirements? If that's
> a hard question to answer because of the OS coupling, what about the main
> app minus the OS-owned resources?
>
> For comparison, I'm wondering if wiregaurd can run on a 200mhz cortex m4f,
> with 246KB of ram, with an LwIP ip stack + FreeRTOS. That's the typical IoT
> hardware we target.
>
> On Fri, Feb 16, 2018, 2:21 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
>> Hi Jonathan,
>>
>> Currently it's quite coupled to Linux, but it doesn't have to be that
>> way for ever. Our cross platform implementations are coming along.
>>
>> Jason
>>
>

-- 
Jonathan Beri
linkedin.com/in/jonathanberi <https://www.linkedin.com/in/jonathanberi/>

--0000000000004eaea0059fbe5d4d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi all,<div><br></div><div>I&#39;m interested in revisitin=
g the idea of Wireguard on embedded systems. It looks like cross platform i=
mplementations have gotten very mature in the past two years. Is it anymore=
 feasible to implement WG in an OS-less (&quot;freestanding&quot;) environm=
ent where something like a TUN interface doesn&#39;t exist? Take one such e=
nvironment, an RTOS, and the popular open source=C2=A0<a href=3D"https://ww=
w.zephyrproject.org/">https://www.zephyrproject.org/</a>. It has a full net=
working implementation but apps typically use BSD sockets (<a href=3D"https=
://docs.zephyrproject.org/latest/reference/networking/sockets.html">https:/=
/docs.zephyrproject.org/latest/reference/networking/sockets.html</a>) or PP=
P (<a href=3D"https://docs.zephyrproject.org/latest/reference/networking/pp=
p.html">https://docs.zephyrproject.org/latest/reference/networking/ppp.html=
</a>) and network management (<a href=3D"https://docs.zephyrproject.org/lat=
est/reference/networking/net_mgmt.html">https://docs.zephyrproject.org/late=
st/reference/networking/net_mgmt.html</a>) directly. Also, these implementa=
tions are very optimized as they typically run on tiny MCUs (~100 Mhz, 256k=
b ram.)</div><div><br></div><div>I&#39;d be curious to hear y&#39;all&#39;s=
 thoughts!</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Sat, Feb 17, 2018 at 7:39 AM Jonathan Beri &lt;<a href=
=3D"mailto:jmberi@gmail.com">jmberi@gmail.com</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">Thanks Jason! Do you have a se=
nse of the resource requirements? If that&#39;s a hard question to answer b=
ecause of the OS coupling, what about the main app minus the OS-owned resou=
rces?<div><br></div><div>For comparison, I&#39;m wondering if wiregaurd can=
 run on a 200mhz cortex m4f, with 246KB of ram, with an LwIP ip stack + Fre=
eRTOS. That&#39;s the typical IoT hardware we target.<br><br><div class=3D"=
gmail_quote"><div dir=3D"ltr">On Fri, Feb 16, 2018, 2:21 PM Jason A. Donenf=
eld &lt;<a href=3D"mailto:Jason@zx2c4.com" target=3D"_blank">Jason@zx2c4.co=
m</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>Hi Jonathan,<br>
<br>
Currently it&#39;s quite coupled to Linux, but it doesn&#39;t have to be th=
at<br>
way for ever. Our cross platform implementations are coming along.<br>
<br>
Jason<br>
</blockquote></div></div></blockquote></div><br clear=3D"all"><div><br></di=
v>-- <br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr">Jonath=
an Beri<div><a href=3D"https://www.linkedin.com/in/jonathanberi/" target=3D=
"_blank">linkedin.com/in/jonathanberi</a><br></div></div></div>

--0000000000004eaea0059fbe5d4d--

--===============3786514664590954594==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============3786514664590954594==--
