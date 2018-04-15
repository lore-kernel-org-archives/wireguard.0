Return-Path: smntov@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ddf4d319
 for <wireguard@lists.zx2c4.com>;
 Sun, 15 Apr 2018 09:53:56 +0000 (UTC)
Received: from mail-wr0-f175.google.com (mail-wr0-f175.google.com
 [209.85.128.175])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 402edd6a
 for <wireguard@lists.zx2c4.com>;
 Sun, 15 Apr 2018 09:53:56 +0000 (UTC)
Received: by mail-wr0-f175.google.com with SMTP id z73so18242481wrb.0
 for <wireguard@lists.zx2c4.com>; Sun, 15 Apr 2018 03:08:19 -0700 (PDT)
Return-Path: <smntov@gmail.com>
Message-ID: <1523786895.1990.5.camel@gmail.com>
Subject: Re: Sharing peer data
From: ST <smntov@gmail.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 15 Apr 2018 13:08:15 +0300
In-Reply-To: <CAHmME9qpEVW3AwDPCUSUA_A4DJi+oTGoMX4V3fVyHk7aXsAZ6Q@mail.gmail.com>
References: <CAJq09z7tm6Cz7RyiO0GTTS7V6oXTVGpdF_ss3eYJT_qMPE=GwA@mail.gmail.com>
 <CAHmME9qpEVW3AwDPCUSUA_A4DJi+oTGoMX4V3fVyHk7aXsAZ6Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Sun, 2018-04-15 at 01:15 +0200, Jason A. Donenfeld wrote:
> Hi Luiz,
> 
> You could indeed arrange for something like this, either directly --
> if both IPs are accessible 

Which IPs do you mean here? Public IPs or private VPN IPs (i.e. those
defined within WireGuard configuration)? I got an idea how to do that
using SFTP... I'll write about it in a separate email...

Just one question: let's assume B and C got the required information
about each other's IPs/public keys from A. Will they now communicate
directly without relying on A in whatever way?... It is important to
know for the case when A is a server with metered paid traffic... Will
the communication between B and C affect the traffic of A or not?

Thank you!
