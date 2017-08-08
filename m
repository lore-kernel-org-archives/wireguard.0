Return-Path: adam@souzis.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0a0ec474
 for <wireguard@lists.zx2c4.com>; Tue, 8 Aug 2017 19:37:08 +0000 (UTC)
Received: from mail-vk0-f46.google.com (mail-vk0-f46.google.com
 [209.85.213.46])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b50a0910
 for <wireguard@lists.zx2c4.com>; Tue, 8 Aug 2017 19:37:08 +0000 (UTC)
Received: by mail-vk0-f46.google.com with SMTP id r199so17965802vke.4
 for <wireguard@lists.zx2c4.com>; Tue, 08 Aug 2017 12:59:00 -0700 (PDT)
MIME-Version: 1.0
From: adam souzis <adam@souzis.com>
Date: Tue, 8 Aug 2017 12:58:58 -0700
Message-ID: <CAJkVDg1O8SXWtR1cazOMQX6U-sxRVh57MNfTdNGBLpCUdOPnog@mail.gmail.com>
Subject: trouble installing on Fedora and CentOS
To: wireguard@lists.zx2c4.com
Content-Type: multipart/alternative; boundary="001a11431952e277ba05564364d6"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--001a11431952e277ba05564364d6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I've been impressed with Wireguard, its design has helped simplify the
implementation of a distributed sandbox app I am building quite a bit. But
I have had mixed results getting it running on different distributions.

The good news is that I can report that I was able to build, install and
run Wireguard on CoreOs.

The bad news is I was unable to get Wireguard working on either CentOS 7,
Fedora 26 or Fedora 25 (running these on AWS), it doesn't appear to be
installing the kernel module properly.

Here's what I see when install the RPM:

+ dkms add -m wireguard -v 0.0.20170629 -q --rpm_safe_upgrade

+ dkms build -m wireguard -v 0.0.20170629 -q

+ dkms install -m wireguard -v 0.0.20170629 -q

D: %post(wireguard-dkms-1:0.0.20170629-2.fc25.noarch): waitpid(14760) rc
14760 status 100

warning: %post(wireguard-dkms-1:0.0.20170629-2.fc25.noarch) scriptlet
failed, exit status 1

Non-fatal POSTIN scriptlet failure in rpm package wireguard-dkms


Looks like it might have worked:

[fedora@ip-1~]$ sudo dkms status

wireguard, 0.0.20170629: added

BUT:

[fedora@ip-1 ~]$ sudo ip link add dev wg0 type wireguard

RTNETLINK answers: Operation not supported
I tried this on the latest version of the RPM and this earlier version. I
also tried compiling it from source on Fedora but make failed early on.

I disabled selinux, verified the kernel config is good and manually enabled
udp_tunnel for good measure. Any other suggestions? (I did see an earlier
post here recommending using kernel-ml for centos 7 but I need to use the
Atomic Host variant and swapping out the kernel on that is non-trivial. I
was hoping using a recent Fedora would solve the kernel compatibility
issues.)

thank you!
Adam
=E1=90=A7

--001a11431952e277ba05564364d6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I&#39;ve been impressed with Wireguard, its design ha=
s helped simplify the implementation of a distributed sandbox app I am buil=
ding quite a bit. But I have had mixed results getting it running on differ=
ent distributions.</div><div><br></div>The good news is that I can report t=
hat I was able to build, install and run Wireguard on CoreOs.<div><br></div=
><div>The bad news is I was unable to get Wireguard working on either CentO=
S 7, Fedora 26 or Fedora 25 (running these on AWS), it doesn&#39;t appear t=
o be installing the kernel module properly.=C2=A0</div><div><br></div><div>=
Here&#39;s what I see when install the RPM:</div><div><br></div><div>







<p class=3D"gmail-p1"><span class=3D"gmail-s1">+ dkms add -m wireguard -v 0=
.0.20170629 -q --rpm_safe_upgrade</span></p><p class=3D"gmail-p1">+ dkms bu=
ild -m wireguard -v 0.0.20170629 -q</p>
<p class=3D"gmail-p1"><span class=3D"gmail-s1">+ dkms install -m wireguard =
-v 0.0.20170629 -q</span></p>
<p class=3D"gmail-p1"><span class=3D"gmail-s1">D: %post(wireguard-dkms-1:0.=
0.20170629-2.fc25.noarch): waitpid(14760) rc 14760 status 100</span></p>
<p class=3D"gmail-p1"><span class=3D"gmail-s1">warning: %post(wireguard-dkm=
s-1:0.0.20170629-2.fc25.noarch) scriptlet failed, exit status 1</span></p>
<p class=3D"gmail-p1"><span class=3D"gmail-s1">Non-fatal POSTIN scriptlet f=
ailure in rpm package wireguard-dkms</span></p><p class=3D"gmail-p1"><span =
class=3D"gmail-s1"><br></span></p><p class=3D"gmail-p1">Looks like it might=
 have worked:</p></div><div>







<p class=3D"gmail-p1"><span class=3D"gmail-s1">[fedora@ip-1~]$ sudo dkms st=
atus<span class=3D"gmail-Apple-converted-space">=C2=A0</span></span></p><p =
class=3D"gmail-p1"><span class=3D"gmail-s1">wireguard, 0.0.20170629: added<=
/span></p><p class=3D"gmail-p1">BUT:</p><p class=3D"gmail-p1"><span class=
=3D"gmail-s1">[fedora@ip-1 ~]$ sudo ip link add dev wg0 type wireguard</spa=
n></p><p class=3D"gmail-p1">










</p><p class=3D"gmail-p1"><span class=3D"gmail-s1">RTNETLINK answers: Opera=
tion not supported</span></p></div><div>I tried this on the latest version =
of the RPM and this earlier version. I also tried compiling it from source =
on Fedora but make failed early on. =C2=A0</div><div><br></div><div>I disab=
led selinux, verified the kernel config is good and manually enabled udp_tu=
nnel for good measure. Any other suggestions? (I did see an earlier post he=
re recommending using kernel-ml for centos 7 but I need to use the Atomic H=
ost variant and swapping out the kernel on that is non-trivial. I was hopin=
g using a recent Fedora would solve the kernel compatibility issues.)</div>=
<div><br></div><div>thank you!</div><div>Adam</div></div><div hspace=3D"str=
eak-pt-mark" style=3D"max-height:1px"><img alt=3D"" style=3D"width:0px;max-=
height:0px;overflow:hidden" src=3D"https://mailfoogae.appspot.com/t?sender=
=3DaYWRhbUBzb3V6aXMuY29t&amp;type=3Dzerocontent&amp;guid=3D42803d30-4da4-43=
44-aaa2-f0026aec1d30"><font color=3D"#ffffff" size=3D"1">=E1=90=A7</font></=
div>

--001a11431952e277ba05564364d6--
