Return-Path: <SRS0=7yF6=Q5=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA5B3C43381
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 22 Feb 2019 00:28:27 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 40A7E20684
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 22 Feb 2019 00:28:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nDaKmLbR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 40A7E20684
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d7ea4c96;
	Fri, 22 Feb 2019 00:19:18 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ea9ea565
 for <wireguard@lists.zx2c4.com>;
 Fri, 22 Feb 2019 00:19:17 +0000 (UTC)
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com
 [IPv6:2607:f8b0:4864:20::730])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5e558d3f
 for <wireguard@lists.zx2c4.com>;
 Fri, 22 Feb 2019 00:19:17 +0000 (UTC)
Received: by mail-qk1-x730.google.com with SMTP id x9so219404qkf.0
 for <wireguard@lists.zx2c4.com>; Thu, 21 Feb 2019 16:28:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=z9z2iKJyOrZtQLIfqF/Ji3GmqJ84jkZY32IRuuExKqY=;
 b=nDaKmLbRjcgTMssfrX2aFfXzkZBHPySFH3NTaS3kUHHSt2mGX0H+EAT8+nFiDnR+8d
 6oeWw1mtzwXammJxJ6VrcVvKxgBTa9nlbSSkrAOuPcLTGhpE0JYvuniJOkr/P29ntEYH
 0iPQemgbNWpZYSHGpvRg8drUgH6cUvj5psbaF1PpKRhrxkSXYKZVdpX4bw5s5f4borop
 umFfHDhKLUhNrcC33K3vBbH6CqA1pl258eVBZmPT8xed9mZHodzbHKFBKrVBDjPRtZB+
 eZUPjhofLpkdFMmZfV0bluz20dTNYs/PhlniG3VXWw4QKoDY16X/LIZnbwSAmbH4NKs1
 vhEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=z9z2iKJyOrZtQLIfqF/Ji3GmqJ84jkZY32IRuuExKqY=;
 b=lKSgxh113xi9KZAJ4UCkWRt0aayibUukI75g3L2qGKp+5F7AvmLbbI0W/gtl+Jtu+v
 JLTNzwE/tkXQ7n8qetzONAV+OuucR1zkcFsv3blwpIvVUEKOH76T3NiH5exP22UPIBbY
 m/yldrHUrlhdp88jtY5MdoxADJi1vwjO2YUwK7jIOIxRZ66aPA8kjKbT1HkbsQRPrg84
 o8v/pVgVgAzkfhfrYD5uoWQUyTR8y1cTYEi/iltHKj+IetUvI25UqsA3IvksatqYlcq9
 12tndh4AnCdLLkPyGJooBGPSt1Z6S7g8cNINC73DnYmX9fg1JG9UpJTG2ropAjQrOZuh
 5eNg==
X-Gm-Message-State: AHQUAuaioKGcm6Ak4GQjSi1O8Zl9qyBGzZDfgtclNgWT41hXQqH/xlFH
 mdu9us6keQrBBSLrwfULp3OdCEBuNf5V/4hxk60=
X-Google-Smtp-Source: AHgI3IYAXUHmkdvg0QaZ9YC73tfeDVIpdQCQtGMX+eLzJ5+LpFsu6z74w98cwN+HGH/lp2xqGJiNxwlIUMCHyx8hftI=
X-Received: by 2002:a37:9201:: with SMTP id u1mr1030188qkd.258.1550795288005; 
 Thu, 21 Feb 2019 16:28:08 -0800 (PST)
MIME-Version: 1.0
References: <CAGCGyt+bsxa-aRoETJFTwvOZ1eb=Q_AemZUwufN_7RYicnnKaw@mail.gmail.com>
 <ac5a35ae-7efb-4143-bf61-a687f6cee8a8@www.fastmail.com>
 <CAGCGytJE5bzXiXB8Go6aHk5OLT0D-m2AnKbRt=Nv1giEVrpsjA@mail.gmail.com>
 <9e6f49da-bf09-ab90-dba7-ac5587863a31@pallas.us>
 <e25e0707-326a-47a3-80fd-967167f6778b@www.fastmail.com>
In-Reply-To: <e25e0707-326a-47a3-80fd-967167f6778b@www.fastmail.com>
From: Arpit Gupta <g.arpit@gmail.com>
Date: Thu, 21 Feb 2019 16:27:56 -0800
Message-ID: <CAGCGytLYibUVaYYeJNE2AJufuXyN6UkYqrQn4vhX0XTT5m49fw@mail.gmail.com>
Subject: Re: upgrading raspberry pi required me to re install wireguard
To: logcabin@fastmail.net
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
Content-Type: multipart/mixed; boundary="===============1079440051367963167=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============1079440051367963167==
Content-Type: multipart/alternative; boundary="00000000000042d23b058270aadc"

