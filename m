Return-Path: kedia.vikas@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6514e455
 for <wireguard@lists.zx2c4.com>;
 Wed, 18 Apr 2018 22:01:14 +0000 (UTC)
Received: from mail-ot0-f172.google.com (mail-ot0-f172.google.com
 [74.125.82.172])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3d844ad3
 for <wireguard@lists.zx2c4.com>;
 Wed, 18 Apr 2018 22:01:13 +0000 (UTC)
Received: by mail-ot0-f172.google.com with SMTP id h8-v6so3668547otj.7
 for <wireguard@lists.zx2c4.com>; Wed, 18 Apr 2018 15:01:14 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAPGejTecZFFQ=+fH-1iT4iNQP07Giajcfce+ETe98UzE+k4nJg@mail.gmail.com>
References: <CAPGejTdkr5ERbLPR=94do2_w6GddCK4fOP62ofZ=VYuvSNJ40w@mail.gmail.com>
 <CAHmME9pHbB8JS9anHpMHXqzbF=Ei_9cw3iXBg8aTSZT59vwBPg@mail.gmail.com>
 <CAPGejTecZFFQ=+fH-1iT4iNQP07Giajcfce+ETe98UzE+k4nJg@mail.gmail.com>
From: Vikas <kedia.vikas@gmail.com>
Date: Wed, 18 Apr 2018 15:01:13 -0700
Message-ID: <CAPGejTe3b26qZA0vAXRJeqkuh8fwcnp1seKGhdfZ4yjH3r3jGw@mail.gmail.com>
Subject: Re: On redhat 7.4 wireguard not working
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Content-Type: multipart/alternative; boundary="000000000000f1f263056a26973f"
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--000000000000f1f263056a26973f
Content-Type: text/plain; charset="UTF-8"

Just when I thought it worked here are more problems:

The steps I followed were:

1. wget
https://rpmfind.net/linux/fedora/linux/releases/25/Everything/x86_64/os/Packages/i/iproute-4.6.0-1.fc25.x86_64.rpm

2. yum install iproute-4.6.0-1.fc25.x86_64.rpm

I installed from fc25 since rhel7 does not have an upgraded iproute package.

3. After installing the iproute 4.6 I do NOT get the error message:

"Error: argument "suppress_prefixlength" is wrong: Failed to parse rule
type"

4. ifconfig shows the wg0 interface.

5. After approx 2 minutes my ssh connection to the machine over the LAN
(eth0) gets disconnected.

6. When I ssh back in to the machine, ifconfig does not show the wg0
interface.


Please help :(



--
VK

On Wed, Apr 18, 2018 at 2:33 PM, Vikas <kedia.vikas@gmail.com> wrote:
>
> Thank you Jason. Your response is very appreciated along with your work
on the wireguard project.
>
> 1. Is there a minimum version of iproute2 that is needed?
>
> 2. Can that be mention in the dependency.
>
> 3. I installed from source and from the suggested rpm method at
https://www.wireguard.com/install/ would it be possible to check for
version for iproute2 and fail with a error message,
>
> Regards,
>
> Vikas
>
>
>
> --
> VK
>
> On Wed, Apr 18, 2018 at 2:10 PM, Jason A. Donenfeld <Jason@zx2c4.com>
wrote:
>>
>> You need a newer version of iproute2.
>
>

--000000000000f1f263056a26973f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Just when I thought it worked here are more problems:<br><=
br>The steps I followed were:<br><br><div>1. wget <a href=3D"https://rpmfin=
d.net/linux/fedora/linux/releases/25/Everything/x86_64/os/Packages/i/iprout=
e-4.6.0-1.fc25.x86_64.rpm">https://rpmfind.net/linux/fedora/linux/releases/=
25/Everything/x86_64/os/Packages/i/iproute-4.6.0-1.fc25.x86_64.rpm</a><br><=
br></div><div>2. yum install iproute-4.6.0-1.fc25.x86_64.rpm<br><br>I insta=
lled from fc25 since rhel7 does not have an upgraded iproute package.<br><b=
r><div>3. After installing the iproute 4.6 I do NOT get the error message:<=
br></div><div><br>&quot;Error: argument &quot;suppress_prefixlength&quot; i=
s wrong: Failed to parse rule type&quot;<br><br>4. ifconfig shows the wg0 i=
nterface.<div><br></div><div>5. After approx 2 minutes my ssh connection to=
 the machine over the LAN (eth0) gets disconnected.</div><div><br></div><di=
v>6. When I ssh back in to the machine, ifconfig does not show the wg0 inte=
rface.<br><br><br>Please help :(<br><br><br><br>--<br>VK<br><br>On Wed, Apr=
 18, 2018 at 2:33 PM, Vikas &lt;<a href=3D"mailto:kedia.vikas@gmail.com">ke=
dia.vikas@gmail.com</a>&gt; wrote:<br>&gt;<br>&gt; Thank you Jason. Your re=
sponse is very appreciated along with your work on the wireguard project.<b=
r>&gt;<br>&gt; 1. Is there a minimum version of iproute2 that is needed?<br=
>&gt;<br>&gt; 2. Can that be mention in the dependency.<br>&gt;<br>&gt; 3. =
I installed from source and from the suggested rpm method at <a href=3D"htt=
ps://www.wireguard.com/install/">https://www.wireguard.com/install/</a> wou=
ld it be possible to check for version for iproute2 and fail with a error m=
essage,<br>&gt;<br>&gt; Regards,<br>&gt;<br>&gt; Vikas<br>&gt;<br>&gt;<br>&=
gt;<br>&gt; --<br>&gt; VK<br>&gt;<br>&gt; On Wed, Apr 18, 2018 at 2:10 PM, =
Jason A. Donenfeld &lt;<a href=3D"mailto:Jason@zx2c4.com">Jason@zx2c4.com</=
a>&gt; wrote:<br>&gt;&gt;<br>&gt;&gt; You need a newer version of iproute2.=
<br>&gt;<br>&gt;</div></div></div></div>

--000000000000f1f263056a26973f--
