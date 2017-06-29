Return-Path: reuben.m.work@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d69023e1
 for <wireguard@lists.zx2c4.com>;
 Thu, 29 Jun 2017 15:30:45 +0000 (UTC)
Received: from mail-it0-f48.google.com (mail-it0-f48.google.com
 [209.85.214.48])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ba7bc4d4
 for <wireguard@lists.zx2c4.com>;
 Thu, 29 Jun 2017 15:30:44 +0000 (UTC)
Received: by mail-it0-f48.google.com with SMTP id v202so47588105itb.0
 for <wireguard@lists.zx2c4.com>; Thu, 29 Jun 2017 08:47:31 -0700 (PDT)
Return-Path: <reuben.m.work@gmail.com>
Received: from travesty.localnet ([75.98.116.245])
 by smtp.gmail.com with ESMTPSA id m97sm2856667ioi.32.2017.06.29.08.47.29
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 29 Jun 2017 08:47:29 -0700 (PDT)
From: Reuben Martin <reuben.m.work@gmail.com>
To: wireguard@lists.zx2c4.com
Subject: snapshot 0.0.20170628 broken?
Date: Thu, 29 Jun 2017 10:47:28 -0500
Message-ID: <2918068.8WQJdSgOSh@travesty>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Something is off with this latest snapshot:

=2D Computer-X sitting in the cloud accepting incomming connections.

=2D Computer-A sits behind a masquerade NAT or a remote network. Computer-A=
 can=20
connect to Computer-X, and then create a TCP session with services on=20
Computer-X directly over the wg0 interface.

=2D Computer-B is behind the same NAT as Computer-A. It can also create a=20
connection with Computer-X. It gets a response pinging Computer-X on it=E2=
=80=99s wg0=20
address, but it cannont create a TCP session with services on Computer-X ov=
er=20
the wg0 interface.

The only thing I have found that might be relevant is that A was the first =
to=20
connect, so the NAT port assigned is the same as the port that wireguard on=
 X=20
is listening to. Where-as B gets assigned a random port on the NAT side. Th=
at =20
may just be coincidental though. Downgrading to 20170613 and TCP sessions w=
ork=20
from all connections again.

=2DReuben
