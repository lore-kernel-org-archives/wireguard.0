Return-Path: bruno@wolff.to
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a8f24f5a
 for <wireguard@lists.zx2c4.com>;
 Mon, 27 Nov 2017 18:21:19 +0000 (UTC)
Received: from wolff.to (wolff.to [98.103.208.27])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with SMTP id 38203476
 for <wireguard@lists.zx2c4.com>;
 Mon, 27 Nov 2017 18:21:19 +0000 (UTC)
Date: Mon, 27 Nov 2017 12:25:58 -0600
From: Bruno Wolff III <bruno@wolff.to>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: Should I expect faster recovery after one side goes down
Message-ID: <20171127182558.GA19220@wolff.to>
References: <20171127094931.GA3104@wolff.to>
 <CAHmME9q+giuOXVz1=hE-F34vFMP0GxzveMzLbzrjeXbbjnrGCQ@mail.gmail.com>
 <20171127134914.GA9392@wolff.to> <20171127173354.GA17685@wolff.to>
 <CAHmME9rq+eaLMZP+a1OAcu1=65X7Q_PrsMNBwAm7U2HaNWfUVQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
In-Reply-To: <CAHmME9rq+eaLMZP+a1OAcu1=65X7Q_PrsMNBwAm7U2HaNWfUVQ@mail.gmail.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Mon, Nov 27, 2017 at 18:36:23 +0100,
  "Jason A. Donenfeld" <Jason@zx2c4.com> wrote:
>Hello Bruno,
>
>That's some pretty weird behavior, and it sounds like whatever the
>cause is is being obscured under layers of systemd. Perhaps come on
>into #wireguard on Freenode and we can debug this in real time? I've
>got a few ideas.

I don't have my laptop with me at work and breaking the wireguard tunnel 
to it will break my access to it from here. I could check configuration 
from work. I can bring it with me tomorrow, otherwise I'll probably get 
home too late for you tonight and I probably won't be up late enough 
to catch you early tomorrow. 

Probably I'll be able to reproduce the issue from work.
