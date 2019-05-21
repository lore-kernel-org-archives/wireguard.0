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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47E88C28D1A
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  6 Jun 2019 09:34:05 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DFD4D20868
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  6 Jun 2019 09:34:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ppFOlKdH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DFD4D20868
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 426337d3;
	Thu, 6 Jun 2019 09:33:22 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4bc57de1
 for <wireguard@lists.zx2c4.com>;
 Tue, 21 May 2019 15:17:34 +0000 (UTC)
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 588f773c
 for <wireguard@lists.zx2c4.com>;
 Tue, 21 May 2019 15:17:33 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id f8so12692595wrt.1
 for <wireguard@lists.zx2c4.com>; Tue, 21 May 2019 08:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=7/3DXFDrOSXYNKZkZHprQ5GNabCWT1AdZRy7lLOnI34=;
 b=ppFOlKdHy/uDoHG5Wft3rJGh7RRgtYoQdn2m4LN2OOZA5dlrmJvJplv5VS9Ei46Tha
 Fe6pOUgWTZTRQza9VNdBVlB4U8nXinXotjKRisgLOk7huXudlQiKVVejBorRJTJc1y+X
 INBb/wbZtZrcjfkJiFJxTXay8o2kIsEqHjwfHyKycMpSk5YEPVUiLVYRO/dmbJ4YlqcU
 tXiiwVvUApvuqxPLtmP2R5VI69sjsGMeWPOitS2V+LH55XrFKtu7vE8fm6qxbZKaFlBD
 n9sA3grt1yLNGPnkZJFg/zu/yjaZkRuj9O4MCIjAtZgYChj1XQGd8QruUOSbE/N0TxMw
 m12w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=7/3DXFDrOSXYNKZkZHprQ5GNabCWT1AdZRy7lLOnI34=;
 b=loXSwsuNzn3b11QXQQSu/nNwkSYmcRCXD/C0kFFjSdNiOwMAlzOahDZ+Qix347AyVk
 V41ZMcqI54mXtHX55ks7Yvfso4gIcBQIpdL8oN9wVpAfw+3yM2vFniKGlmWStiA7y+Xs
 y6wBapY5qesNfR/xTolXVRPCtojOkrfS/Uw4GwSq23dRYalOHlHyJrEL2NUtF9WyAZNt
 Ywt0ApFbTbzig920Q2t+bU523SAcf8RM2QvugayRJ0ssOpxxvKwZB8VaAUY0DvNGABhc
 KT7HgvYYYB/68FsRw7REYKE0+uPMQG6aVEUN8bpceu79jgE0m/CBfcPJ+kN2gsYqsrDj
 /d1w==
X-Gm-Message-State: APjAAAUAcCna+FqguNLajCPGmM8afKMgvWixgJCfDKfu9w1FxHqCJMyu
 3Iszr+Gx3eOXDDP9qPtImrgtq0IEBTcWl6MbsS8l9iPuSjE=
X-Google-Smtp-Source: APXvYqxnWGC+yso9npFOH8OJf2Lekp8E62diGnu0n8j9vRAvzst9PD8l+MYWKWzf00/6GsMEKu59V9wqsp9Tnhu8rQA=
X-Received: by 2002:adf:cf05:: with SMTP id o5mr35326760wrj.262.1558451851776; 
 Tue, 21 May 2019 08:17:31 -0700 (PDT)
MIME-Version: 1.0
From: "Christopher O'Connell" <jwriteclub@gmail.com>
Date: Tue, 21 May 2019 18:17:19 +0300
Message-ID: <CAEx8eyTU2-auBDfyy+-1_-byUYheoxFKLaXsN9t+_CTXrGBzsQ@mail.gmail.com>
Subject: Minimal WinTUN Program Access Denied Opening Tun
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
Content-Type: multipart/mixed; boundary="===============5190906951819306422=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============5190906951819306422==
Content-Type: multipart/alternative; boundary="000000000000065ae70589675903"

