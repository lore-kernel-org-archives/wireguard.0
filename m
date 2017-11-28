Return-Path: bruno@wolff.to
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5b7722a2
 for <wireguard@lists.zx2c4.com>;
 Tue, 28 Nov 2017 08:38:00 +0000 (UTC)
Received: from wolff.to (wolff.to [98.103.208.27])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with SMTP id bbd57613
 for <wireguard@lists.zx2c4.com>;
 Tue, 28 Nov 2017 08:38:00 +0000 (UTC)
Date: Tue, 28 Nov 2017 02:42:37 -0600
From: Bruno Wolff III <bruno@wolff.to>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: Should I expect faster recovery after one side goes down
Message-ID: <20171128084237.GA12292@wolff.to>
References: <20171127094931.GA3104@wolff.to>
 <CAHmME9q+giuOXVz1=hE-F34vFMP0GxzveMzLbzrjeXbbjnrGCQ@mail.gmail.com>
 <20171127134914.GA9392@wolff.to> <20171127173354.GA17685@wolff.to>
 <CAHmME9rq+eaLMZP+a1OAcu1=65X7Q_PrsMNBwAm7U2HaNWfUVQ@mail.gmail.com>
 <20171127182558.GA19220@wolff.to> <20171128061306.GA7842@wolff.to>
 <20171128064413.GA9218@wolff.to>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
In-Reply-To: <20171128064413.GA9218@wolff.to>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Tue, Nov 28, 2017 at 00:44:13 -0600,
  Bruno Wolff III <bruno@wolff.to> wrote:
>
>I think the correct fix is to know if I reboot the router for testing 
>something, I need to also restart wireguard to make sure it is sending 
>data to the expected port. This isn't going to be an issue in normal 
>operation.

I found a way to make it work more automatically. The reason the port 
was getting reassigned was because the original connection packet was 
being tracked and was conflicting with the source nat mapping even though 
in reallity the connection was the same. By putting in CT --notrack rules 
I was able to block that traking and without the conflict the port doesn't 
get remapped. I don't need tracking or the original connection for my 
firewall rules so this should be OK. On testing it seems to work as 
expected. Now when I reboot my router, my laptop reconnects and the wireguard 
tunnel works without having to restart it.
