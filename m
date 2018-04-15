Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1a1df800
 for <wireguard@lists.zx2c4.com>;
 Sun, 15 Apr 2018 13:54:25 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 263da70a
 for <wireguard@lists.zx2c4.com>;
 Sun, 15 Apr 2018 13:54:25 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b6458237
 for <wireguard@lists.zx2c4.com>;
 Sun, 15 Apr 2018 13:45:33 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 234e92bc
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 15 Apr 2018 13:45:33 +0000 (UTC)
Received: by mail-oi0-f41.google.com with SMTP id 126-v6so12252234oig.0
 for <wireguard@lists.zx2c4.com>; Sun, 15 Apr 2018 07:08:49 -0700 (PDT)
MIME-Version: 1.0
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 15 Apr 2018 16:08:48 +0200
Message-ID: <CAHmME9owJaafkWfz8ruaKWqATmQ9gfoxNtZNyxRJFjyQgr7yvw@mail.gmail.com>
Subject: PMTU Discovery Security Concerns
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
Cc: Luis Ressel <aranea@aixah.de>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi list,

[CC'ing Luis, who's been working on this with me.]

I've more or less figured out how to do PMTU discovery (something
along the lines of https://xn--4db.cc/WFHQzX2o/c inspired by the vti
driver). I wonder, however, if this is safe to do.

The basic idea is that if you're talking to a WireGuard peer via its
internal tunnel IP address, the kernel keeps some notion of what that
internal IP address's PMTU is. Meanwhile, WireGuard itself is talking
to that peer via its external endpoint IP address, and the kernel
keeps some notion of what that external IP address's PMTU is. If the
encrypted packets are larger than the external PMTU, well behaved
networks will send ICMP messages, indicating that packets sent to that
external endpoint IP should be smaller. This, however, doesn't have
anything to do with what the user is trying to send internally, and so
there will continue to be overly large packets sent.

The way to fix it would be to relay the external endpoint PMTU to the
internal tunnel PMTU. Then, when an external encrypted packet gets
dropped due to being overly large, the ICMP message for that winds up
affecting the internal tunneled IP address's PMTU, so that the next
message it sends is smaller. All is well, packets flow, and TCP
sessions no longer stall. This is generally how PMTU discovery works
with network tunnels.

The security problem is that those ICMP messages indicating we should
send smaller packets are unauthenticated, since they're triggered by
things external to the tunnel, rather than inside the tunnel. By
propagating the information from those unauthenticated ICMP messages
to state that concerns the inside of the tunnel, we're essentially
enabling an unauthenticated state injection. This could enable some
mischief. On the benign end of the spectrum, an attacker could launch
a DoS attack by causing the sending end to use smaller and smaller
packets. On the scarier end of the spectrum, an attacker could
intelligently do this to change the size of packets and observe the
way in which a data flow is rechunked, in order to infer something
about the actual data being encrypted.

These security concerns make me inclined to just simplistically
declare, "PMTU discovery in tunnels can't be done securely with the
existing Internet, so WireGuard doesn't support it." However,
undoubtedly smart people have thought about this before, and perhaps
they've come up with real solutions for this. Indeed I've come across
various discussions of the matter in the IPsec RFCs. But at the
present moment, I'm unsure what the most reasonable way forward is.

So, I thought if anyone on the list has thought about this extensively
before and would like to chime in with some wisdom, I'm all ears.

Regards,
Jason
