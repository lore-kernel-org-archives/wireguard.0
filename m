Return-Path: dave@natulte.net
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f5536fe9
 for <wireguard@lists.zx2c4.com>;
 Fri, 17 Feb 2017 03:14:16 +0000 (UTC)
Received: from mail-ua0-f174.google.com (mail-ua0-f174.google.com
 [209.85.217.174])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3c25e919
 for <wireguard@lists.zx2c4.com>;
 Fri, 17 Feb 2017 03:14:16 +0000 (UTC)
Received: by mail-ua0-f174.google.com with SMTP id t17so14892303uae.3
 for <wireguard@lists.zx2c4.com>; Thu, 16 Feb 2017 19:14:33 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <87o9y4n555.fsf@alice.fifthhorseman.net>
References: <CAMx+r7WsvfJ6j7JT9+Z5mNe=FEFwehTVNgX+7-8vnQMa5FxORg@mail.gmail.com>
 <874lzzqai9.fsf@alice.fifthhorseman.net>
 <CAMx+r7XsHgrxy+1T4ndqzSebA6Ds4XTjQrD9VmoCWAtJkLygHw@mail.gmail.com>
 <87o9y4n555.fsf@alice.fifthhorseman.net>
From: David Anderson <dave@natulte.net>
Date: Thu, 16 Feb 2017 19:14:11 -0800
Message-ID: <CAMx+r7X9ZLqqRf8YC8juk0+V1Y3SR6GzPDK7dLqBF0nfEWqg2w@mail.gmail.com>
Subject: Re: (Unofficial) wireguard packages for Debian Stretch (testing)
To: Daniel Kahn Gillmor <dkg@fifthhorseman.net>
Content-Type: multipart/alternative; boundary=94eb2c05b050f906e60548b14f9d
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--94eb2c05b050f906e60548b14f9d
Content-Type: text/plain; charset=UTF-8

On Tue, Feb 14, 2017 at 7:50 AM, Daniel Kahn Gillmor <dkg@fifthhorseman.net>
wrote:

> On Mon 2017-02-13 23:55:45 -0500, David Anderson wrote:
> > "Once stretch is released" could be a few months still, right? It's only
> > just gone into final freeze. I agree that once it's released, backports
> is
> > definitely the right way to distribute.
>
> Yep, it could still be a few months, depending on how rapidly we're able
> to fix the remaining outstanding release-critical bugs.
>
> > So, I'd initially tried doing this, by adding the unstable repository at
> a
> > negative priority. What turned me off is that even with that low
> > preference, attempting to install the wireguard packages seemed to pull
> in
> > some core system libraries (libc and such) from unstable as well. And
> while
> > I'm excited about wireguard, I'm not "install unstable base libraries"
> > excited :).
>
> absolutely!  However, i'm a little surprised that this happened.  If you
> could show a transcript of what you did specifically, and what the
> resultant proposed apt changes were, i'd be interested in understanding
> what went on there.
>

Apologies for the delay. I tried pinning again on a fresh Stretch VM. It
looks like I confused myself by assuming that all the extra packages to be
installed were from sid as well, whereas -d shows that the vast majority
are coming from stretch/main. Sorry about the confusion, given this
behavior I completely agree that this should be the documented way to get
wireguard before stretch gets released as stable.

The transcript below still shows one additional package being pulled from
sid/main, the dkms package. I find this strange: wireguard-dkms depends on
dkms >=2.1.0.0, stretch has dkms 2.3-2, and sid has dkms 2.3-3. Despite the
negative priority for unstable, apt picks 2.3-3 from sid, even though the
dependency could be satisfied out of stretch. What am I missing?

root@atik # echo "deb http://ftp.us.debian.org/debian sid main"
>/etc/apt/sources.list.d/sid.list
root@atik # cat >/etc/apt/preferences.d/avoid_sid <<EOF
Package: *
Pin: release a=unstable
Pin-Priority: -10
EOF
root@atik # apt update
Hit:1 http://security.debian.org stretch/updates InRelease
Hit:2 http://ftp.us.debian.org/debian stretch InRelease

