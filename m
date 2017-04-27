Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0e178ad9
 for <wireguard@lists.zx2c4.com>;
 Thu, 27 Apr 2017 21:57:06 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 254cc9f4
 for <wireguard@lists.zx2c4.com>;
 Thu, 27 Apr 2017 21:57:06 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 45ce826d
 for <wireguard@lists.zx2c4.com>;
 Thu, 27 Apr 2017 21:57:06 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id b901571c
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 27 Apr 2017 21:57:06 +0000 (UTC)
Received: by mail-io0-f176.google.com with SMTP id a103so37442600ioj.1
 for <wireguard@lists.zx2c4.com>; Thu, 27 Apr 2017 15:06:03 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <em2d98f94f-86e9-49a2-88de-5960b0aa5e13@fmf-laptop>
References: <em2d98f94f-86e9-49a2-88de-5960b0aa5e13@fmf-laptop>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 28 Apr 2017 00:06:02 +0200
Message-ID: <CAHmME9qfaWhcAf1EEURxo9OkTo8HLW=g+amWbBonUKz7suvvAg@mail.gmail.com>
Subject: Re: System crash consistently after transferring around 280 Mbyte
 over Wireguard
To: Florian Franzeck <fmfranzeck@gmail.com>
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

Hey Florian,

So sorry to hear you're having this problem. That really really should
not be happening. I'm happy to help you debug it.

Could you enable netconsole on the box, so that you can send your
kernel log remotely over ethernet to a logging udp server in the event
of another crash? It's really easy to setup generally. Then you'll
have a good log for me to analyze.

Feel free to pop into IRC -- I'm zx2c4 -- and I can walk you through steps.

Jason
