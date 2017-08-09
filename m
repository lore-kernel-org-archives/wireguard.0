Return-Path: adam@souzis.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e1ec5ed3
 for <wireguard@lists.zx2c4.com>; Wed, 9 Aug 2017 12:17:22 +0000 (UTC)
Received: from mail-ua0-f176.google.com (mail-ua0-f176.google.com
 [209.85.217.176])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 80540ede
 for <wireguard@lists.zx2c4.com>; Wed, 9 Aug 2017 12:17:22 +0000 (UTC)
Received: by mail-ua0-f176.google.com with SMTP id k43so27753085uaf.3
 for <wireguard@lists.zx2c4.com>; Wed, 09 Aug 2017 05:39:19 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <0774b643-23a3-5e57-c4db-889db42ae7eb@solidadmin.com>
References: <CAJkVDg1O8SXWtR1cazOMQX6U-sxRVh57MNfTdNGBLpCUdOPnog@mail.gmail.com>
 <0774b643-23a3-5e57-c4db-889db42ae7eb@solidadmin.com>
From: adam souzis <adam@souzis.com>
Date: Wed, 9 Aug 2017 05:39:18 -0700
Message-ID: <CAJkVDg1-0rQU0KCoVTyyiEK2Usuyf=djszSJ2KhP6xJdZwgzow@mail.gmail.com>
Subject: Re: trouble installing on Fedora and CentOS
To: Joe Doss <joe@solidadmin.com>
Content-Type: multipart/alternative; boundary="f403043eeeec5a8e070556515e46"
Cc: wireguard@lists.zx2c4.com
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--f403043eeeec5a8e070556515e46
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Joe,

Thanks for looking into this, yes you are correct that my machine's kernel
version didn't match with what the rpm expected, I discovered this when I
tried to build from source. Maybe this error should be fatal or output a
message suggesting the expected kernel?

Have you tried to get your packages to working on an Atomic Host build?
When I did, the install failed:

[fedora@atomic~]$ uname -r

4.11.11-300.fc26.x86_64

[fedora@atomic~]$ sudo rpm-ostree install
./wireguard-dkms-0.0.20170726-1.fc26.noarch.rpm

Checking out tree 0715ce8... done

Resolving dependencies... done

Overlaying... done

*error: *Running %post for wireguard-dkms: Executing
bwrap(/usr/wireguard-dkms.post): Child process exited with code 8

So I just copied the wireguard.ko and wg binaries over from a regular
Fedora 26, did an insmod and things are working, so I'm good for now.

thanks,

Adam
=E1=90=A7

On Tue, Aug 8, 2017 at 6:51 PM, Joe Doss <joe@solidadmin.com> wrote:

> Hey Adam,
>
> Thanks for using WireGuard. See my response below.
>
> On 08/08/2017 02:58 PM, adam souzis wrote:
>
>> I've been impressed with Wireguard, its design has helped simplify the
>> implementation of a distributed sandbox app I am building quite a bit. B=
ut
>> I have had mixed results getting it running on different distributions.
>>
>> The good news is that I can report that I was able to build, install and
>> run Wireguard on CoreOs.
>>
>> The bad news is I was unable to get Wireguard working on either CentOS 7=
,
>> Fedora 26 or Fedora 25 (running these on AWS), it doesn't appear to be
>> installing the kernel module properly.
>>
>> Here's what I see when install the RPM:
>>
>> + dkms add -m wireguard -v 0.0.20170629 -q --rpm_safe_upgrade
>>
>> + dkms build -m wireguard -v 0.0.20170629 -q
>>
>> + dkms install -m wireguard -v 0.0.20170629 -q
>>
>> D: %post(wireguard-dkms-1:0.0.20170629-2.fc25.noarch): waitpid(14760) rc
>> 14760 status 100
>>
>> warning: %post(wireguard-dkms-1:0.0.20170629-2.fc25.noarch) scriptlet
>> failed, exit status 1
>>
>> Non-fatal POSTIN scriptlet failure in rpm package wireguard-dkms
>>
> Are you running into this issue on a freshly provisioned server? Or after
> you do a system update? Do you reboot into the most current kernel if you
> do update? Does the kernel update along with kernel-devel and
> kernel-headers?
>
> This issue is caused by you running a kernel that doesn't have the correc=
t
> kernel-header package installed:
>
> [root@localhost ~]# dkms status
> wireguard, 0.0.20170726: added
>
> [root@localhost wireguard-0.0.20170726]# dkms build -m wireguard -v
> 0.0.20170726
> Error! echo
> Your kernel headers for kernel 4.11.8-300.fc26.x86_64 cannot be found at
> /lib/modules/4.11.8-300.fc26.x86_64/build or
> /lib/modules/4.11.8-300.fc26.x86_64/source.
>
> [root@localhost ~]# uname -a
> Linux localhost.localdomain 4.11.8-300.fc26.x86_64 #1 SMP Thu Jun 29
> 20:09:48 UTC 2017 x86_64 x86_64 x86_64 GNU/Linux
>
> [root@localhost ~]# rpm -qa |grep kernel
> kernel-devel-4.11.11-300.fc26.x86_64
> kernel-core-4.11.8-300.fc26.x86_64
> kernel-headers-4.11.11-300.fc26.x86_64
>
> I just tested the latest package on Vagrant and it works after running a
> dnf update and rebooting into the most current kernel that matches the
> currently installed kernel headers package.
>
> [root@localhost ~]# uname -a
> Linux localhost.localdomain 4.11.11-300.fc26.x86_64 #1 SMP Mon Jul 17
> 16:32:11 UTC 2017 x86_64 x86_64 x86_64 GNU/Linux
>
> [root@localhost ~]# rpm -qa |grep kernel
> kernel-devel-4.11.11-300.fc26.x86_64
> kernel-core-4.11.8-300.fc26.x86_64
> kernel-headers-4.11.11-300.fc26.x86_64
> kernel-core-4.11.11-300.fc26.x86_64
>
> [root@localhost ~]# dkms build -m wireguard -v 0.0.20170726
> Module wireguard/0.0.20170726 already built for kernel
> 4.11.11-300.fc26.x86_64/4
>
> [root@localhost ~]# ip link add dev wg0 type wireguard
>
> [root@localhost ~]# wg show
> interface: wg0
>
> You either want to install the kernel-headers package that matches your
> currently running kernel or dnf update and reboot, then DKMS will auto
> build the WireGuard kernel module on boot.
>
> Joe
>
> --
> Joe Doss
> joe@solidadmin.com
>
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
>

