Return-Path: jens@viisauksena.de
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 13009de6
 for <wireguard@lists.zx2c4.com>; Wed, 4 Jan 2017 21:12:49 +0000 (UTC)
Received: from viisauksena.de (v32412.1blu.de [178.254.39.111])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7664a6d9
 for <wireguard@lists.zx2c4.com>; Wed, 4 Jan 2017 21:12:49 +0000 (UTC)
Subject: Re: wg set allowed ip confusion
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
References: <5674e440-84df-dab2-41ef-327cf61dca1e@viisauksena.de>
 <CAHmME9rakpxbx+YU=_TnNqjJYSbACO+K6SPdRw4PZrwxAV5sqg@mail.gmail.com>
From: jens <jens@viisauksena.de>
Message-ID: <898feaf1-0f48-6820-1092-525d3dcadee4@viisauksena.de>
Date: Wed, 4 Jan 2017 22:21:03 +0100
MIME-Version: 1.0
In-Reply-To: <CAHmME9rakpxbx+YU=_TnNqjJYSbACO+K6SPdRw4PZrwxAV5sqg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

for some reason i was confused , that this should be the real incoming
ip , not the given ip for the wg if.

thx


On 04.01.2017 22:15, Jason A. Donenfeld wrote:
> On your server, each peer's allowed IPs should probably be a /32 of
> the actual internal IP address of the peer.

-- 
make the world nicer, please use PGP encryption
