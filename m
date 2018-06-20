Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9ef29941
 for <wireguard@lists.zx2c4.com>;
 Wed, 20 Jun 2018 21:20:14 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4bf40e79
 for <wireguard@lists.zx2c4.com>;
 Wed, 20 Jun 2018 21:20:14 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 71cd65cf
 for <wireguard@lists.zx2c4.com>;
 Wed, 20 Jun 2018 21:19:01 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id ea4b29a0
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 20 Jun 2018 21:19:01 +0000 (UTC)
Received: by mail-oi0-f53.google.com with SMTP id k190-v6so946876oib.9
 for <wireguard@lists.zx2c4.com>; Wed, 20 Jun 2018 14:25:03 -0700 (PDT)
MIME-Version: 1.0
References: <b9a4b41fbe912803@frisell.zx2c4.com>
 <8B706799-0A06-449B-960B-08C017C58412@lonnie.abelbeck.com>
In-Reply-To: <8B706799-0A06-449B-960B-08C017C58412@lonnie.abelbeck.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 20 Jun 2018 23:24:51 +0200
Message-ID: <CAHmME9r+uOOT_50zG3XQwB79reOhFBysE04=3=btubVQMdbuyQ@mail.gmail.com>
Subject: Re: [ANNOUNCE] WireGuard Snapshot `0.0.20180620` Available
To: Lonnie Abelbeck <lists@lonnie.abelbeck.com>
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

Hey Lonnie,

Thanks for letting me know. Can you tell me if this patch --
https://=D7=90.cc/GJpT3gVY -- brings the performance back up? And if that
works, can you then try each of those three fragments separate to see
which one has an actual effect (or perhaps all do).

Jason