--f403043eeeec5a8e070556515e46
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Joe,=C2=A0<br></div><div><br></div><div>Thanks for=
 looking into this, yes you are correct that my machine&#39;s kernel versio=
n didn&#39;t match with what the rpm expected, I discovered this when I tri=
ed to build from source. Maybe this error should be fatal or output a messa=
ge suggesting the expected kernel?</div><div><br></div><div>Have you tried =
to get your packages to working on an Atomic Host build? When I did, the in=
stall failed:</div><div>







<p class=3D"gmail-p1"><span class=3D"gmail-s1">[fedora@atomic~]$ uname -r<s=
pan class=3D"gmail-Apple-converted-space">=C2=A0</span></span></p>
<p class=3D"gmail-p1"><span class=3D"gmail-s1">4.11.11-300.fc26.x86_64</spa=
n></p><p class=3D"gmail-p1"><span class=3D"gmail-s1">[fedora@atomic~]$ sudo=
 rpm-ostree install ./wireguard-dkms-0.0.20170726-1.fc26.noarch.rpm<span cl=
ass=3D"gmail-Apple-converted-space">=C2=A0</span></span></p><p class=3D"gma=
il-p1"><span class=3D"gmail-s1">Checking out tree 0715ce8... done</span></p=
><p class=3D"gmail-p1">Resolving dependencies... done<br></p><p class=3D"gm=
ail-p2"><span class=3D"gmail-s1"></span></p><p class=3D"gmail-p1"><span cla=
ss=3D"gmail-s1">Overlaying... done</span></p><p class=3D"gmail-p1"><span cl=
ass=3D"gmail-s1">

















</span></p><p class=3D"gmail-p1"><span class=3D"gmail-s2"><b>error: </b></s=
pan><span class=3D"gmail-s1">Running %post for wireguard-dkms: Executing bw=
rap(/usr/wireguard-dkms.post): Child process exited with code 8</span></p><=
p class=3D"gmail-p1">So I just copied the wireguard.ko and wg binaries over=
 from a regular Fedora 26, did an insmod and things are working, so I&#39;m=
 good for now.</p><p class=3D"gmail-p1">thanks,</p><p class=3D"gmail-p1">Ad=
