Return-Path: barhom@netsat.se
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 690d300d
 for <wireguard@lists.zx2c4.com>;
 Tue, 21 Feb 2017 00:52:57 +0000 (UTC)
Received: from mail-qt0-f177.google.com (mail-qt0-f177.google.com
 [209.85.216.177])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f0beaf05
 for <wireguard@lists.zx2c4.com>;
 Tue, 21 Feb 2017 00:52:57 +0000 (UTC)
Received: by mail-qt0-f177.google.com with SMTP id k15so99978823qtg.3
 for <wireguard@lists.zx2c4.com>; Mon, 20 Feb 2017 16:53:42 -0800 (PST)
MIME-Version: 1.0
References: <CAMx+r7WsvfJ6j7JT9+Z5mNe=FEFwehTVNgX+7-8vnQMa5FxORg@mail.gmail.com>
 <874lzzqai9.fsf@alice.fifthhorseman.net>
 <CAMx+r7XsHgrxy+1T4ndqzSebA6Ds4XTjQrD9VmoCWAtJkLygHw@mail.gmail.com>
 <87o9y4n555.fsf@alice.fifthhorseman.net>
 <CAMx+r7X9ZLqqRf8YC8juk0+V1Y3SR6GzPDK7dLqBF0nfEWqg2w@mail.gmail.com>
 <87efywha2u.fsf@alice.fifthhorseman.net>
 <CAMx+r7Wq8z8pvEacHw07TM26jktuha08ZvThP2JBx=WUBtviKg@mail.gmail.com>
In-Reply-To: <CAMx+r7Wq8z8pvEacHw07TM26jktuha08ZvThP2JBx=WUBtviKg@mail.gmail.com>
From: Ibrahim Tachijian <barhom@netsat.se>
Date: Tue, 21 Feb 2017 00:53:31 +0000
Message-ID: <CACTq0bQ1onTE+jb4bwjstoTiXReEHEYb=vXqe=+rQC4pSL7qkA@mail.gmail.com>
Subject: Re: (Unofficial) wireguard packages for Debian Stretch (testing)
To: David Anderson <dave@natulte.net>,
 Daniel Kahn Gillmor <dkg@fifthhorseman.net>
Content-Type: multipart/alternative; boundary=001a1140f04cb9862c0548ffcfc8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--001a1140f04cb9862c0548ffcfc8
Content-Type: text/plain; charset=UTF-8

I for one would love to be able to try WireGuard on Debian Jessie on 3.16
kernel.

The reason being is I do not see myself upgrading and/or running a
backported linux kernel for the foreseeable future.

Are there any limitations in 3.16 kernel when it comes to Wireguard
capabilities ?

Thanks,


On Tue, Feb 21, 2017 at 12:53 AM David Anderson <dave@natulte.net> wrote:

On Fri, Feb 17, 2017 at 11:49 AM, Daniel Kahn Gillmor <dkg@fifthhorseman.net
> wrote:

On Thu 2017-02-16 22:14:11 -0500, David Anderson wrote:
> The transcript below still shows one additional package being pulled from
> sid/main, the dkms package. I find this strange: wireguard-dkms depends on
> dkms >=2.1.0.0, stretch has dkms 2.3-2, and sid has dkms 2.3-3. Despite
the
> negative priority for unstable, apt picks 2.3-3 from sid, even though the
> dependency could be satisfied out of stretch. What am I missing?

That is indeed weird.  what does "apt-cache policy dkms" show you?


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
get?


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




        --dkg


_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--001a1140f04cb9862c0548ffcfc8
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr" class=3D"gmail_msg">I for one would love =
to be able to try WireGuard on Debian Jessie on 3.16 kernel.<div class=3D"g=
mail_msg"><br class=3D"gmail_msg"></div><div class=3D"gmail_msg">The reason=
 being is I do not see myself upgrading and/or running a backported linux k=