Hit:3 http://ftp.us.debian.org/debian stretch-updates InRelease

Get:4 http://ftp.us.debian.org/debian sid InRelease [231 kB]

Hit:5 http://deb.robustperception.io precise InRelease

Get:6 http://ftp.us.debian.org/debian sid/main amd64 Packages [7,446 kB]
Get:7 http://ftp.us.debian.org/debian sid/main Translation-en [5,645 kB]
Fetched 13.3 MB in 7s (1,739 kB/s)

Reading package lists... Done
Building dependency tree
Reading state information... Done
All packages are up to date.
root@atik # apt upgrade
Reading package lists... Done
Building dependency tree
Reading state information... Done
Calculating upgrade... Done
0 upgraded, 0 newly installed, 0 to remove and 0 not upgraded.
root@atik # apt install -d wireguard-dkms/unstable wireguard-tools/unstable
Reading package lists... Done
Building dependency tree
Reading state information... Done
Selected version '0.0.20170214-1' (Debian:unstable [all]) for
'wireguard-dkms'
Selected version '0.0.20170214-1' (Debian:unstable [amd64]) for
'wireguard-tools'
The following additional packages will be installed:
  dkms fakeroot gcc libfakeroot linux-headers-amd64
Suggested packages:
  python3-apport menu gcc-multilib autoconf automake libtool flex bison gdb
gcc-doc
The following NEW packages will be installed:
  dkms fakeroot gcc libfakeroot linux-headers-amd64 wireguard-dkms
wireguard-tools
0 upgraded, 7 newly installed, 0 to remove and 59 not upgraded.
Need to get 348 kB of archives.
After this operation, 1,360 kB of additional disk space will be used.
Do you want to continue? [Y/n]
Get:1 http://ftp.us.debian.org/debian stretch/main amd64 gcc amd64
4:6.3.0-1 [5,184 B]
Get:2 http://ftp.us.debian.org/debian sid/main amd64 dkms all 2.3-3 [74.9
kB]
Get:3 http://ftp.us.debian.org/debian stretch/main amd64 libfakeroot amd64
1.21-3.1 [45.7 kB]
Get:4 http://ftp.us.debian.org/debian stretch/main amd64 fakeroot amd64
1.21-3.1 [85.6 kB]
Get:5 http://ftp.us.debian.org/debian stretch/main amd64
linux-headers-amd64 amd64 4.9+78 [5,744 B]
Get:6 http://ftp.us.debian.org/debian sid/main amd64 wireguard-dkms all
0.0.20170214-1 [85.5 kB]
Get:7 http://ftp.us.debian.org/debian sid/main amd64 wireguard-tools amd64
0.0.20170214-1 [44.9 kB]
Fetched 348 kB in 0s (531 kB/s)
Download complete and in download only mode


Cheers,
- Dave


