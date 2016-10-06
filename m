Return-Path: bruno@wolff.to
Received: from wolff.to (wolff.to [98.103.208.27])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with SMTP id aca2cb4c
 for <wireguard@lists.zx2c4.com>; Thu, 6 Oct 2016 19:18:00 +0000 (UTC)
Date: Thu, 6 Oct 2016 14:27:43 -0500
From: Bruno Wolff III <bruno@wolff.to>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Message-ID: <20161006192743.GA12972@wolff.to>
References: <1475719977.650386.747317105.1837502D@webmail.messagingengine.com>
 <20161006150310.GB30704@wolff.to>
 <CAHmME9qj9AARx7S6RsyCnWYN4fJizeHfgeqW4zmFtGahLs--pg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
In-Reply-To: <CAHmME9qj9AARx7S6RsyCnWYN4fJizeHfgeqW4zmFtGahLs--pg@mail.gmail.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] auth-only wireguard
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Thu, Oct 06, 2016 at 19:32:36 +0200,
  "Jason A. Donenfeld" <Jason@zx2c4.com> wrote:
>On Thu, Oct 6, 2016 at 5:03 PM, Bruno Wolff III <bruno@wolff.to> wrote:
>> Without encryption you authentication won't be useful against attackers that
>> can modify packets or insert packets with the source address of your
>> contact.
>
>Either I've misunderstood you, or this is completely inaccurate.
>
>What do you mean exactly?

Someone able to watch and modify traffic can wait for authentication to occur 
and then take over the connection. So you don't know you are still 
communicating with the party that did the authentication. You need something 
protecting message integrity which is normally based on encryption, but I 
think there might be ways to do that with just hashing.
