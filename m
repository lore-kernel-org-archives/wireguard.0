Return-Path: bruno@wolff.to
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7fcd0254
 for <wireguard@lists.zx2c4.com>;
 Wed, 22 Nov 2017 17:25:41 +0000 (UTC)
Received: from wolff.to (wolff.to [98.103.208.27])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with SMTP id 77c26888
 for <wireguard@lists.zx2c4.com>;
 Wed, 22 Nov 2017 17:25:41 +0000 (UTC)
Date: Wed, 22 Nov 2017 11:28:27 -0600
From: Bruno Wolff III <bruno@wolff.to>
To: d tbsky <tbskyd@gmail.com>
Subject: Re: roaming and ddns dynamic ip
Message-ID: <20171122172827.GB26189@wolff.to>
References: <CAC6SzHKVvOEZYXiuK-O6jMN=OOPjfogq2bbeHnYA1xoLew-OcQ@mail.gmail.com>
 <CAHmME9qmZCt7GDeXZtDBwSeg2z1Md9UQENbNo5TXvSqWion9rA@mail.gmail.com>
 <CAC6SzHJ_xHN5fCn2mQ=xrx2Uz6YbZLoHE6As0bwE1SmzprCn+g@mail.gmail.com>
 <D8DF2FC5-F5BF-474E-B774-C0FF4D993DB9@lonnie.abelbeck.com>
 <CAC6SzHKzraOBNh0B9C9PUojSJy2r2XvfqehzEnmzzK5GJeuG6w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
In-Reply-To: <CAC6SzHKzraOBNh0B9C9PUojSJy2r2XvfqehzEnmzzK5GJeuG6w@mail.gmail.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Thu, Nov 23, 2017 at 00:00:51 +0800,
  d tbsky <tbskyd@gmail.com> wrote:
>
>when client is behind firewall via nat to internet, and server has
>dynamic ip, I don't think keepalive will help. since the changed
>server can not connect to client, it needs client to initial the
>connection. under openvpn, keepalive can detect broken link and try to
>restart itself, then client can reconnect to server automatically.

If both sides are using keep alives it could help. It won't work if both sides 
change IP addresses between keep alives. And if the client is turned off 
when the server changes IP addresses that is going to apply.