ernel for the foreseeable future.</div><div class=3D"gmail_msg"><br></div><=
div class=3D"gmail_msg">Are there any limitations in 3.16 kernel when it co=
mes to Wireguard capabilities ?</div><div class=3D"gmail_msg"><br></div><di=
v class=3D"gmail_msg">Thanks,</div><div class=3D"gmail_msg">=C2=A0<br></div=
></div><br class=3D"gmail_msg"><div class=3D"gmail_quote gmail_msg"><div di=
r=3D"ltr" class=3D"gmail_msg">On Tue, Feb 21, 2017 at 12:53 AM David Anders=
on &lt;<a href=3D"mailto:dave@natulte.net" class=3D"gmail_msg" target=3D"_b=
lank">dave@natulte.net</a>&gt; wrote:<br class=3D"gmail_msg"></div><blockqu=
ote class=3D"gmail_quote gmail_msg" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex"><div dir=3D"ltr" class=3D"gmail_msg"><div =
class=3D"gmail_extra gmail_msg"><div class=3D"gmail_quote gmail_msg">On Fri=
, Feb 17, 2017 at 11:49 AM, Daniel Kahn Gillmor <span dir=3D"ltr" class=3D"=
gmail_msg">&lt;<a href=3D"mailto:dkg@fifthhorseman.net" class=3D"gmail_msg"=
 target=3D"_blank">dkg@fifthhorseman.net</a>&gt;</span> wrote:<br class=3D"=
gmail_msg"><blockquote class=3D"gmail_quote gmail_msg" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><spa=
n class=3D"m_-6198650694073987848m_-8255239338075419741gmail- gmail_msg">On=
 Thu 2017-02-16 22:14:11 -0500, David Anderson wrote:<br class=3D"gmail_msg=
">
&gt; The transcript below still shows one additional package being pulled f=
rom<br class=3D"gmail_msg">
&gt; sid/main, the dkms package. I find this strange: wireguard-dkms depend=
s on<br class=3D"gmail_msg">
&gt; dkms &gt;=3D2.1.0.0, stretch has dkms 2.3-2, and sid has dkms 2.3-3. D=
espite the<br class=3D"gmail_msg">
&gt; negative priority for unstable, apt picks 2.3-3 from sid, even though =
the<br class=3D"gmail_msg">
&gt; dependency could be satisfied out of stretch. What am I missing?<br cl=
ass=3D"gmail_msg">
<br class=3D"gmail_msg">
</span>That is indeed weird.=C2=A0 what does &quot;apt-cache policy dkms&qu=
ot; show you?<br class=3D"gmail_msg"></blockquote><div class=3D"gmail_msg">=
<br class=3D"gmail_msg"></div></div></div></div><div dir=3D"ltr" class=3D"g=
mail_msg"><div class=3D"gmail_extra gmail_msg"><div class=3D"gmail_quote gm=
ail_msg"><div class=3D"gmail_msg"><div class=3D"gmail_msg"># apt-cache poli=
cy dkms</div><div class=3D"gmail_msg">dkms:</div><div class=3D"gmail_msg">=
=C2=A0 Installed: (none)</div><div class=3D"gmail_msg">=C2=A0 Candidate: 2.=
3-2</div><div class=3D"gmail_msg">=C2=A0 Version table:</div><div class=3D"=
gmail_msg">=C2=A0 =C2=A0 =C2=A02.3-3 -1</div><div class=3D"gmail_msg">=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 -10 <a href=3D"http://ftp.us.debian.org/debian" cl=
ass=3D"gmail_msg" target=3D"_blank">http://ftp.us.debian.org/debian</a> sid=
/main amd64 Packages</div><div class=3D"gmail_msg">=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 100 /var/lib/dpkg/status</div><div class=3D"gmail_msg">=C2=A0 =C2=A0 =
=C2=A02.3-2 500</div><div class=3D"gmail_msg">=C2=A0 =C2=A0 =C2=A0 =C2=A0 5=
00 <a href=3D"http://ftp.us.debian.org/debian" class=3D"gmail_msg" target=
=3D"_blank">http://ftp.us.debian.org/debian</a> stretch/main amd64 Packages=
</div></div></div></div></div><div dir=3D"ltr" class=3D"gmail_msg"><div cla=
ss=3D"gmail_extra gmail_msg"><div class=3D"gmail_quote gmail_msg"><div clas=
s=3D"gmail_msg"><br class=3D"gmail_msg"></div><div class=3D"gmail_msg"><br =
class=3D"gmail_msg"></div><blockquote class=3D"gmail_quote gmail_msg" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">what if you &quot;apt install dkms&quot; on its own first, which=
 version do you<br class=3D"gmail_msg">
