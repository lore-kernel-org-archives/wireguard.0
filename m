Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1f0149a9
 for <wireguard@lists.zx2c4.com>;
 Fri, 12 May 2017 09:28:16 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1ab6fb1d
 for <wireguard@lists.zx2c4.com>;
 Fri, 12 May 2017 09:28:16 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c3c5e758
 for <wireguard@lists.zx2c4.com>;
 Fri, 12 May 2017 09:28:16 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id e2ecb890
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 12 May 2017 09:28:15 +0000 (UTC)
Received: by mail-oi0-f43.google.com with SMTP id l18so59520376oig.2
 for <wireguard@lists.zx2c4.com>; Fri, 12 May 2017 02:39:00 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <8a2eb5ef-f154-ecff-e080-57b9a63d1bce@inuits.eu>
References: <8a2eb5ef-f154-ecff-e080-57b9a63d1bce@inuits.eu>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 12 May 2017 11:38:59 +0200
Message-ID: <CAHmME9pJf1RP_0C1VrqHzEnqaNrAx4XH8snYaAH_h2xJdO3tGw@mail.gmail.com>
Subject: Re: Wireguard on Centos 7
To: Christophe Vanlancker <carroarmato0@inuits.eu>
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

Centos's 3.10 is not kernel.org's 3.10. They patch it heavily. If
you'd like to adjust compat.h to support centos's patched-up kernel,
without breaking support for other kernels, feel free to submit a
patch.

Jason
