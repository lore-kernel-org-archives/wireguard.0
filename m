Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e170eb0d
 for <wireguard@lists.zx2c4.com>;
 Thu, 10 Aug 2017 14:07:51 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4076f839
 for <wireguard@lists.zx2c4.com>;
 Thu, 10 Aug 2017 14:07:51 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d0ea0b22
 for <wireguard@lists.zx2c4.com>;
 Thu, 10 Aug 2017 14:26:54 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id c180033b
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 10 Aug 2017 14:26:53 +0000 (UTC)
Received: by mail-it0-f49.google.com with SMTP id 76so13778460ith.0
 for <wireguard@lists.zx2c4.com>; Thu, 10 Aug 2017 07:29:55 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAF75rJDj79FU7GMa1DKxPNZ9V2dSW0+rFUDQjmEJ_z3ZDeuuGA@mail.gmail.com>
References: <CAF75rJBdfeD-7MpDGfFBV=bLbm0-H--mFin30QL9jDmpd4z1jw@mail.gmail.com>
 <CAHmME9oj1N3PdutkA1dAPOieqn6ukUPnRONp-_iBck1HhnjZiw@mail.gmail.com>
 <CAF75rJDubyJwgrwTFTTzM4nKX2e=+6h_qBBC+Vt4FvzVhbfnuw@mail.gmail.com>
 <CAHmME9pujFf3pUAr9NZK81DZMQHYsH1gvgh3uH6RAQwNEZ8JDA@mail.gmail.com>
 <CAF75rJD7ZcSKp6WiEHg+VUa7=07-+9P3r6TxU6s9ieW+LdkNhQ@mail.gmail.com>
 <CAF75rJD3LH-CcPt2Da2qfxtv7C+W4Ed=ORkUg0L2vW1QiUfBcg@mail.gmail.com>
 <CAHmME9rJ7BiinhPRhOqzAjZJEdc=wKzdk80Dvi=xQnP2fu_eqw@mail.gmail.com>
 <CAF75rJDj79FU7GMa1DKxPNZ9V2dSW0+rFUDQjmEJ_z3ZDeuuGA@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 10 Aug 2017 16:29:54 +0200
Message-ID: <CAHmME9q5T-KpTatXxLZ_H_j_Ly=ZTX63wKTeYD=jqKQeupFFpQ@mail.gmail.com>
Subject: Re: Multihomed server issue
To: Wang Jian <larkwang@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>,
 Jan De Landtsheer <jan@delandtsheer.eu>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi Wang,

Did you have any luck reproducing this with the netns.sh script?

Here's what's happening here:

1. Packet from peer P arrives from src:A dst:B
2. WireGuard records that it should contact P at src:B dst:A
3. When sending an encrypted packet to P, it asks for which interface
to use for src:B dst:A. The routing API returns interface I.
4. We ask whether interface I has an address B assigned to it. If yes,
we transmit the packet as src:B dst:A using interface I, and return.
If no, we move to step 5:
5. We ask which interface and src IP we should use for src:default
dst:A. The routing API returns interface I' (which may be the same as
I or perhaps not) and a default src address, B', for interface I'.
6. We transmit the packet as src:B' dst:A using interface I'.

In the past, this has been sufficient for handling issues with
multihomed servers, while still dealing gracefully with IP address
changes.

It seems like the problem you're facing is that B does not belong to
I, because B belongs to an unrouted dummy0 interface. The solution
would be to change the question of step 4 to instead ask if _any_
interface contains B, not just the returned interface I. While this is
essentially what's done for IPv6, I'm not certain this is the correct
behavior for IPv4. Do you know of any relevant RFCs for your use of v4
dummy interfaces and RTS routing? Or some other reference?

Please do let me know whether the above is an accurate representation
of the problem you're facing.

Jason
