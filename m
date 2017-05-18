Return-Path: dkg@fifthhorseman.net
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e8df104b
 for <wireguard@lists.zx2c4.com>;
 Thu, 18 May 2017 19:33:18 +0000 (UTC)
Received: from che.mayfirst.org (che.mayfirst.org [162.247.75.118])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c2c0956e
 for <wireguard@lists.zx2c4.com>;
 Thu, 18 May 2017 19:33:18 +0000 (UTC)
From: Daniel Kahn Gillmor <dkg@fifthhorseman.net>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Jannis Pinter <jannis@pinterjann.is>
Subject: Re: Compatibiliyt issues between 0.0.20170115 and 0.0.20170517
In-Reply-To: <CAHmME9osBYxRKFwSCroHcpORdCj8d8x1=WrE=6iR0DRofB=rAg@mail.gmail.com>
References: <16c492cb-af24-e864-cd49-c8c2c5457ee4@pinterjann.is>
 <CAHmME9osBYxRKFwSCroHcpORdCj8d8x1=WrE=6iR0DRofB=rAg@mail.gmail.com>
Date: Thu, 18 May 2017 15:39:48 -0400
Message-ID: <8737c29cor.fsf@fifthhorseman.net>
MIME-Version: 1.0
Content-Type: text/plain
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Thu 2017-05-18 20:43:11 +0200, Jason A. Donenfeld wrote:

> Only use 0.0.20170517.

i think this was the first incompatible revision that has been released.
is that correct?

i know we're in early days with wireguard, and there's no guarantee of
protocol compatibility.  but i wonder whether we should signal
explicitly when there is an update that requires both sides to upgrade
at the same time.  Should i have put it in the NEWS file in the debian
package, for example?  Or are there other forms of signalling that we
should use to communicate this better?

         --dkg
