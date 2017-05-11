Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6b9cfc09
 for <wireguard@lists.zx2c4.com>;
 Thu, 11 May 2017 11:33:33 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d74a25c5
 for <wireguard@lists.zx2c4.com>;
 Thu, 11 May 2017 11:33:33 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 951fee11
 for <wireguard@lists.zx2c4.com>;
 Thu, 11 May 2017 11:33:33 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id c8320d99
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 11 May 2017 11:33:32 +0000 (UTC)
Received: by mail-oi0-f48.google.com with SMTP id h4so26548379oib.3
 for <wireguard@lists.zx2c4.com>; Thu, 11 May 2017 04:44:10 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAGzienFjbbm-NY5c8EEY5sB+pGx7xbs8r5ac4+G8smfOp0Nzpg@mail.gmail.com>
References: <CAGzienFjbbm-NY5c8EEY5sB+pGx7xbs8r5ac4+G8smfOp0Nzpg@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 11 May 2017 13:44:09 +0200
Message-ID: <CAHmME9q7TWDKXp0d+esk9bQ8VCu05xfrS5HU7Ab9hpVu1BzWAQ@mail.gmail.com>
Subject: Re: Ability to bind wireguard to specific interface / ip address
To: Damian Kaczkowski <damian.kaczkowski@gmail.com>
Content-Type: text/plain; charset=UTF-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi Damian,

Indeed right now WireGuard lets you specify a "listen port", but then
defaults to opening two sockets, one for v4 and one for v6, on the ANY
address. This generally isn't a problem because WireGuard is silent
unless it's sent fully authenticated packets. For ease of use, I
figured that it should accept these from anywhere, since if it's
authenticated, it's authenticated. But there is the sysadmin concern
of wanting to run other services on the same port, like a local DNS
resolver on 53. I can't think of a clean interface for allowing this,
however. Maybe you have some ideas? For example, if I simply allow
specifying IP:port, then how does this work for supporting v4&v6?
Maybe I should then allow for specifying an arbitrarily large sized
list of IP:port combos, and reserve one special case one for "both v4
and v6"? But this gets super complicated and I don't want that. Or
maybe I should rely on using the v6-mapped-v4 hack, except this isn't
available on all systems and isn't really efficient for what we're
doing inside WireGuard. So, hmm... I couldn't come up with a clean way
of doing this, so I just stuck with the simplest thing I could think
of... Ideas?

Jason
