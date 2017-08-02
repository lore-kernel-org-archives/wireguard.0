Return-Path: bruno@wolff.to
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0bc23e9a
 for <wireguard@lists.zx2c4.com>; Wed, 2 Aug 2017 12:25:22 +0000 (UTC)
Received: from wolff.to (wolff.to [98.103.208.27])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with SMTP id 38628bec
 for <wireguard@lists.zx2c4.com>; Wed, 2 Aug 2017 12:25:22 +0000 (UTC)
Date: Wed, 2 Aug 2017 07:41:21 -0500
From: Bruno Wolff III <bruno@wolff.to>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: Compile time assertion failure
Message-ID: <20170802124121.GA27945@wolff.to>
References: <20170802121920.GA3119@wolff.to> <20170802122430.GA11203@wolff.to>
 <20170802122935.GA21536@wolff.to>
 <CAHmME9qwUezvL6Aab+r=DSqZ8RtFB-odpBZ70_2SAheL58A66w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
In-Reply-To: <CAHmME9qwUezvL6Aab+r=DSqZ8RtFB-odpBZ70_2SAheL58A66w@mail.gmail.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Wed, Aug 02, 2017 at 14:38:59 +0200,
  "Jason A. Donenfeld" <Jason@zx2c4.com> wrote:
>
>Thanks for the report. Looks like I was relying on optimization
>behavior of a gcc newer than yours. I'll revert.

commit 107735eaea0f48c1f5bfc0a6ca82f1879a850b98 (HEAD -> master, origin/master, origin/HEAD)
Author: Jason A. Donenfeld <Jason@zx2c4.com>
Date:   Tue Aug 1 22:47:26 2017 +0200

    routingtable: unbloat BUG()
    
    Really isn't necessary.

fixes the problem for me. I tested building and connecting to another 
machine.

Thanks!
