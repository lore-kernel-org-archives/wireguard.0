Return-Path: svschwartz@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id dac76be2
 for <wireguard@lists.zx2c4.com>;
 Mon, 26 Jun 2017 15:24:36 +0000 (UTC)
Received: from mail-it0-f54.google.com (mail-it0-f54.google.com
 [209.85.214.54])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d5297ce8
 for <wireguard@lists.zx2c4.com>;
 Mon, 26 Jun 2017 15:24:36 +0000 (UTC)
Received: by mail-it0-f54.google.com with SMTP id m68so679146ith.1
 for <wireguard@lists.zx2c4.com>; Mon, 26 Jun 2017 08:41:00 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CACTq0bR=+0wB1u6JJk=LuVxxKnPSGWp49bDtOb8oS666zkE8-Q@mail.gmail.com>
References: <CAEpXMn2G5W8ta39WXReXOZe_G9+gGVTZ+31u4sJ8s54DMgSzmA@mail.gmail.com>
 <CACTq0bR=+0wB1u6JJk=LuVxxKnPSGWp49bDtOb8oS666zkE8-Q@mail.gmail.com>
From: =?UTF-8?B?0KjQstCw0YDRhiDQodC10YDQs9C10Lkg0JLQu9Cw0LTQuNC80LjRgNC+0LLQuNGH?=
 <svschwartz@gmail.com>
Date: Mon, 26 Jun 2017 18:40:59 +0300
Message-ID: <CAEpXMn32ZqHF309UBr2b2+zA=zyScd1k9j7GBAaTD=6qD2Viyg@mail.gmail.com>
Subject: Re: debian 8 setup
To: Ibrahim Tachijian <barhom@netsat.se>
Content-Type: multipart/alternative; boundary="001a1144d5fe1cbe290552dec746"
Cc: wireguard@lists.zx2c4.com
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--001a1144d5fe1cbe290552dec746
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ibrahim,

I've rebooted the server and now it's ok.

Cheers,
Sergey


2017-06-26 14:55 GMT+03:00 Ibrahim Tachijian <barhom@netsat.se>:

> Hello Sergey,
>
> You have probably recently done an apt-get update upgrade that installed =
a
> newer kernel-image.
> I believe if you run,
>
>
>    - apt-get update and upgrade
>    - reboot
>    - rebuild wireguard from source (make, make install)
>
> Then wireguard should work for you.
>
> On Mon, Jun 26, 2017 at 1:35 PM =D0=A8=D0=B2=D0=B0=D1=80=D1=86 =D0=A1=D0=
=B5=D1=80=D0=B3=D0=B5=D0=B9 =D0=92=D0=BB=D0=B0=D0=B4=D0=B8=D0=BC=D0=B8=D1=
=80=D0=BE=D0=B2=D0=B8=D1=87 <
> svschwartz@gmail.com> wrote:
>
>> Hi guys!
>>
>> I've build debs for jessie from unstable dsc, but wireguard module faile=
d
>> to load
>>
>> [34282909.202963] wireguard: Unknown symbol __sk_mem_reclaim_amount (err
>> 0)
>>
>> am I doing something wrong or is it jessie simply not supported ?
>>
>> Regards,
>> Sergey
>> _______________________________________________
>> WireGuard mailing list
>> WireGuard@lists.zx2c4.com
>> https://lists.zx2c4.com/mailman/listinfo/wireguard
>>
> --
> *Ibrahim Tachijian*
>
> CEO Net Sat AB
> Mobile: +46723321377
> barhom@netsat.se
>
> _________________________
>
>
> *Net Sat ABC/O Jayway AB*Klara =C3=96stra Kyrkogata 2B, 1TR, 111 52 Stock=
holm,
> Sweden
> Office: +46 (0)8 408 394 53
>

--001a1144d5fe1cbe290552dec746
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div>Ibrahim,<br><br></div>I&#39;ve rebooted the=
 server and now it&#39;s ok.<br><br></div>Cheers,<br></div><div>Sergey<br><=