--00000000000042d23b058270aadc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Not looking to build manually at this time. Since there are packages
available in raspberry pi repos I use them.

I was just curious as to what the expected behavior is when kernel gets
upgraded when there is an existing wireguard installation and if it's
something that the package scripts should address.
--
Arpit

On Thu, Feb 21, 2019, 4:24 PM <logcabin@fastmail.net> wrote:

> If you want to build/install wg from source, you can do what I do
> (automation is easy):
>
> Download the source xz file and unpack it using xzcat and tar.  Navigate
> to the src directory and build the module and tools using the "make"
> command. Then use "sudo make install" to get the wg .ko file replaced wit=
h
> the latest one and install any updates to the tools and wg executable. If
> you do this after a kernel upgrade, you'll need to reboot the pi before y=
ou
> install the wg kernel module, otherwise it won't find the right kernel
> headers.
>
> A simple shell script can be made to do all this stuff for you.
>
> On Thu, Feb 21, 2019, at 6:30 PM, Derrick Lyndon Pallas wrote:
>
> I just use DKMS to do it. Check out WireGuard to /usr/src, ln -s
> WireGuard/src WireGuard-0, dkms add WireGuard/0. If it's not auto buildin=
g,
> have you tried dkms install WireGuard/0? ~D
>
>
> On 2/21/19 2:57 PM, Arpit Gupta wrote:
>
> Ya reboot did not solve this for me. I will read up on how I can execute
> package pre/post install scripts.
>
> Curious to know if the rebuild the module is the responsibility of the os
> or the package after a kernel upgrade?
>
> I will try to remember this next time there is a kernel upgrade =F0=9F=98=
=81.
>
>
>
> --
> Arpit
>
> On Thu, Feb 21, 2019, 4:30 AM <logcabin@fastmail.net> wrote:
>
> Yes, the kernel did get updated, causing the wg module dependencies to ge=
t
> out of sync. A reboot after the update should solve this, otherwise you m=
ay
> need to run the package's preinst script to get the modules back in sync.
> Should be no need to reinstall the wg packages.
>
> On Thu, Feb 21, 2019, at 2:14 AM, Arpit Gupta wrote:
>
> Hi All
>
> I am running raspberry pi v3 and ran apt-get update and upgrade commands
> to get upto date. It also ended up updating the kernel i think. I should
> have paid more attention to what all was getting updated.
>
> After the update wireguard was not running and upon debugging i found tha=
t
> the wireguard kernel module was no longer present. So i uninstalled all
> wireguard packages and installed them again and the module showed up and =
on
> reboot system was back to normal. What i was curious was how should one g=
o
> about doing os/kernel updates in future in order to avoid this issue?
>
> I am running
> Linux raspberrypi 4.14.98-v7+ #1200 SMP Tue Feb 12 20:27:48 GMT 2019
> armv7l GNU/Linux
> No LSB modules are available.
> Distributor ID: Raspbian
> Description: Raspbian GNU/Linux 9.8 (stretch)
> Release: 9.8
> Codename: stretch
>
> ii  wireguard                       0.0.20190123-1               all
>     fast, modern, secure kernel VPN tunnel (metapackage)
> ii  wireguard-dkms                  0.0.20190123-1               all
>     fast, modern, secure kernel VPN tunnel (DKMS version)
> ii  wireguard-tools                 0.0.20190123-1               armhf
>     fast, modern, secure kernel VPN tunnel (userland utilities)
>
> --
> Arpit
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
>
>
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
>
>
> _______________________________________________
> WireGuard mailing listWireGuard@lists.zx2c4.comhttps://lists.zx2c4.com/ma=
ilman/listinfo/wireguard
>
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
>
>
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
>

