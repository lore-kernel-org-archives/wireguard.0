Return-Path: bruno@wolff.to
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 14fa9901
 for <wireguard@lists.zx2c4.com>;
 Mon, 27 Nov 2017 13:44:35 +0000 (UTC)
Received: from wolff.to (wolff.to [98.103.208.27])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with SMTP id c129461f
 for <wireguard@lists.zx2c4.com>;
 Mon, 27 Nov 2017 13:44:35 +0000 (UTC)
Date: Mon, 27 Nov 2017 07:49:14 -0600
From: Bruno Wolff III <bruno@wolff.to>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: Should I expect faster recovery after one side goes down
Message-ID: <20171127134914.GA9392@wolff.to>
References: <20171127094931.GA3104@wolff.to>
 <CAHmME9q+giuOXVz1=hE-F34vFMP0GxzveMzLbzrjeXbbjnrGCQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
In-Reply-To: <CAHmME9q+giuOXVz1=hE-F34vFMP0GxzveMzLbzrjeXbbjnrGCQ@mail.gmail.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Mon, Nov 27, 2017 at 12:04:06 +0100,
  "Jason A. Donenfeld" <Jason@zx2c4.com> wrote:
>Hi Bruno,
>
>The first question is - how long?

For "systemctl iptables stop" I have waited around a minute before 
using control C. After running "systemctl stop wireguard" or 
"systemctl restart wireguard" (which will delete wg0) "systemctl stop 
iptables" will run with no noticeable delay.

For network traffic, I waited around 10 minutes and things were still not 
working. Web page loads would still time out after a minute or two. But 
I did have a few DNS lookups succeed. I'm not sure if I did something 
that allowed a value to get cached (there is a local caching resolver 
on the affected machines) or if a response eventually made it through. 
After "systemctl restart wireguard" things start working normal right 
away. So I don't know the delay for specific traffic, but it looks to 
be at least a minute for most traffic. The problem does not seem to 
resolve for at least 10 minutes, though I don't think I have ever seen it 
resolve on its own.