get?<br class=3D"gmail_msg"></blockquote><div class=3D"gmail_msg"><br class=
=3D"gmail_msg"></div></div></div></div><div dir=3D"ltr" class=3D"gmail_msg"=
><div class=3D"gmail_extra gmail_msg"><div class=3D"gmail_quote gmail_msg">=
<div class=3D"gmail_msg"><div class=3D"gmail_msg"># apt install -d dkms</di=
v></div></div></div></div><div dir=3D"ltr" class=3D"gmail_msg"><div class=
=3D"gmail_extra gmail_msg"><div class=3D"gmail_quote gmail_msg"><div class=
=3D"gmail_msg"><div class=3D"gmail_msg">Reading package lists... Done</div>=
<div class=3D"gmail_msg">Building dependency tree =C2=A0 =C2=A0 =C2=A0=C2=
=A0</div><div class=3D"gmail_msg">Reading state information... Done</div><d=
iv class=3D"gmail_msg">The following additional packages will be installed:=
</div><div class=3D"gmail_msg">=C2=A0 fakeroot gcc libfakeroot linux-header=
s-amd64</div><div class=3D"gmail_msg">Suggested packages:</div><div class=
=3D"gmail_msg">=C2=A0 python3-apport menu gcc-multilib autoconf automake li=
btool flex bison gdb gcc-doc</div><div class=3D"gmail_msg">The following NE=
W packages will be installed:</div><div class=3D"gmail_msg">=C2=A0 dkms fak=
eroot gcc libfakeroot linux-headers-amd64</div></div></div></div></div><div=
 dir=3D"ltr" class=3D"gmail_msg"><div class=3D"gmail_extra gmail_msg"><div =
class=3D"gmail_quote gmail_msg"><div class=3D"gmail_msg"><div class=3D"gmai=
l_msg">0 upgraded, 5 newly installed, 0 to remove and 0 not upgraded.</div>=
<div class=3D"gmail_msg">Need to get 217 kB of archives.</div><div class=3D=
"gmail_msg">After this operation, 717 kB of additional disk space will be u=
sed.</div></div></div></div></div><div dir=3D"ltr" class=3D"gmail_msg"><div=
 class=3D"gmail_extra gmail_msg"><div class=3D"gmail_quote gmail_msg"><div =
class=3D"gmail_msg"><div class=3D"gmail_msg">Do you want to continue? [Y/n]=
=C2=A0</div><div class=3D"gmail_msg">Get:1 <a href=3D"http://ftp.us.debian.=
org/debian" class=3D"gmail_msg" target=3D"_blank">http://ftp.us.debian.org/=
debian</a> stretch/main amd64 gcc amd64 4:6.3.0-1 [5,184 B]</div></div></di=
v></div></div><div dir=3D"ltr" class=3D"gmail_msg"><div class=3D"gmail_extr=
a gmail_msg"><div class=3D"gmail_quote gmail_msg"><div class=3D"gmail_msg">=
<div class=3D"gmail_msg">Get:2 <a href=3D"http://ftp.us.debian.org/debian" =
class=3D"gmail_msg" target=3D"_blank">http://ftp.us.debian.org/debian</a> s=
tretch/main amd64 dkms all 2.3-2 [74.8 kB]</div></div></div></div></div><di=
v dir=3D"ltr" class=3D"gmail_msg"><div class=3D"gmail_extra gmail_msg"><div=
 class=3D"gmail_quote gmail_msg"><div class=3D"gmail_msg"><div class=3D"gma=
