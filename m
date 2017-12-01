Return-Path: johnstonljordan@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2ca8c158
 for <wireguard@lists.zx2c4.com>; Fri, 1 Dec 2017 17:24:27 +0000 (UTC)
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d4e6b9bc
 for <wireguard@lists.zx2c4.com>; Fri, 1 Dec 2017 17:24:27 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id v19so4639133wmh.5
 for <wireguard@lists.zx2c4.com>; Fri, 01 Dec 2017 09:30:44 -0800 (PST)
MIME-Version: 1.0
From: Jordan Johnston <johnstonljordan@gmail.com>
Date: Fri, 1 Dec 2017 12:30:43 -0500
Message-ID: <CAKgnZ5wDEwMXA6+WbxrmQocBgPPeHCH-WBdn5kHezzsLPGDdtQ@mail.gmail.com>
Subject: WireGuard (Android) Configuration issues, etc.
To: wireguard@lists.zx2c4.com
Content-Type: multipart/alternative; boundary="089e0820ea0c7025d4055f4abae4"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--089e0820ea0c7025d4055f4abae4
Content-Type: text/plain; charset="UTF-8"

Hey Jason (and everyone else).

@Jason; we chatted on XDA yesterday, a few PMs back and forth (I'm
nine7nine on XDA).

So just as a recap; My progress with integrating WireGuard with my Kernel
and on the Stock Oreo 8.0 rom (Google Pixel 1);

Kernel support - working.
building the standalone wg-tools - working
wg-tools installation - working

Now, my issue seems to be with actually getting the WireGuard app working
with AzireVPN.... But in the process, I've figured out that wq-quick is NOT
working properly ~ which aside from the possibility that my configuration
for AzireVPM may be incorrect ~ The wg-quick issue is probably why the
android WireGuard app isn't working (as I assume it requires wg-quick)...
My pixel doesn't seem to recognise the wg-quick script being in
/system/xbin (even though it's there);

# wg-quick up wg0
sh: /system/xbin/wg-quick: No such file or directory

the script has;

#!/system/xbin/bash

changing it to not include bash, does allow it to be executed, but then I
get;

sh: /system/xbin/wg-quick: Permission denied

I'm not sure what's up here (but it doesn't matter if I'm root user or not,
same permission problem, I've checked permissions, it's executable, etc)...
***NOTE: If I manually use wg for setup ~ I can get the interface up and
working, following the quick start instructions and running wg for
verification (ref: https://www.wireguard.com/quickstart/) ... So i think
WireGuard is actually working. (kernel support and wg).... That said ~ I'm
going to have a stab at repackaging the user-space components as a standard
android flashable zip (as we talked about on XDA, @Jason), start fresh and
see if I can get it working...

All of that aside; I'm wondering if someone could post a working
config/template for AzireVPN or any other free VPN that supports
WireGuard??? (minus any private information, respectfully). I'd just like
to make sure that I have a working config for WireGuard on Android -> so
that when I try to test, after re-installing wg-tools ~ that might be one
less hiccup... I've never used WireGuard, so all very new to me.

Thanks

Jordan

PS: @Jason - I'm also going to have a look (later on) and see If i can get
the WireGuard android app to not "crash on boot" in Oreo ~ using the
commits for Kernel Aduitor's fixes that I pointed out to you yesterday,
when I brought up the issue. ttyl

--089e0820ea0c7025d4055f4abae4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hey Jason (and everyone else).</div><div><br></div><d=
iv>@Jason; we chatted on XDA yesterday, a few PMs back and forth (I&#39;m n=
ine7nine on XDA).</div><div><br></div><div>So just as a recap; My progress =
with integrating WireGuard with my Kernel and on the Stock Oreo 8.0 rom (Go=
ogle Pixel 1);</div><div><br></div><div>Kernel support - working.</div><div=
>building the standalone wg-tools - working</div><div>wg-tools installation=
 - working<br></div><div><br></div><div>Now, my issue seems to be with actu=
ally getting the WireGuard app working with AzireVPN.... But in the process=
, I&#39;ve figured out that wq-quick is NOT working properly ~ which aside =
from the possibility that my configuration for AzireVPM may be incorrect ~ =
The wg-quick issue is probably why the android WireGuard app isn&#39;t work=
ing (as I assume it requires wg-quick)... My pixel doesn&#39;t seem to reco=
gnise the wg-quick script being in /system/xbin (even though it&#39;s there=
);</div><div><br></div><div># wg-quick up wg0<br>sh: /system/xbin/wg-quick:=
 No such file or directory</div><div><br></div><div>the script has;</div><d=
iv><br></div><div>#!/system/xbin/bash</div><div><br></div><div>changing it =
to not include bash, does allow it to be executed, but then I get;</div><di=
v><br></div><div>sh: /system/xbin/wg-quick: Permission denied</div><div><br=
></div><div>I&#39;m not sure what&#39;s up here (but it doesn&#39;t matter =
if I&#39;m root user or not, same permission problem, I&#39;ve checked perm=
issions, it&#39;s executable, etc)... ***NOTE: If I manually use wg for set=
up ~ I can get the interface up and working, following the quick start inst=
ructions and running wg for verification (ref: <a href=3D"https://www.wireg=
uard.com/quickstart/">https://www.wireguard.com/quickstart/</a>) ... So i t=
hink WireGuard is actually working. (kernel support and wg).... That said ~=
 I&#39;m going to have a stab at repackaging the user-space components as a=
 standard android flashable zip (as we talked about on XDA, @Jason), start =
fresh and see if I can get it working...</div><div></div><br><div>All of th=
at aside; I&#39;m wondering if someone could post a working config/template=
 for AzireVPN or any other free VPN that supports WireGuard??? (minus any p=
rivate information, respectfully). I&#39;d just like to make sure that I ha=
ve a working config for WireGuard on Android -&gt; so that when I try to te=
st, after re-installing wg-tools ~ that might be one less hiccup... I&#39;v=
e never used WireGuard, so all very new to me.</div><div><br></div><div>Tha=
nks</div><div><br></div><div>Jordan<br></div><div><br></div><div>PS: @Jason=
 - I&#39;m also going to have a look (later on) and see If i can get the Wi=
reGuard android app to not &quot;crash on boot&quot; in Oreo ~ using the co=
mmits for Kernel Aduitor&#39;s fixes that I pointed out to you yesterday, w=
hen I brought up the issue. ttyl<br></div><div><br></div><div><br></div></d=
iv>

--089e0820ea0c7025d4055f4abae4--
