Return-Path: labawi-wg@matrix-dream.net
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d09bea21
 for <wireguard@lists.zx2c4.com>;
 Sun, 16 Sep 2018 16:53:53 +0000 (UTC)
Received: from mail1.matrix-dream.net (mail1.matrix-dream.net
 [IPv6:2a0a:51c0::71])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1f6e6b3a
 for <wireguard@lists.zx2c4.com>;
 Sun, 16 Sep 2018 16:53:52 +0000 (UTC)
Date: Sun, 16 Sep 2018 16:54:58 +0000
From: Ivan =?iso-8859-1?Q?Lab=E1th?= <labawi-wg@matrix-dream.net>
To: Raffaele Spazzoli <rspazzol@redhat.com>
Subject: Re: what to do when the peers use different IPs to transmit and
 receive
Message-ID: <20180916165458.GA31165@matrix-dream.net>
References: <CACOeLq+PG-SFUhSZUejCVWc+uMnBq1ATRwUFFLQZBTCU6JMSew@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <CACOeLq+PG-SFUhSZUejCVWc+uMnBq1ATRwUFFLQZBTCU6JMSew@mail.gmail.com>
Cc: wireguard@lists.zx2c4.com
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi,

On Sun, Sep 16, 2018 at 08:21:02AM -0400, Raffaele Spazzoli wrote:
> ... then the IP that a  node uses for its outbound
> connection is not the same that its peer need to use for its inbound
> connections.

Who uses what for whose connection? You lost me here.
Looks like a broken network to me. Does TCP even work?

Anyway, SNAT/DNAT should be able to fix things up, if you want to go
that route.

Regards,
Ivan
