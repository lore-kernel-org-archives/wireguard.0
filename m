Return-Path: uberscubajim@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 00c9b988
 for <wireguard@lists.zx2c4.com>;
 Sun, 10 Sep 2017 11:08:39 +0000 (UTC)
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 43e1f8fb
 for <wireguard@lists.zx2c4.com>;
 Sun, 10 Sep 2017 11:08:39 +0000 (UTC)
Received: by mail-wm0-f44.google.com with SMTP id 189so1420708wmh.1
 for <wireguard@lists.zx2c4.com>; Sun, 10 Sep 2017 04:34:38 -0700 (PDT)
Return-Path: <uberscubajim@gmail.com>
Received: from [10.23.162.36] ([141.143.213.13])
 by smtp.googlemail.com with ESMTPSA id a33sm3242248edd.67.2017.09.10.04.34.35
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 10 Sep 2017 04:34:35 -0700 (PDT)
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
From: Jim Darby <uberscubajim@gmail.com>
Subject: Timing issue (?) with wg-quick up on Raspberry Pi B+
Message-ID: <1e1740c3-f8cf-2ee2-d842-749b687cb737@gmail.com>
Date: Sun, 10 Sep 2017 12:34:34 +0100
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary="------------371B0ECA8C47CFD0EBEF3BA5"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

This is a multi-part message in MIME format.
--------------371B0ECA8C47CFD0EBEF3BA5
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

I've been using WireGuard and it's proven great. However, I've noticed a 
perclirary on a Raspberry Pi B+.

When I do a wg-quick up wg0 it echos the commands it's running and 
they're fine. So it says:

    [#] ip link add wg0 type wireguard
    [#] wg setconf wg0 /dev/fd/63
    [#] ip address add 192.168.2.3/32 dev wg0
    [#] ip link set mtu 1420 dev wg0
    [#] ip link set wg0 up
    [#] ip route add 192.168.2.0/24 dev wg0

However, if I look at wg0 I get:

wg0       Link encap:UNSPEC  HWaddr 
00-00-00-00-00-00-00-00-00-00-00-00-00-00-00-00
           UP POINTOPOINT RUNNING NOARP MTU:1420  Metric:1
           RX packets:0 errors:0 dropped:0 overruns:0 frame:0
           TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
           collisions:0 txqueuelen:1
           RX bytes:0 (0.0 B)  TX bytes:0 (0.0 B)

So, it's all worked /apart/ from the ip address add 192.168.2.3/32 dev wg0.

It works fine on the faster Raspberry Pi 3 and if run the ip address 
command manually it performs perfectly.

This leads me to suspect some sort of timing problem that rarely shows 
due to most machines being significantly faster.

Any ideas?

Regards,

Jim.



--------------371B0ECA8C47CFD0EBEF3BA5
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=utf-8">
  </head>
  <body text="#000099" bgcolor="#FFFFFF">
    <p><font face="Verdana">I've been using WireGuard and it's proven
        great. However, I've noticed a perclirary on a Raspberry Pi B+.</font></p>
    <p><font face="Verdana">When I do a wg-quick up wg0 it echos the
        commands it's running and they're fine. So it says:</font></p>
    <blockquote>
      <p><font face="Verdana">[#] ip link add wg0 type wireguard<br>
          [#] wg setconf wg0 /dev/fd/63<br>
          [#] ip address add 192.168.2.3/32 dev wg0<br>
          [#] ip link set mtu 1420 dev wg0<br>
          [#] ip link set wg0 up<br>
          [#] ip route add 192.168.2.0/24 dev wg0<br>
        </font></p>
    </blockquote>
    <p><font face="Verdana">However, if I look at wg0 I get:</font></p>
    <p><font face="Verdana">wg0       Link encap:UNSPEC  HWaddr
        00-00-00-00-00-00-00-00-00-00-00-00-00-00-00-00  </font><br>
      <font face="Verdana">          UP POINTOPOINT RUNNING NOARP 
        MTU:1420  Metric:1</font><br>
      <font face="Verdana">          RX packets:0 errors:0 dropped:0
        overruns:0 frame:0</font><br>
      <font face="Verdana">          TX packets:0 errors:0 dropped:0
        overruns:0 carrier:0</font><br>
      <font face="Verdana">          collisions:0 txqueuelen:1 </font><br>
      <font face="Verdana">          RX bytes:0 (0.0 B)  TX bytes:0 (0.0
        B)</font><br>
      <font face="Verdana"><br>
      </font></p>
    <p><font face="Verdana">So, it's all worked <i>apart</i> from the </font><font
        face="Verdana"><font face="Verdana">ip address add
          192.168.2.3/32 dev wg0.</font></font></p>
    <p><font face="Verdana"><font face="Verdana">It works fine on the
          faster Raspberry Pi 3 and if run the ip address command
          manually it performs perfectly.</font></font></p>
    <p><font face="Verdana"><font face="Verdana">This leads me to
          suspect some sort of timing problem that rarely shows due to
          most machines being significantly faster.</font></font></p>
    <p><font face="Verdana"><font face="Verdana">Any ideas?</font></font></p>
    <p><font face="Verdana"><font face="Verdana">Regards,</font></font></p>
    <p><font face="Verdana"><font face="Verdana">Jim.<br>
        </font></font></p>
    <p><font face="Verdana"><br>
      </font></p>
  </body>
</html>

--------------371B0ECA8C47CFD0EBEF3BA5--
