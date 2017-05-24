Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 659ad739
 for <wireguard@lists.zx2c4.com>;
 Wed, 24 May 2017 01:44:36 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a6b6f344
 for <wireguard@lists.zx2c4.com>;
 Wed, 24 May 2017 01:44:36 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5b45ff66
 for <wireguard@lists.zx2c4.com>;
 Wed, 24 May 2017 01:56:01 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 60c09f87
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 24 May 2017 01:56:00 +0000 (UTC)
Received: by mail-oi0-f49.google.com with SMTP id b204so224572218oii.1
 for <wireguard@lists.zx2c4.com>; Tue, 23 May 2017 18:56:47 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170524034606.54078c3c@msi.defcon1>
References: <20170524034606.54078c3c@msi.defcon1>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 24 May 2017 03:56:46 +0200
Message-ID: <CAHmME9rQoSrRsVWzOMWbc4FMrHG1+jWj4VM7C7tQQE9c9P0ooA@mail.gmail.com>
Subject: Re: What has changed in the configuration file?
To: Bzzzz <lazyvirus@gmx.com>
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

wg-quick(8) is a wrapper around wg(8) that adds a few more
configuration keys, such as "Address=", "PostUp=", and so forth. Thus,
you should only use these augmented config files with wg-quick(8):

wg-quick up path/to/configuration.conf
