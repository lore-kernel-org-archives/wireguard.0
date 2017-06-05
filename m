Return-Path: lesandie@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a49cfe76
 for <wireguard@lists.zx2c4.com>; Mon, 5 Jun 2017 12:48:35 +0000 (UTC)
Received: from mail-yw0-f182.google.com (mail-yw0-f182.google.com
 [209.85.161.182])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 201cb641
 for <wireguard@lists.zx2c4.com>; Mon, 5 Jun 2017 12:48:35 +0000 (UTC)
Received: by mail-yw0-f182.google.com with SMTP id l75so14933905ywc.3
 for <wireguard@lists.zx2c4.com>; Mon, 05 Jun 2017 06:02:20 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAHmME9oGkubUS-cvcepvF4-JDo8-J8Pdfg7fDoOj=dNE-hsa1w@mail.gmail.com>
References: <c04b7a897d9fce0a@frisell.zx2c4.com>
 <CAKgwHq-d0vMPLsQ7p1WjW4yiUehDG3vCKYZkodDx+P8yamkCNw@mail.gmail.com>
 <CAHmME9oGkubUS-cvcepvF4-JDo8-J8Pdfg7fDoOj=dNE-hsa1w@mail.gmail.com>
From: Le Sandie <lesandie@gmail.com>
Date: Mon, 5 Jun 2017 15:02:19 +0200
Message-ID: <CAKgwHq_kZLJ=yrggCO+T2O+4w1DfBZhc8V8ar3drpS1sfeRTQw@mail.gmail.com>
Subject: Re: [ANNOUNCE] WireGuard Snapshot `0.0.20170531` Available
To: wireguard@lists.zx2c4.com
Content-Type: multipart/alternative; boundary="001a11413cbcf7f7630551361c21"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--001a11413cbcf7f7630551361c21
Content-Type: text/plain; charset="UTF-8"

Hi!, iperf results!

Peers: server 10.11.12.1 and client 10.11.12.2

UDP test

100MB transfer (with a size similar to the theoretical raspberry pi fast
ethernet limit (100mbps)


pi@raspberrypi:~ $ iperf -c 10.11.12.2 -u -p 12345 -t 30 -b 100M
------------------------------------------------------------
Client connecting to 10.11.12.2, UDP port 12345
Sending 1470 byte datagrams
UDP buffer size:  160 KByte (default)
------------------------------------------------------------
[  3] local 10.11.12.3 port 47707 connected with 10.11.12.2 port 12345
[ ID] Interval       Transfer     Bandwidth
[  3]  0.0-30.0 sec   278 MBytes  77.8 Mbits/sec
[  3] Sent 198395 datagrams
[  3] Server Report:
[  3]  0.0-30.3 sec  6.30 MBytes  1.75 Mbits/sec  11.417 ms 193896/198393
(98%)
pi@raspberrypi:~ $


WITH the NEW SNAPSHOT (20170531)

pi@raspberrypi:~ $ iperf -c 10.11.12.2 -u -t 30 -b 100M
------------------------------------------------------------
Client connecting to 10.11.12.2, UDP port 5001
Sending 1470 byte datagrams
UDP buffer size:  160 KByte (default)
------------------------------------------------------------
[  3] local 10.11.12.3 port 59246 connected with 10.11.12.2 port 5001
[ ID] Interval       Transfer     Bandwidth
[  3]  0.0-30.0 sec   275 MBytes  77.0 Mbits/sec
[  3] Sent 196350 datagrams
[  3] Server Report:
[  3]  0.0-30.2 sec  6.67 MBytes  1.85 Mbits/sec  10.785 ms 191590/196347
(98%)
[  3]  0.0-30.2 sec  1 datagrams received out-of-order


Results are what i expected, both rpi3 hitting the limit of the fast
ethernet. I'm gonna test it with two routers (Netgear X4S nighthawk, with
ARM neon and Gigabit ethernet interface).

Best!


On Sat, Jun 3, 2017 at 3:31 AM, Jason A. Donenfeld <Jason@zx2c4.com> wrote:

> On Sat, Jun 3, 2017 at 12:47 AM, Le Sandie <lesandie@gmail.com> wrote:
> > I have tested the WireGuard-0.0.20170531 snapshot between two ARM peers
> (a
> > couple of rpi3s with the same snapshot) and it works nice. I haven't had
> > time to iperf but will do to check that performance raise in ARM SoCs.
>
> Great, please do let me know.
>
> >
> > Also i tested this snapshot with one ARM peer and the other peer with a
> LEDE
> > (17.01.1) router with wireguard and the handshake goes well but no
> > connectivity between peers. If i downgrade the ARM peer snapshot to
> > WireGuard-0.0.20170421, both peers see each other with connectivity.
> > Probably when the openwrt/LEDE package maintainer bump up the package to
> the
> > new snapshot it will work.
>
> Yes indeed there was a backwards incompatible change made. The
> openwrt/lede package already has been bumped, however, so just update
> your system.
> https://github.com/openwrt/packages/blob/master/net/wireguard/Makefile
>



-- 
Lt. Col. Sandie

