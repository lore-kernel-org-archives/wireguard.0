Return-Path: dave@natulte.net
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 12116eea
 for <wireguard@lists.zx2c4.com>;
 Mon, 20 Feb 2017 23:52:56 +0000 (UTC)
Received: from mail-vk0-f44.google.com (mail-vk0-f44.google.com
 [209.85.213.44])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9f4086f5
 for <wireguard@lists.zx2c4.com>;
 Mon, 20 Feb 2017 23:52:56 +0000 (UTC)
Received: by mail-vk0-f44.google.com with SMTP id t8so70582884vke.3
 for <wireguard@lists.zx2c4.com>; Mon, 20 Feb 2017 15:53:42 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <87efywha2u.fsf@alice.fifthhorseman.net>
References: <CAMx+r7WsvfJ6j7JT9+Z5mNe=FEFwehTVNgX+7-8vnQMa5FxORg@mail.gmail.com>
 <874lzzqai9.fsf@alice.fifthhorseman.net>
 <CAMx+r7XsHgrxy+1T4ndqzSebA6Ds4XTjQrD9VmoCWAtJkLygHw@mail.gmail.com>
 <87o9y4n555.fsf@alice.fifthhorseman.net>
 <CAMx+r7X9ZLqqRf8YC8juk0+V1Y3SR6GzPDK7dLqBF0nfEWqg2w@mail.gmail.com>
 <87efywha2u.fsf@alice.fifthhorseman.net>
From: David Anderson <dave@natulte.net>
Date: Mon, 20 Feb 2017 15:53:21 -0800
Message-ID: <CAMx+r7Wq8z8pvEacHw07TM26jktuha08ZvThP2JBx=WUBtviKg@mail.gmail.com>
Subject: Re: (Unofficial) wireguard packages for Debian Stretch (testing)
To: Daniel Kahn Gillmor <dkg@fifthhorseman.net>
Content-Type: multipart/alternative; boundary=001a11440db81becc20548fef91d
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--001a11440db81becc20548fef91d
Content-Type: text/plain; charset=UTF-8

On Fri, Feb 17, 2017 at 11:49 AM, Daniel Kahn Gillmor <dkg@fifthhorseman.net
> wrote:

> On Thu 2017-02-16 22:14:11 -0500, David Anderson wrote:
> > The transcript below still shows one additional package being pulled from
> > sid/main, the dkms package. I find this strange: wireguard-dkms depends
> on
> > dkms >=2.1.0.0, stretch has dkms 2.3-2, and sid has dkms 2.3-3. Despite
> the
> > negative priority for unstable, apt picks 2.3-3 from sid, even though the
> > dependency could be satisfied out of stretch. What am I missing?
>
> That is indeed weird.  what does "apt-cache policy dkms" show you?
>

# apt-cache policy dkms
dkms:
  Installed: (none)
  Candidate: 2.3-2
  Version table:
     2.3-3 -1
        -10 http://ftp.us.debian.org/debian sid/main amd64 Packages
        100 /var/lib/dpkg/status
     2.3-2 500
        500 http://ftp.us.debian.org/debian stretch/main amd64 Packages


what if you "apt install dkms" on its own first, which version do you
> get?
>

# apt install -d dkms
Reading package lists... Done
Building dependency tree
Reading state information... Done
The following additional packages will be installed:
  fakeroot gcc libfakeroot linux-headers-amd64
Suggested packages:
  python3-apport menu gcc-multilib autoconf automake libtool flex bison gdb
gcc-doc
The following NEW packages will be installed:
  dkms fakeroot gcc libfakeroot linux-headers-amd64
0 upgraded, 5 newly installed, 0 to remove and 0 not upgraded.
Need to get 217 kB of archives.
After this operation, 717 kB of additional disk space will be used.
Do you want to continue? [Y/n]
Get:1 http://ftp.us.debian.org/debian stretch/main amd64 gcc amd64
4:6.3.0-1 [5,184 B]
Get:2 http://ftp.us.debian.org/debian stretch/main amd64 dkms all 2.3-2
[74.8 kB]
Get:3 http://ftp.us.debian.org/debian stretch/main amd64 libfakeroot amd64
1.21-3.1 [45.7 kB]
Get:4 http://ftp.us.debian.org/debian stretch/main amd64 fakeroot amd64
1.21-3.1 [85.6 kB]
Get:5 http://ftp.us.debian.org/debian stretch/main amd64
linux-headers-amd64 amd64 4.9+78 [5,744 B]
Fetched 217 kB in 0s (328 kB/s)
Download complete and in download only mode

Looks like installing just dkms correctly selects from Stretch, whereas
installing as a dependency of wireguard-dkms pulls in the sid version.