>
> on a similar system i'm using (stretch, with unstable available but
> pinned low), i see only packages from stretch being installed (aside
> from wireguard itself, clearly)
>
> 0 root@test:~# cat /etc/apt/sources.list.d/unstable.list
> deb http://ftp.us.debian.org/debian/ unstable main
> 0 root@test:~# cat /etc/apt/preferences.d/limit-unstable
> Package: *
> Pin: release a=unstable
> Pin-Priority: 200
> 1 root@test:~# apt install wireguard-dkms wireguard-tools -d
> Reading package lists... Done
> Building dependency tree
> Reading state information... Done
> The following additional packages will be installed:
>   binutils cpp cpp-6 dkms gcc gcc-6 libasan3 libatomic1 libcc1-0
> libcilkrts5
>   libgcc-6-dev libgomp1 libisl15 libitm1 liblsan0 libmpc3 libmpfr4 libmpx2
>   libquadmath0 libtsan0 libubsan0 make patch
> Suggested packages:
>   binutils-doc cpp-doc gcc-6-locales python3-apport menu gcc-multilib
>   manpages-dev autoconf automake libtool flex bison gdb gcc-doc
> gcc-6-multilib
>   gcc-6-doc libgcc1-dbg libgomp1-dbg libitm1-dbg libatomic1-dbg
> libasan3-dbg
>   liblsan0-dbg libtsan0-dbg libubsan0-dbg libcilkrts5-dbg libmpx2-dbg
>   libquadmath0-dbg make-doc ed diffutils-doc
> Recommended packages:
>   fakeroot sudo linux-headers-686-pae | linux-headers-amd64
>   | linux-headers-generic | linux-headers lsb-release libc6-dev | libc-dev
>   libc6-dev
> The following NEW packages will be installed:
>   binutils cpp cpp-6 dkms gcc gcc-6 libasan3 libatomic1 libcc1-0
> libcilkrts5
>   libgcc-6-dev libgomp1 libisl15 libitm1 liblsan0 libmpc3 libmpfr4 libmpx2
>   libquadmath0 libtsan0 libubsan0 make patch wireguard-dkms wireguard-tools
> 0 upgraded, 25 newly installed, 0 to remove and 0 not upgraded.
> Need to get 22.4 MB of archives.
> After this operation, 94.5 MB of additional disk space will be used.
> Do you want to continue? [Y/n]
> Get:1 http://ftp.us.debian.org/debian stretch/main amd64 libmpfr4 amd64
> 3.1.5-1 [556 kB]
> Get:2 http://ftp.us.debian.org/debian stretch/main amd64 libmpc3 amd64
> 1.0.3-1 [40.2 kB]
> Get:3 http://ftp.us.debian.org/debian stretch/main amd64 binutils amd64
> 2.27.90.20170124-2 [3,761 kB]
> Get:4 http://ftp.us.debian.org/debian stretch/main amd64 libisl15 amd64
> 0.18-1 [564 kB]
> Get:5 http://ftp.us.debian.org/debian stretch/main amd64 cpp-6 amd64
> 6.3.0-6 [6,574 kB]
> Get:6 http://ftp.us.debian.org/debian stretch/main amd64 cpp amd64
> 4:6.3.0-1 [18.6 kB]
> Get:7 http://ftp.us.debian.org/debian stretch/main amd64 libcc1-0 amd64
> 6.3.0-6 [30.7 kB]
> Get:8 http://ftp.us.debian.org/debian stretch/main amd64 libgomp1 amd64
> 6.3.0-6 [73.2 kB]
> Get:9 http://ftp.us.debian.org/debian stretch/main amd64 libitm1 amd64
> 6.3.0-6 [27.3 kB]
> Get:10 http://ftp.us.debian.org/debian stretch/main amd64 libatomic1
> amd64 6.3.0-6 [8,904 B]
> Get:11 http://ftp.us.debian.org/debian stretch/main amd64 libasan3 amd64
> 6.3.0-6 [311 kB]
> Get:12 http://ftp.us.debian.org/debian stretch/main amd64 liblsan0 amd64
> 6.3.0-6 [115 kB]
> Get:13 http://ftp.us.debian.org/debian stretch/main amd64 libtsan0 amd64
> 6.3.0-6 [256 kB]
> Get:14 http://ftp.us.debian.org/debian stretch/main amd64 libubsan0 amd64
> 6.3.0-6 [107 kB]
> Get:15 http://ftp.us.debian.org/debian stretch/main amd64 libcilkrts5
> amd64 6.3.0-6 [40.6 kB]
> Get:16 http://ftp.us.debian.org/debian stretch/main amd64 libmpx2 amd64
> 6.3.0-6 [11.2 kB]
> Get:17 http://ftp.us.debian.org/debian stretch/main amd64 libquadmath0
> amd64 6.3.0-6 [131 kB]
> Get:18 http://ftp.us.debian.org/debian stretch/main amd64 libgcc-6-dev
> amd64 6.3.0-6 [2,296 kB]
> Get:19 http://ftp.us.debian.org/debian stretch/main amd64 gcc-6 amd64
> 6.3.0-6 [6,852 kB]
> Get:20 http://ftp.us.debian.org/debian stretch/main amd64 gcc amd64
> 4:6.3.0-1 [5,184 B]
> Get:21 http://ftp.us.debian.org/debian stretch/main amd64 make amd64
> 4.1-9 [299 kB]
> Get:22 http://ftp.us.debian.org/debian stretch/main amd64 patch amd64
> 2.7.5-1 [109 kB]
> Get:23 http://ftp.us.debian.org/debian stretch/main amd64 dkms all 2.3-2
> [74.8 kB]
> Get:24 http://ftp.us.debian.org/debian unstable/main amd64 wireguard-dkms
> all 0.0.20170213-1 [90.2 kB]
> Get:25 http://ftp.us.debian.org/debian unstable/main amd64
> wireguard-tools amd64 0.0.20170213-1 [44.9 kB]
> Fetched 22.4 MB in 2s (9,247 kB/s)
> Download complete and in download only mode
> 0 root@test:~#
>
> Please let me know what you're seeing that's different.
>
> Regards,
>
>        --dkg
>

