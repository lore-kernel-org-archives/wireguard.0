Return-Path: bruno@wolff.to
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 126356c0
 for <wireguard@lists.zx2c4.com>; Mon, 6 Nov 2017 16:12:57 +0000 (UTC)
Received: from wolff.to (wolff.to [98.103.208.27])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with SMTP id 3f25733f
 for <wireguard@lists.zx2c4.com>; Mon, 6 Nov 2017 16:12:56 +0000 (UTC)
Date: Mon, 6 Nov 2017 10:06:14 -0600
From: Bruno Wolff III <bruno@wolff.to>
To: Markus Woschank <markus.woschank@gmail.com>
Subject: Re: wg showconf
Message-ID: <20171106160614.GA27994@wolff.to>
References: <CAKUy5axWvBJfDQOjWSs7T0BCJ3Gw051Uu8gGw0BdSUOrzMAndw@mail.gmail.com>
 <20171104212701.527fadc1@vega.skynet.aixah.de>
 <CAKUy5ayAzFtkLvagJN=m9Qk5Zuk1uwhHkj19=kCKDqNDj4jBxQ@mail.gmail.com>
 <20171105000122.09eae100@vega.skynet.aixah.de>
 <20171105000327.0a772771@vega.skynet.aixah.de>
 <CAKUy5az5NX6hLDPsiUg1eoJEnJ4VK6Q2KyrKLzZ3BMAGrg2nnw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
In-Reply-To: <CAKUy5az5NX6hLDPsiUg1eoJEnJ4VK6Q2KyrKLzZ3BMAGrg2nnw@mail.gmail.com>
Cc: wireguard@lists.zx2c4.com
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Sun, Nov 05, 2017 at 01:05:18 +0100,
  Markus Woschank <markus.woschank@gmail.com> wrote:
>
>I imaging specifying an endpoint IP for a peer and than discovering
>that it connected from a different IP may be surprising to some. I
>generally prefer for things to break if I configure them the wrong way
>and not work "sometimes" (wrong endpoint IP on one side but the other
>first initiating the connection most of the time).

Perhaps, but I think you are thinking about the function incorrectly. The 
peer address shouldn't be looked at as a restriction, but rather as a hint 
of where to send traffic to reach the peer if no traffic has been received 
from it. In that light, wg's behavior makes sense. The last IP address 
the peer was seen at, is normally the best place to look for it later.
