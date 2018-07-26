Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a6a39508
 for <wireguard@lists.zx2c4.com>;
 Thu, 26 Jul 2018 16:07:22 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 124b479a
 for <wireguard@lists.zx2c4.com>;
 Thu, 26 Jul 2018 16:07:22 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1a027114
 for <wireguard@lists.zx2c4.com>;
 Thu, 26 Jul 2018 16:06:08 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id d5799e3a
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 26 Jul 2018 16:06:08 +0000 (UTC)
Received: by mail-oi0-f51.google.com with SMTP id k12-v6so3940394oiw.8
 for <wireguard@lists.zx2c4.com>; Thu, 26 Jul 2018 09:16:49 -0700 (PDT)
MIME-Version: 1.0
References: <CAHjFYUJp3A3Q_Jdqcn8XOnnYfsnMsF6x2FUM=AiAV=j0g8BY9w@mail.gmail.com>
In-Reply-To: <CAHjFYUJp3A3Q_Jdqcn8XOnnYfsnMsF6x2FUM=AiAV=j0g8BY9w@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 26 Jul 2018 18:16:37 +0200
Message-ID: <CAHmME9r8zh_X5JDSHy+wkAyeX3Kt-FuWzpcxFSgkBdo8o13Rnw@mail.gmail.com>
Subject: Re: Cross compiling wireguard-go for ARM with utiliities
To: Jacob Schooley <jacob.schooley+wgvpn@gmail.com>
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

cd src/tools
make