--00000000000042d23b058270aadc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Not looking to build manually at this time. Since there a=
re packages available in raspberry pi repos I use them.<br><br><div data-sm=
artmail=3D"gmail_signature">I was just curious as to what the expected beha=
vior is when kernel gets upgraded when there is an existing wireguard insta=
llation and if it&#39;s something that the package scripts should address.<=
br>--<br>Arpit</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" c=
lass=3D"gmail_attr">On Thu, Feb 21, 2019, 4:24 PM  &lt;<a href=3D"mailto:lo=
gcabin@fastmail.net">logcabin@fastmail.net</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc s=
olid;padding-left:1ex"><u></u><div><div style=3D"font-family:Arial">If you =
want to build/install wg from source, you can do what I do (automation is e=
asy):<br></div><div style=3D"font-family:Arial"><br></div><div style=3D"fon=
t-family:Arial">Download the source xz file and unpack it using xzcat and t=
ar.=C2=A0 Navigate to the src directory and build the module and tools usin=
g the &quot;make&quot; command. Then use &quot;sudo make install&quot; to g=
et the wg .ko file replaced with the latest one and install any updates to =
the tools and wg executable. If you do this after a kernel upgrade, you&#39=
;ll need to reboot the pi before you install the wg kernel module, otherwis=
e it won&#39;t find the right kernel headers. <br></div><div style=3D"font-=
family:Arial"><br></div><div style=3D"font-family:Arial">A simple shell scr=
ipt can be made to do all this stuff for you. <br></div><div style=3D"font-=
family:Arial"><br></div><div style=3D"font-family:Arial">On Thu, Feb 21, 20=
19, at 6:30 PM, Derrick Lyndon Pallas wrote:<br></div><blockquote type=3D"c=
ite" id=3D"m_4735378302854122214fastmail-quoted"><p>I just use DKMS to do i=
t. Check out WireGuard to /usr/src, ln -s
      WireGuard/src WireGuard-0, dkms add WireGuard/0. If it&#39;s not auto
      building, have you tried dkms install WireGuard/0? ~D<br></p><p><br><=
/p><div class=3D"m_4735378302854122214fastmail-quoted-moz-cite-prefix">On 2=
/21/19 2:57 PM, Arpit Gupta wrote:<br></div><blockquote type=3D"cite"><div =
dir=3D"auto"><div style=3D"font-family:Arial">Ya reboot did not solve this =
for me. I will read
        up on how I can execute package pre/post install scripts. <br></div=
><div dir=3D"auto"><br></div><div dir=3D"auto">Curious to know if the rebui=
ld the module is the
          responsibility of the os or the package after a kernel
          upgrade?<br></div><div dir=3D"auto"><br></div><div dir=3D"auto"><=
div style=3D"font-family:Arial">I will try to remember this next time there=
 is a
          kernel upgrade =F0=9F=98=81.<br></div><div style=3D"font-family:A=
rial"> <br></div><div style=3D"font-family:Arial"> <br></div><div dir=3D"au=
to"><div style=3D"font-family:Arial"><br></div><div style=3D"font-family:Ar=
ial">--<br></div><div style=3D"font-family:Arial"> Arpit<br></div></div></d=
iv></div><div style=3D"font-family:Arial"><br></div><div class=3D"m_4735378=
302854122214fastmail-quoted-gmail_quote"><div class=3D"m_473537830285412221=
4fastmail-quoted-gmail_attr" dir=3D"ltr">On Thu, Feb 21, 2019, 4:30 AM
          &lt;<a href=3D"mailto:logcabin@fastmail.net" target=3D"_blank" re=
l=3D"noreferrer">logcabin@fastmail.net</a>&gt; wrote:<br></div><blockquote =
style=3D"margin-top:0px;margin-right:0px;margin-bottom:0px;margin-left:0.8e=
x;border-left-width:1px;border-left-style:solid;border-left-color:rgb(204,2=
04,204);padding-left:1ex" class=3D"m_4735378302854122214fastmail-quoted-gma=
il_quote"><div><div style=3D"font-family:Arial">Yes, the kernel did get
              updated, causing the wg module dependencies to get out of
              sync. A reboot after the update should solve this,
              otherwise you may need to run the package&#39;s preinst scrip=
t
              to get the modules back in sync. Should be no need to
              reinstall the wg packages.<br></div><div style=3D"font-family=
:Arial"><br></div><div style=3D"font-family:Arial">On Thu, Feb 21, 2019, at=
 2:14
              AM, Arpit Gupta wrote:<br></div><blockquote id=3D"m_473537830=
2854122214fastmail-quoted-m_-2690143954488973293fastmail-quoted" type=3D"ci=
te"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><di=
v style=3D"font-family:Arial">Hi All<br></div><div><br></div><div>I am runn=
ing raspberry pi v3 and ran apt-get
                        update and upgrade commands to get upto date. It
                        also ended up updating the kernel i think. I
                        should have paid more attention to what all was
                        getting updated.<br></div><div><br></div><div>After=
 the update wireguard was not running
                        and upon debugging i found that the wireguard
                        kernel module was no longer present. So i
                        uninstalled all wireguard packages and installed
                        them again and the module showed up and on
                        reboot system was back to normal. What i was
                        curious was how should one go about doing
                        os/kernel updates in future in order to avoid
                        this issue?<br></div><div><br></div><div>I am runni=
ng<br></div><div>Linux raspberrypi 4.14.98-v7+ #1200 SMP Tue
                        Feb 12 20:27:48 GMT 2019 armv7l GNU/Linux<br></div>=
<div><div>No LSB modules are available.<br></div><div>Distributor ID:<span =
style=3D"white-space:pre-wrap"> </span>Raspbian<br></div><div>Description:<=
span style=3D"white-space:pre-wrap"> </span>Raspbian
                          GNU/Linux 9.8 (stretch)<br></div><div>Release:<sp=
