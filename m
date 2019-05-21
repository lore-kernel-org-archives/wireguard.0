Return-Path: <SRS0=gQ6O=UF=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8EABC04AB5
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  6 Jun 2019 09:34:05 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6D05D20868
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  6 Jun 2019 09:34:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IVvK4Z/S"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6D05D20868
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 73fa1b69;
	Thu, 6 Jun 2019 09:33:23 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8d20d35b
 for <wireguard@lists.zx2c4.com>;
 Tue, 21 May 2019 15:59:24 +0000 (UTC)
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9996cfba
 for <wireguard@lists.zx2c4.com>;
 Tue, 21 May 2019 15:59:24 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id j187so3448778wmj.1
 for <wireguard@lists.zx2c4.com>; Tue, 21 May 2019 08:59:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=loBY+65DQxndglm8gyxH6rWA3EqL+TkoC6jWtkoNP/o=;
 b=IVvK4Z/SUC2a/FMrHfdh5jTed+j86SD738ir6J55Ka1yDyfFbLibKbveOwTXtKKQ4X
 KaCEnsfleQJvY/s2BIhYTn/LoeikRRcXAMssYkc5PV7TZn6eKOz1xRuLCIm3SzniARsp
 oTPtT7ymsWMQbmwpJ8MAPYrgIDuJ5pkCNOlThlu7bv0ZjCbn+Pj2Hfzw89/aCeDjz0PU
 /EB/4+NKNScp/2lY1xU4j9yFUxS8cZ54BHKJI2Yy8IQBKApWlv1OevEUrD2CCxoMPRjD
 QkNHYpjLyeGC3WZbNtD7FZHKZqj0KpGJMkq0WEnI6J70NT0NWQM/IBekHao8p8rZzqjk
 adRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=loBY+65DQxndglm8gyxH6rWA3EqL+TkoC6jWtkoNP/o=;
 b=mZ9fX96X+/IEdZbEm6Sbu7Kv8lRODOMqb2oJewZa7ITHaPjbA76Nfn0ofMMneelZjm
 aSivGqHSWSxDaZDwjrRX6eEJQlPthwcMORZUY615aWR/yVCygDlO0BasxOJexLAa1RV7
 IshB5uFLf/OkRv5vgWTQQP4tWribMbQI1yKZQqyZF7U7SvIbaIebChA+YYbbfKGlFeSJ
 zHz2F0u4+Ddr6S2A+AF5wupiBuWkFsn2mScrk3UcZbcuwAIr/jqB85BeWO1WPQ2Y2HqC
 75xs4bKh8CuROhNypJr5xqM9xF0dVg2HnlWjm/xQq5h+FMWokqF2PafWIvBeaEStBZf2
 TRLw==
X-Gm-Message-State: APjAAAWHDhBG4ry/VCIdB/uRQDfu2VpwWkYtNYej0qaYqM/S3Fp/6by3
 X0ueGyGzm0qoJvb9SDJTtxPQ50PGk9F4xiPayUwidW1A
X-Google-Smtp-Source: APXvYqwyC8AROhfywkvcjX+AZ2gKUnCMel0CBipUgSSymdocQmCGoKKiJcsc5+qMlsuf+nNxyx+und+7dZ8ubnKwrtk=
X-Received: by 2002:a05:600c:10ca:: with SMTP id
 l10mr4195270wmd.23.1558454363118; 
 Tue, 21 May 2019 08:59:23 -0700 (PDT)
MIME-Version: 1.0
References: <CAEx8eyTU2-auBDfyy+-1_-byUYheoxFKLaXsN9t+_CTXrGBzsQ@mail.gmail.com>
In-Reply-To: <CAEx8eyTU2-auBDfyy+-1_-byUYheoxFKLaXsN9t+_CTXrGBzsQ@mail.gmail.com>
From: "Christopher O'Connell" <jwriteclub@gmail.com>
Date: Tue, 21 May 2019 18:59:07 +0300
Message-ID: <CAEx8eySO6DE-VeLsn3BYz=Kj-_kfU_WHqSmOTTpG367j51qCdg@mail.gmail.com>
Subject: Re: Minimal WinTUN Program Access Denied Opening Tun
To: wireguard@lists.zx2c4.com
X-Mailman-Approved-At: Thu, 06 Jun 2019 11:33:21 +0200
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============8202047976691300542=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============8202047976691300542==
Content-Type: multipart/alternative; boundary="000000000000b6613e058967eef6"