il_msg">Get:3 <a href=3D"http://ftp.us.debian.org/debian" class=3D"gmail_ms=
g" target=3D"_blank">http://ftp.us.debian.org/debian</a> stretch/main amd64=
 libfakeroot amd64 1.21-3.1 [45.7 kB]</div><div class=3D"gmail_msg">Get:4 <=
a href=3D"http://ftp.us.debian.org/debian" class=3D"gmail_msg" target=3D"_b=
lank">http://ftp.us.debian.org/debian</a> stretch/main amd64 fakeroot amd64=
 1.21-3.1 [85.6 kB]</div><div class=3D"gmail_msg">Get:5 <a href=3D"http://f=
tp.us.debian.org/debian" class=3D"gmail_msg" target=3D"_blank">http://ftp.u=
s.debian.org/debian</a> stretch/main amd64 linux-headers-amd64 amd64 4.9+78=
 [5,744 B]</div></div></div></div></div><div dir=3D"ltr" class=3D"gmail_msg=
"><div class=3D"gmail_extra gmail_msg"><div class=3D"gmail_quote gmail_msg"=
><div class=3D"gmail_msg"><div class=3D"gmail_msg">Fetched 217 kB in 0s (32=
8 kB/s) =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0</div></div></div></div></=
div><div dir=3D"ltr" class=3D"gmail_msg"><div class=3D"gmail_extra gmail_ms=
g"><div class=3D"gmail_quote gmail_msg"><div class=3D"gmail_msg"><div class=
=3D"gmail_msg">Download complete and in download only mode</div></div></div=
></div></div><div dir=3D"ltr" class=3D"gmail_msg"><div class=3D"gmail_extra=
 gmail_msg"><div class=3D"gmail_quote gmail_msg"><div class=3D"gmail_msg"><=
/div><div class=3D"gmail_msg"><br class=3D"gmail_msg"></div><div class=3D"g=
mail_msg">Looks like installing just dkms correctly selects from Stretch, w=
hereas installing as a dependency of wireguard-dkms pulls in the sid versio=
n.</div><div class=3D"gmail_msg"><br class=3D"gmail_msg"></div><div class=
=3D"gmail_msg">- Dave</div><div class=3D"gmail_msg"><br class=3D"gmail_msg"=
></div><div class=3D"gmail_msg">=C2=A0</div><blockquote class=3D"gmail_quot=
e gmail_msg" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">
<span class=3D"m_-6198650694073987848m_-8255239338075419741gmail-HOEnZb gma=
il_msg"><font color=3D"#888888" class=3D"gmail_msg"><br class=3D"gmail_msg"=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 --dkg<br class=3D"gmail_msg">
</font></span></blockquote></div><br class=3D"gmail_msg"></div></div>
_______________________________________________<br class=3D"gmail_msg">
WireGuard mailing list<br class=3D"gmail_msg">
<a href=3D"mailto:WireGuard@lists.zx2c4.com" class=3D"gmail_msg" target=3D"=
_blank">WireGuard@lists.zx2c4.com</a><br class=3D"gmail_msg">
<a href=3D"https://lists.zx2c4.com/mailman/listinfo/wireguard" rel=3D"noref=
errer" class=3D"gmail_msg" target=3D"_blank">https://lists.zx2c4.com/mailma=
n/listinfo/wireguard</a><br class=3D"gmail_msg">
</blockquote></div></div>

--001a1140f04cb9862c0548ffcfc8--
