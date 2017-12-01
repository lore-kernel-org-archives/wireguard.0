Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 494883b0
 for <wireguard@lists.zx2c4.com>; Fri, 1 Dec 2017 17:20:58 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id eaf9c69c
 for <wireguard@lists.zx2c4.com>; Fri, 1 Dec 2017 17:20:58 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ffbabe0c
 for <wireguard@lists.zx2c4.com>; Fri, 1 Dec 2017 17:20:58 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 74a8df8a
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 1 Dec 2017 17:20:58 +0000 (UTC)
Received: by mail-ot0-f179.google.com with SMTP id d5so9639973oti.3
 for <wireguard@lists.zx2c4.com>; Fri, 01 Dec 2017 09:27:15 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <b984758b-93ce-f909-e63e-f31fb575a5f9@gmail.com>
References: <b984758b-93ce-f909-e63e-f31fb575a5f9@gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 1 Dec 2017 18:27:14 +0100
Message-ID: <CAHmME9qFWDme113eRkxtK4ut9tK1i3auWT_YrCsZwrUdZAiJHw@mail.gmail.com>
Subject: Re: Wireguard ceased to work after Fedora 26->27 upgrade
To: Germano Massullo <germano.massullo@gmail.com>
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

Sounds like dkms isn't kicking in? You might need to remove
wireguard-dkms and reinstall it and see what happens?