--000000000000b6613e058967eef6
Content-Type: text/plain; charset="UTF-8"

So I must have messed up my service installer and wasn't really running as
the LocalSystem, because with some tweaking it does open now. I further
confirmed this using the PSExec64 utility and calling the basic code to run
as the system user and it runs correctly.

So it seems that the WinTUN device does restrict itself to being opened as
the system user. It might be good to add such a note to the documentation
for WinTUN (I'm happy to make an edit and push a patch if others would like
that).

I'm also interested in the rationale for requiring the system user to open
the device?

All the best,

~ Christopher

On Tue, May 21, 2019 at 6:17 PM Christopher O'Connell <jwriteclub@gmail.com>
wrote:

> Hello,
>
> I've been very intrigued by WinTUN, and the option of a small, simple TUN
> driver, especially one with good golang bindings offers a lot of
> opportunity to build interesting things on Windows.
>
> I've been building a minimal program based on the go libraries, my goal
> being to just write a simple ICMP endpoint to be able to ping, as a way to
> learn the WinTUN code and libraries. Unfortunately, I've run into an issue
> that I'm unable to actually read from the tun device, my code always
> getting errors like open \\.\Global\WINTUN32768: Access is denied.
>
> In a nutshell, my code does the following (error checking and some other
> ancillary code is omitted, please see this gist
> <https://gist.github.com/jwriteclub/4f0fa081cb4eb39620702d7f7e212afd> for
> the complete code):
>
> func main() {
>     // These two functions are taken from wireguard windows, added just to
> make sure that
>     // this code is running from the same privilege level as the WireGuard
> windows code
>     checkForAdminGroup()
>     checkForWow64()
>     // Create a tun. This works, with the small patch to tun_windows.go
> which I submitted earlier
>     t, err := tun.CreateTun("My Test Tun")
>     nt := t.(*tun.NativeTun)
>     // Get the interface and set IPs, etc
>     iface, err := winipccfg.InterfaceFromLUID(nt.LUID())
>     iface.SetAddresses("172.16.16.1/24")// Omitting all the mangly code
> to create an IPNet
>     // Listen for Reads
>     wg := &sync.WaitGroup{}
>     wg.Add(1)
>     go func() {
>         defer wg.Done()
>         for {
>             bt := make([]byte, 15000) // Lots of packets
>             read, err := nt.Read(bt, 0) // Offset of 0 for now, just
> trying to read
>             if err != nil {
>                 fmt.Printf("%#v\n", err)
>                 return
>             }
>             fmt.Printf("Read %d bytes\n", read)
>         }
>     }()
>     wg.Wait()
> }
>
> I've tried this using two different versions of the WinTUN driver, one
> where I just created a simple installer using the v0.1 MSM file on
> WinTun.net, and the other by installing WireGuard v0.0.8 from the main
> website. In both cases, CreateTun and interface calls work, and I'm able
> to see the network adapter added to Windows. However, in both cases, the
> call to Read fails. Ultimately, after drilling down, the failing call is
> in tun_windows.go in func (tun *NativeTun) openTUN, and the offending
> line is tun.tunFileRead, err = os.OpenFile(name, os.O_RDONLY, 0).
>
> To test out my code, and see if I am missing some key component, I
> compiled and ran golang.zx2c4.com/wireguard/main_windows.go, which
> exhibits the exact same behavior as my program, ending with an error like ERROR:
> (MyTunTest) 2019/05/21 18:14:17 Failed to read packet from TUN device: open
> \\.\Global\WINTUN32769: Access is denied.
>
> At this point I was convinced that it might be some factor about my system
> which was preventing this from working, but much to my surprise when I
> downloaded and ran the current v0.0.8 release version of the WireGuard
> client, it worked just fine, and I was able to connect to and route traffic
> through a WireGuard server.
>
> I then considered that there was something special about opening the tun
> device from a service specifically, as opposed to an elevated user space
> process (although I cannot figure out a reason why this should be so). I
> whipped up a very quick windows service in C# to only tries to open the
> already created WinTUN device (literally, just var tunRead =
> File.Open(TUN_NAME, FileMode.Open, FileAccess.Read);, plus all the usual
> service boiler plate). I installed this service with the LocalSystem
> permission and when starting, it similarly gets an access denied error.
>
> Clearly, the WireGuard windows client is executing some command which puts
> the tun into an ready to open state or changes the privileges in some key
> way, but I have been unable to find this key command or function. Any help
> on a minimum viable program to successfully call Read on a WinTUN object is
> most appreciated.
>
> All the best,
>
> ~ Christopher
>

