Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ff2d57a2
 for <wireguard@lists.zx2c4.com>;
 Wed, 16 Nov 2016 15:06:55 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2c926108
 for <wireguard@lists.zx2c4.com>;
 Wed, 16 Nov 2016 15:06:55 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id d9f437e9
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 16 Nov 2016 15:06:55 +0000 (UTC)
Received: by mail-qt0-f169.google.com with SMTP id c47so104779583qtc.2
 for <wireguard@lists.zx2c4.com>; Wed, 16 Nov 2016 07:09:45 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <7FCCB728-BB7E-4A4F-ABAC-7D16FA6A1382@danrl.com>
References: <A7E34EE0-F8F0-4F88-AA94-58434D0DF2BA@danrl.com>
 <CAHmME9r0tdR8=nnC4yPLJoOE8yU_7iJi0qEpx9POyM3OBZ3otQ@mail.gmail.com>
 <44DAF4D4-00A8-4903-8003-EB0215635B61@danrl.com>
 <CAHmME9qTLVPVrCnrusb3W32EtGYvLuKyyiGz+TWrXTxneVSrCA@mail.gmail.com>
 <7FCCB728-BB7E-4A4F-ABAC-7D16FA6A1382@danrl.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 16 Nov 2016 16:09:44 +0100
Message-ID: <CAHmME9qEndwTaCwAcG2hq71S_Fo-So3JjXdCH-7OGFVV4nayjQ@mail.gmail.com>
To: =?UTF-8?Q?Dan_L=C3=BCdtke?= <mail@danrl.com>
Content-Type: text/plain; charset=UTF-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] Demo Server: Dual stack?
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi Dan,

Everything is open source:

https://git.zx2c4.com/WireGuard/tree/contrib/examples/ncat-client-server/README

client.sh and server.sh -- the ugliest bash you've ever seen. :)

Jason
