Return-Path: adam@souzis.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 50c48f71
 for <wireguard@lists.zx2c4.com>; Tue, 8 Aug 2017 22:27:38 +0000 (UTC)
Received: from mail-vk0-f52.google.com (mail-vk0-f52.google.com
 [209.85.213.52])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bece6211
 for <wireguard@lists.zx2c4.com>; Tue, 8 Aug 2017 22:27:38 +0000 (UTC)
Received: by mail-vk0-f52.google.com with SMTP id u133so19598138vke.3
 for <wireguard@lists.zx2c4.com>; Tue, 08 Aug 2017 15:49:30 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170808200811.GB7930@wolff.to>
References: <CAJkVDg1O8SXWtR1cazOMQX6U-sxRVh57MNfTdNGBLpCUdOPnog@mail.gmail.com>
 <20170808200811.GB7930@wolff.to>
From: adam souzis <adam@souzis.com>
Date: Tue, 8 Aug 2017 15:49:29 -0700
Message-ID: <CAJkVDg00xN6YzKTYhPeHC6uJ6KR+bHfPfxznfpa3+8Ma4R9SXg@mail.gmail.com>
Subject: Re: trouble installing on Fedora and CentOS
To: Bruno Wolff III <bruno@wolff.to>
Content-Type: multipart/alternative; boundary="001a1143b43eba7b05055645c6ed"
Cc: wireguard@lists.zx2c4.com
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--001a1143b43eba7b05055645c6ed
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

OK, you inspired me to try harder to build it from source -- turns out on
both fedora 25 and 26 `uname -r` doesn't match the kernel src installed by
kernel-devel, once I fixed that it builds and installs and appears to work.

thanks!
Adam
=E1=90=A7

On Tue, Aug 8, 2017 at 1:08 PM, Bruno Wolff III <bruno@wolff.to> wrote:

> On Tue, Aug 08, 2017 at 12:58:58 -0700,
>  adam souzis <adam@souzis.com> wrote:
>
>>
>> The bad news is I was unable to get Wireguard working on either CentOS 7=
,
>> Fedora 26 or Fedora 25 (running these on AWS), it doesn't appear to be
>> installing the kernel module properly.
>>
>
> I run it on rawhide (Fedora 27 effectivel) by building from source.
>
> I have a local clone of the git repo and do the following:
> cd WireGuard/src
> make clean all
> su
> make install
>
> That installs the kernel module in the running kernel. You'll need
> kernel-devel installed and maybe kernel-headers. If you are updating the
> module, you will want to stop wireguard and use rmmod wireguard to remove
> the existing module, so the new one will get loaded (or reboot the system=
).
>

--001a1143b43eba7b05055645c6ed
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">OK, you inspired me to try harder to build it from source =
-- turns out on both fedora 25 and 26 `uname -r` doesn&#39;t match the kern=
el src installed by kernel-devel, once I fixed that it builds and installs =
and appears to work.<div><br></div><div>thanks!</div><div>Adam</div></div><=
div hspace=3D"streak-pt-mark" style=3D"max-height:1px"><img alt=3D"" style=
=3D"width:0px;max-height:0px;overflow:hidden" src=3D"https://mailfoogae.app=
spot.com/t?sender=3DaYWRhbUBzb3V6aXMuY29t&amp;type=3Dzerocontent&amp;guid=
=3Dce274123-b01a-4a67-a45e-b90b71c3c173"><font color=3D"#ffffff" size=3D"1"=
>=E1=90=A7</font></div><div class=3D"gmail_extra"><br><div class=3D"gmail_q=
uote">On Tue, Aug 8, 2017 at 1:08 PM, Bruno Wolff III <span dir=3D"ltr">&lt=
;<a href=3D"mailto:bruno@wolff.to" target=3D"_blank">bruno@wolff.to</a>&gt;=
</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">On Tue, A=
ug 08, 2017 at 12:58:58 -0700,<br>
=C2=A0adam souzis &lt;<a href=3D"mailto:adam@souzis.com" target=3D"_blank">=
adam@souzis.com</a>&gt; wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
<br>
The bad news is I was unable to get Wireguard working on either CentOS 7,<b=
r>
Fedora 26 or Fedora 25 (running these on AWS), it doesn&#39;t appear to be<=
br>
installing the kernel module properly.<br>
</blockquote>
<br></span>
I run it on rawhide (Fedora 27 effectivel) by building from source.<br>
<br>
I have a local clone of the git repo and do the following:<br>
cd WireGuard/src<br>
make clean all<br>
su<br>
make install<br>
<br>
That installs the kernel module in the running kernel. You&#39;ll need kern=
el-devel installed and maybe kernel-headers. If you are updating the module=
, you will want to stop wireguard and use rmmod wireguard to remove the exi=
sting module, so the new one will get loaded (or reboot the system).<br>
</blockquote></div><br></div>

--001a1143b43eba7b05055645c6ed--