an style=3D"white-space:pre-wrap"> </span>9.8<br></div><div>Codename:<span =
style=3D"white-space:pre-wrap"> </span>stretch<br></div><div><br></div><div=
><div>ii=C2=A0 wireguard=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0
                            =C2=A00.0.20190123-1=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0all=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0
                            fast, modern, secure kernel VPN tunnel
                            (metapackage)<br></div><div>ii=C2=A0 wireguard-=
dkms=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0
                            0.0.20190123-1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0all=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0
                            fast, modern, secure kernel VPN tunnel (DKMS
                            version)<br></div><div>ii=C2=A0 wireguard-tools=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0
                            =C2=A00.0.20190123-1=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0armhf=C2=A0 =C2=A0 =C2=A0 =C2=A0
                            fast, modern, secure kernel VPN tunnel
                            (userland utilities)<br></div></div><div><br></=
div><div><div dir=3D"ltr" class=3D"m_4735378302854122214fastmail-quoted-m_-=
2690143954488973293fastmail-quoted-gmail_signature"><div dir=3D"ltr"><div>-=
-<br></div><div style=3D"font-family:Arial">Arpit<br></div></div></div></di=
v></div></div></div></div></div><div>______________________________________=
_________<br></div><div>WireGuard mailing list<br></div><div><a rel=3D"nore=
ferrer noreferrer" href=3D"mailto:WireGuard@lists.zx2c4.com" target=3D"_bla=
nk">WireGuard@lists.zx2c4.com</a><br></div><div><a rel=3D"noreferrer norefe=
rrer" href=3D"https://lists.zx2c4.com/mailman/listinfo/wireguard" target=3D=
"_blank">https://lists.zx2c4.com/mailman/listinfo/wireguard</a><br></div><d=
iv><br></div></blockquote><div style=3D"font-family:Arial"><br></div></div>=
<div style=3D"font-family:Arial">__________________________________________=
_____<br></div><div style=3D"font-family:Arial"> WireGuard mailing list<br>=
</div><div style=3D"font-family:Arial"> <a rel=3D"noreferrer noreferrer" hr=
ef=3D"mailto:WireGuard@lists.zx2c4.com" target=3D"_blank">WireGuard@lists.z=
x2c4.com</a><br></div><div style=3D"font-family:Arial"> <a rel=3D"noreferre=
r noreferrer noreferrer" href=3D"https://lists.zx2c4.com/mailman/listinfo/w=
ireguard" target=3D"_blank">https://lists.zx2c4.com/mailman/listinfo/wiregu=
ard</a><br></div></blockquote></div><div style=3D"font-family:Arial"><br></=
div><pre class=3D"m_4735378302854122214fastmail-quoted-moz-quote-pre">_____=
__________________________________________
WireGuard mailing list
<a href=3D"mailto:WireGuard@lists.zx2c4.com" class=3D"m_4735378302854122214=
fastmail-quoted-moz-txt-link-abbreviated" target=3D"_blank" rel=3D"noreferr=
er">WireGuard@lists.zx2c4.com</a>
<a href=3D"https://lists.zx2c4.com/mailman/listinfo/wireguard" class=3D"m_4=
735378302854122214fastmail-quoted-moz-txt-link-freetext" target=3D"_blank" =
rel=3D"noreferrer">https://lists.zx2c4.com/mailman/listinfo/wireguard</a>
<br></pre></blockquote><div>_______________________________________________=
<br></div><div>WireGuard mailing list<br></div><div><a href=3D"mailto:WireG=
uard@lists.zx2c4.com" target=3D"_blank" rel=3D"noreferrer">WireGuard@lists.=
zx2c4.com</a><br></div><div><a href=3D"https://lists.zx2c4.com/mailman/list=
info/wireguard" target=3D"_blank" rel=3D"noreferrer">https://lists.zx2c4.co=
m/mailman/listinfo/wireguard</a><br></div><div><br></div></blockquote><div =
style=3D"font-family:Arial"><br></div></div>_______________________________=
________________<br>
WireGuard mailing list<br>
<a href=3D"mailto:WireGuard@lists.zx2c4.com" target=3D"_blank" rel=3D"noref=
errer">WireGuard@lists.zx2c4.com</a><br>
<a href=3D"https://lists.zx2c4.com/mailman/listinfo/wireguard" rel=3D"noref=
errer noreferrer" target=3D"_blank">https://lists.zx2c4.com/mailman/listinf=
o/wireguard</a><br>
</blockquote></div>

--00000000000042d23b058270aadc--

--===============1079440051367963167==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============1079440051367963167==--
