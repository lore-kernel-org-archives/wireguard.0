Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fb588f10
 for <wireguard@lists.zx2c4.com>;
 Fri, 29 Sep 2017 07:35:01 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e776ccea
 for <wireguard@lists.zx2c4.com>;
 Fri, 29 Sep 2017 07:35:01 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5eea9f6d
 for <wireguard@lists.zx2c4.com>;
 Fri, 29 Sep 2017 07:54:04 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id ced76caa
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 29 Sep 2017 07:54:03 +0000 (UTC)
Received: by mail-oi0-f54.google.com with SMTP id 125so838239oie.5
 for <wireguard@lists.zx2c4.com>; Fri, 29 Sep 2017 01:03:22 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170929042331.18247-1-chetgurevitch@protonmail.com>
References: <20170929042331.18247-1-chetgurevitch@protonmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 29 Sep 2017 10:03:21 +0200
Message-ID: <CAHmME9qM-FGCSKa8iLp0dzB=fYuk2DjcG7LK8Ai8OMZbO2azTw@mail.gmail.com>
Subject: Re: [PATCH] Makefile: add uapi level to dkms-install target
To: Chet Gurevitch <chetgurevitch@gmail.com>
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

Hey Chet,

Thanks for the patch. Indeed I hadn't finished that aspect of the
netlink stuff, so I'm glad you caught that before I made a snapshot.
I'll likely rebase this into the big netlink commit.

@dkg -- you were wondering what the purpose is. This is for the new
uapi/ directory, which needs to be accounted for in dkms, since
uapi/wireguard.h has replaced uapi.h during the recent Netlink
rewrite.

Jason
