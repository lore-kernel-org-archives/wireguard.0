Return-Path: tcondeixa@veniamworks.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a98ec166
 for <wireguard@lists.zx2c4.com>;
 Mon, 26 Jun 2017 12:14:14 +0000 (UTC)
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c3f38263
 for <wireguard@lists.zx2c4.com>;
 Mon, 26 Jun 2017 12:14:14 +0000 (UTC)
Received: by mail-wm0-f51.google.com with SMTP id w126so5912385wme.0
 for <wireguard@lists.zx2c4.com>; Mon, 26 Jun 2017 05:30:37 -0700 (PDT)
Return-Path: <tcondeixa@veniamworks.com>
From: Tiago Condeixa <tcondeixa@veniamworks.com>
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Subject: Wireguard performance
Message-Id: <CCB871CE-1067-41E6-BE5F-837362773C7D@veniamworks.com>
Date: Mon, 26 Jun 2017 13:30:35 +0100
To: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi,

I have been doing more experiments with heterogenous technologies and =
connections and there is a scenario where I believe that something =
strange is happening with wireguard.
When my board is using a 100 Mbps ethernet connection in a local network =
the iperf3 TCP is able to reach 95Mbps with the direct IP route, but =
when using wireguard the throughput reduces to 65/70 Mbps.=20
It=E2=80=99s not a bad result at all, but I noticed that with wireguard =
the iperf3 CPU consumption goes from 10% to 70% when comparing with =
direct IP route. Do you have any idea why is this happening? ...the =
overall system CPU can slightly increase but I do not expect that happen =
with iperf3.
In other scenarios with other technologies and networks wireguard =
usually reduce 5% of the throughput but in this case it goes beyond 25%.

Thanks a lot,
Tiago=
