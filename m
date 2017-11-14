Return-Path: bruno@wolff.to
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 138dfdfa
 for <wireguard@lists.zx2c4.com>;
 Tue, 14 Nov 2017 13:22:43 +0000 (UTC)
Received: from wolff.to (wolff.to [98.103.208.27])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with SMTP id 80c220cf
 for <wireguard@lists.zx2c4.com>;
 Tue, 14 Nov 2017 13:22:43 +0000 (UTC)
Date: Tue, 14 Nov 2017 07:25:51 -0600
From: Bruno Wolff III <bruno@wolff.to>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: Roaming Mischief
Message-ID: <20171114132551.GB13027@wolff.to>
References: <CAHmME9pW_0o8C+ovxgN3_-6csAa2sjF4hXo=24bhsi0jo=AP0Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
In-Reply-To: <CAHmME9pW_0o8C+ovxgN3_-6csAa2sjF4hXo=24bhsi0jo=AP0Q@mail.gmail.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Tue, Nov 14, 2017 at 10:59:03 +0100,
  "Jason A. Donenfeld" <Jason@zx2c4.com> wrote:
>(Endpoint=my.server.whatever.zx2c4.com:51820!), that would prevent
>servers from roaming; the client would still roam in the eyes of the
>server, but the server, would no longer roam in the eyes of the
>client. In other words, an option -- gasp, a nob! -- to disable
>roaming on a per-by-peer one-sided basis. As you know, I don't really
>like nobs. And I'd hate to add this, and then for people to use it,
>and then loose some nice aspects of roaming, if it's not really even
>required.

If you know your other end point is at a fixed address you can use 
iptables (or the equivalent) to enforce this. I don't think it needs 
to be in WireGuard.
