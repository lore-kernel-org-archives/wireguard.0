Return-Path: luci@createc.ro
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e095ece8
 for <wireguard@lists.zx2c4.com>;
 Mon, 16 Apr 2018 11:21:52 +0000 (UTC)
Received: from mail.intelterm.ro (174.15.122.86.static.cluj.rdsnet.ro
 [86.122.15.174])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id aaf4d052
 for <wireguard@lists.zx2c4.com>;
 Mon, 16 Apr 2018 11:21:52 +0000 (UTC)
Received: from [192.168.123.118] (unknown [188.24.39.160])
 by mail.intelterm.ro (Postfix) with ESMTPSA id 37F402218C77
 for <wireguard@lists.zx2c4.com>; Mon, 16 Apr 2018 14:36:22 +0300 (EEST)
Subject: Re: Bird OSPF Problems
To: wireguard@lists.zx2c4.com
References: <CAApANAYEwJfsopDUvDOHv5jZ62oz88wHsggVPLPgjzUMzaWCkA@mail.gmail.com>
 <CAJqFBzx2=aQox=RhtK-L0FsLZ+xKL19v4jQ0WGO6hxwubBYuGQ@mail.gmail.com>
From: Lucian Cristian <luci@createc.ro>
Message-ID: <77b9a91e-a348-7d63-5c2d-618671df8970@createc.ro>
Date: Mon, 16 Apr 2018 14:36:24 +0300
MIME-Version: 1.0
In-Reply-To: <CAJqFBzx2=aQox=RhtK-L0FsLZ+xKL19v4jQ0WGO6hxwubBYuGQ@mail.gmail.com>
Content-Type: multipart/alternative;
 boundary="------------BBBE0EF7047F8B7A7B945CDB"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

This is a multi-part message in MIME format.
--------------BBBE0EF7047F8B7A7B945CDB
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16.04.2018 13:31, Zsolt Hegyi wrote:
> Hi Cedric,
>
> As far as I know, wireguard doesn't support multicasts yet, which OSPF 
> uses for neighbor discovery. The reason why BGP works is because it 
> uses unicast TCP packets as means of communication.
>
> To get around this, try telling BIRD that your wireguard interface is 
> an NBMA network (or a point-to-point link).
>
> vista
>
> On Mon, 16 Apr 2018, 11:27 cedric Kienzler, <cedrickienzler1@gmail.com 
> <mailto:cedrickienzler1@gmail.com>> wrote:
>
>     Hey List,
>
>     i'm currently facing issues with OSPF over the wireguard tunnel.
>
>     I use both, IPv4 and IPv6 and everything works fine. I can ping
>     through the tunnel, traffic flows perfectly, but when i try to
>     configure OSPF using the Bird routing daemon, i didn't even see a
>     HELLO message. Also when trying to list the interface using 'show
>     ospf interfaces' i didn't even see the Interface.
>
>     For IPv6 i use 2a03.... as prefix.
>     Should i configure multicast IPv6 (fe80::) on the interface too to
>     get OSPF working?
>
>     Interesting fact: BGB using Bird works just fine.
>
>     Anyone here that could help me?
>
>
>     Thanks a lot.
>
>     Best regards,
>     Cedi
>     _______________________________________________
>     WireGuard mailing list
>     WireGuard@lists.zx2c4.com <mailto:WireGuard@lists.zx2c4.com>
>     https://lists.zx2c4.com/mailman/listinfo/wireguard
>
>
>
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard

I have something like this (but with frr/quagga)


router ospf
ospf router-id 172.16.223.2
network 192.168.123.0/24 area 1
network 172.16.223.0/24 area 1

172.16.223.2 being the wg0 local interface

Regards


--------------BBBE0EF7047F8B7A7B945CDB
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">On 16.04.2018 13:31, Zsolt Hegyi wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAJqFBzx2=aQox=RhtK-L0FsLZ+xKL19v4jQ0WGO6hxwubBYuGQ@mail.gmail.com">Hi
      Cedric,
      <div><br>
      </div>
      <div>As far as I know, wireguard doesn't support multicasts yet,
        which OSPF uses for neighbor discovery. The reason why BGP works
        is because it uses unicast TCP packets as means of
        communication.</div>
      <div><br>
      </div>
      <div>To get around this, try telling BIRD that your wireguard
        interface is an NBMA network (or a point-to-point link).</div>
      <div><br>
      </div>
      <div>vista<br>
        <br>
        <div class="gmail_quote">
          <div dir="ltr">On Mon, 16 Apr 2018, 11:27 cedric Kienzler,
            &lt;<a href="mailto:cedrickienzler1@gmail.com"
              moz-do-not-send="true">cedrickienzler1@gmail.com</a>&gt;
            wrote:<br>
          </div>
          <blockquote class="gmail_quote" style="margin:0 0 0
            .8ex;border-left:1px #ccc solid;padding-left:1ex">
            <div dir="ltr">
              <div>
                <div>
                  <div>
                    <div>
                      <div>
                        <div>
                          <div>
                            <div>
                              <div>Hey List,<br>
                                <br>
                              </div>
                              i'm currently facing issues with OSPF over
                              the wireguard tunnel.<br>
                              <br>
                            </div>
                            I use both, IPv4 and IPv6 and everything
                            works fine. I can ping through the tunnel,
                            traffic flows perfectly, but when i try to
                            configure OSPF using the Bird routing
                            daemon, i didn't even see a HELLO message.
                            Also when trying to list the interface using
                            'show ospf interfaces' i didn't even see the
                            Interface.<br>
                            <br>
                          </div>
                          For IPv6 i use 2a03.... as prefix.<br>
                        </div>
                        Should i configure multicast IPv6 (fe80::) on
                        the interface too to get OSPF working?<br>
                        <br>
                      </div>
                      Interesting fact: BGB using Bird works just fine.<br>
                      <br>
                    </div>
                    Anyone here that could help me?<br>
                    <br>
                    <br>
                  </div>
                  Thanks a lot.<br>
                  <br>
                </div>
                Best regards,<br>
              </div>
              Cedi<br>
            </div>
            _______________________________________________<br>
            WireGuard mailing list<br>
            <a href="mailto:WireGuard@lists.zx2c4.com" target="_blank"
              moz-do-not-send="true">WireGuard@lists.zx2c4.com</a><br>
            <a href="https://lists.zx2c4.com/mailman/listinfo/wireguard"
              rel="noreferrer" target="_blank" moz-do-not-send="true">https://lists.zx2c4.com/mailman/listinfo/wireguard</a><br>
          </blockquote>
        </div>
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
    <p>I have something like this (but with frr/quagga)<br>
    </p>
    <p><br>
      router ospf<br>
      ospf router-id 172.16.223.2<br>
      network 192.168.123.0/24 area 1<br>
      network 172.16.223.0/24 area 1<br>
    </p>
    <p>172.16.223.2 being the wg0 local interface</p>
    <p>Regards<br>
    </p>
  </body>
</html>

--------------BBBE0EF7047F8B7A7B945CDB--
