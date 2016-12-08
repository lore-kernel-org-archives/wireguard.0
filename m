Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 05033e56
 for <wireguard@lists.zx2c4.com>; Thu, 8 Dec 2016 00:48:48 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5f6c55b3
 for <wireguard@lists.zx2c4.com>; Thu, 8 Dec 2016 00:48:48 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fae48e0d
 for <wireguard@lists.zx2c4.com>; Thu, 8 Dec 2016 00:48:48 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 7a9a699b
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 8 Dec 2016 00:48:47 +0000 (UTC)
Received: by mail-wm0-f54.google.com with SMTP id g23so194482543wme.1
 for <wireguard@lists.zx2c4.com>; Wed, 07 Dec 2016 16:54:16 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <87d1h3jszm.fsf@alice.fifthhorseman.net>
References: <CAHmME9pEq1weLxpOC1c0_nFcO9pmJRtTQ3=H8Hh8AtZyhamqpw@mail.gmail.com>
 <87d1h3jszm.fsf@alice.fifthhorseman.net>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 8 Dec 2016 01:54:14 +0100
Message-ID: <CAHmME9rPzC7uXRK3EUBkzG4uT=on05BwQhKvOUUiTT4+i7ma9g@mail.gmail.com>
Subject: Re: Ephemeral key lifetime & system sleep
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset=UTF-8
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Very much a work in progress, but here's a first stab:
https://git.zx2c4.com/WireGuard/commit/?id=dc89b0ffcb38f668310efdabe7a415ead0742d70
