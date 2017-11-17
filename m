Return-Path: markus.woschank@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 632090d9
 for <wireguard@lists.zx2c4.com>;
 Fri, 17 Nov 2017 17:18:51 +0000 (UTC)
Received: from mail-ot0-f175.google.com (mail-ot0-f175.google.com
 [74.125.82.175])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e2913ff3
 for <wireguard@lists.zx2c4.com>;
 Fri, 17 Nov 2017 17:18:50 +0000 (UTC)
Received: by mail-ot0-f175.google.com with SMTP id b49so2604593otj.5
 for <wireguard@lists.zx2c4.com>; Fri, 17 Nov 2017 09:23:21 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <593d6d3a-550e-a14d-4c1d-f7ee8e731d87@gmail.com>
References: <CAHmME9pW_0o8C+ovxgN3_-6csAa2sjF4hXo=24bhsi0jo=AP0Q@mail.gmail.com>
 <CAKUy5axhFKvgeGY1FrP5S4UON2QPV=7jQjZM268qG-M3RCAcVw@mail.gmail.com>
 <593d6d3a-550e-a14d-4c1d-f7ee8e731d87@gmail.com>
From: Markus Woschank <markus.woschank@gmail.com>
Date: Fri, 17 Nov 2017 18:23:20 +0100
Message-ID: <CAKUy5axo5jO=6qv1XEsHvOUkcm6z7r4UW1hV+Oeomq_dJqQXJg@mail.gmail.com>
Subject: Re: Roaming Mischief
To: Aaron Jones <aaronmdjones@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

> WireGuard is not a client-server architecture
Did not claim otherwise.

> by removing the endpoint, you are preventing this peer from initiating.

Two peers forming a connection have the following properties/aspects:
* at least one has a fixed IP/DNS entry and this is set in the
configuration as endpoint in the other peer's configuration
* if one peer is in roaming mode it makes no sense to specify it's
endpoint in the other peers's configuration
* if both peers have fixed addresses it makes sense to specify each
other endpoint IPs in the configuration so the connection can be
established from both sides at any time

Please prove me wrong and supply an example where it makes sense to
have a roaming peer's endpoint set, where the roaming peer _really_
roams (changes it's IP) and where on reboot/reset/whatsoever the
originally set endpoint IP in the configuration magically makes any
sense again.

Markus