--94eb2c05b050f906e60548b14f9d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On T=
ue, Feb 14, 2017 at 7:50 AM, Daniel Kahn Gillmor <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:dkg@fifthhorseman.net" target=3D"_blank">dkg@fifthhorseman.ne=
t</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
"><span class=3D"gmail-">On Mon 2017-02-13 23:55:45 -0500, David Anderson w=
rote:<br>
&gt; &quot;Once stretch is released&quot; could be a few months still, righ=
t? It&#39;s only<br>
&gt; just gone into final freeze. I agree that once it&#39;s released, back=
ports is<br>
&gt; definitely the right way to distribute.<br>
<br>
</span>Yep, it could still be a few months, depending on how rapidly we&#39=
;re able<br>
to fix the remaining outstanding release-critical bugs.<br>
<span class=3D"gmail-"><br>
&gt; So, I&#39;d initially tried doing this, by adding the unstable reposit=
ory at a<br>
&gt; negative priority. What turned me off is that even with that low<br>
&gt; preference, attempting to install the wireguard packages seemed to pul=
l in<br>
&gt; some core system libraries (libc and such) from unstable as well. And =
while<br>
&gt; I&#39;m excited about wireguard, I&#39;m not &quot;install unstable ba=
se libraries&quot;<br>
&gt; excited :).<br>
<br>
</span>absolutely!=C2=A0 However, i&#39;m a little surprised that this happ=
ened.=C2=A0 If you<br>
could show a transcript of what you did specifically, and what the<br>
resultant proposed apt changes were, i&#39;d be interested in understanding=
<br>
what went on there.<br></blockquote><div><br></div><div>Apologies for the d=
elay. I tried pinning again on a fresh Stretch VM. It looks like I confused=
 myself by assuming that all the extra packages to be installed were from s=
id as well, whereas -d shows that the vast majority are coming from stretch=
/main. Sorry about the confusion, given this behavior I completely agree th=
at this should be the documented way to get wireguard before stretch gets r=
eleased as stable.</div><div><br></div><div>The transcript below still show=
s one additional package being pulled from sid/main, the dkms package. I fi=
nd this strange: wireguard-dkms depends on dkms &gt;=3D2.1.0.0, stretch has=
 dkms 2.3-2, and sid has dkms 2.3-3. Despite the negative priority for unst=
