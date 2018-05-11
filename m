Return-Path: henry.snow@nielsen.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 51da8f71
 for <wireguard@lists.zx2c4.com>;
 Fri, 11 May 2018 16:12:39 +0000 (UTC)
Received: from mail-pf0-x243.google.com (mail-pf0-x243.google.com
 [IPv6:2607:f8b0:400e:c00::243])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 55cd8d9a
 for <wireguard@lists.zx2c4.com>;
 Fri, 11 May 2018 16:12:38 +0000 (UTC)
Received: by mail-pf0-x243.google.com with SMTP id v63-v6so2945275pfk.8
 for <wireguard@lists.zx2c4.com>; Fri, 11 May 2018 09:15:31 -0700 (PDT)
MIME-Version: 1.0
References: <CAFuSFDHSJ8zezCqKuA+JM5asoWH-B2AYLAN2fbcWCwNE=r33hQ@mail.gmail.com>
 <CAHmME9pocAi6bsEkpycRhz1LQmipzj-=6ztBPPihE8HQ7ZhQDw@mail.gmail.com>
 <CAHmME9oQNfscJCUkoVW4qKoukTKBdCj3MYaW9C4jGW2m0Nm9LA@mail.gmail.com>
 <962dc8ba-30ed-fbd0-9e41-a65b7aab9522@solidadmin.com>
In-Reply-To: <962dc8ba-30ed-fbd0-9e41-a65b7aab9522@solidadmin.com>
From: Henry Snow <henry.snow@nielsen.com>
Date: Fri, 11 May 2018 12:15:18 -0400
Message-ID: <CAFuSFDFkwbTF7j5=qUSU-5owsDsE8hnZmeSXLLSLSyGG1OZ6BQ@mail.gmail.com>
Subject: Re: wireguard-dkms and CentOS 7.5
To: Joe Doss <joe@solidadmin.com>
Content-Type: multipart/alternative; boundary="000000000000e42c78056bf07186"
Cc: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--000000000000e42c78056bf07186
Content-Type: text/plain; charset="UTF-8"

I've been doing a bit of off-list debugging with Jason -- it's looking like
a separate issue. The compat.h changes were effective in fixing the
compilation issues. The crash seems to be in the i40e ethernet driver
(v 1.3.46-k) update that comes with RHEL/CentOS 7.5. Compiling
i40e-2.4.6.tar.gz from sourceforge has let me bring up the tunnels
successfully.

On Fri, May 11, 2018 at 12:07 PM Joe Doss <joe@solidadmin.com> wrote:

> On 05/10/2018 11:14 AM, Jason A. Donenfeld wrote:
> > Hi again,
> >
> > I've fixed that here:
> >
> https://git.zx2c4.com/WireGuard/patch/?id=94f25e47b23ddeba26120de4ee3c098438fc2251
> >
> > This will be part of the next snapshot. In the meantime, you can apply
> > that manually to the src directory, and perhaps Joe (CCd) can add it
> > to the rpm.
>
> It sounds like the patch maybe causing some problems still based on this
> thread. Regardless, patch or snapshot, I will have some time this
> weekend build the RPM with the fix.
>
> Joe
>
>
>
>
> --
> Joe Doss
> joe@solidadmin.com
>
-- 
Henry Snow | Director, Site Reliability Engineering
eXelate, a Nielsen company <http://exelate.com/>
E: henry.snow@nielsen.com | M: 347.366.2700
675 6th Ave, 3rd Floor, New York, NY 10010

--000000000000e42c78056bf07186
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I&#39;ve been doing a bit of off-list debugging with Jason=
 -- it&#39;s looking like a separate issue. The compat.h changes were effec=
tive in fixing the compilation issues. The crash seems to be in the i40e et=
hernet driver (v=C2=A01.3.46-k) update that comes with RHEL/CentOS 7.5. Com=
piling i40e-2.4.6.tar.gz from sourceforge has let me bring up the tunnels s=
uccessfully.=C2=A0<br><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Fr=
i, May 11, 2018 at 12:07 PM Joe Doss &lt;<a href=3D"mailto:joe@solidadmin.c=
om">joe@solidadmin.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1e=
x">On 05/10/2018 11:14 AM, Jason A. Donenfeld wrote:<br>
&gt; Hi again,<br>
&gt; <br>
&gt; I&#39;ve fixed that here:<br>
&gt; <a href=3D"https://git.zx2c4.com/WireGuard/patch/?id=3D94f25e47b23ddeb=
a26120de4ee3c098438fc2251" rel=3D"noreferrer" target=3D"_blank">https://git=
.zx2c4.com/WireGuard/patch/?id=3D94f25e47b23ddeba26120de4ee3c098438fc2251</=
a><br>
&gt; <br>
&gt; This will be part of the next snapshot. In the meantime, you can apply=
<br>
&gt; that manually to the src directory, and perhaps Joe (CCd) can add it<b=
r>
&gt; to the rpm.<br>
<br>
It sounds like the patch maybe causing some problems still based on this <b=
r>
thread. Regardless, patch or snapshot, I will have some time this <br>
weekend build the RPM with the fix.<br>
<br>
Joe<br>
<br>
<br>
<br>
<br>
-- <br>
Joe Doss<br>
<a href=3D"mailto:joe@solidadmin.com" target=3D"_blank">joe@solidadmin.com<=
/a><br>
</blockquote></div></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature" =
data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><font color=3D"#808080"=
 style=3D"line-height:normal;font-family:cantarell">Henry Snow | Director, =
Site Reliability Engineering</font><div><font color=3D"#808080" style=3D"li=
ne-height:normal;font-family:cantarell"><a href=3D"http://exelate.com/">eXe=
late, a Nielsen company</a></font><br style=3D"line-height:normal;color:rgb=
(0,0,0);font-family:cantarell"><font color=3D"#808080" style=3D"line-height=
:normal;font-family:cantarell">E:=C2=A0<a href=3D"mailto:henry.snow@nielsen=
.com">henry.snow@nielsen.com</a>=C2=A0|=C2=A0</font><span style=3D"color:rg=
b(128,128,128);font-family:cantarell;line-height:normal">M: 347.366.2700</s=
pan><br style=3D"line-height:normal;color:rgb(0,0,0);font-family:cantarell"=
><font color=3D"#808080" style=3D"line-height:normal;font-family:cantarell"=
>675 6th Ave, 3rd Floor, New York, NY 10010=C2=A0</font><br></div></div></d=
iv>

--000000000000e42c78056bf07186--
