Return-Path: luci@createc.ro
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1c0adb7c
 for <wireguard@lists.zx2c4.com>; Wed, 6 Dec 2017 15:05:10 +0000 (UTC)
Received: from mail.intelterm.ro (mail.crimel.ro [109.166.220.71])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 05f6a0e6
 for <wireguard@lists.zx2c4.com>; Wed, 6 Dec 2017 15:05:10 +0000 (UTC)
Received: from [192.168.123.118] (unknown [188.24.31.89])
 by mail.intelterm.ro (Postfix) with ESMTPSA id E3ECE212DE9D
 for <wireguard@lists.zx2c4.com>; Wed,  6 Dec 2017 17:12:02 +0200 (EET)
Subject: Re: Babel over wireguard
To: wireguard@lists.zx2c4.com
References: <CAM3m09QrRs=20aTOdDXtWg3dgCVemRgAXZ91=WTWTf_+d-ax4A@mail.gmail.com>
 <BF2C7924-EBFC-480C-AA52-D92CB818F3D3@toke.dk>
 <CAM3m09T_GA3-AdFkZuEf4P5sG0=wNi4FN_79Da6cd4q6un+oDw@mail.gmail.com>
 <87a7yw0zmp.fsf@toke.dk>
 <CAM3m09Sqdmw9Pkp+VYaveXeHkjVFiYJcfsVMjfxbXO=1N895jw@mail.gmail.com>
From: Lucian Cristian <luci@createc.ro>
Message-ID: <4d49b9c9-4264-61cd-72d5-333800a94c91@createc.ro>
Date: Wed, 6 Dec 2017 17:12:03 +0200
MIME-Version: 1.0
In-Reply-To: <CAM3m09Sqdmw9Pkp+VYaveXeHkjVFiYJcfsVMjfxbXO=1N895jw@mail.gmail.com>
Content-Type: multipart/alternative;
 boundary="------------E31636EF887C7318FD5410BB"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

This is a multi-part message in MIME format.
--------------E31636EF887C7318FD5410BB
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On 06.12.2017 15:22, Ryan Whelan wrote:
> If you're gauging interest, I would be very interested in using 
> unicast atop Wireguard for routing selection
>
> Thank you for the explanation; very helpful.
>
>
> On Wed, Dec 6, 2017 at 8:11 AM, Toke Høiland-Jørgensen <toke@toke.dk 
> <mailto:toke@toke.dk>> wrote:
>
>     Ryan Whelan <rcwhelan@gmail.com <mailto:rcwhelan@gmail.com>> writes:
>
>     > Are there any routing protocol implementations that do not depend on
>     > multicast?
>
>     We are in the process of standardising Babel, and one of the things we
>     are adding is the ability to run entirely over unicast. So in the
>     future, Babel will be able to do this (and integration with
>     Wireguard is
>     one of the things I want to achieve with this). But for now, no
>     implementation exists.
>
>     Other than that, maybe BGP? But you'd still need integration with
>     Wireguard if you don't want to just set AllowedIPs to ::/0
>
>     > In my setup, 2 hosts will be able to route to one another over 2
>     > different wg interfaces and I just need something to select
>     whichever
>     > interface has the least latency. Anything like that exist? :D
>
>     You can do this with point-to-point wireguard links. I.e., as long as
>     the wireguard link only has two peers, you can set AllowedIPs to
>     0.0.0.0/0 <http://0.0.0.0/0>, ::/0 on both sides, assign manual
>     link-local addresses
>     (anything in fe80::/64 will work, so you could just assign
>     fe80::1/64 to
>     one side and fe80::2/64 to the other side; they don't need to be
>     globally unique either). Then you can run babeld on top, which will
>     instruct the kernel to send appropriate packets to the wireguard
>     interface, and wireguard will forward it to the other side.
>
>     It's not currently possible to run a routing daemon on a multi-peer
>     wireguard interface. The routing daemon would need to reconfigure
>     wireguard in the kernel when it adds routes. I am planning to add this
>     to Bird at some point, but have not gotten around to it yet...
>
>     -Toke
>
>
>
>
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard

I'm usig frr routing with eigrp over wg

EIGRP: eigrpd 3.1-dev starting: vty@2613
EIGRP: interface 192.168.123.1 [10] join EIGRP Multicast group.
EIGRP: interface 172.16.223.2 [15] join EIGRP Multicast group.
EIGRP: Neighbor 172.16.223.1 (wg0) is pending: new adjacency
EIGRP: Neighbor(172.16.223.1) adjacency became full