--000000000000b6613e058967eef6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>So I must have messed up my service installer and was=
n&#39;t really running as the LocalSystem, because with some tweaking it do=
es open now. I further confirmed this using the PSExec64 utility and callin=
g the basic code to run as the system user and it runs correctly.</div><div=
><br></div><div>So it seems that the WinTUN device does restrict itself to =
being opened as the system user. It might be good to add such a note to the=
 documentation for WinTUN (I&#39;m happy to make an edit and push a patch i=
f others would like that).</div><div><br></div><div>I&#39;m also interested=
 in the rationale for requiring the system user to open the device?</div><d=
iv><br></div><div>All the best,</div><div><br></div><div>~ Christopher<br><=
/div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_a=
ttr">On Tue, May 21, 2019 at 6:17 PM Christopher O&#39;Connell &lt;<a href=
=3D"mailto:jwriteclub@gmail.com">jwriteclub@gmail.com</a>&gt; wrote:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div>=
Hello,</div><div><br></div><div>I&#39;ve been very intrigued by WinTUN, and=
 the option of a small, simple TUN driver, especially one with good golang =
bindings offers a lot of opportunity to build interesting things on Windows=
.</div><div><br></div><div>I&#39;ve been building a minimal program based o=
n the go libraries, my goal being to just write a simple ICMP endpoint to b=
e able to ping, as a way to learn the WinTUN code and libraries. Unfortunat=
ely, I&#39;ve run into an issue that I&#39;m unable to actually read from t=
he tun device, my code always getting errors like <span style=3D"font-famil=
y:courier new,monospace">open \\.\Global\WINTUN32768: Access is denied</spa=
n>.</div><div><br></div><div>In a nutshell, my code does the following (err=
or checking and some other ancillary code is omitted, please see <a href=3D=
"https://gist.github.com/jwriteclub/4f0fa081cb4eb39620702d7f7e212afd" targe=
t=3D"_blank">this gist</a> for the complete code):</div><div><br></div><div=
><span style=3D"font-family:courier new,monospace">func main() {</span></di=
v><div><span style=3D"font-family:courier new,monospace">=C2=A0=C2=A0=C2=A0=
 // These two functions are taken from wireguard windows, added just to mak=
e sure that</span></div><div><span style=3D"font-family:courier new,monospa=
ce">=C2=A0=C2=A0=C2=A0 // this code is running from the same privilege leve=
l as the WireGuard windows code<br></span></div><div><span style=3D"font-fa=
mily:courier new,monospace">=C2=A0=C2=A0=C2=A0 checkForAdminGroup()</span><=
/div><div><span style=3D"font-family:courier new,monospace">=C2=A0=C2=A0=C2=
=A0 checkForWow64()</span></div><div><span style=3D"font-family:courier new=
,monospace">=C2=A0=C2=A0=C2=A0 // Create a tun. This works, with the small =
patch to tun_windows.go which I submitted earlier<br></span></div><div><spa=
n style=3D"font-family:courier new,monospace">=C2=A0=C2=A0=C2=A0 t, err :=
=3D tun.CreateTun(&quot;My Test Tun&quot;)</span></div><div><span style=3D"=
font-family:courier new,monospace">=C2=A0=C2=A0=C2=A0 nt :=3D t.(*tun.Nativ=
eTun)<br></span></div><div><span style=3D"font-family:courier new,monospace=
">=C2=A0=C2=A0=C2=A0 // Get the interface and set IPs, etc<br></span></div>=
<div><span style=3D"font-family:courier new,monospace">=C2=A0=C2=A0=C2=A0 i=
face, err :=3D winipccfg.InterfaceFromLUID(nt.LUID())</span></div><div><spa=
n style=3D"font-family:courier new,monospace">=C2=A0=C2=A0=C2=A0 iface.SetA=
ddresses(&quot;<a href=3D"http://172.16.16.1/24" target=3D"_blank">172.16.1=
6.1/24</a>&quot;)// Omitting all the mangly code to create an IPNet</span><=
/div><div><span style=3D"font-family:courier new,monospace">=C2=A0=C2=A0=C2=
=A0 // Listen for Reads<br></span></div><div><span style=3D"font-family:cou=
rier new,monospace">=C2=A0=C2=A0=C2=A0 wg :=3D &amp;sync.WaitGroup{}</span>=
</div><div><span style=3D"font-family:courier new,monospace">=C2=A0=C2=A0=
=C2=A0 wg.Add(1)</span></div><div><span style=3D"font-family:courier new,mo=
nospace">=C2=A0=C2=A0=C2=A0 go func() {</span></div><div><span style=3D"fon=
t-family:courier new,monospace">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
defer wg.Done()</span></div><div><span style=3D"font-family:courier new,mon=
ospace">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for {</span></div><div><=
span style=3D"font-family:courier new,monospace">=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bt :=3D make([]byte, 15000) // L=
ots of packets</span></div><div><span style=3D"font-family:courier new,mono=
space">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 r=
ead, err :=3D nt.Read(bt, 0) // Offset of 0 for now, just trying to read</s=
pan></div><div><span style=3D"font-family:courier new,monospace">=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if err !=3D nil {=
</span></div><div><span style=3D"font-family:courier new,monospace">=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 fmt.Printf(&quot;%#v\n&quot;, err)</span></div><div><span style=
=3D"font-family:courier new,monospace">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return<br></span></d=
iv><div><span style=3D"font-family:courier new,monospace">=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }</span></div><div><spa=
n style=3D"font-family:courier new,monospace">=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fmt.Printf(&quot;Read %d bytes\n&qu=
ot;, read)<br></span></div><div><span style=3D"font-family:courier new,mono=
space">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }<br></span></div><div><s=
pan style=3D"font-family:courier new,monospace">=C2=A0=C2=A0=C2=A0 }()</spa=
n></div><div><span style=3D"font-family:courier new,monospace">=C2=A0=C2=A0=
=C2=A0 wg.Wait()<br></span></div><div><span style=3D"font-family:courier ne=
w,monospace">}</span></div><div><br></div><div>I&#39;ve tried this using tw=
o different versions of the WinTUN driver, one where I just created a simpl=
e installer using the v0.1 MSM file on WinTun.net, and the other by install=
ing WireGuard v0.0.8 from the main website. In both cases, <span style=3D"f=
ont-family:courier new,monospace">CreateTun</span> and interface calls work=
, and I&#39;m able to see the network adapter added to Windows. However, in=
 both cases, the call to <span style=3D"font-family:courier new,monospace">=
