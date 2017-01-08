Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 01b24c38
 for <wireguard@lists.zx2c4.com>; Sun, 8 Jan 2017 22:39:48 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 66b44ae5
 for <wireguard@lists.zx2c4.com>; Sun, 8 Jan 2017 22:39:48 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 810eff1f
 for <wireguard@lists.zx2c4.com>; Sun, 8 Jan 2017 22:39:48 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 84afbb18
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Sun, 8 Jan 2017 22:39:48 +0000 (UTC)
Received: by mail-oi0-f46.google.com with SMTP id b126so673195797oia.2
 for <wireguard@lists.zx2c4.com>; Sun, 08 Jan 2017 14:49:20 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20170108224117.GB9445@tuxmachine.polynome.dn42>
References: <20170108224117.GB9445@tuxmachine.polynome.dn42>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 8 Jan 2017 23:49:18 +0100
Message-ID: <CAHmME9pZLDieAabMhjDQHxpj_TDd5OLjNEUpQrraFvXA0g7gmA@mail.gmail.com>
Subject: Re: [RFC] Handling multiple endpoints for a single peer
To: Baptiste Jonglez <baptiste@bitsofnetworks.org>
Content-Type: text/plain; charset=UTF-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Thanks for the proposal. Obviously the easiest solution is a userspace
decoupled one, but this might not necessarily be the most desirable.
However, it's possible the upcoming userspace event notification fd
support (epoll on an fd to learn when handshakes happen) and userspace
peer-message support (send an encrypted out of band non-IP packet
directly to a peer, for things like autoconfig) could play a nice role
in this.

But if it is in the kernel, the decision logic boils down essentially
to: there's a list of endpoints in a given order. Based on differing
metrics of success at differing points in time, the list gets
reordered, and packets are always sent to the top of the list. For
example, the list could be rotated or permutated on every handshake
retry. Or the various other RTT or routing metrics you mentioned
earlier.

However, this doesn't shine any light on the hardest problem: how to
update the list of addresses in a memory-bounded fashion. Right now,
if you receive an encrypted packet, the endpoint of that peer is
updated to the src address of that packet. With multi-endpoint, which
endpoint is updated? Is it simply appended to an ever-growing list of
recent endpoints? How to keep this clean and manageable?