but it can be used as unicast specifing the neighbor, but with no 
interface for the moment, is under development

Regards



--------------E31636EF887C7318FD5410BB
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">On 06.12.2017 15:22, Ryan Whelan wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAM3m09Sqdmw9Pkp+VYaveXeHkjVFiYJcfsVMjfxbXO=1N895jw@mail.gmail.com">
      <div dir="ltr">If you're gauging interest, I would be very
        interested in using unicast atop Wireguard for routing selection
        <div><br>
        </div>
        <div>Thank you for the explanation; very helpful.  <br>
        </div>
        <div><br>
        </div>
      </div>
      <div class="gmail_extra"><br>
        <div class="gmail_quote">On Wed, Dec 6, 2017 at 8:11 AM, Toke
          Høiland-Jørgensen <span dir="ltr">&lt;<a
              href="mailto:toke@toke.dk" target="_blank"
              moz-do-not-send="true">toke@toke.dk</a>&gt;</span> wrote:<br>
          <blockquote class="gmail_quote" style="margin:0 0 0
            .8ex;border-left:1px #ccc solid;padding-left:1ex"><span
              class="">Ryan Whelan &lt;<a
                href="mailto:rcwhelan@gmail.com" moz-do-not-send="true">rcwhelan@gmail.com</a>&gt;
              writes:<br>
              <br>
              &gt; Are there any routing protocol implementations that
              do not depend on<br>
              &gt; multicast?<br>
              <br>
            </span>We are in the process of standardising Babel, and one
            of the things we<br>
            are adding is the ability to run entirely over unicast. So
            in the<br>
            future, Babel will be able to do this (and integration with
            Wireguard is<br>
            one of the things I want to achieve with this). But for now,
            no<br>
            implementation exists.<br>
            <br>
            Other than that, maybe BGP? But you'd still need integration
            with<br>
            Wireguard if you don't want to just set AllowedIPs to ::/0<br>
            <span class=""><br>
              &gt; In my setup, 2 hosts will be able to route to one
              another over 2<br>
              &gt; different wg interfaces and I just need something to
              select whichever<br>
              &gt; interface has the least latency. Anything like that
              exist? :D<br>
              <br>
            </span>You can do this with point-to-point wireguard links.
            I.e., as long as<br>
            the wireguard link only has two peers, you can set
            AllowedIPs to<br>
            <a href="http://0.0.0.0/0" rel="noreferrer" target="_blank"
              moz-do-not-send="true">0.0.0.0/0</a>, ::/0 on both sides,
            assign manual link-local addresses<br>
            (anything in fe80::/64 will work, so you could just assign
            fe80::1/64 to<br>
            one side and fe80::2/64 to the other side; they don't need
            to be<br>
            globally unique either). Then you can run babeld on top,
            which will<br>
            instruct the kernel to send appropriate packets to the
            wireguard<br>
            interface, and wireguard will forward it to the other side.<br>
            <br>
            It's not currently possible to run a routing daemon on a
            multi-peer<br>
            wireguard interface. The routing daemon would need to
            reconfigure<br>
            wireguard in the kernel when it adds routes. I am planning
            to add this<br>
            to Bird at some point, but have not gotten around to it
            yet...<br>
            <span class="HOEnZb"><font color="#888888"><br>
                -Toke<br>
              </font></span></blockquote>
        </div>
        <br>
      </div>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <br>
      <pre wrap="">_______________________________________________
WireGuard mailing list
<a class="moz-txt-link-abbreviated" href="mailto:WireGuard@lists.zx2c4.com">WireGuard@lists.zx2c4.com</a>
<a class="moz-txt-link-freetext" href="https://lists.zx2c4.com/mailman/listinfo/wireguard">https://lists.zx2c4.com/mailman/listinfo/wireguard</a>
</pre>
    </blockquote>
    <p>I'm usig frr routing with eigrp over wg<br>
    </p>
    <p>EIGRP: eigrpd 3.1-dev starting: vty@2613<br>
      EIGRP: interface 192.168.123.1 [10] join EIGRP Multicast group.<br>
      EIGRP: interface 172.16.223.2 [15] join EIGRP Multicast group.<br>
      EIGRP: Neighbor 172.16.223.1 (wg0) is pending: new adjacency<br>
      EIGRP: Neighbor(172.16.223.1) adjacency became full<br>
    </p>
    <p>but it can be used as unicast specifing the neighbor, but with no
      interface for the moment, is under development</p>
    <p>Regards<br>
    </p>
    <p><br>
    </p>
  </body>
</html>

--------------E31636EF887C7318FD5410BB--
