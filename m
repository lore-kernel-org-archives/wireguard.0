Return-Path: rcwhelan@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 59ee8b31
 for <wireguard@lists.zx2c4.com>;
 Sun, 15 Apr 2018 15:30:56 +0000 (UTC)
Received: from mail-qt0-f170.google.com (mail-qt0-f170.google.com
 [209.85.216.170])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f02a0eae
 for <wireguard@lists.zx2c4.com>;
 Sun, 15 Apr 2018 15:30:56 +0000 (UTC)
Received: by mail-qt0-f170.google.com with SMTP id a25so6574365qtm.1
 for <wireguard@lists.zx2c4.com>; Sun, 15 Apr 2018 08:45:21 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAHmME9owJaafkWfz8ruaKWqATmQ9gfoxNtZNyxRJFjyQgr7yvw@mail.gmail.com>
References: <CAHmME9owJaafkWfz8ruaKWqATmQ9gfoxNtZNyxRJFjyQgr7yvw@mail.gmail.com>
From: Ryan Whelan <rcwhelan@gmail.com>
Date: Sun, 15 Apr 2018 11:45:20 -0400
Message-ID: <CAM3m09Q8mg_baVZrmZ+tqx2FiKuStMhSTq8mT0kZ_beK_10GxA@mail.gmail.com>
Subject: Re: PMTU Discovery Security Concerns
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Content-Type: multipart/alternative; boundary="94eb2c1250002d07fa0569e4feb6"
Cc: Luis Ressel <aranea@aixah.de>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--94eb2c1250002d07fa0569e4feb6
Content-Type: text/plain; charset="UTF-8"

I don't have an actual fix; but is something that could have a switch that
could be configured per interface?  I know knobs and controls aren't really
desirable, but if Off by default, it would encourage those turning it on to
understand what they're exposing.

$0.02

On Sun, Apr 15, 2018 at 10:08 AM, Jason A. Donenfeld <Jason@zx2c4.com>
wrote:

> Hi list,
>
> [CC'ing Luis, who's been working on this with me.]
>
> I've more or less figured out how to do PMTU discovery (something
> along the lines of https://xn--4db.cc/WFHQzX2o/c inspired by the vti
> driver). I wonder, however, if this is safe to do.
>
> The basic idea is that if you're talking to a WireGuard peer via its
> internal tunnel IP address, the kernel keeps some notion of what that
> internal IP address's PMTU is. Meanwhile, WireGuard itself is talking
> to that peer via its external endpoint IP address, and the kernel
> keeps some notion of what that external IP address's PMTU is. If the
> encrypted packets are larger than the external PMTU, well behaved
> networks will send ICMP messages, indicating that packets sent to that
> external endpoint IP should be smaller. This, however, doesn't have
> anything to do with what the user is trying to send internally, and so
> there will continue to be overly large packets sent.
>
> The way to fix it would be to relay the external endpoint PMTU to the
> internal tunnel PMTU. Then, when an external encrypted packet gets
> dropped due to being overly large, the ICMP message for that winds up
> affecting the internal tunneled IP address's PMTU, so that the next
> message it sends is smaller. All is well, packets flow, and TCP
> sessions no longer stall. This is generally how PMTU discovery works
> with network tunnels.
>
> The security problem is that those ICMP messages indicating we should
> send smaller packets are unauthenticated, since they're triggered by
> things external to the tunnel, rather than inside the tunnel. By
> propagating the information from those unauthenticated ICMP messages
> to state that concerns the inside of the tunnel, we're essentially
> enabling an unauthenticated state injection. This could enable some
> mischief. On the benign end of the spectrum, an attacker could launch
> a DoS attack by causing the sending end to use smaller and smaller
> packets. On the scarier end of the spectrum, an attacker could
> intelligently do this to change the size of packets and observe the
> way in which a data flow is rechunked, in order to infer something
> about the actual data being encrypted.
>
> These security concerns make me inclined to just simplistically
> declare, "PMTU discovery in tunnels can't be done securely with the
> existing Internet, so WireGuard doesn't support it." However,
> undoubtedly smart people have thought about this before, and perhaps
> they've come up with real solutions for this. Indeed I've come across
> various discussions of the matter in the IPsec RFCs. But at the
> present moment, I'm unsure what the most reasonable way forward is.
>
> So, I thought if anyone on the list has thought about this extensively
> before and would like to chime in with some wisdom, I'm all ears.
>
> Regards,
> Jason
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
>

