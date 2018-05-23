Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id eb402b51
 for <wireguard@lists.zx2c4.com>;
 Wed, 23 May 2018 22:14:12 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 06acaf52
 for <wireguard@lists.zx2c4.com>;
 Wed, 23 May 2018 22:14:12 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1ce3eedd
 for <wireguard@lists.zx2c4.com>;
 Wed, 23 May 2018 22:12:58 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id e8ce4885
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 23 May 2018 22:12:58 +0000 (UTC)
Received: by mail-ot0-f174.google.com with SMTP id n1-v6so27071687otf.7
 for <wireguard@lists.zx2c4.com>; Wed, 23 May 2018 15:15:28 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAJxLCjGm5OX8AO=HG4MfGQrjKSp4u3WrYCTHqjg4_7c0SO3zJw@mail.gmail.com>
References: <CAJxLCjGm5OX8AO=HG4MfGQrjKSp4u3WrYCTHqjg4_7c0SO3zJw@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 24 May 2018 00:15:27 +0200
Message-ID: <CAHmME9rZz=L6bhCxttZRD93FC0qexGGJ4kTTog4O641QzXBAXQ@mail.gmail.com>
Subject: Re: cosmetic issue regarding installation script
To: celaena sardothien <aagalathynius@gmail.com>
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

Hi Celaena,

Thanks for pointing this out. I just booted up the latest Fedora live
CD and found that you're right. I seem to remember the full path being
required in earlier versions, or something, but I don't remember
details. Anyway, fixed now.

Jason
