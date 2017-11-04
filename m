Return-Path: markus.woschank@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 917f95a8
 for <wireguard@lists.zx2c4.com>; Sat, 4 Nov 2017 20:01:33 +0000 (UTC)
Received: from mail-oi0-f48.google.com (mail-oi0-f48.google.com
 [209.85.218.48])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a3245dc6
 for <wireguard@lists.zx2c4.com>; Sat, 4 Nov 2017 20:01:32 +0000 (UTC)
Received: by mail-oi0-f48.google.com with SMTP id w197so4470918oif.6
 for <wireguard@lists.zx2c4.com>; Sat, 04 Nov 2017 13:04:25 -0700 (PDT)
MIME-Version: 1.0
Sender: markus.woschank@gmail.com
From: Markus Woschank <markus.woschank+wg@gmail.com>
Date: Sat, 4 Nov 2017 21:04:22 +0100
Message-ID: <CAKUy5axWvBJfDQOjWSs7T0BCJ3Gw051Uu8gGw0BdSUOrzMAndw@mail.gmail.com>
Subject: wg showconf
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hello everyone,

I'm having a minor issue with the showconf command:
The configuration generated may change over time without any settings
changed on the interface, I noticed that peers without an endpoint set
suddenly have an endpoint setting in the output once they established
a handshake with the remote peer.

Is there a specific reason for this behaviour? If not, then I would
argue that showconf should reflect the settings used to configure the
interface and not the current state.

Having the output of showconf reflect the original configuration in a
deterministic way enables configuration/provisioning software to check
if the interface is in the desired state and only take action if it's
not - that would be very helpful at least to me.

Thanks Markus