--94eb2c1250002d07fa0569e4feb6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I don&#39;t have an actual fix; but is something that coul=
d have a switch that could be configured per interface?=C2=A0 I know knobs =
and controls aren&#39;t really desirable, but if Off by default, it would e=
ncourage those turning it on to understand what they&#39;re exposing.<div><=
br></div><div>$0.02=C2=A0</div></div><div class=3D"gmail_extra"><br><div cl=
ass=3D"gmail_quote">On Sun, Apr 15, 2018 at 10:08 AM, Jason A. Donenfeld <s=
pan dir=3D"ltr">&lt;<a href=3D"mailto:Jason@zx2c4.com" target=3D"_blank">Ja=
son@zx2c4.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hi li=
st,<br>
<br>
[CC&#39;ing Luis, who&#39;s been working on this with me.]<br>
<br>
I&#39;ve more or less figured out how to do PMTU discovery (something<br>
along the lines of <a href=3D"https://xn--4db.cc/WFHQzX2o/c" rel=3D"norefer=
rer" target=3D"_blank">https://xn--4db.cc/WFHQzX2o/c</a> inspired by the vt=
i<br>
driver). I wonder, however, if this is safe to do.<br>
<br>
The basic idea is that if you&#39;re talking to a WireGuard peer via its<br=
>
internal tunnel IP address, the kernel keeps some notion of what that<br>
internal IP address&#39;s PMTU is. Meanwhile, WireGuard itself is talking<b=
r>
to that peer via its external endpoint IP address, and the kernel<br>
keeps some notion of what that external IP address&#39;s PMTU is. If the<br=
>
encrypted packets are larger than the external PMTU, well behaved<br>
networks will send ICMP messages, indicating that packets sent to that<br>
external endpoint IP should be smaller. This, however, doesn&#39;t have<br>
anything to do with what the user is trying to send internally, and so<br>
there will continue to be overly large packets sent.<br>
<br>
The way to fix it would be to relay the external endpoint PMTU to the<br>
internal tunnel PMTU. Then, when an external encrypted packet gets<br>
dropped due to being overly large, the ICMP message for that winds up<br>
affecting the internal tunneled IP address&#39;s PMTU, so that the next<br>
message it sends is smaller. All is well, packets flow, and TCP<br>
sessions no longer stall. This is generally how PMTU discovery works<br>
with network tunnels.<br>
<br>
The security problem is that those ICMP messages indicating we should<br>
send smaller packets are unauthenticated, since they&#39;re triggered by<br=
>
things external to the tunnel, rather than inside the tunnel. By<br>
propagating the information from those unauthenticated ICMP messages<br>
to state that concerns the inside of the tunnel, we&#39;re essentially<br>
enabling an unauthenticated state injection. This could enable some<br>
mischief. On the benign end of the spectrum, an attacker could launch<br>
a DoS attack by causing the sending end to use smaller and smaller<br>
packets. On the scarier end of the spectrum, an attacker could<br>
intelligently do this to change the size of packets and observe the<br>
way in which a data flow is rechunked, in order to infer something<br>
about the actual data being encrypted.<br>
<br>
These security concerns make me inclined to just simplistically<br>
declare, &quot;PMTU discovery in tunnels can&#39;t be done securely with th=
e<br>
existing Internet, so WireGuard doesn&#39;t support it.&quot; However,<br>
undoubtedly smart people have thought about this before, and perhaps<br>
they&#39;ve come up with real solutions for this. Indeed I&#39;ve come acro=
ss<br>
various discussions of the matter in the IPsec RFCs. But at the<br>
present moment, I&#39;m unsure what the most reasonable way forward is.<br>
<br>
So, I thought if anyone on the list has thought about this extensively<br>
before and would like to chime in with some wisdom, I&#39;m all ears.<br>
<br>
Regards,<br>
Jason<br>
______________________________<wbr>_________________<br>
WireGuard mailing list<br>
<a href=3D"mailto:WireGuard@lists.zx2c4.com">WireGuard@lists.zx2c4.com</a><=
br>
<a href=3D"https://lists.zx2c4.com/mailman/listinfo/wireguard" rel=3D"noref=
errer" target=3D"_blank">https://lists.zx2c4.com/<wbr>mailman/listinfo/wire=
guard</a><br>
</blockquote></div><br></div>

--94eb2c1250002d07fa0569e4feb6--
