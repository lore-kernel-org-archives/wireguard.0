Return-Path: bruno@wolff.to
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id dce178a8
 for <wireguard@lists.zx2c4.com>; Thu, 7 Dec 2017 13:32:46 +0000 (UTC)
Received: from wolff.to (wolff.to [98.103.208.27])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with SMTP id 8e557d54
 for <wireguard@lists.zx2c4.com>; Thu, 7 Dec 2017 13:32:46 +0000 (UTC)
Date: Thu, 7 Dec 2017 07:37:59 -0600
From: Bruno Wolff III <bruno@wolff.to>
To: Stefan Tatschner <rumpelsepp@sevenbyte.org>
Subject: Re: WireGuard Upstreaming Roadmap (November 2017)
Message-ID: <20171207133759.GA395@wolff.to>
References: <20171111044854.GA7956@zx2c4.com>
 <CAB=oiXZYChYMzqK4cufNy+Gr-QHK7jE=h8-9+zQMx67_xsLVoQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
In-Reply-To: <CAB=oiXZYChYMzqK4cufNy+Gr-QHK7jE=h8-9+zQMx67_xsLVoQ@mail.gmail.com>
Cc: wireguard@lists.zx2c4.com
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Thu, Dec 07, 2017 at 11:22:04 +0100,
  Stefan Tatschner <rumpelsepp@sevenbyte.org> wrote:
>
>Assuming I am right according the crypto agility, what's the upgrade
>path if any of the involved cryptographic algorithms will be declared
>insecure/broken? From my point of view wireguard tries to stay as
>simple as possible and in general that's a good idea. I am just a bit
>worrying about the possible lack of a clear upgrade path once
>wireguard is mainlined.

Having alternate crypto paths is also a weakness. There have been lots of 
downgrade attacks against systems that incorporate agility.
