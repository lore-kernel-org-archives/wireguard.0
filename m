Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 470ac2c5
 for <wireguard@lists.zx2c4.com>;
 Wed, 31 May 2017 10:45:56 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ada5d8b9
 for <wireguard@lists.zx2c4.com>;
 Wed, 31 May 2017 10:45:56 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d1b59843
 for <wireguard@lists.zx2c4.com>;
 Wed, 31 May 2017 10:57:20 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id f38bff5b
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 31 May 2017 10:57:19 +0000 (UTC)
Received: by mail-oi0-f45.google.com with SMTP id w10so10657947oif.0
 for <wireguard@lists.zx2c4.com>; Wed, 31 May 2017 03:59:01 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CACTq0bRBqH85OhjF2gRmkRGay91+L=XXy7Y6mAYuodGPz9L62w@mail.gmail.com>
References: <CACTq0bRBqH85OhjF2gRmkRGay91+L=XXy7Y6mAYuodGPz9L62w@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 31 May 2017 12:59:00 +0200
Message-ID: <CAHmME9qLvaHjC7E5ZwF49AQMfQXZbCXFkfmsoxYyUxYSKDo8yg@mail.gmail.com>
Subject: Re: Wireguard and MTU
To: Ibrahim Tachijian <barhom@netsat.se>
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

Set the mtu_fix boolean to 1 in your firewall config.
https://wiki.openwrt.org/doc/uci/firewall