--000000000000065ae70589675903
Content-Type: text/plain; charset="UTF-8"

Hello,

I've been very intrigued by WinTUN, and the option of a small, simple TUN
driver, especially one with good golang bindings offers a lot of
opportunity to build interesting things on Windows.

I've been building a minimal program based on the go libraries, my goal
being to just write a simple ICMP endpoint to be able to ping, as a way to
learn the WinTUN code and libraries. Unfortunately, I've run into an issue
that I'm unable to actually read from the tun device, my code always
getting errors like open \\.\Global\WINTUN32768: Access is denied.

In a nutshell, my code does the following (error checking and some other
ancillary code is omitted, please see this gist
<https://gist.github.com/jwriteclub/4f0fa081cb4eb39620702d7f7e212afd> for
the complete code):

func main() {
    // These two functions are taken from wireguard windows, added just to
make sure that
    // this code is running from the same privilege level as the WireGuard
windows code
    checkForAdminGroup()
    checkForWow64()
    // Create a tun. This works, with the small patch to tun_windows.go
which I submitted earlier
    t, err := tun.CreateTun("My Test Tun")
    nt := t.(*tun.NativeTun)
    // Get the interface and set IPs, etc
    iface, err := winipccfg.InterfaceFromLUID(nt.LUID())
    iface.SetAddresses("172.16.16.1/24")// Omitting all the mangly code to
create an IPNet
    // Listen for Reads
    wg := &sync.WaitGroup{}
    wg.Add(1)
    go func() {
        defer wg.Done()
        for {
            bt := make([]byte, 15000) // Lots of packets
            read, err := nt.Read(bt, 0) // Offset of 0 for now, just trying
to read
            if err != nil {
                fmt.Printf("%#v\n", err)
                return
            }
            fmt.Printf("Read %d bytes\n", read)
        }
    }()
    wg.Wait()
}

I've tried this using two different versions of the WinTUN driver, one
where I just created a simple installer using the v0.1 MSM file on
WinTun.net, and the other by installing WireGuard v0.0.8 from the main
website. In both cases, CreateTun and interface calls work, and I'm able to
see the network adapter added to Windows. However, in both cases, the call
to Read fails. Ultimately, after drilling down, the failing call is in
tun_windows.go in func (tun *NativeTun) openTUN, and the offending
line is tun.tunFileRead,
err = os.OpenFile(name, os.O_RDONLY, 0).

To test out my code, and see if I am missing some key component, I compiled
and ran golang.zx2c4.com/wireguard/main_windows.go, which exhibits the
exact same behavior as my program, ending with an error like ERROR:
(MyTunTest) 2019/05/21 18:14:17 Failed to read packet from TUN device: open
\\.\Global\WINTUN32769: Access is denied.

At this point I was convinced that it might be some factor about my system
which was preventing this from working, but much to my surprise when I
downloaded and ran the current v0.0.8 release version of the WireGuard
client, it worked just fine, and I was able to connect to and route traffic
through a WireGuard server.

I then considered that there was something special about opening the tun
device from a service specifically, as opposed to an elevated user space
process (although I cannot figure out a reason why this should be so). I
whipped up a very quick windows service in C# to only tries to open the
already created WinTUN device (literally, just var tunRead =
File.Open(TUN_NAME, FileMode.Open, FileAccess.Read);, plus all the usual
service boiler plate). I installed this service with the LocalSystem
permission and when starting, it similarly gets an access denied error.

Clearly, the WireGuard windows client is executing some command which puts
the tun into an ready to open state or changes the privileges in some key
way, but I have been unable to find this key command or function. Any help
on a minimum viable program to successfully call Read on a WinTUN object is
most appreciated.

All the best,

~ Christopher