able, apt picks 2.3-3 from sid, even though the dependency could be satisfi=
ed out of stretch. What am I missing?</div><div><br></div><div>root@atik #=
=C2=A0echo &quot;deb <a href=3D"http://ftp.us.debian.org/debian">http://ftp=
.us.debian.org/debian</a> sid main&quot; &gt;/etc/apt/sources.list.d/sid.li=
st<br></div><div>root@atik # cat &gt;/etc/apt/preferences.d/avoid_sid &lt;&=
lt;EOF</div><div><div>Package: *</div><div>Pin: release a=3Dunstable</div><=
div>Pin-Priority: -10</div></div><div>EOF</div><div>root@atik # apt update<=
/div><div><div>Hit:1 <a href=3D"http://security.debian.org">http://security=
.debian.org</a> stretch/updates InRelease</div><div>Hit:2 <a href=3D"http:/=
/ftp.us.debian.org/debian">http://ftp.us.debian.org/debian</a> stretch InRe=
lease =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0=C2=A0</div><div>Hit:3 <a href=3D"http://ftp.us.debian.org/debian=
">http://ftp.us.debian.org/debian</a> stretch-updates InRelease =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0</div><div>Ge=
t:4 <a href=3D"http://ftp.us.debian.org/debian">http://ftp.us.debian.org/de=
bian</a> sid InRelease [231 kB] =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0</div><div>Hit:5 <a href=3D"ht=
tp://deb.robustperception.io">http://deb.robustperception.io</a> precise In=
Release =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0</div><div>Get:6 <a href=3D"http://ftp.us.debian.org/debian">http://ftp.=
us.debian.org/debian</a> sid/main amd64 Packages [7,446 kB]</div><div>Get:7=
 <a href=3D"http://ftp.us.debian.org/debian">http://ftp.us.debian.org/debia=
n</a> sid/main Translation-en [5,645 kB]</div><div>Fetched 13.3 MB in 7s (1=
,739 kB/s) =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0</div><div>Reading package lists... Done</div><d=
iv>Building dependency tree =C2=A0 =C2=A0 =C2=A0=C2=A0</div><div>Reading st=
ate information... Done</div><div>All packages are up to date.</div></div><=
div>root@atik # apt upgrade</div><div><div>Reading package lists... Done</d=
iv><div>Building dependency tree =C2=A0 =C2=A0 =C2=A0=C2=A0</div><div>Readi=
ng state information... Done</div><div>Calculating upgrade... Done</div><di=
v>0 upgraded, 0 newly installed, 0 to remove and 0 not upgraded.</div></div=
><div>root@atik # apt install -d wireguard-dkms/unstable wireguard-tools/un=
stable</div><div>Reading package lists... Done</div><div>Building dependenc=
y tree =C2=A0 =C2=A0 =C2=A0=C2=A0</div><div>Reading state information... Do=
ne</div><div>Selected version &#39;0.0.20170214-1&#39; (Debian:unstable [al=
l]) for &#39;wireguard-dkms&#39;</div><div>Selected version &#39;0.0.201702=
14-1&#39; (Debian:unstable [amd64]) for &#39;wireguard-tools&#39;</div><div=
>The following additional packages will be installed:</div><div>=C2=A0 dkms=
 fakeroot gcc libfakeroot linux-headers-amd64</div><div>Suggested packages:=
