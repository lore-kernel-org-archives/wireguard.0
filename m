Return-Path: phil@p1sec.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2c3c1524
 for <wireguard@lists.zx2c4.com>;
 Mon, 19 Feb 2018 22:22:41 +0000 (UTC)
Received: from mail-qk0-f171.google.com (mail-qk0-f171.google.com
 [209.85.220.171])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5484ff21
 for <wireguard@lists.zx2c4.com>;
 Mon, 19 Feb 2018 22:22:41 +0000 (UTC)
Received: by mail-qk0-f171.google.com with SMTP id v124so2798273qkh.11
 for <wireguard@lists.zx2c4.com>; Mon, 19 Feb 2018 14:30:13 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAJQSx3ahtq40bO=Fa4qJz=3_q0FU6cfOh1nuYg_s0KuVwSaoJA@mail.gmail.com>
References: <28272814.1271279.1519071494156.JavaMail.zimbra@jave.fr>
 <CAJQSx3ahtq40bO=Fa4qJz=3_q0FU6cfOh1nuYg_s0KuVwSaoJA@mail.gmail.com>
From: Philippe Langlois <phil@p1sec.com>
Date: Mon, 19 Feb 2018 23:29:42 +0100
Message-ID: <CAGfUPkDccMH3H0_hp1AYBs_ah9dCD6ZMSX6pKp8_GXYwL0+J1Q@mail.gmail.com>
Subject: Re: Alternative to UDP
To: Steve Gilberd <steve@erayd.net>
Content-Type: multipart/alternative; boundary="001a11473db0ce75130565983c33"
Cc: wireguard@lists.zx2c4.com
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--001a11473db0ce75130565983c33
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Eric,

I strongly second Steve's opinion here: if you want this, make it
option-defined, and definitely not the default option.
The case study to look at is SCTP:
https://en.wikipedia.org/wiki/Stream_Control_Transmission_Protocol

While an interesting and useful protocol, SCTP adoption and support is
severely limited by the fact that it is an IP protocol on its own:
SCTP gets dropped in 90% of implementations doing IP packet header
operations (NAT, PCEF, Firewalls, 6to4 ...)

Hope this helps,
Best regards,
Philippe Langlois.
--
http://www.P1security.com
Priority One Security


This transmission is intended only for the use of the addressee and may
contain information that is privileged, confidential and exempt from
disclosure under applicable law. If you are not the intended recipient, you
are hereby notified that any dissemination, distribution or copying of this
communication is strictly prohibited.
If you have received this communication in error, please notify us
immediately.

On Mon, Feb 19, 2018 at 11:15 PM, Steve Gilberd <steve@erayd.net> wrote:

> Hi,
>
> This feels like a bad idea to me - switching to a dedicated protocol woul=
d
> remove a small amount of overhead, but comes with a lot of downsides, whi=
ch
> in my opinion outweighs the minor benefit of removing some of the overhea=
d.
>
> I have a strong preference for the continued use of UDP, because a large
> amount of consumer networking gear can't handle destination NAT for
> anything that isn't UDP or TCP. And even wth gear that can, using a
> separate IP protocol would limit clients relying on destination NAT to on=
e
> client machine per public IP.
>
> Cheers,
> Steve
>
>
> On Tue, 20 Feb 2018, 09:20 Eric Dillmann, <lists@jave.fr> wrote:
>
>> Hi,
>>
>> Today i discovered that OVH is limiting UDP rate to 6Mbit/s, i did a tes=
t
>> by encapsulating wireguard in an ip/ip tunnel
>> and got 90Mbit/S.
>>
>> Is there a way to make wireguard evolve to use it's own protocol number.
>>
>> That would prevent the overhead of wireguard over ipip/gre/vxlan ...
>>
>> Thanks,
>> Regards,
>> Eric
>> _______________________________________________
>> WireGuard mailing list
>> WireGuard@lists.zx2c4.com
>> https://lists.zx2c4.com/mailman/listinfo/wireguard
>>
> --
>
> Cheers,
>
> *Steve Gilberd*
> Erayd LTD *=C2=B7* Consultant
> *Phone: +64 4 974-4229 <+64%204-974%204229> **=C2=B7** Mob: +64 27 565-32=
37
> <+64%2027%20565%203237>*
> *PO Box 10019 The Terrace, Wellington 6143, NZ*
>
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
>
>