--000000000000065ae70589675903
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello,</div><div><br></div><div>I&#39;ve been very in=
trigued by WinTUN, and the option of a small, simple TUN driver, especially=
 one with good golang bindings offers a lot of opportunity to build interes=
ting things on Windows.</div><div><br></div><div>I&#39;ve been building a m=
inimal program based on the go libraries, my goal being to just write a sim=
ple ICMP endpoint to be able to ping, as a way to learn the WinTUN code and=
 libraries. Unfortunately, I&#39;ve run into an issue that I&#39;m unable t=
o actually read from the tun device, my code always getting errors like <sp=
an style=3D"font-family:courier new,monospace">open \\.\Global\WINTUN32768:=
 Access is denied</span>.</div><div><br></div><div>In a nutshell, my code d=
oes the following (error checking and some other ancillary code is omitted,=
 please see <a href=3D"https://gist.github.com/jwriteclub/4f0fa081cb4eb3962=
0702d7f7e212afd">this gist</a> for the complete code):</div><div><br></div>=
<div><span style=3D"font-family:courier new,monospace">func main() {</span>=
</div><div><span style=3D"font-family:courier new,monospace">=C2=A0=C2=A0=
=C2=A0 // These two functions are taken from wireguard windows, added just =
to make sure that</span></div><div><span style=3D"font-family:courier new,m=
onospace">=C2=A0=C2=A0=C2=A0 // this code is running from the same privileg=
e level as the WireGuard windows code<br></span></div><div><span style=3D"f=
ont-family:courier new,monospace">=C2=A0=C2=A0=C2=A0 checkForAdminGroup()</=
span></div><div><span style=3D"font-family:courier new,monospace">=C2=A0=C2=
=A0=C2=A0 checkForWow64()</span></div><div><span style=3D"font-family:couri=
er new,monospace">=C2=A0=C2=A0=C2=A0 // Create a tun. This works, with the =
small patch to tun_windows.go which I submitted earlier<br></span></div><di=
v><span style=3D"font-family:courier new,monospace">=C2=A0=C2=A0=C2=A0 t, e=
rr :=3D tun.CreateTun(&quot;My Test Tun&quot;)</span></div><div><span style=
=3D"font-family:courier new,monospace">=C2=A0=C2=A0=C2=A0 nt :=3D t.(*tun.N=
ativeTun)<br></span></div><div><span style=3D"font-family:courier new,monos=
pace">=C2=A0=C2=A0=C2=A0 // Get the interface and set IPs, etc<br></span></=
div><div><span style=3D"font-family:courier new,monospace">=C2=A0=C2=A0=C2=
=A0 iface, err :=3D winipccfg.InterfaceFromLUID(nt.LUID())</span></div><div=
><span style=3D"font-family:courier new,monospace">=C2=A0=C2=A0=C2=A0 iface=
.SetAddresses(&quot;<a href=3D"http://172.16.16.1/24">172.16.16.1/24</a>&qu=
ot;)// Omitting all the mangly code to create an IPNet</span></div><div><sp=
an style=3D"font-family:courier new,monospace">=C2=A0=C2=A0=C2=A0 // Listen=
 for Reads<br></span></div><div><span style=3D"font-family:courier new,mono=
space">=C2=A0=C2=A0=C2=A0 wg :=3D &amp;sync.WaitGroup{}</span></div><div><s=
pan style=3D"font-family:courier new,monospace">=C2=A0=C2=A0=C2=A0 wg.Add(1=
)</span></div><div><span style=3D"font-family:courier new,monospace">=C2=A0=
=C2=A0=C2=A0 go func() {</span></div><div><span style=3D"font-family:courie=
r new,monospace">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 defer wg.Done()=
</span></div><div><span style=3D"font-family:courier new,monospace">=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for {</span></div><div><span style=3D"=
font-family:courier new,monospace">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 bt :=3D make([]byte, 15000) // Lots of packets<=
/span></div><div><span style=3D"font-family:courier new,monospace">=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 read, err :=3D=
 nt.Read(bt, 0) // Offset of 0 for now, just trying to read</span></div><di=
v><span style=3D"font-family:courier new,monospace">=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if err !=3D nil {</span></div=
><div><span style=3D"font-family:courier new,monospace">=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fm=
t.Printf(&quot;%#v\n&quot;, err)</span></div><div><span style=3D"font-famil=
y:courier new,monospace">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return<br></span></div><div><spa=
n style=3D"font-family:courier new,monospace">=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }</span></div><div><span style=3D"f=
ont-family:courier new,monospace">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 fmt.Printf(&quot;Read %d bytes\n&quot;, read)<b=
r></span></div><div><span style=3D"font-family:courier new,monospace">=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }<br></span></div><div><span style=
=3D"font-family:courier new,monospace">=C2=A0=C2=A0=C2=A0 }()</span></div><=
div><span style=3D"font-family:courier new,monospace">=C2=A0=C2=A0=C2=A0 wg=
.Wait()<br></span></div><div><span style=3D"font-family:courier new,monospa=
ce">}</span></div><div><br></div><div>I&#39;ve tried this using two differe=
nt versions of the WinTUN driver, one where I just created a simple install=
er using the v0.1 MSM file on WinTun.net, and the other by installing WireG=
uard v0.0.8 from the main website. In both cases, <span style=3D"font-famil=
y:courier new,monospace">CreateTun</span> and interface calls work, and I&#=
39;m able to see the network adapter added to Windows. However, in both cas=
es, the call to <span style=3D"font-family:courier new,monospace">Read</spa=
n> fails. Ultimately, after drilling down, the failing call is in tun_windo=
ws.go in <span style=3D"font-family:courier new,monospace">func (tun *Nativ=
eTun) openTUN</span>, and the offending line is <span style=3D"font-family:=
courier new,monospace">tun.tunFileRead, err =3D os.OpenFile(name, os.O_RDON=
LY, 0)</span>.</div><div><br></div><div>To test out my code, and see if I a=
m missing some key component, I compiled and ran <a href=3D"http://golang.z=
x2c4.com/wireguard/main_windows.go">golang.zx2c4.com/wireguard/main_windows=
.go</a>, which exhibits the exact same behavior as my program, ending with =
an error like <span style=3D"font-family:courier new,monospace">ERROR: (MyT=
unTest) 2019/05/21 18:14:17 Failed to read packet from TUN device: open \\.=
\Global\WINTUN32769: Access is denied</span>.</div><div><br></div><div>At t=
his point I was convinced that it might be some factor about my system whic=
h was preventing this from working, but much to my surprise when I download=
ed and ran the current v0.0.8 release version of the WireGuard client, it w=
orked just fine, and I was able to connect to and route traffic through a W=
ireGuard server.<br></div><div><br></div><div>I then considered that there =
was something special about opening the tun device from a service specifica=
lly, as opposed to an elevated user space process (although I cannot figure=
 out a reason why this should be so). I whipped up a very quick windows ser=
vice in C# to only tries to open the already created WinTUN device (literal=
ly, just var <span style=3D"font-family:courier new,monospace">tunRead =3D =
File.Open(TUN_NAME, FileMode.Open, FileAccess.Read);</span>, plus all the u=
sual service boiler plate). I installed this service with the LocalSystem p=
ermission and when starting, it similarly gets an access denied error.</div=
><div><br></div><div>Clearly, the WireGuard windows client is executing som=
e command which puts the tun into an ready to open state or changes the pri=
vileges in some key way, but I have been unable to find this key command or=
 function. Any help on a minimum viable program to successfully call Read o=
n a WinTUN object is most appreciated.</div><div><br></div><div>All the bes=
t,</div><div><br></div><div>~ Christopher<br></div></div>

--000000000000065ae70589675903--

--===============5190906951819306422==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============5190906951819306422==--