</div><div>=C2=A0 python3-apport menu gcc-multilib autoconf automake libtoo=
l flex bison gdb gcc-doc</div><div>The following NEW packages will be insta=
lled:</div><div>=C2=A0 dkms fakeroot gcc libfakeroot linux-headers-amd64 wi=
reguard-dkms wireguard-tools</div><div>0 upgraded, 7 newly installed, 0 to =
remove and 59 not upgraded.</div><div>Need to get 348 kB of archives.</div>=
<div>After this operation, 1,360 kB of additional disk space will be used.<=
/div><div>Do you want to continue? [Y/n]=C2=A0</div><div>Get:1 <a href=3D"h=
ttp://ftp.us.debian.org/debian">http://ftp.us.debian.org/debian</a> stretch=
/main amd64 gcc amd64 4:6.3.0-1 [5,184 B]</div><div>Get:2 <a href=3D"http:/=
/ftp.us.debian.org/debian">http://ftp.us.debian.org/debian</a> sid/main amd=
64 dkms all 2.3-3 [74.9 kB]</div><div>Get:3 <a href=3D"http://ftp.us.debian=
.org/debian">http://ftp.us.debian.org/debian</a> stretch/main amd64 libfake=
root amd64 1.21-3.1 [45.7 kB]</div><div>Get:4 <a href=3D"http://ftp.us.debi=
an.org/debian">http://ftp.us.debian.org/debian</a> stretch/main amd64 faker=
oot amd64 1.21-3.1 [85.6 kB]</div><div>Get:5 <a href=3D"http://ftp.us.debia=
n.org/debian">http://ftp.us.debian.org/debian</a> stretch/main amd64 linux-=
headers-amd64 amd64 4.9+78 [5,744 B]</div><div>Get:6 <a href=3D"http://ftp.=
us.debian.org/debian">http://ftp.us.debian.org/debian</a> sid/main amd64 wi=
reguard-dkms all 0.0.20170214-1 [85.5 kB]</div><div>Get:7 <a href=3D"http:/=
/ftp.us.debian.org/debian">http://ftp.us.debian.org/debian</a> sid/main amd=
64 wireguard-tools amd64 0.0.20170214-1 [44.9 kB]</div><div>Fetched 348 kB =
in 0s (531 kB/s) =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0</div><div>Download compl=
ete and in download only mode</div><div><br></div><div><br></div><div>Cheer=
s,</div><div>- Dave</div><div>=C2=A0<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">
<br>
on a similar system i&#39;m using (stretch, with unstable available but<br>
pinned low), i see only packages from stretch being installed (aside<br>
from wireguard itself, clearly)<br>
<br>
0 root@test:~# cat /etc/apt/sources.list.d/<wbr>unstable.list<br>
deb <a href=3D"http://ftp.us.debian.org/debian/" rel=3D"noreferrer" target=
=3D"_blank">http://ftp.us.debian.org/<wbr>debian/</a> unstable main<br>
0 root@test:~# cat /etc/apt/preferences.d/limit-<wbr>unstable<br>
Package: *<br>
Pin: release a=3Dunstable<br>
Pin-Priority: 200<br>
1 root@test:~# apt install wireguard-dkms wireguard-tools -d<br>
Reading package lists... Done<br>
Building dependency tree<br>
Reading state information... Done<br>
The following additional packages will be installed:<br>
=C2=A0 binutils cpp cpp-6 dkms gcc gcc-6 libasan3 libatomic1 libcc1-0 libci=
lkrts5<br>
=C2=A0 libgcc-6-dev libgomp1 libisl15 libitm1 liblsan0 libmpc3 libmpfr4 lib=
mpx2<br>
=C2=A0 libquadmath0 libtsan0 libubsan0 make patch<br>
Suggested packages:<br>
=C2=A0 binutils-doc cpp-doc gcc-6-locales python3-apport menu gcc-multilib<=
br>
=C2=A0 manpages-dev autoconf automake libtool flex bison gdb gcc-doc gcc-6-=
multilib<br>
=C2=A0 gcc-6-doc libgcc1-dbg libgomp1-dbg libitm1-dbg libatomic1-dbg libasa=
n3-dbg<br>
=C2=A0 liblsan0-dbg libtsan0-dbg libubsan0-dbg libcilkrts5-dbg libmpx2-dbg<=
br>
=C2=A0 libquadmath0-dbg make-doc ed diffutils-doc<br>
Recommended packages:<br>
=C2=A0 fakeroot sudo linux-headers-686-pae | linux-headers-amd64<br>
=C2=A0 | linux-headers-generic | linux-headers lsb-release libc6-dev | libc=
-dev<br>
=C2=A0 libc6-dev<br>
The following NEW packages will be installed:<br>
=C2=A0 binutils cpp cpp-6 dkms gcc gcc-6 libasan3 libatomic1 libcc1-0 libci=
lkrts5<br>
=C2=A0 libgcc-6-dev libgomp1 libisl15 libitm1 liblsan0 libmpc3 libmpfr4 lib=
mpx2<br>
=C2=A0 libquadmath0 libtsan0 libubsan0 make patch wireguard-dkms wireguard-=
tools<br>
0 upgraded, 25 newly installed, 0 to remove and 0 not upgraded.<br>
Need to get 22.4 MB of archives.<br>
After this operation, 94.5 MB of additional disk space will be used.<br>
Do you want to continue? [Y/n]<br>
Get:1 <a href=3D"http://ftp.us.debian.org/debian" rel=3D"noreferrer" target=
=3D"_blank">http://ftp.us.debian.org/<wbr>debian</a> stretch/main amd64 lib=
mpfr4 amd64 3.1.5-1 [556 kB]<br>
Get:2 <a href=3D"http://ftp.us.debian.org/debian" rel=3D"noreferrer" target=
=3D"_blank">http://ftp.us.debian.org/<wbr>debian</a> stretch/main amd64 lib=
mpc3 amd64 1.0.3-1 [40.2 kB]<br>
Get:3 <a href=3D"http://ftp.us.debian.org/debian" rel=3D"noreferrer" target=
=3D"_blank">http://ftp.us.debian.org/<wbr>debian</a> stretch/main amd64 bin=
utils amd64 2.27.90.20170124-2 [3,761 kB]<br>
Get:4 <a href=3D"http://ftp.us.debian.org/debian" rel=3D"noreferrer" target=
=3D"_blank">http://ftp.us.debian.org/<wbr>debian</a> stretch/main amd64 lib=
isl15 amd64 0.18-1 [564 kB]<br>
Get:5 <a href=3D"http://ftp.us.debian.org/debian" rel=3D"noreferrer" target=
=3D"_blank">http://ftp.us.debian.org/<wbr>debian</a> stretch/main amd64 cpp=
-6 amd64 6.3.0-6 [6,574 kB]<br>
Get:6 <a href=3D"http://ftp.us.debian.org/debian" rel=3D"noreferrer" target=
=3D"_blank">http://ftp.us.debian.org/<wbr>debian</a> stretch/main amd64 cpp=
 amd64 4:6.3.0-1 [18.6 kB]<br>