--001a11413cbcf7f7630551361c21
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi!, iperf results!<br><div><br></div><div>Peers: server 1=
0.11.12.1 and client 10.11.12.2 <br><br>UDP test<br><br></div><div>100MB tr=
ansfer (with a size similar to the theoretical raspberry pi fast ethernet l=
imit (100mbps)<br><br></div><div><br>pi@raspberrypi:~ $ iperf -c 10.11.12.2=
 -u -p 12345 -t 30 -b 100M<br>---------------------------------------------=
---------------<br>Client connecting to 10.11.12.2, UDP port 12345<br>Sendi=
ng 1470 byte datagrams<br>UDP buffer size:=C2=A0 160 KByte (default)<br>---=
---------------------------------------------------------<br>[=C2=A0 3] loc=
al 10.11.12.3 port 47707 connected with 10.11.12.2 port 12345<br>[ ID] Inte=
rval=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Transfer=C2=A0=C2=A0=C2=A0=C2=A0 B=
andwidth<br>[=C2=A0 3]=C2=A0 0.0-30.0 sec=C2=A0=C2=A0 278 MBytes=C2=A0 77.8=
 Mbits/sec<br>[=C2=A0 3] Sent 198395 datagrams<br>[=C2=A0 3] Server Report:=
<br>[=C2=A0 3]=C2=A0 0.0-30.3 sec=C2=A0 6.30 MBytes=C2=A0 1.75 Mbits/sec=C2=
=A0 11.417 ms 193896/198393 (98%)<br>pi@raspberrypi:~ $<br><br><br></div><d=
iv>WITH the NEW SNAPSHOT (20170531)<br><br>pi@raspberrypi:~ $ iperf -c 10.1=
1.12.2 -u -t 30 -b 100M<br>------------------------------------------------=
------------<br>Client connecting to 10.11.12.2, UDP port 5001<br>Sending 1=
470 byte datagrams<br>UDP buffer size:=C2=A0 160 KByte (default)<br>-------=
-----------------------------------------------------<br>[=C2=A0 3] local 1=
0.11.12.3 port 59246 connected with 10.11.12.2 port 5001<br>[ ID] Interval=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Transfer=C2=A0=C2=A0=C2=A0=C2=A0 Bandw=
idth<br>[=C2=A0 3]=C2=A0 0.0-30.0 sec=C2=A0=C2=A0 275 MBytes=C2=A0 77.0 Mbi=
ts/sec<br>[=C2=A0 3] Sent 196350 datagrams<br>[=C2=A0 3] Server Report:<br>=
[=C2=A0 3]=C2=A0 0.0-30.2 sec=C2=A0 6.67 MBytes=C2=A0 1.85 Mbits/sec=C2=A0 =
10.785 ms 191590/196347 (98%)<br>[=C2=A0 3]=C2=A0 0.0-30.2 sec=C2=A0 1 data=
grams received out-of-order<br><br><br></div><div>Results are what i expect=
ed, both rpi3 hitting the limit of the fast ethernet. I&#39;m gonna test it=
 with two routers (Netgear X4S nighthawk, with=C2=A0 ARM neon and Gigabit e=
thernet interface). <br></div><div><br></div><div>Best!<br></div><div><br><=
/div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Sat=
, Jun 3, 2017 at 3:31 AM, Jason A. Donenfeld <span dir=3D"ltr">&lt;<a href=
=3D"mailto:Jason@zx2c4.com" target=3D"_blank">Jason@zx2c4.com</a>&gt;</span=
> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex"><span class=3D"">On Sat, Jun 3, =
2017 at 12:47 AM, Le Sandie &lt;<a href=3D"mailto:lesandie@gmail.com">lesan=
die@gmail.com</a>&gt; wrote:<br>
&gt; I have tested the WireGuard-0.0.20170531 snapshot between two ARM peer=
s (a<br>
&gt; couple of rpi3s with the same snapshot) and it works nice. I haven&#39=
;t had<br>
&gt; time to iperf but will do to check that performance raise in ARM SoCs.=
<br>
<br>
</span>Great, please do let me know.<br>
<span class=3D""><br>
&gt;<br>
&gt; Also i tested this snapshot with one ARM peer and the other peer with =
a LEDE<br>
&gt; (17.01.1) router with wireguard and the handshake goes well but no<br>
&gt; connectivity between peers. If i downgrade the ARM peer snapshot to<br=
>
&gt; WireGuard-0.0.20170421, both peers see each other with connectivity.<b=
r>
&gt; Probably when the openwrt/LEDE package maintainer bump up the package =
to the<br>
&gt; new snapshot it will work.<br>
<br>
</span>Yes indeed there was a backwards incompatible change made. The<br>
openwrt/lede package already has been bumped, however, so just update<br>
your system.<br>
<a href=3D"https://github.com/openwrt/packages/blob/master/net/wireguard/Ma=
kefile" rel=3D"noreferrer" target=3D"_blank">https://github.com/openwrt/<wb=
r>packages/blob/master/net/<wbr>wireguard/Makefile</a><br>
</blockquote></div><br><br clear=3D"all"><br>-- <br><div class=3D"gmail_sig=
nature" data-smartmail=3D"gmail_signature">Lt. Col. Sandie</div>
</div>

--001a11413cbcf7f7630551361c21--
