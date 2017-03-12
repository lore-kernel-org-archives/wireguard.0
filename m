Return-Path: quanzhou822@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 53ad7d2b
 for <wireguard@lists.zx2c4.com>;
 Sun, 12 Mar 2017 15:54:17 +0000 (UTC)
Received: from mail-ot0-f174.google.com (mail-ot0-f174.google.com
 [74.125.82.174])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2ecfd4fe
 for <wireguard@lists.zx2c4.com>;
 Sun, 12 Mar 2017 15:54:17 +0000 (UTC)
Received: by mail-ot0-f174.google.com with SMTP id 19so100946098oti.0
 for <wireguard@lists.zx2c4.com>; Sun, 12 Mar 2017 08:57:30 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <22326a60-1a27-5916-ff3f-29a9cedb4272@mailbox.org>
References: <22326a60-1a27-5916-ff3f-29a9cedb4272@mailbox.org>
From: Quan Zhou <quanzhou822@gmail.com>
Date: Sun, 12 Mar 2017 23:57:09 +0800
Message-ID: <CAMRLKH_0mSXFNFeOb3dF0sQKzwRrKB26fVvTPdnzYkrR0j8OpQ@mail.gmail.com>
Subject: Re: grsec kernel: RTNETLINK answers: Operation not supported
Cc: wireguard@lists.zx2c4.com
Content-Type: multipart/alternative; boundary=001a114630e6e8e5cc054a8aa617
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--001a114630e6e8e5cc054a8aa617
Content-Type: text/plain; charset=UTF-8

Is there anything in the dmesg?

On Sun, Mar 12, 2017 at 10:14 PM, <8177y3hfj2nv5@mailbox.org> wrote:

> Hello,
>
> I apologise if this is not a question for here, but I haven't been able
> to find a solution for my problem, so I thought I'd try.
>
> I'm running a grsec kernel, and am trying to set up wireguard. I have it
> working on the standard kernel, but not on the grsec 4.9 one.
>
> The problem is this:
>
> sudo ip link add dev wg0 type wireguard
> RTNETLINK answers: Operation not supported
>
> I thought I traced it back to kernel configuration of several NETFILTER
> items, which state 'm'. So I've been trying to find a module responsible
> for this, and the closest I have come is nfnetlink, but even after
> modprobe nfnetlink it doesn't work.
>
> Any help is much appreciated. Thank you for all the great work on this
> fantastic program.
>
> Cheers
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
>



-- 
Regards,

Quan Zhou
+------------------------+
|pub [expires 2019-05-04]|
|D7CF DCE8 2EBA 2766 499A|
|20DF 8273 6C6F ABCD 0A0F|
+------------------------+
|pub [revoked 2016-04-16]|
|44D2 0307 1643 E80F 2E31|
|F081 FAFA 6643 7F9F D46F|
+------------------------+
|quanzhou822@gmail.com   |
|https://keybase.io/qzhou|
+------------------------+

--001a114630e6e8e5cc054a8aa617
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Is there anything in the dmesg?</div><div class=3D"gmail_e=
xtra"><br><div class=3D"gmail_quote">On Sun, Mar 12, 2017 at 10:14 PM,  <sp=
an dir=3D"ltr">&lt;<a href=3D"mailto:8177y3hfj2nv5@mailbox.org" target=3D"_=
blank">8177y3hfj2nv5@mailbox.org</a>&gt;</span> wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">Hello,<br>
<br>
I apologise if this is not a question for here, but I haven&#39;t been able=
<br>
to find a solution for my problem, so I thought I&#39;d try.<br>
<br>
I&#39;m running a grsec kernel, and am trying to set up wireguard. I have i=
t<br>
working on the standard kernel, but not on the grsec 4.9 one.<br>
<br>
The problem is this:<br>
<br>
sudo ip link add dev wg0 type wireguard<br>
RTNETLINK answers: Operation not supported<br>
<br>
I thought I traced it back to kernel configuration of several NETFILTER<br>
items, which state &#39;m&#39;. So I&#39;ve been trying to find a module re=
sponsible<br>
for this, and the closest I have come is nfnetlink, but even after<br>
modprobe nfnetlink it doesn&#39;t work.<br>
<br>
Any help is much appreciated. Thank you for all the great work on this<br>
fantastic program.<br>
<br>
Cheers<br>
______________________________<wbr>_________________<br>
WireGuard mailing list<br>
<a href=3D"mailto:WireGuard@lists.zx2c4.com">WireGuard@lists.zx2c4.com</a><=
br>
<a href=3D"https://lists.zx2c4.com/mailman/listinfo/wireguard" rel=3D"noref=
errer" target=3D"_blank">https://lists.zx2c4.com/<wbr>mailman/listinfo/wire=
guard</a><br>
</blockquote></div><br><br clear=3D"all"><div><br></div>-- <br><div class=
=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><d=
iv><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div=
 dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><font face=3D"monospace, mon=
ospace">Regards,<br><br>Quan Zhou<br></font><span style=3D"font-family:mono=
space,monospace;font-size:12.8px">+------------------------+</span></div><d=
iv dir=3D"ltr"><font face=3D"monospace, monospace">|pub [expires 2019-05-04=
]|</font><br style=3D"font-family:monospace,monospace;font-size:12.8px"><fo=
nt face=3D"monospace, monospace">|D7CF DCE8 2EBA 2766 499A</font><span styl=
e=3D"font-family:monospace,monospace;font-size:12.8px">|</span></div><div d=
ir=3D"ltr"><font face=3D"monospace, monospace">|</font><span style=3D"font-=
family:monospace,monospace;font-size:12.8px">20DF 8273 6C6F ABCD 0A0F</span=
><span style=3D"font-family:monospace,monospace;font-size:12.8px">|</span><=
/div><div dir=3D"ltr"><font face=3D"monospace, monospace">+----------------=
--------+<br>|pub [revoked 2016-04-16]|<br>|44D2 0307 1643 E80F 2E31|<br>|F=
081 FAFA 6643 7F9F D46F|<br>+------------------------+<br>|<a href=3D"mailt=
o:quanzhou822@gmail.com" target=3D"_blank">quanzhou822@gmail.com</a>=C2=A0 =
=C2=A0|<br>|<a href=3D"https://keybase.io/qzhou" target=3D"_blank">https://=
keybase.io/qzhou</a>|<br>+------------------------+<br></font></div></div><=
/div></div></div></div></div></div></div></div>
</div>

--001a114630e6e8e5cc054a8aa617--