Read</span> fails. Ultimately, after drilling down, the failing call is in =
tun_windows.go in <span style=3D"font-family:courier new,monospace">func (t=
un *NativeTun) openTUN</span>, and the offending line is <span style=3D"fon=
t-family:courier new,monospace">tun.tunFileRead, err =3D os.OpenFile(name, =
os.O_RDONLY, 0)</span>.</div><div><br></div><div>To test out my code, and s=
ee if I am missing some key component, I compiled and ran <a href=3D"http:/=
/golang.zx2c4.com/wireguard/main_windows.go" target=3D"_blank">golang.zx2c4=
.com/wireguard/main_windows.go</a>, which exhibits the exact same behavior =
as my program, ending with an error like <span style=3D"font-family:courier=
 new,monospace">ERROR: (MyTunTest) 2019/05/21 18:14:17 Failed to read packe=
t from TUN device: open \\.\Global\WINTUN32769: Access is denied</span>.</d=
iv><div><br></div><div>At this point I was convinced that it might be some =
factor about my system which was preventing this from working, but much to =
my surprise when I downloaded and ran the current v0.0.8 release version of=
 the WireGuard client, it worked just fine, and I was able to connect to an=
d route traffic through a WireGuard server.<br></div><div><br></div><div>I =
then considered that there was something special about opening the tun devi=
ce from a service specifically, as opposed to an elevated user space proces=
s (although I cannot figure out a reason why this should be so). I whipped =
up a very quick windows service in C# to only tries to open the already cre=
ated WinTUN device (literally, just var <span style=3D"font-family:courier =
new,monospace">tunRead =3D File.Open(TUN_NAME, FileMode.Open, FileAccess.Re=
ad);</span>, plus all the usual service boiler plate). I installed this ser=
vice with the LocalSystem permission and when starting, it similarly gets a=
n access denied error.</div><div><br></div><div>Clearly, the WireGuard wind=
ows client is executing some command which puts the tun into an ready to op=
en state or changes the privileges in some key way, but I have been unable =
to find this key command or function. Any help on a minimum viable program =
to successfully call Read on a WinTUN object is most appreciated.</div><div=
><br></div><div>All the best,</div><div><br></div><div>~ Christopher<br></d=
iv></div>
</blockquote></div>

--000000000000b6613e058967eef6--

--===============8202047976691300542==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============8202047976691300542==--
