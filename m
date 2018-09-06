Return-Path: cloos@jhcloos.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 23818a21
 for <wireguard@lists.zx2c4.com>; Thu, 6 Sep 2018 21:16:19 +0000 (UTC)
Received: from ore.jhcloos.com (ore.jhcloos.com [192.40.56.151])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6f74efb2
 for <wireguard@lists.zx2c4.com>; Thu, 6 Sep 2018 21:16:19 +0000 (UTC)
From: James Cloos <cloos@jhcloos.com>
To: wireguard@lists.zx2c4.com
Subject: Re: Let's talk about obfuscation again
In-Reply-To: <2c0808aa-47da-9d1a-1c35-1aec3d0c9acc@pobox.com> (Brian Candler's
 message of "Thu, 6 Sep 2018 16:24:00 +0100")
References: <mailman.1542.1536245115.2201.wireguard@lists.zx2c4.com>
 <2c0808aa-47da-9d1a-1c35-1aec3d0c9acc@pobox.com>
Date: Thu, 06 Sep 2018 17:16:28 -0400
Message-ID: <m3pnxquy1f.fsf@carbon.jhcloos.org>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Brian Candler <b.candler@pobox.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

>>>>> "BC" == Brian Candler <b.candler@pobox.com> writes:

BC> OK, so what about changing wireguard to use TCP and TLS on port 443?

Using udp/443 for one end could allow making it look like quic.

You'd need non-wg traffic on the port to reply like a quic server would.

-JimC
-- 
James Cloos <cloos@jhcloos.com>         OpenPGP: 0x997A9F17ED7DAEA6