- Dave



>
>         --dkg
>

--001a11440db81becc20548fef91d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On F=
ri, Feb 17, 2017 at 11:49 AM, Daniel Kahn Gillmor <span dir=3D"ltr">&lt;<a =
href=3D"mailto:dkg@fifthhorseman.net" target=3D"_blank">dkg@fifthhorseman.n=
et</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x"><span class=3D"gmail-">On Thu 2017-02-16 22:14:11 -0500, David Anderson =
wrote:<br>
&gt; The transcript below still shows one additional package being pulled f=
rom<br>
&gt; sid/main, the dkms package. I find this strange: wireguard-dkms depend=
s on<br>
&gt; dkms &gt;=3D2.1.0.0, stretch has dkms 2.3-2, and sid has dkms 2.3-3. D=
espite the<br>
&gt; negative priority for unstable, apt picks 2.3-3 from sid, even though =
the<br>
&gt; dependency could be satisfied out of stretch. What am I missing?<br>
<br>
</span>That is indeed weird.=C2=A0 what does &quot;apt-cache policy dkms&qu=
ot; show you?<br></blockquote><div><br></div><div><div># apt-cache policy d=
kms</div><div>dkms:</div><div>=C2=A0 Installed: (none)</div><div>=C2=A0 Can=
didate: 2.3-2</div><div>=C2=A0 Version table:</div><div>=C2=A0 =C2=A0 =C2=
=A02.3-3 -1</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 -10 <a href=3D"http://ftp=
.us.debian.org/debian">http://ftp.us.debian.org/debian</a> sid/main amd64 P=
ackages</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 100 /var/lib/dpkg/status</div=
><div>=C2=A0 =C2=A0 =C2=A02.3-2 500</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 5=
00 <a href=3D"http://ftp.us.debian.org/debian">http://ftp.us.debian.org/deb=
ian</a> stretch/main amd64 Packages</div></div><div><br></div><div><br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">what if you &quot;apt i=
nstall dkms&quot; on its own first, which version do you<br>
get?<br></blockquote><div><br></div><div><div># apt install -d dkms</div><d=
iv>Reading package lists... Done</div><div>Building dependency tree =C2=A0 =
=C2=A0 =C2=A0=C2=A0</div><div>Reading state information... Done</div><div>T=
he following additional packages will be installed:</div><div>=C2=A0 fakero=
ot gcc libfakeroot linux-headers-amd64</div><div>Suggested packages:</div><=
div>=C2=A0 python3-apport menu gcc-multilib autoconf automake libtool flex =
bison gdb gcc-doc</div><div>The following NEW packages will be installed:</=
div><div>=C2=A0 dkms fakeroot gcc libfakeroot linux-headers-amd64</div><div=
>0 upgraded, 5 newly installed, 0 to remove and 0 not upgraded.</div><div>N=
eed to get 217 kB of archives.</div><div>After this operation, 717 kB of ad=
ditional disk space will be used.</div><div>Do you want to continue? [Y/n]=
=C2=A0</div><div>Get:1 <a href=3D"http://ftp.us.debian.org/debian">http://f=
tp.us.debian.org/debian</a> stretch/main amd64 gcc amd64 4:6.3.0-1 [5,184 B=
]</div><div>Get:2 <a href=3D"http://ftp.us.debian.org/debian">http://ftp.us=
.debian.org/debian</a> stretch/main amd64 dkms all 2.3-2 [74.8 kB]</div><di=
v>Get:3 <a href=3D"http://ftp.us.debian.org/debian">http://ftp.us.debian.or=
g/debian</a> stretch/main amd64 libfakeroot amd64 1.21-3.1 [45.7 kB]</div><=
div>Get:4 <a href=3D"http://ftp.us.debian.org/debian">http://ftp.us.debian.=
org/debian</a> stretch/main amd64 fakeroot amd64 1.21-3.1 [85.6 kB]</div><d=
iv>Get:5 <a href=3D"http://ftp.us.debian.org/debian">http://ftp.us.debian.o=
rg/debian</a> stretch/main amd64 linux-headers-amd64 amd64 4.9+78 [5,744 B]=
</div><div>Fetched 217 kB in 0s (328 kB/s) =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0</div><div>Download complete and in download only mode</div></div=
><div><br></div><div>Looks like installing just dkms correctly selects from=
 Stretch, whereas installing as a dependency of wireguard-dkms pulls in the=
 sid version.</div><div><br></div><div>- Dave</div><div><br></div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<span class=3D"gmail-HOEnZb"><font color=3D"#888888"><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 --dkg<br>
</font></span></blockquote></div><br></div></div>

--001a11440db81becc20548fef91d--