am</p></div></div><div hspace=3D"streak-pt-mark" style=3D"max-height:1px"><=
img alt=3D"" style=3D"width:0px;max-height:0px;overflow:hidden" src=3D"http=
s://mailfoogae.appspot.com/t?sender=3DaYWRhbUBzb3V6aXMuY29t&amp;type=3Dzero=
content&amp;guid=3D5e39972b-f2f0-4700-8deb-99e1cc774636"><font color=3D"#ff=
ffff" size=3D"1">=E1=90=A7</font></div><div class=3D"gmail_extra"><br><div =
class=3D"gmail_quote">On Tue, Aug 8, 2017 at 6:51 PM, Joe Doss <span dir=3D=
"ltr">&lt;<a href=3D"mailto:joe@solidadmin.com" target=3D"_blank">joe@solid=
admin.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hey Adam=
,<br>
<br>
Thanks for using WireGuard. See my response below.<span class=3D""><br>
<br>
On 08/08/2017 02:58 PM, adam souzis wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
I&#39;ve been impressed with Wireguard, its design has helped simplify the =
implementation of a distributed sandbox app I am building quite a bit. But =
I have had mixed results getting it running on different distributions.<br>
<br>
The good news is that I can report that I was able to build, install and ru=
n Wireguard on CoreOs.<br>
<br>
The bad news is I was unable to get Wireguard working on either CentOS 7, F=
edora 26 or Fedora 25 (running these on AWS), it doesn&#39;t appear to be i=
nstalling the kernel module properly.<br>
<br>
Here&#39;s what I see when install the RPM:<br>
<br>
+ dkms add -m wireguard -v 0.0.20170629 -q --rpm_safe_upgrade<br>
<br>
+ dkms build -m wireguard -v 0.0.20170629 -q<br>
<br>
+ dkms install -m wireguard -v 0.0.20170629 -q<br>
<br>
D: %post(wireguard-dkms-1:0.0.201<wbr>70629-2.fc25.noarch): waitpid(14760) =
rc 14760 status 100<br>
<br>
warning: %post(wireguard-dkms-1:0.0.201<wbr>70629-2.fc25.noarch) scriptlet =
failed, exit status 1<br>
<br>
Non-fatal POSTIN scriptlet failure in rpm package wireguard-dkms<br>
</blockquote></span>
Are you running into this issue on a freshly provisioned server? Or after y=
ou do a system update? Do you reboot into the most current kernel if you do=
 update? Does the kernel update along with kernel-devel and kernel-headers?=
<br>
<br>
This issue is caused by you running a kernel that doesn&#39;t have the corr=
ect kernel-header package installed:<br>
<br>
[root@localhost ~]# dkms status<br>
wireguard, 0.0.20170726: added<br>
<br>
[root@localhost wireguard-0.0.20170726]# dkms build -m wireguard -v 0.0.201=
70726<br>
Error! echo<br>
Your kernel headers for kernel 4.11.8-300.fc26.x86_64 cannot be found at<br=
>
/lib/modules/4.11.8-300.fc26.x<wbr>86_64/build or /lib/modules/4.11.8-300.f=
c26.x<wbr>86_64/source.<br>
<br>
[root@localhost ~]# uname -a<br>
Linux localhost.localdomain 4.11.8-300.fc26.x86_64 #1 SMP Thu Jun 29 20:09:=
48 UTC 2017 x86_64 x86_64 x86_64 GNU/Linux<br>
<br>
[root@localhost ~]# rpm -qa |grep kernel<br>
kernel-devel-4.11.11-300.fc26.<wbr>x86_64<br>
kernel-core-4.11.8-300.fc26.x8<wbr>6_64<br>
kernel-headers-4.11.11-300.fc2<wbr>6.x86_64<br>
<br>
I just tested the latest package on Vagrant and it works after running a dn=
f update and rebooting into the most current kernel that matches the curren=
tly installed kernel headers package.<br>
<br>
[root@localhost ~]# uname -a<br>
Linux localhost.localdomain 4.11.11-300.fc26.x86_64 #1 SMP Mon Jul 17 16:32=
:11 UTC 2017 x86_64 x86_64 x86_64 GNU/Linux<br>
<br>
[root@localhost ~]# rpm -qa |grep kernel<br>
kernel-devel-4.11.11-300.fc26.<wbr>x86_64<br>
kernel-core-4.11.8-300.fc26.x8<wbr>6_64<br>
kernel-headers-4.11.11-300.fc2<wbr>6.x86_64<br>
kernel-core-4.11.11-300.fc26.x<wbr>86_64<br>
<br>
[root@localhost ~]# dkms build -m wireguard -v 0.0.20170726<br>
Module wireguard/0.0.20170726 already built for kernel 4.11.11-300.fc26.x86=
_64/4<br>
<br>
[root@localhost ~]# ip link add dev wg0 type wireguard<br>
<br>
[root@localhost ~]# wg show<br>
interface: wg0<br>
<br>
You either want to install the kernel-headers package that matches your cur=
rently running kernel or dnf update and reboot, then DKMS will auto build t=
he WireGuard kernel module on boot.<br>
<br>
Joe<br>
<br>
--<br>
Joe Doss<br>
<a href=3D"mailto:joe@solidadmin.com" target=3D"_blank">joe@solidadmin.com<=
/a><div class=3D"HOEnZb"><div class=3D"h5"><br>
______________________________<wbr>_________________<br>
WireGuard mailing list<br>
<a href=3D"mailto:WireGuard@lists.zx2c4.com" target=3D"_blank">WireGuard@li=
sts.zx2c4.com</a><br>
<a href=3D"https://lists.zx2c4.com/mailman/listinfo/wireguard" rel=3D"noref=
errer" target=3D"_blank">https://lists.zx2c4.com/mailma<wbr>n/listinfo/wire=
guard</a><br>
</div></div></blockquote></div><br></div>

--f403043eeeec5a8e070556515e46--
