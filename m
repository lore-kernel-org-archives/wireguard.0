Return-Path: bruno@wolff.to
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8070a696
 for <wireguard@lists.zx2c4.com>;
 Mon, 27 Nov 2017 17:29:15 +0000 (UTC)
Received: from wolff.to (wolff.to [98.103.208.27])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with SMTP id 707c30bb
 for <wireguard@lists.zx2c4.com>;
 Mon, 27 Nov 2017 17:29:15 +0000 (UTC)
Date: Mon, 27 Nov 2017 11:33:54 -0600
From: Bruno Wolff III <bruno@wolff.to>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: Should I expect faster recovery after one side goes down
Message-ID: <20171127173354.GA17685@wolff.to>
References: <20171127094931.GA3104@wolff.to>
 <CAHmME9q+giuOXVz1=hE-F34vFMP0GxzveMzLbzrjeXbbjnrGCQ@mail.gmail.com>
 <20171127134914.GA9392@wolff.to>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
In-Reply-To: <20171127134914.GA9392@wolff.to>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Mon, Nov 27, 2017 at 07:49:14 -0600,
  Bruno Wolff III <bruno@wolff.to> wrote:
>On Mon, Nov 27, 2017 at 12:04:06 +0100,
> "Jason A. Donenfeld" <Jason@zx2c4.com> wrote:
>>Hi Bruno,
>>
>>The first question is - how long?

This might be related to the amount or type of traffic backed up. The two 
machines where this was very noticeable in testing had all of their traffic 
routed through the tunnel other than the encapsulating packets. (DNS traffic 
gets tunnelled.) Playing with this on my work machine where only traffic 
destined for a few specific hosts was tunnelled, I am finding it hard to 
duplicate the problem.
