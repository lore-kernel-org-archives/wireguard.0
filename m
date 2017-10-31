Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cfd5716c
 for <wireguard@lists.zx2c4.com>;
 Tue, 31 Oct 2017 13:50:01 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 823025f9
 for <wireguard@lists.zx2c4.com>;
 Tue, 31 Oct 2017 13:50:01 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e703a181
 for <wireguard@lists.zx2c4.com>;
 Tue, 31 Oct 2017 13:50:01 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id fec6ad3f
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 31 Oct 2017 13:50:00 +0000 (UTC)
Received: by mail-oi0-f51.google.com with SMTP id c77so26723422oig.0
 for <wireguard@lists.zx2c4.com>; Tue, 31 Oct 2017 06:52:21 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAHmME9pQuq2ntj-yUi9PnqzzzPpLKq=bW9U2DDUTtmvT=5GH0Q@mail.gmail.com>
References: <462fb5c1-0832-a394-8839-d9b54bcb13fa@thalheim.io>
 <CAHmME9pQuq2ntj-yUi9PnqzzzPpLKq=bW9U2DDUTtmvT=5GH0Q@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 31 Oct 2017 14:52:20 +0100
Message-ID: <CAHmME9qHrUo6FZf81f2i78cU9SFS0c3xNvBA9vpCRPRqi-KGhw@mail.gmail.com>
Subject: Re: [PATCH] wg: correct type for CTRL_ATTR_FAMILY_ID
To: =?UTF-8?Q?J=C3=B6rg_Thalheim?= <joerg@thalheim.io>
Content-Type: text/plain; charset="UTF-8"
Cc: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

This broke MIPS.