/div><br></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">20=
17-06-26 14:55 GMT+03:00 Ibrahim Tachijian <span dir=3D"ltr">&lt;<a href=3D=
"mailto:barhom@netsat.se" target=3D"_blank">barhom@netsat.se</a>&gt;</span>=
:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-le=
ft:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr">Hello Sergey,<div><br>=
</div><div>You have probably recently done an apt-get update upgrade that i=
nstalled a newer kernel-image.</div><div>I believe if you run,</div><div><b=
r></div><div><ul><li><font size=3D"2">apt-get update and upgrade</font></li=
><li><font size=3D"2">reboot</font></li><li><font size=3D"2">rebuild wiregu=
ard from source (make, make install)</font></li></ul><div><font size=3D"2">=
Then wireguard should work for you.</font></div></div></div><br><div class=
=3D"gmail_quote"><div><div class=3D"h5"><div dir=3D"ltr">On Mon, Jun 26, 20=
17 at 1:35 PM =D0=A8=D0=B2=D0=B0=D1=80=D1=86 =D0=A1=D0=B5=D1=80=D0=B3=D0=B5=
=D0=B9 =D0=92=D0=BB=D0=B0=D0=B4=D0=B8=D0=BC=D0=B8=D1=80=D0=BE=D0=B2=D0=B8=
=D1=87 &lt;<a href=3D"mailto:svschwartz@gmail.com" target=3D"_blank">svschw=
artz@gmail.com</a>&gt; wrote:<br></div></div></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-lef=
t:1ex"><div><div class=3D"h5"><div dir=3D"ltr"><div><div><div><div>Hi guys!=
<br><br></div>I&#39;ve build debs for jessie from unstable dsc, but wiregua=
rd module failed to load<br><br>[34282909.202963] wireguard: Unknown symbol=
 __sk_mem_reclaim_amount (err 0)<br><br></div>am I doing something wrong or=
 is it jessie simply not supported ?<br><br></div>Regards,<br></div>Sergey<=
br></div></div></div>
______________________________<wbr>_________________<br>
WireGuard mailing list<br>
<a href=3D"mailto:WireGuard@lists.zx2c4.com" target=3D"_blank">WireGuard@li=
sts.zx2c4.com</a><br>
<a href=3D"https://lists.zx2c4.com/mailman/listinfo/wireguard" rel=3D"noref=
errer" target=3D"_blank">https://lists.zx2c4.com/<wbr>mailman/listinfo/wire=
guard</a><span class=3D"HOEnZb"><font color=3D"#888888"><br>
</font></span></blockquote></div><span class=3D"HOEnZb"><font color=3D"#888=
888"><div dir=3D"ltr">-- <br></div><div data-smartmail=3D"gmail_signature">=
<div dir=3D"ltr"><b style=3D"color:black;font-family:arial,sans-serif;font-=
size:small"><span style=3D"font-size:11px;line-height:12.2667px">Ibrahim Ta=
chijian</span></b><div class=3D"m_9114265046075777890gmail_signature" style=
=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:small"><div =
dir=3D"ltr"><div><div dir=3D"ltr"><div dir=3D"ltr"><p><span style=3D"color:=
black;font-size:7.5pt;line-height:11.5px">CEO Net Sat AB<br></span><span st=
yle=3D"font-size:7.5pt;line-height:11.5px"><font color=3D"#000000">Mobile: =
+46723321377<br></font></span><a href=3D"mailto:barhom@netsat.se" style=3D"=
color:rgb(17,85,204);font-size:7.5pt;line-height:11.5px" target=3D"_blank">=
barhom@netsat.se</a></p><p style=3D"line-height:14.72px"><span style=3D"fon=
t-size:7.5pt;line-height:11.5px;color:black">_________________________<br><=
b>Net Sat AB<br>C/O Jayway AB<br></b></span><span style=3D"color:black;font=
-size:7.5pt;line-height:11.5px">Klara =C3=96stra Kyrkogata 2B, 1TR, 111 52 =
Stockholm, Sweden<br></span><span style=3D"color:black;font-size:7.5pt;line=
-height:11.5px">Office: +46 (0)8 408 394 53</span></p></div></div></div></d=
iv></div></div></div>
</font></span></blockquote></div><br></div>

--001a1144d5fe1cbe290552dec746--