--001a11473db0ce75130565983c33
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Dear Eric,<div><br></div><div>I strongly second Steve&#39;=
s opinion here: if you want this, make it option-defined, and definitely no=
t the default option.=C2=A0</div><div>The case study to look at is SCTP:</d=
iv><div><a href=3D"https://en.wikipedia.org/wiki/Stream_Control_Transmissio=
n_Protocol" target=3D"_blank">https://en.wikipedia.org/wiki/<wbr>Stream_Con=
trol_Transmission_<wbr>Protocol</a><br></div><div><br></div><div>While an i=
nteresting and useful protocol, SCTP adoption and support is severely limit=
ed by the fact that it is an IP protocol on its own:=C2=A0</div><div>SCTP g=
ets dropped in 90% of implementations doing IP packet header operations (NA=
T, PCEF, Firewalls, 6to4 ...)</div><div><br></div><div>Hope this helps,</di=
v><div class=3D"gmail_extra"><div><div class=3D"m_-861384470863070070gmail_=
signature"><div dir=3D"ltr"><div><div dir=3D"ltr"><div>Best regards,</div><=
div>Philippe Langlois.</div><div>--<br><a href=3D"http://www.P1security.com=
" target=3D"_blank">http://www.P1security.com</a><br>Priority One Security<=
br><br><br>This transmission is intended only for the use of the addressee =
and may contain information that is privileged, confidential and exempt fro=
m disclosure under applicable law. If you are not the intended recipient, y=
ou are hereby notified that any dissemination, distribution or copying of t=
his communication is strictly prohibited. <br>If you have received this com=
munication in error, please notify us immediately.<br></div></div></div></d=
iv></div></div>
<br><div class=3D"gmail_quote">On Mon, Feb 19, 2018 at 11:15 PM, Steve Gilb=
erd <span dir=3D"ltr">&lt;<a href=3D"mailto:steve@erayd.net" target=3D"_bla=
nk">steve@erayd.net</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex"><div>Hi,</div><div><br></div><div>This feels like a bad=
 idea to me - switching to a dedicated protocol would remove a small amount=
 of overhead, but comes with a lot of downsides, which in my opinion outwei=
ghs the minor benefit of removing some of the overhead.</div><div><br></div=
>I have a strong preference for the continued use of UDP, because a large a=
mount of consumer networking gear can&#39;t handle destination NAT for anyt=
hing that isn&#39;t UDP or TCP. And even wth gear that can, using a separat=
e IP protocol would limit clients relying on destination NAT to one client =
machine per public IP.<div><br></div><div>Cheers,</div><div>Steve<div><div =
class=3D"m_-861384470863070070gmail-h5"><br><br><div class=3D"gmail_quote">=
<div dir=3D"ltr">On Tue, 20 Feb 2018, 09:20 Eric Dillmann, &lt;<a href=3D"m=
ailto:lists@jave.fr" target=3D"_blank">lists@jave.fr</a>&gt; wrote:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">Hi,<br>
<br>
Today i discovered that OVH is limiting UDP rate to 6Mbit/s, i did a test b=
y encapsulating wireguard in an ip/ip tunnel<br>
and got 90Mbit/S.<br>
<br>
Is there a way to make wireguard evolve to use it&#39;s own protocol number=
.<br>
<br>
That would prevent the overhead of wireguard over ipip/gre/vxlan ...<br>
<br>
Thanks,<br>
Regards,<br>
Eric<br>
______________________________<wbr>_________________<br>
WireGuard mailing list<br>
<a href=3D"mailto:WireGuard@lists.zx2c4.com" target=3D"_blank">WireGuard@li=
sts.zx2c4.com</a><br>
<a href=3D"https://lists.zx2c4.com/mailman/listinfo/wireguard" rel=3D"noref=
errer" target=3D"_blank">https://lists.zx2c4.com/mailma<wbr>n/listinfo/wire=
guard</a><br>
</blockquote></div></div></div></div><span class=3D"m_-861384470863070070gm=
ail-HOEnZb"><font color=3D"#888888">-- <br><div dir=3D"ltr" class=3D"m_-861=
384470863070070gmail-m_-1807180667054606802gmail_signature"><div dir=3D"ltr=
"><p dir=3D"ltr">Cheers,</p>
<p dir=3D"ltr"><b>Steve Gilberd</b><br>
<font color=3D"#666666">Erayd LTD=C2=A0</font><b><font color=3D"#666666">=
=C2=B7</font></b><font color=3D"#666666">=C2=A0Consultant</font><br>
<i><font color=3D"#666666">Phone: <a href=3D"tel:+64%204-974%204229" value=
=3D"+6449744229" target=3D"_blank">+64 4 974-4229</a>=C2=A0</font></i><b><i=
><font color=3D"#666666">=C2=B7</font></i></b><i><font color=3D"#666666">=
=C2=A0Mob: <a href=3D"tel:+64%2027%20565%203237" value=3D"+64275653237" tar=
get=3D"_blank">+64 27 565-3237</a></font></i><br>
<i><font color=3D"#666666">PO Box 10019 The Terrace, Wellington 6143, NZ</f=
ont></i></p>
</div></div>
</font></span><br>______________________________<wbr>_________________<br>
WireGuard mailing list<br>
<a href=3D"mailto:WireGuard@lists.zx2c4.com" target=3D"_blank">WireGuard@li=
sts.zx2c4.com</a><br>
<a href=3D"https://lists.zx2c4.com/mailman/listinfo/wireguard" rel=3D"noref=
errer" target=3D"_blank">https://lists.zx2c4.com/mailma<wbr>n/listinfo/wire=
guard</a><br>
<br></blockquote></div><br></div></div>

--001a11473db0ce75130565983c33--
