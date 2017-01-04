Return-Path: dkg@fifthhorseman.net
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0a859283
 for <wireguard@lists.zx2c4.com>; Wed, 4 Jan 2017 20:54:04 +0000 (UTC)
Received: from che.mayfirst.org (che.mayfirst.org [162.247.75.118])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 19ea8df7
 for <wireguard@lists.zx2c4.com>; Wed, 4 Jan 2017 20:54:04 +0000 (UTC)
From: Daniel Kahn Gillmor <dkg@fifthhorseman.net>
To: Christian Hesse <list@eworm.de>, wireguard@lists.zx2c4.com
Subject: Re: [PATCH 1/1] tools: remove DESTDIR for autodetection
In-Reply-To: <20170104201416.25893-1-list@eworm.de>
References: <CAHmME9qEs=oHr=r=dfAeiL=QGXxOeNmuFUkrnbv7L4MBbHb+tw@mail.gmail.com>
 <20170104201416.25893-1-list@eworm.de>
Date: Wed, 04 Jan 2017 16:02:44 -0500
Message-ID: <87a8b6k07f.fsf@alice.fifthhorseman.net>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Christian Hesse <mail@eworm.de>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Wed 2017-01-04 15:14:16 -0500, Christian Hesse wrote:
> From: Christian Hesse <mail@eworm.de>
>
> DESTDIR is always empty, no need to check anything there. Check the main
> system instead.

why are we checking either place?  It's entirely possible that my
dedicated build farm doesn't have any bash completion mechanisms
installed, even if my development system does.

           --dkg