Get:7 <a href=3D"http://ftp.us.debian.org/debian" rel=3D"noreferrer" target=
=3D"_blank">http://ftp.us.debian.org/<wbr>debian</a> stretch/main amd64 lib=
cc1-0 amd64 6.3.0-6 [30.7 kB]<br>
Get:8 <a href=3D"http://ftp.us.debian.org/debian" rel=3D"noreferrer" target=
=3D"_blank">http://ftp.us.debian.org/<wbr>debian</a> stretch/main amd64 lib=
gomp1 amd64 6.3.0-6 [73.2 kB]<br>
Get:9 <a href=3D"http://ftp.us.debian.org/debian" rel=3D"noreferrer" target=
=3D"_blank">http://ftp.us.debian.org/<wbr>debian</a> stretch/main amd64 lib=
itm1 amd64 6.3.0-6 [27.3 kB]<br>
Get:10 <a href=3D"http://ftp.us.debian.org/debian" rel=3D"noreferrer" targe=
t=3D"_blank">http://ftp.us.debian.org/<wbr>debian</a> stretch/main amd64 li=
batomic1 amd64 6.3.0-6 [8,904 B]<br>
Get:11 <a href=3D"http://ftp.us.debian.org/debian" rel=3D"noreferrer" targe=
t=3D"_blank">http://ftp.us.debian.org/<wbr>debian</a> stretch/main amd64 li=
basan3 amd64 6.3.0-6 [311 kB]<br>
Get:12 <a href=3D"http://ftp.us.debian.org/debian" rel=3D"noreferrer" targe=
t=3D"_blank">http://ftp.us.debian.org/<wbr>debian</a> stretch/main amd64 li=
blsan0 amd64 6.3.0-6 [115 kB]<br>
Get:13 <a href=3D"http://ftp.us.debian.org/debian" rel=3D"noreferrer" targe=
t=3D"_blank">http://ftp.us.debian.org/<wbr>debian</a> stretch/main amd64 li=
btsan0 amd64 6.3.0-6 [256 kB]<br>
Get:14 <a href=3D"http://ftp.us.debian.org/debian" rel=3D"noreferrer" targe=
t=3D"_blank">http://ftp.us.debian.org/<wbr>debian</a> stretch/main amd64 li=
bubsan0 amd64 6.3.0-6 [107 kB]<br>
Get:15 <a href=3D"http://ftp.us.debian.org/debian" rel=3D"noreferrer" targe=
t=3D"_blank">http://ftp.us.debian.org/<wbr>debian</a> stretch/main amd64 li=
bcilkrts5 amd64 6.3.0-6 [40.6 kB]<br>
Get:16 <a href=3D"http://ftp.us.debian.org/debian" rel=3D"noreferrer" targe=
t=3D"_blank">http://ftp.us.debian.org/<wbr>debian</a> stretch/main amd64 li=
bmpx2 amd64 6.3.0-6 [11.2 kB]<br>
Get:17 <a href=3D"http://ftp.us.debian.org/debian" rel=3D"noreferrer" targe=
t=3D"_blank">http://ftp.us.debian.org/<wbr>debian</a> stretch/main amd64 li=
bquadmath0 amd64 6.3.0-6 [131 kB]<br>
Get:18 <a href=3D"http://ftp.us.debian.org/debian" rel=3D"noreferrer" targe=
t=3D"_blank">http://ftp.us.debian.org/<wbr>debian</a> stretch/main amd64 li=
bgcc-6-dev amd64 6.3.0-6 [2,296 kB]<br>
Get:19 <a href=3D"http://ftp.us.debian.org/debian" rel=3D"noreferrer" targe=
t=3D"_blank">http://ftp.us.debian.org/<wbr>debian</a> stretch/main amd64 gc=
c-6 amd64 6.3.0-6 [6,852 kB]<br>
Get:20 <a href=3D"http://ftp.us.debian.org/debian" rel=3D"noreferrer" targe=
t=3D"_blank">http://ftp.us.debian.org/<wbr>debian</a> stretch/main amd64 gc=
c amd64 4:6.3.0-1 [5,184 B]<br>
Get:21 <a href=3D"http://ftp.us.debian.org/debian" rel=3D"noreferrer" targe=
t=3D"_blank">http://ftp.us.debian.org/<wbr>debian</a> stretch/main amd64 ma=
ke amd64 4.1-9 [299 kB]<br>
Get:22 <a href=3D"http://ftp.us.debian.org/debian" rel=3D"noreferrer" targe=
t=3D"_blank">http://ftp.us.debian.org/<wbr>debian</a> stretch/main amd64 pa=
tch amd64 2.7.5-1 [109 kB]<br>
Get:23 <a href=3D"http://ftp.us.debian.org/debian" rel=3D"noreferrer" targe=
t=3D"_blank">http://ftp.us.debian.org/<wbr>debian</a> stretch/main amd64 dk=
ms all 2.3-2 [74.8 kB]<br>
Get:24 <a href=3D"http://ftp.us.debian.org/debian" rel=3D"noreferrer" targe=
t=3D"_blank">http://ftp.us.debian.org/<wbr>debian</a> unstable/main amd64 w=
ireguard-dkms all 0.0.20170213-1 [90.2 kB]<br>
Get:25 <a href=3D"http://ftp.us.debian.org/debian" rel=3D"noreferrer" targe=
t=3D"_blank">http://ftp.us.debian.org/<wbr>debian</a> unstable/main amd64 w=
ireguard-tools amd64 0.0.20170213-1 [44.9 kB]<br>
Fetched 22.4 MB in 2s (9,247 kB/s)<br>
Download complete and in download only mode<br>
0 root@test:~#<br>
<br>
Please let me know what you&#39;re seeing that&#39;s different.<br>
<br>
Regards,<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0--dkg<br>
</blockquote></div><br></div></div>

--94eb2c05b050f906e60548b14f9d--
