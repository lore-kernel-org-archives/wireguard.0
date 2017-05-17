Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id df2d60d3
 for <wireguard@lists.zx2c4.com>;
 Wed, 17 May 2017 13:48:55 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 152b2ba9
 for <wireguard@lists.zx2c4.com>;
 Wed, 17 May 2017 13:48:55 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0bf534f1
 for <wireguard@lists.zx2c4.com>;
 Wed, 17 May 2017 13:48:55 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id f480f8aa
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 17 May 2017 13:48:55 +0000 (UTC)
Received: by mail-oi0-f52.google.com with SMTP id h4so15967117oib.3
 for <wireguard@lists.zx2c4.com>; Wed, 17 May 2017 07:00:19 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAHmME9pGX9zH+A9ouz0g8g6R7ZheZ=sKu_seAZ8r-DtBRdY_Rw@mail.gmail.com>
References: <CAHmME9pGX9zH+A9ouz0g8g6R7ZheZ=sKu_seAZ8r-DtBRdY_Rw@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 17 May 2017 16:00:17 +0200
Message-ID: <CAHmME9o-PM0ma0E5tF868fBCmOfoSdJ8BYA+_Enbbq89t900+w@mail.gmail.com>
Subject: Re: Text-based IPC for Userspace Implementations
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hello list,

Re:JSON --

JSON is difficult to parse and requires large libraries, especially
for something like JSON-RPC. I'd rather not have these dependencies or
complications.

On the contrary, a simple key=value newline scheme can be parsed
trivially by anyone in a safe way, and allows for very quick in basic
implementations in nearly all environments, even bash. Even given a
JSON library, a stream of key=value is considerably easier and more
flexible in the parsing stage.

JSON is nice but it is not ideal for all environments.

Jason
