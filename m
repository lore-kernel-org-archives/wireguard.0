Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f313151b
 for <wireguard@lists.zx2c4.com>; Mon, 2 Jan 2017 21:34:00 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4fc80a32
 for <wireguard@lists.zx2c4.com>; Mon, 2 Jan 2017 21:34:00 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 57f40cde
 for <wireguard@lists.zx2c4.com>; Mon, 2 Jan 2017 21:34:00 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 8eface0b
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 2 Jan 2017 21:33:59 +0000 (UTC)
Received: by mail-oi0-f41.google.com with SMTP id b126so491130776oia.2
 for <wireguard@lists.zx2c4.com>; Mon, 02 Jan 2017 13:42:44 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <9fe139f0-a635-76ef-90b0-56b1a968c565@createc.ro>
References: <9fe139f0-a635-76ef-90b0-56b1a968c565@createc.ro>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 2 Jan 2017 22:42:43 +0100
Message-ID: <CAHmME9qJR-Y6gwULoGfBcORwcDthut37yVeiX_bFBKzHzHpu3A@mail.gmail.com>
Subject: Re: centos 6 build error
To: Lucian Cristian <luci@createc.ro>
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

Your compiler is ancient.

Either update your compiler, or just remove lines 343 & 350 (which are
no-ops anyway).

Jason
