Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 77d5a7b1
 for <wireguard@lists.zx2c4.com>;
 Thu, 21 Sep 2017 22:25:19 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d65bf93e
 for <wireguard@lists.zx2c4.com>;
 Thu, 21 Sep 2017 22:25:19 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c5a72e0d
 for <wireguard@lists.zx2c4.com>;
 Thu, 21 Sep 2017 22:44:22 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 289ec4a2
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 21 Sep 2017 22:44:21 +0000 (UTC)
Received: by mail-io0-f175.google.com with SMTP id v36so14374872ioi.1
 for <wireguard@lists.zx2c4.com>; Thu, 21 Sep 2017 15:52:44 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170921192148.GB2587@gmail.com>
References: <20170921192148.GB2587@gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 22 Sep 2017 00:52:43 +0200
Message-ID: <CAHmME9qPeMve8rRUNCsMpwHxgbXwomj2TCC_5CFKQoA+q0c3eQ@mail.gmail.com>
Subject: Re: 2-factor auth options
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi Konstantin,

The easiest way would be to add OTP to the part of your infra that
does the key exchange. That is, if you have some kind of HTTPS
REST-based API or an SSH-based API, you can have the server not accept
a new public key until the OTP challenge is satisfied.

Alternatively, you could do OTP in-band, in order to authorize that
public key for a certain window of time before inactivity. In this
scheme, you'd disallow access to the network segment based on firewall
rules until a certain in-band challenge is made -- perhaps by
contacting a certain sandboxed server and answering an OTP challenge
there

(At some point it is planned for WireGuard to have an API for sending
control messages directly to a public key, not via an IP address,
which will provide another option for in-band challenges (in addition
to dynamic configuration of IPs), but it's not immediately obvious
that this actually simplifies things, which is why I haven't yet
implemented the plan.)

What kind of infrastructure are you imagining? Is this for kernel.org?

Jason
